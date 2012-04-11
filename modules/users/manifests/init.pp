# We have some other classes to grab too.
#import 'groups'
#import 'people'
#import 'roles'
#import 'web.pp'
# define useraccount
# creates a user with their complete home directory, including ssh key(s),
# shell profile(s) and anything else.
# This define should be called to create a virtual resource so it can
# be used to create all users, and then the users required on the particular
# node are specified through the various user classes.
# Example:
# @useraccount { 'username':
#   ensure   => 'present',
#   uid      => 500,
#   pgroup   => users,
#   groups   => ['staff', 'other'],
#   fullname => 'New User',
#   homefs   => "$homefs",
#   shell    => "$shell",
# }

define useraccount ( $ensure = present, $fullname, $uid, $pgroup = pubyun, $groups, $homefs, $shell) {
    $username = $name
    # This case statement will allow disabling an account by passing
    # ensure => absent, to set the home directory ownership to root.
    case $ensure {
        present: {
            $home_owner = $username
            $home_group = $pgroup
        }
        default: {
            $home_owner = 'root'
            $home_group = 'root'
        }
    }
    # Create the user with their groups as specified
    user { $username:
        ensure      => $ensure,
        uid         => $uid,
        gid         => $pgroup,
        groups      => $groups,
        comment     => $fullname,
        home        => "${homefs}/$username",
        shell       => $shell,
        allowdupe   => false,
    }
    file { "${homefs}/${username}":
        ensure  => directory,
        owner   => $home_owner,
        group   => $home_group,
        mode    => '0750',
        require => User[$username],
    }
    file { "${homefs}/${username}/.ssh":
        ensure  => directory,
        owner   => $home_owner,
        group   => $home_group,
        mode    => '0700',
        require => File["${homefs}/${username}"],
    }
    file { "${homefs}/${username}/.ssh/authorized_keys":
        ensure  => present,
        owner   => $home_owner,
        group   => $home_group,
        mode    => '0600',
        require => File["${homefs}/${username}/.ssh"],
        source  => "puppet:///modules/users/${username}/.ssh/authorized_keys",
    }
    file { "${homefs}/${username}/.ssh/authorized_keys2":
        ensure  => "${homefs}/${username}/.ssh/authorized_keys",
        require => File["${homefs}/${username}/.ssh/authorized_keys"],
    }
    file { "${homefs}/${username}/.bashrc":
        ensure  => present,
        owner   => $home_owner,
        group   => $home_group,
        mode    => '0640',
        require => File["${homefs}/${username}"],
        source  => [
		   "puppet:///modules/users/${username}/.bashrc",
		   "puppet:///modules/users/.bashrc",
		   ],
    }
    file { "${homefs}/${username}/.bash_profile":
        ensure  => "${homefs}/${username}/.bashrc",
        require => File["${homefs}/${username}/.bashrc"],
    }
    file { "${homefs}/${username}/.vimrc":
        ensure  => present,
        owner   => $home_owner,
        group   => $home_group,
        mode    => '0640',
        require => File["${homefs}/${username}"],
        source  => "puppet:///modules/users/${username}/.vimrc",
    }
}

define roleaccount ( $ensure = present, $uid, $pgroup = pubyun, $groups, $fullname, $homefs, $shell) {
    $username = $name
    # This case statement will allow disabling an account by passing
    # ensure => absent, to set the home directory ownership to root.
    case $ensure {
        present: {
            $home_owner = $username
            $home_group = $pgroup
        }
        default: {
            $home_owner = 'root'
            $home_group = 'root'
        }
    }
    # Create the user with their groups as specified
    user { $username:
        ensure      => $ensure,
        uid         => $uid,
        gid         => $pgroup,
        groups      => $groups,
        comment     => $fullname,
        home        => "${homefs}/$username",
        shell       => $shell,
        allowdupe   => false,
    }
    file { "${homefs}/${username}":
        ensure  => directory,
        owner   => $home_owner,
        group   => $home_group,
        mode    => '0750',
        require => User[$username],
    }
}


class users::noc {
  realize (
    Useraccount[ppyy],
    Useraccount[lyl],
    Useraccount[yangxu],
  )
}

class users::web {
  realize (
    Useraccount[hq],
  )
}

