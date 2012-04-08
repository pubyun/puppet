class pubyun::users {
  include user::virtual

  @user::virtual::localuser { 'ppyy':
    uid      => "1000",
    realname => 'Peng Yong',
    sshkeys  => "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAsK9KlkKzq+2aVaEXiFtinAUh2BPCfF/grEORxfxTujoJZtnAEMs2/QscGaCvDRFLwK1Nf/N7tKOoO1nqYhJbM7lz2g1CzTl/3t6j+bv+xNrrdTjSQoIuV5mbzcufNWU9jbkURdEfSIEe5GQO3mXTOLKH7CRwfzXJkzjUG4xvLN0= ppyy@pubyun.com\n",
  }

  @user::virtual::localuser { 'lyl':
    uid      => "1001",
    realname => 'Liu YunLong',
    sshkeys  => "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAuUOvtRtvjrDrXiXhWZJirlNtaYJ7azvHROFG13GwwCSru9Vmb5uz9UGAwChj3MgyLf6RTTvnl4q/BzOdoKwRvRY9DY+hiyACXOdJao0MVDBKo36BcnhXOEKLCi1kHl6e9GdTuTjXkxI4kU8ojzhZrzNJmk4hSKI3VHGbmgJItPM= lyl@pubyun.com\n",
  }
  @user::virtual::localuser { 'hq':
    uid      => "1002",
    realname => 'Hua Qiang',
    sshkeys  => "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAqwTPCjLPbNywOziyUYF3tonieAOtEzPy0yx3ScmwUPNEwuwyHNFk7XoTwGWtsSd2CcStZdH9kIx7xhDLQhyMpn5w48sm3tIbmpu8CYWsbfFOlqLlTJbOmwme1ToQjCgK2u5MpX1rZDSPxeeQh/TXdCNxwgPamy0Qx2ZQMUzYdE8= hhqq888@co188.com\n",
  }
  @user::virtual::localuser { 'yangxu':
    uid      => "1003",
    realname => 'Yang Xu',
    sshkeys  => "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAmGiT8g7wL1emNvMGIA1jRSlSvTHVlVrlyOLR9CNkBz3/PpkoOldLti/OvdSeKHEg53SY2YHIZp0rOgkoKVUYH+i80R4r+080HZZ6NOU7GbYIjWXK+/7yo7ij+vvw51BI26lt87+ERKfiWIZYZQ+XtkTa/6xJ03YvOveJAVTeuiAnGdwiZo6AQLxxe8lA11wmFtMxHAFsq3RIjvtakuz4ajESuZyYg1q49hIW+rkIvkl5JK3u0ywYAZnBoIciKcD1BZJORZdSSpJ8jw2nlE2/TBVtCi7OVs/kbXrKszrpEtSf4ZMUBgSjlxcpxHYbJoLnkOAdXBAHKObPlDSPUQHZHQ== yangxu@pubyun.com\n",
  }
}

# 按照不同的应用，进行分组
class user::sysadms {
  realize (
    User::Virtual::Localuser['ppyy'],
    User::Virtual::Localuser['lyl'],
    User::Virtual::Localuser['yangxu'],
  )
}

class user::co188 {
  realize (
    User::Virtual::Localuser['ppyy'],
    User::Virtual::Localuser['hq'],
  )
}
