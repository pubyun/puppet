class sudo {
    package { 'sudo': ensure => latest }

    group { 'adm':
        ensure => 'present'
    }

    file { '/etc/sudoers':
        ensure  => 'present',
        owner   => 'root',
        group   => 'root',
        mode    => '0440',
        source  => [ 'puppet:///modules/sudo/per-host/$fqdn/sudoers',
                     'puppet:///modules/sudo/sudoers' ],
        replace => 'true',
        require => Package['sudo'],
    }
}
