file{'sample.conf':
  ensure  => file,
  content => 'Hello World',
  notify  => Notify['msg']
}

# Subscribe to changes in the sample.conf file
file{'sample.log':
  ensure    => file,
  subscribe => File['sample.conf'],
  content   => 'The sample.conf file has been changed'
}

notify{'msg':
  message => 'The sampe config file has been synched'
}
