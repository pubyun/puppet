Facter.add("brokenhosts") do
  brokenhosts = "true"
  if FileTest.exist?("/etc/hosts")
    IO.foreach("/etc/hosts") do |x|
      x.split.each do |y|
        if y == Facter.value("fqdn")
          brokenhosts = "false"
          break
        end
      end
    end
  end
  setcode do
    brokenhosts == "true"
  end
end
