class usaptest {

#TASK 1

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
			
 # ssh_authorized_key { 'ec2-user@ip-172-31-16-175.us-west-2.compute.internal':		ensure => present,
 #											user => 'wilma',
 #											type => 'ssh-rsa',
 #											key => ,}

  group { 'cars':   	ensure => present,}
  group { 'sysadmin':   ensure => present,} 
  group { 'trucks':     ensure => present,}
  group { 'ambulances': ensure => present,}

#TASK 2

#TASK 3

		package { 'openssl': 			ensure => installed,}
  package { 'httpd':   			ensure => installed,}
  package { 'mysql': 			ensure => installed,}	
  package { 'tigervnc-server':		ensure => installed,}
  package { 'tmux':			ensure => installed,} 
  package { 'dia2code':			ensure => installed,
					source => 'http://sourceforge.net/projects/dia2code/files/dia2code/0.8.3/dia2code-0.8.3-1.x86_64.rpm',}
  package { 'lynx':			ensure => installed,
					source => 'ftp://ftp.gwdg.de/opensuse/repositories/home:/TheIndifferent:/rhel7-icewm/rhel7-shared/x86_64/lynx-2.8.9-6.1.x86_64.rpm'}
  package { 'gcc':			ensure => installed,}
  package { 'gdb':			ensure => installed,}
  package {'cgdb':			ensure => installed,
					source => 'http://dl.fedoraproject.org/pub/epel/7/x86_64/c/cgdb-0.6.8-1.el7.x86_64.rpm',
					name => 'cgdb',}
  package { 'vim':    			ensure => installed,}
  package { 'emacs':			ensure => installed,}
  package {'fuse-devel':		ensure => installed,}
  package {'glib2-devel':		ensure => installed,}
  exec {'install_sshfs':		command => '/etc/puppetlabs/code/environments/production/manifests/sshfs-2.8/configure',
					cwd => '/etc/puppetlabs/code/environments/production/manifests/sshfs-2.8/',
					refreshonly => true,}	
				
#TASK 4

  augeas{"disable_root":		context   => "/etc/ssh/sshd_config",
								changes   => "set /etc/ssh/sshd_config",}

  file_line { 'change DocumentRoot':
  ensure => present,
  replace => true, 
  path  => '/etc/httpd/conf/httpd.conf',
  line  => 'DocumentRoot "/var/www/s3491364"',
  match => '^DocumentRoot "\/var\/www\/html"',
}

#TASK 5

#7 - wait until servers back up
					
  host{ 'titan.csit.rmit.edu.au':   	host_aliases => 'titan',
										ip => '131.170.5.131',}

  host{ 'saturn.csit.rmit.edu.au': 		host_aliases => 'saturn',
										ip => '131.170.5.132',
  }
										
  host{ 'jupiter.csit.rmit.edu.au': 	host_aliases => 'jupiter',
										ip => '131.170.5.135',}


#TASK 6 

  notify{ 'date': 	message => "Agent run starting at ${::date}",}

#TASK 7 

  file { "/etc/environment": content => 'export PATH:/usr/local/bin:$PATH',}

#TASK 8 

  service{ 'openssl':		ensure => running,
							enable => true,}

