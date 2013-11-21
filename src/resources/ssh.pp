# set up SSH key access instead of using password
ssh_authorized_key{'ssh-key-access':
  ensure => present,
  user   => '', # username
  type   => 'ssh-rsa' # encryption type
  key    => '' # public key
}
