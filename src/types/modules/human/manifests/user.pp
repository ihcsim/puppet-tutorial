# Manages the user's .bashrc and ssh keys.
# Also ensures that the user and user's home directory is present.
define human::user (
  $userid = $title,
  $homedir = "/home/${title}"
){

  user{$userid:
    ensure => present
  }

  file{'user.home':
    ensure  => directory,
    path    => "$homedir",
    owner   => $userid,
    require => User[$userid]
  }

  file{'user.bashrc':
    ensure  => file,
    path    => "$homedir/.bashrc",
    owner   => $userid,
    mode    => 0755,
    content => template('human/.bashrc.erb'),
    require => File['user.home']
  }

  ssh_authorized_key{'user.ssh.key':
    ensure => present,
    user   => $userid,
    key    => '', # location of public key
    type   => 'ssh-rsa'
  }
}

human::user{'john':}
