 define httpd::vhost(
  $port,
  $docroot,
  $template      = 'apache/vhost-default.conf.erb',
  $priority      = '25',
  $servername    = '',
  $serveraliases = '',
  $options       = "Indexes FollowSymLinks MultiViews",
  $vhost_name    = '*') {

  include httpd

  if $servername == '' {
    $srvname = $title
  } else {
    $srvname = $servername
  }

  case $operatingsystem {
    'centos', 'redhat', 'fedora': { $vdir = '/etc/httpd/conf.d'
                                    $logdir = '/var/log/httpd'}
    'ubuntu', 'debian': { $vdir = '/etc/apache2/sites-enabled'
                          $logdir = '/var/log/apache2'}
    default: { $vdir = '/etc/apache2/sites-enabled'
               $logdir = '/var/log/apache2'}
  }
  
  file {"${vdir}/${priority}-${name}.conf":
    content => template($template),
    owner   => 'root',
    group   => 'root',
    mode    => '755',
    require => Package['httpd'],
    notify  => Service['httpd']
  }
}
