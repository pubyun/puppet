Facter.add("v4ips") do
  confine :kernel => :linux
  addrs = []
  if FileTest.exist?("/bin/ip")
    %x{ip addr list}.each do |line|
      next unless line =~ /\s+inet/
      next if line =~ /scope (link|host)/
      if line =~ /\s+inet\s+(\S+)(\/\d{1,2}| peer) .*/
        addrs << $1
      end
    end
  end
  ret = addrs.join(",")
  if ret.empty?
    ret = 'no'
  end
  setcode do
    ret
  end
end

Facter.add("v6ips") do
  confine :kernel => :linux
  addrs = []
  if FileTest.exist?("/bin/ip")
    %x{ip addr list}.each do |line|
      next unless line =~ /\s+inet/
      next if line =~ /scope (link|host)/
      if line =~ /\s+inet6\s+(\S+)\/\d{1,3} .*/
        addrs << $1
      end
    end
  end
  ret = addrs.join(",")
  if ret.empty?
    ret = 'no'
  end
  setcode do
    ret
  end
end

Facter.add("vpnips") do
  confine :kernel => :linux
  addrs = []
  if FileTest.exist?("/bin/ip")
    if FileTest.directory?("/etc/openvpn")
      Dir.glob("/etc/openvpn/spi-*.conf").each do |vpn|
        if vpn =~ /\/etc\/openvpn\/spi-(\S+).conf/
          %x{ip addr list tun-n2-#{$1}}.each do |line|
            next unless line =~ /\s+inet/
            next if line =~ /scope (link|host)/
            if line =~ /\s+inet\s+(\S+) peer .*/
              addrs << $1
            end
          end
        end
      end
    end
  end
  addrs.uniq!
  ret = addrs.join(",")
  if ret.empty?
    ret = 'no'
  end
  setcode do
    ret
  end
end
