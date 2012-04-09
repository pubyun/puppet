Facter.add("smartarraycontroller") do
  confine :kernel => :linux
  setcode do
    FileTest.exist?("/dev/cciss/")
  end
end

Facter.add("ThreeWarecontroller") do
  confine :kernel => :linux
  setcode do
    is3w = "false"
    if FileTest.exist?("/proc/scsi/scsi")
      IO.foreach("/proc/scsi/scsi") { |x|
        is3w = "true" if x =~ /Vendor: 3ware/
      }
    end
    is3w == "true"
  end
end

Facter.add("megaraid") do
  confine :kernel => :linux
  setcode do
    FileTest.exist?("/dev/megadev0")
  end
end

Facter.add("mptraid") do
  setcode do
    FileTest.exist?("/dev/mptctl") or FileTest.exist?("/dev/mpt0") or FileTest.exist?("/proc/mpt/summary")
  end
end

Facter.add("aacraid") do
  confine :kernel => :linux
  setcode do
    FileTest.exist?("/dev/aac0")
  end
end

Facter.add("swraid") do
  confine :kernel => :linux
  setcode do
    swraid = "false"
    if FileTest.exist?("/proc/mdstat") && FileTest.exist?("/sbin/mdadm")
      IO.foreach("/proc/mdstat") { |x|
        swraid = "true" if x =~ /md[0-9]+ : active/
      }
    end
    swraid == "true"
  end
end
