module Puppet::Parser::Functions
  newfunction(:nodeinfo, :type => :rvalue) do |args|

    host = args[0]
    yamlfile = args[1]

    results         = function_yamlinfo(host, yamlfile)
    return(results)
  end
end
