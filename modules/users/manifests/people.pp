# class users::people
# we separate this out because it is long from having all the useraccount define
# calls.
class users::people {
  $group  =  "root"
  $shell  =  "/bin/bash"
  $homefs = "/home"
  file { $homefs:
    ensure  => directory,
    owner   => "root",
    group   => $group,
    mode    => 2755
  }

  @useraccount { "joerg":
    ensure   => "present",
    uid      => "1000",
    pgroup   => "pubyun",
    groups   => ['bacula','puppetvcs', 'adm', 'pubyun', 'list', 'web', 'ssh'],
    fullname => "Joerg Jaspert",
    homefs   => $homefs,
    shell    => "/usr/bin/zsh",
  }

  @useraccount { "schultmc":
    ensure   => "present",
    uid      => "1001",
    pgroup   => "pubyun",
    groups   => ['bacula','puppetvcs', 'adm', 'pubyun', 'list', 'web', 'ssh'],
    fullname => "Michael Schultheiss",
    homefs   => $homefs,
    shell    => $shell,
  }

  @useraccount { "bdale":
    ensure   => "present",
    uid      => "1010",
    pgroup   => "pubyun",
    groups   => ['pubyun', 'web', 'ssh'],
    fullname => "Bdale Garbee",
    homefs   => $homefs,
    shell    => $shell,
  }

  @useraccount { "noodles":
    ensure   => "present",
    uid      => "1011",
    pgroup   => "pubyun",
    groups   => ['pubyun', 'web', 'secretary', 'ssh'],
    fullname => "Jonathan McDowell",
    homefs   => $homefs,
    shell    => $shell,
  }

  @useraccount { "stefan":
    ensure   => "present",
    uid      => "1012",
    pgroup   => "synopsis",
    groups   => ['synopsis', 'ssh'],
    fullname => "Stefan Seefeld",
    homefs   => $homefs,
    shell    => $shell,
  }
}
