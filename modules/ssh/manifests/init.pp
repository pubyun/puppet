class ssh ($listenport='53399') {
  case $operatingsystem {
    centos, redhat: {
        $packages = ['openssh-clients', 'openssh-server']
        $service  = 'sshd'
    }
    debian, ubuntu: {
        $packages = ['openssh-client', 'openssh-server']
        $service  = 'ssh'
    }
    default: { fail("Unrecognized operating system for webserver") }
  }
  package { $packages: ensure => 'latest' }

    file { 
      '/etc/ssh/ssh_config':
          content => template('ssh/ssh_config'),
        ; 
      '/etc/ssh/sshd_config':
          ensure => 'present',
          owner  => 'root',
          group  => 'root',
          mode   => '0444',
          content => template('ssh/sshd_config'),
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
