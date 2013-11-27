file{'/tmp/some-facts.txt':
  ensure => file,
  content => "This Learning Puppet VM's IP address is $ipaddress. It think its hostname is $fqdn, but you might not be able to reach it from your host machine. It is running $operatingsystem $operatingsytemrelease and Puppet $puppetversion.
  Web console login:
    URL: https://$ipaddress_eth0
    User: puppet@example.com
    Password: learningpuppet
  "
}
