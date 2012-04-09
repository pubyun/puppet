# class users::roles
class users::roles {
  $group  =  'root'
  $shell  =  '/bin/false'
  $homefs = '/srv/roles'

  file { $homefs:
    ensure  => directory,
    owner   => 'root',
    group   => $group,
    mode    => '2755'
  }

  @roleaccount { 'archive':
    ensure   => 'present',
    uid      => '2000',
    pgroup   => 'archive',
    groups   => ['archive'],
    fullname => 'Archiving role account',
    homefs   => $homefs,
    shell    => '/bin/false',
  }
  @roleaccount { 'synopsis':
    ensure   => 'present',
    uid      => '2001',
    pgroup   => 'synopsis',
    groups   => ['synopsis'],
    fullname => 'Fresco/Synopsis role account',
    homefs   => $homefs,
    shell    => '/bin/sh',
  }
  @roleaccount { 'www-treasurer':
    ensure   => 'present',
    uid      => '2002',
    pgroup   => 'www-treasurer',
    groups   => ['www-treasurer'],
    fullname => 'treasurer webpage role user',
    homefs   => $homefs,
    shell    => '/bin/false',
  }
  @roleaccount { 'treasurer':
    ensure   => 'present',
    uid      => '2003',
    pgroup   => 'treasurer',
    groups   => ['treasurer'],
    fullname => 'treasurer role account',
    homefs   => $homefs,
    shell    => '/bin/sh',
  }
}
