class ssh {
    package {
        'openssh-client': ensure => latest;
        'openssh-server': ensure => latest;
    }
    file { 
      '/etc/ssh/ssh_config':
          source  => [ 'puppet:///modules/ssh/ssh_config' ],
          require => Package['openssh-client']
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
          require => Package['openssh-client']
        ;
    }
    service { 'ssh':
      ensure          => running,
      hasrestart      => true,
      subscribe       => File['/etc/ssh/sshd_config'],
    }
}
