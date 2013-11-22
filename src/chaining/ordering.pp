file{'create-file':
  path   => '/tmp/new-file.txt',
  ensure => present
}
->
notify{'msg':
  message => 'Created /tmp/new-file.txt'
}
