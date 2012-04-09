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
}
