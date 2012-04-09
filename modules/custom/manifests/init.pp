# common/manifests/init.pp - Define common infrastructure for modules
# Copyright (C) 2007 David Schmitt <david@schmitt.edv-bus.at>
# 3-clause BSD

class custom {
  import "defines/*.pp"
  import "classes/*.pp"
}
