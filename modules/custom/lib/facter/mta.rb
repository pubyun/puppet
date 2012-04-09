Facter.add("mta") do
  setcode do
    mta = "exim4"
    if FileTest.exist?("/usr/sbin/postfix")
      mta = "postfix"
    end
    mta
  end
end

Facter.add("exim_ssl_certs") do
  setcode do
    FileTest.exist?("/etc/exim4/ssl/") &&
      FileTest.exist?("/etc/exim4/ssl/ca.crl") &&
      FileTest.exist?("/etc/exim4/ssl/thishost.crt") &&
      FileTest.exist?("/etc/exim4/ssl/ca.crt") &&
      FileTest.exist?("/etc/exim4/ssl/thishost.key")
  end
end
