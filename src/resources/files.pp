file {'create-new-file':
  path    => '/tmp/new.txt',
  ensure  => present,
  chmod   => 0755,
  content => 'Hello World'
}

file {'remove-file':
  path   => '/tmp/obsolete.txt',
  ensure => absent
}

file {'create-folder':
  path => '/tmp/folder1',
  ensure => directory
}

file {'link-file':
  path => '/tmp/link',
  ensure => link,
  target => '/tmp/new.txt'
}

