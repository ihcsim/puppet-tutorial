case $operatingsystem{
  centos, redhat: { $variant='enterprise' }
  debian, ubuntu: { $variant='debian' }
  default: { fail('Unrecognized operating system for web server') }
}

package{'gcc':
  ensure => installed
}

# also install the build-essential package if this is a Debian
if($variant == 'debian'){
  package{'build-essential':
    ensure => installed
  }
}
