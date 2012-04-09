class users::groups {
  group { 'web':
    allowdupe => false,
    ensure => present,
    gid => 500,
  }
  group { 'spi':
    allowdupe => false,
    ensure => present,
    gid => 501,
  }
  group { 'bacula':
    allowdupe => false,
    ensure => present,
    gid => 502,
  }
  group { 'puppetvcs':
    allowdupe => false,
    ensure => present,
    gid => 503,
  }
  group { 'secretary':
    allowdupe => false,
    ensure => present,
    gid => 504,
  }
  group { 'git':
    allowdupe => false,
    ensure => present,
    gid => 505,
  }
  group { 'ssh':
    allowdupe => false,
    ensure => present,
    gid => 506,
  }
  group { 'archive':
    allowdupe => false,
    ensure => present,
    gid => 507,
  }
  group { 'synopsis':
    allowdupe => false,
    ensure => present,
    gid => 508,
  }
  group { 'www-treasurer':
    allowdupe => false,
    ensure => present,
    gid => 509,
  }
  group { 'treasurer':
    allowdupe => false,
    ensure => present,
    gid => 510,
  }
}
