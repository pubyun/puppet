class users::groups {
  group { 'web':
    ensure    => present,
    allowdupe => false,
    gid       => 500,
  }
  group { 'pubyun':
    ensure    => present,
    allowdupe => false,
    gid       => 501,
  }
  group { 'bacula':
    ensure    => present,
    allowdupe => false,
    gid       => 502,
  }
  group { 'puppetvcs':
    ensure    => present,
    allowdupe => false,
    gid       => 503,
  }
  group { 'secretary':
    ensure    => present,
    allowdupe => false,
    gid       => 504,
  }
  group { 'git':
    ensure    => present,
    allowdupe => false,
    gid       => 505,
  }
  group { 'ssh':
    ensure    => present,
    allowdupe => false,
    gid       => 506,
  }
  group { 'archive':
    ensure    => present,
    allowdupe => false,
    gid       => 507,
  }
}
