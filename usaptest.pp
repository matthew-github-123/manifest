class usaptest {
 
#TASK 1

#2 - ssh key

  user { 'becca':   ensure => present,
    		    managehome => true,    
		    home => '/home/becca',   
		    groups => ['sysadmin', 'cars'],
		    password => '$1$JmHq8zq7$RqwSUJUN3oTOsW5UmM6ot.',	 
		    uid => '10011364',
		    shell => '/bin/bash',}
  user{ 'fred':     ensure => present,
		    managehome => true,
		    home => '/home/fred',
		    groups => ['trucks', 'cars'],
		    password => '$1$9n4qi3rw$Z5JPTgBmp0/1P5fUmIAAf.',    
		    uid => '10021364',
		    shell => '/bin/csh',}
  user{ 'wilma':    ensure => present, 
		    managehome => true, 
		    home => '/home/wilma',
		    groups => ['trucks', 'cars', 'ambulances'],
		    password => '$1$oRKnT248$8OZSU09IWKbQ4MMXpruDp/',
		    uid => '10031364',}

  group { 'cars':   	ensure => present,}
  group { 'sysadmin':   ensure => present,} 
  group { 'trucks':     ensure => present,}
  group { 'ambulances': ensure => present,}

#TASK 2

#3 - not started 

#TASK 3

#4 - rpm download or not?
#5 - remaining packages

  package { 'openssl': 		ensure => installed,}
  package { 'httpd':   		ensure => installed,}
  package { 'mysql-server': 	ensure => installed,}
  package { 'mysql-client':	ensure => installed,}
  package { 'tigervnc-server':	ensure => installed,}
  package { 'tmux':		ensure => installed,} 
  package { 'lynx':		ensure => installed,}
  package { 'gcc':		ensure => installed,}
  package { 'gdb':		ensure => installed,}
  package { 'cgdb':		ensure => installed,}
  package { 'vim':    		ensure => installed,}
  package { 'emacs':		ensure => installed,}
  package { 'fuse-sshfs':	provider => 'rpm', 
				ensure => installed, 
   				source => 'fuse-sshfs-2.5-1.el7.rf.x86_64.rpm',}

#TASK 4

#6 - searching and replacing lines

  file_line { 'change DocumentRoot':
  ensure => present,
  replace => true, 
  path  => '/etc/httpd/conf/httpd.conf',
  line  => 'DocumentRoot "/var/www/s3491364"',
  match => '^DocumentRoot "\/var\/www\/html"',
}

#TASK 5

#7 - wait until servers back up

  host{ 'titan.csit.rmit.edu.au': 	host_aliases => 'titan',
   					ip => '127.0.0.1',}

#TASK 6 

#8 - how to find correct log file

  notify{ 'date': 	message => "Agent run starting at ${::date}",}

#TASK 7 

  file { "/etc/environment": content => 'export PATH:/usr/local/bin:$PATH',}

#TASK 8 

#9 - understand services resource more

  service{ 'openssl':		ensure => running,
				enable => true,}


#ADDITIONAL
#  exec { 'puppet_module_stdlib':  command => "puppet module install puppetlabs-stdlib --version 4.20.0",}



}
