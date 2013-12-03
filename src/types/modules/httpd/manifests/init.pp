class httpd{

  package{'httpd':
    ensure => installed,
    before => File['httpd.conf']
  }

  files{'httpd.conf':
    ensure => file,
    path   => '/etc/httpd/conf/httpd.conf',
    content => template('httpd/httpd.conf.erb')
  }

  service{'httpd':
    ensure    => running,
    subscribe => File['httpd.conf']
  }

  files{'www.error':
    ensure => file,
    path   => '/var/www/error/error.html',
    source => 'puppet:///modules/httpd/error.html'
  }

  files{'www.home':
    ensure => file,
    path   => '/var/www/html/home.html',
    source => 'puppet:///modules/httpd/home.html'
  }
}
