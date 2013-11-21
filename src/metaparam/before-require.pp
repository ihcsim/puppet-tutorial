file{'new-file':
  path    => '/tmp/new-folder/new-file.txt'
  ensure  => 'file',
  before  => Notify['msg'],
  require => File{'new-folder'},
  content => 'Hello World!!'
}

file{'new-folder':
  path   => '/tmp/new-folder',
  ensure => directory
}

notify{'msg':
 message => 'New file is now synched.
}
