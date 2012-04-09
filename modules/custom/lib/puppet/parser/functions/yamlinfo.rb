module Puppet::Parser::Functions
  newfunction(:yamlinfo, :type => :rvalue) do |args|

    host = args[0]
    yamlfile = args[1]
    parser = Puppet::Parser::Parser.new(environment)
    parser.watch_file(yamlfile)

    def read_yaml(yaml, host)
      results = {}

      ['nameinfo', 'footer'].each do |detail|
        if yaml.has_key?(detail)
          if yaml[detail].has_key?(host)
            results[detail] = yaml[detail][host]
          end
        end
      end

      if yaml.has_key?('services')
        yaml['services'].each_pair do |service, hostlist|
          hostlist=[hostlist] unless hostlist.kind_of?(Array)
          results[service] = hostlist.include?(host)
        end
      end

      results['mail_port']      = ''
      results['smarthost']      = ''
      results['heavy_exim']     = ''
      results['smarthost_port'] = 587
      results['reservedaddrs']  = '0.0.0.0/8 : 127.0.0.0/8 : 10.0.0.0/8 : 169.254.0.0/16 : 172.16.0.0/12 : 192.0.0.0/17 : 192.168.0.0/16 : 224.0.0.0/4 : 240.0.0.0/5 : 248.0.0.0/5'

      if yaml['host_settings'].kind_of?(Hash)
        yaml['host_settings'].each_pair do |property, values|
          if values.kind_of?(Hash)
            results[property] = values[host] if values.has_key?(host)
          elsif values.kind_of?(Array)
            results[property] = "true" if values.include?(host)
          end
        end
      end
      return(results)
    end

    require 'yaml'
    $KCODE = 'utf-8'

    yaml = YAML.load_file(yamlfile)
    ret = {}

    if host == '*'
      Dir.entries('/var/lib/puppet/yaml/node/').each do |fname|
        next unless fname =~ /(.*)\.yaml$/
        host_name = $1
        ret[host_name] = read_yaml(yaml, host_name)
      end
    else
      ret = read_yaml(yaml, host)
    end

    return(ret)
  end
end
