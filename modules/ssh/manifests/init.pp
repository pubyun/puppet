class ssh {
  case $operatingsystem {
    centos, redhat: {
        $packages = ['openssh-clients', 'openssh-server']
        $config = 'sshd_config.el'
        $service  = 'sshd'
    }
    debian, ubuntu: {
        $packages = ['openssh-client', 'openssh-server']
        $config = 'sshd_config.debian'
        $service  = 'ssh'
    }
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
              "puppet:///modules/ssh/${config}",
              'puppet:///modules/ssh/sshd_config'
          ],
          replace => 'true',
        ;
    }
    service { 'ssh':
      ensure          => running,
      enable          => true,
      name            => $service,
      hasrestart      => true,
      subscribe       => File['/etc/ssh/sshd_config'],
    }
}
