define sysctl($key, $value, $ensure=present) {
  file {
    "/etc/sysctl.d/$name.conf":
      ensure  => $ensure,
      owner   => root,
      group   => root,
      mode    => 0644,
      content => "$key = $value\n",
      notify  => Exec["procps restart"],
  }
}
