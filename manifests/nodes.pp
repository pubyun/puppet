import 'users'

class pubyun_base ($iptables_public_tcp_ports) {
  include pubyun::users
  include ssh
  include sudo

# 由于 iptables-persistent 安装出错，暂时禁止
#  class { 'iptables':
#    public_tcp_ports => $iptables_public_tcp_ports,
#  }

  file { '/etc/profile.d/Z98-byobu.sh':
    ensure => 'absent'
  }

  package { 'ntp':
    ensure => installed
  }

  package { 'popularity-contest':
    ensure => purged
  }

  service { 'ntpd':
    ensure     => running,
    name       => 'ntp',
    enable     => true,
    hasrestart => true,
    require    => Package['ntp'],
  }

  $packages = ['python-software-properties',
    'puppet',
    'git',
    'python-setuptools',
    'python-virtualenv',
    'byobu'
  ]
  package { $packages: ensure => 'latest' }
}

class pubyun_cron {
  cron { 'updatepuppet':
    user    => root,
    minute  => '*/15',
    command => 'apt-get update >/dev/null 2>&1 ; sleep $((RANDOM\%600)) && cd /root/puppet && /usr/bin/git pull -q && puppet apply -l /tmp/manifest.log --modulepath =/root/puppet/modules manifests/site.pp', environment => 'PATH=/usr/bin:/bin:/usr/sbin:/sbin',
  }
}

# A template host with no running services
class pubyun_template ($iptables_public_tcp_ports) {
  class { 'pubyun_base':
    iptables_public_tcp_ports => $iptables_public_tcp_ports
  }

  realize (
    User::Virtual::Localuser['ppyy'],
    User::Virtual::Localuser['lyl'],
  )
}

# A server that we expect to run for some time
class pubyun_server ($iptables_public_tcp_ports) {
  class { 'pubyun_template':
    iptables_public_tcp_ports => $iptables_public_tcp_ports
  }
#  include pubyun_cron
}

node basenode {
  class { 'pubyun_server':
    iptables_public_tcp_ports => []
  }
}

node 'u1.pubyun.com' inherits basenode {
}

