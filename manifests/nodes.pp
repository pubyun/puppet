
class pubyun_base ($iptables_public_tcp_ports) {

# 由于 iptables-persistent 安装出错，暂时禁止
#  class { 'iptables':
#    public_tcp_ports => $iptables_public_tcp_ports,
#  }

  $packages = ['puppet',
    'git',
    'python-setuptools',
    'python-pip',
    'python-virtualenv',
  ]
  package { $packages: ensure => 'latest' }

  include users::noc
  include users::roles
  include users::groups
  include users::people
  include ssh
  include ntp
  include sudo
  include postfix
  include pubyun_cron
}

class pubyun_cron {
  cron { 'updatepuppet':
    user    => root,
    minute  => '*/15',
    command => 'sleep $((RANDOM\%600)) && cd /root/puppet && /usr/bin/git pull -q && puppet apply -l /tmp/manifest.log --modulepath /root/puppet/modules manifests/site.pp', environment => 'PATH=/usr/bin:/bin:/usr/sbin:/sbin',
  }
}

# A template host with no running services
class pubyun_server ($iptables_public_tcp_ports) {
  class { 'pubyun_base':
    iptables_public_tcp_ports => $pubyun_server::iptables_public_tcp_ports
  }
}

# A server that we expect to run for some time
class co188_server ($iptables_public_tcp_ports) {
  class { 'pubyun_base':
    iptables_public_tcp_ports => $co188_server::iptables_public_tcp_ports
  }
}

node basenode {
  class { 'pubyun_server':
    iptables_public_tcp_ports => []
  }
}

node 'default' inherits basenode {
}

node 'u1.pubyun.com' inherits basenode {
}

