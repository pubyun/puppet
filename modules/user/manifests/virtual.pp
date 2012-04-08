class user::virtual {
  define localuser ($realname,$sshkeys='',$shell='/bin/bash') {
    group { $title:
      ensure => 'present'
    }

    user { $title:
      ensure     => 'present',
      comment    => $realname,
      home       => "/home/$title",
      shell      => $shell,
      gid        => $title,
      groups     => ['sudo'],
      membership => 'minimum',
      managehome => true,  # creates the home directory (does not actually manage it)
      require    => Group[$title],
    }
    
    file { "${title}_sshdir":
      ensure  => 'directory',
      name    => "/home/$title/.ssh",
      owner   => $title,
      group   => $title,
      mode    => '0700',
      require => User[$title],
    }

    file { "${title}_keys":
      ensure  => 'present',
      name    => "/home/$title/.ssh/authorized_keys",
      owner   => $title,
      group   => $title,
      mode    => '0400',
      content => $sshkeys,
      require => File["${title}_sshdir"],
    }
  }
}
