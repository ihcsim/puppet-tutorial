class ntp{
  case $operatinsystem{
    centos, redhat: {
      $service_name = 'ntpd'
      $conf_file = 'ntp.conf.el'
      $default_servers = ["0.centos.pool.ntp.org",
                          "1.centos.pool.ntp.org",
                          "2.centos.pool.ntp.org"] 
    }
  
    debian, ubuntu{
      $service_name = 'ntp'
      $conf_file = 'ntp.conf.el'
      $default_servers = ["0.debian.pool.ntp.prg.iburst",
                          "1.debian.pool.ntp.prg.iburst",
                          "2.debian.pool.ntp.prg.iburst",
                          "3.debian.pool.ntp.prg.iburst",

    }
  }

  $servers_real = $default_servers

  package{'ntp':
    ensure => installed
  }

  file{'ntp.conf':
    path    => '/etc/ntp.conf',
    ensure  => file,
    require => Package['ntp'],
    content  => template("ntp/${conf_file}.erb")
  }

  service{'ntp':
    name      => $service_name,
    ensure    => running,
    enable    => true,
    subscribe => File['ntp.conf']
  }
}
