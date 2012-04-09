Facter.add("kvmdomain") do
  setcode do
    if File.new('/proc/cpuinfo').read().index('QEMU Virtual CPU')
      result = true
    else
      result = false
    end
  end
end
