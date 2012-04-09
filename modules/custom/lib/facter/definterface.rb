Facter.add("definterface") do
  confine :kernel => :linux
  defint=""
  if FileTest.exist?("/bin/ip")
    %x{ip route list 0.0.0.0/0}.each do |line|
      next unless line =~ /^default/
      if line =~ /^default via .* dev (\S+)/
        defint=$1
      end
    end
  end
  setcode do
    defint
  end
end
