module Puppet::Parser::Functions
  newfunction(:whohosts, :type => :rvalue) do |args|
    require 'ipaddr'
    require 'yaml'

    nodeinfo = args[0]
    yamlfile = args[1]
    parser = Puppet::Parser::Parser.new(environment)
    parser.watch_file(yamlfile)

    $KCODE = 'utf-8'

    ans = "unknown"
    yaml = YAML.load_file(yamlfile)

    lookupvar('v4ips').split(',').each do |ip|
      ip.chomp!
      yaml.keys.each do |hoster|
        yaml[hoster].each do |net|
          if IPAddr.new(net).include?(ip)
            ans = hoster
          end
        end
      end
    end
    return ans
  end
end
