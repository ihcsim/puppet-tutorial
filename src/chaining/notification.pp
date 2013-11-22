# Check out this link for explanation between ordering and notification:
# http://docs.puppetlabs.com/puppet/2.7/reference/lang_relationships.html#ordering-and-notification
file{'create-file':
  path    => '/tmp/new-file.txt',
  ensure  => present,
  content => 'Hello World'
}
~>
file{'update-log':
  path    => '/tmp/log.txt',
  ensure  => present,
  content => 'Both the new file and the log are now refreshed.'
}
