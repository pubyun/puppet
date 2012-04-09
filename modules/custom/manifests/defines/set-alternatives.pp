define set_alternatives($linkto) {
  exec {
    "/usr/sbin/update-alternatives --set $name $linkto":
      unless => "/bin/sh -c '! [ -e $linkto ] || ! [ -e /etc/alternatives/$name ] || ([ -L /etc/alternatives/$name ] && [ /etc/alternatives/$name -ef $linkto ])'"
  }
}
