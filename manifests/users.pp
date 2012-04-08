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
}
