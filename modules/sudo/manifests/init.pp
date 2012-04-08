class sudo {
    package { 'sudo': ensure => latest }

    group { 'sudo':
        ensure => 'present'
    }

    file { '/etc/sudoers':
        ensure  => 'present',
        owner   => 'root',
        group   => 'root',
        mode    => '0440',
        source  => 'puppet:///modules/sudo/sudoers',
        replace => 'true',
        require => Package['sudo'],
    }
}
