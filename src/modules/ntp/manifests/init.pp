class ntp{
  case $operatinsystem{
    centos, redhat: {
      $service_name = 'ntpd'
      $conf_file = 'ntp.conf.el'
    }
  
    debian, ubuntu{
      $service_name = 'ntp'
      $conf_file = 'ntp.conf.el'
    }
  }

  package{'ntp':
    ensure => installed
  }

  file{'ntp.conf':
    path    => '/etc/ntp.conf',
    ensure  => file,
    require => Package['ntp'],
    source  => '/tmp/$conf_file'
  }

  service{'ntp':
    name      => $service_name,
    ensure    => running,
    enable    => true,
    subscribe => File['ntp.conf']
  }
}
