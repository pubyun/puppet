class postfix {
    package {
        'postfix': ensure => present;
    }
    
    file { '/etc/aliases':
        require => Package['postfix'],
        content => template('postfix/aliases.erb'),
        notify => Exec['postalias'],
    }
    
    file { 
      '/etc/postfix/master.cf':
          owner   => 'root',
          group   => 'root',
          mode    => '0644',
          source  => [ 'puppet:///modules/postfix/master.cf' ],
          require => Package['postfix'],
          notify  => Service['postfix'],
        ; 
      '/etc/postfix/main.cf':
          owner   => 'root',
          group   => 'root',
          mode    => '0644',
          source  => [ 'puppet:///modules/postfix/main.cf' ],
          require => Package['postfix'],
          notify  => Service['postfix'],
        ;
    }
    service { 'postfix':
        ensure => running,
        enable => true,
        require => Package['postfix'],
    }
    
    exec { 'postalias':
        command => '/usr/sbin/postalias /etc/aliases',
        require => File['/etc/aliases'],
        refreshonly => true,
    }
}
