module Puppet::Parser::Functions
  newfunction(:extractnodeinfo, :type => :rvalue) do |args|

    nodeinfo = args[0]
    key      = args[1]

    if nodeinfo.has_key?(key)
      return nodeinfo[key]
    else
      return "false"
    end
  end
end
