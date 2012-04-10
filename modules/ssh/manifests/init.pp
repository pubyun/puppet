class ssh {
  case $operatingsystem {
    centos: { $packages = ['openssh-clients', 'openssh-server'] }
    redhat: { $packages = ['openssh-clients', 'openssh-server'] }
    debian: { $packages = ['openssh-client', 'openssh-server'] }
    ubuntu: { $packages = ['openssh-client', 'openssh-server'] }
    default: { fail("Unrecognized operating system for webserver") }
  }
  package { $packages: ensure => 'latest' }

    file { 
      '/etc/ssh/ssh_config':
          source  => [ 'puppet:///modules/ssh/ssh_config' ],
        ; 
      '/etc/ssh/sshd_config':
          ensure => 'present',
          owner  => 'root',
          group  => 'root',
          mode   => '0444',
          source => [
              'puppet:///modules/ssh/sshd_config.$operatingsystem',
              'puppet:///modules/ssh/sshd_config'
          ],
          replace => 'true',
        ;
    }
    service { 'ssh':
      ensure          => running,
      hasrestart      => true,
      subscribe       => File['/etc/ssh/sshd_config'],
    }
}
