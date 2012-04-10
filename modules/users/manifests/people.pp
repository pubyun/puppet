# class users::people
# we separate this out because it is long from having all the useraccount define
# calls.
class users::people {
  $group  =  'root'
  $shell  =  '/bin/bash'
  $homefs = '/home'
  file { $homefs:
    ensure  => directory,
    owner   => 'root',
    group   => $group,
    mode    => '2755',
  }

  @useraccount { 'ppyy':
    ensure   => 'present',
    fullname => 'Peng Yong',
    uid      => '1000',
    pgroup   => 'pubyun',
    groups   => ['bacula','puppetvcs', 'adm', 'pubyun', 'web', 'ssh'],
    homefs   => $homefs,
    shell    => $shell,
  }

  @useraccount { 'lyl':
    ensure   => 'present',
    fullname => 'Liu YunLong',
    uid      => '1001',
    pgroup   => 'pubyun',
    groups   => ['bacula','puppetvcs', 'adm', 'pubyun', 'web', 'ssh'],
    homefs   => $homefs,
    shell    => $shell,
  }

  @useraccount { 'hq':
    ensure   => 'present',
    fullname => 'Hua Qiang',
    uid      => '1002',
    pgroup   => 'pubyun',
    groups   => ['pubyun', 'web', 'ssh'],
    homefs   => $homefs,
    shell    => $shell,
  }

  @useraccount { 'yangxu':
    ensure   => 'present',
    fullname => 'Yang Xu',
    uid      => '1003',
    pgroup   => 'pubyun',
    groups   => ['pubyun', 'web', 'secretary', 'ssh'],
    homefs   => $homefs,
    shell    => $shell,
  }
}
