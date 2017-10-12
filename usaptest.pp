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
		    groups => ['trucks', 'cars', 'wheel'],
		    password => '$1$9n4qi3rw$Z5JPTgBmp0/1P5fUmIAAf.',    
		    uid => '10021364',
		    shell => '/bin/csh',}
  user{ 'wilma':    ensure => present, 
		    managehome => true, 
		    home => '/home/wilma',
		    groups => ['trucks', 'cars', 'ambulances'],
		    password => '$1$oRKnT248$8OZSU09IWKbQ4MMXpruDp/',
		    uid => '10031364',}			
 
  ssh_authorized_key { 'ec2-user@ip-172-31-16-175.us-west-2.compute.internal':		ensure => present,
 											user => 'wilma',
 											type => 'ssh-rsa',
 											key => 'AAAB3NzaC1yc2EAAAADAQABAAABAQCghh8RQsB0Gp9f/hwKjZRxbXuMdY4H0wQ/e7jTA/5zOgQzKBea4QGu+3BDtzJTfLjby2jIVMyLYRt4EIaM8NurZetwZSnhRDqlv5VK1Qk0CKd1MX5iFukavPjmSFIf6fMEKrw63AXeIhpxn97EfA864E6qKtIA06VijJLwYMeV+SXvIsYvlOltlXK0a2zqVNItJjbcfcpQuGxDsLrTiB2o64aHr4owqi9a0YMkf/dWl0b1p28DNc0CwTGa3NTAc2wYR98IggRrzMKxHsEhVrk1dawYjHbOhGtM0tjoa+Yj4Z8KwuZ8JXxtA2j5FCngwHD1mrHLH/7yyapa/WmiTuJH',}

  group { 'cars':   	ensure => present,}
  group { 'sysadmin':   ensure => present,} 
  group { 'trucks':     ensure => present,}
  group { 'ambulances': ensure => present,}

#TASK 2

#ini_setting { 'agent_runinterval':	ensure => present,
#					path    => "/etc/puppetlabs/puppet/puppet.conf",
#					section => "agent",
#					setting => "runinterval",
#					value => "1200",}

#TASK 3

  package { 'openssh': 			ensure => installed,}
  package { 'httpd':   			ensure => installed,}
  package { 'mysql': 			ensure => installed,}	
  package { 'tigervnc-server':		ensure => installed,}
  package { 'tmux':			ensure => installed,} 
  package { 'dia2code':			ensure => installed,
					source => 'dia-0.97.2-29.1.x86_64.rpm',}
  package { 'lynx':			ensure => installed,
					source => 'ftp://ftp.gwdg.de/opensuse/repositories/home:/TheIndifferent:/rhel7-icewm/rhel7-shared/x86_64/lynx-2.8.9-6.1.x86_64.rpm'}
  package { 'gcc':			ensure => installed,}
  package { 'gdb':			ensure => installed,}
  package { 'cgdb':			ensure => installed,
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

  file_line { 'disable root':     	ensure => present,
					replace => true,
					path => '/etc/ssh/sshd_config',
					line => 'PermitRootLogin no',
					match => 'PermitRootLogin yes',}

  file_line { 'change DocumentRoot':	ensure => present,
 					replace => true, 
  					path => '/etc/httpd/conf/httpd.conf',
  					line  => 'DocumentRoot "/var/www/s3491364"',
  					match => '^DocumentRoot "\/var\/www\/html"',}

  file_line {'becca sudo':		ensure => present,
					path => '/etc/sudoers',
					line => 'becca		ALL=(ALL)	NOPASSWD:ALL',}

#TASK 5
					
  host{ 'titan.csit.rmit.edu.au':   	host_aliases => 'titan',
					ip => '131.170.5.131',}

  host{ 'saturn.csit.rmit.edu.au': 	host_aliases => 'saturn',
					ip => '131.170.5.132',}
										
  host{ 'jupiter.csit.rmit.edu.au': 	host_aliases => 'jupiter',
					ip => '131.170.5.135',}

#TASK 6 

  $time = generate("/bin/date");	
  notify{ 'date': 			message => "Agent run starting at ${time}",}

#TASK 7 

  file_line { "/etc/environment": 	ensure => present,
					path => '/etc/environment',
					line => 'export PATH:/usr/local/bin:$PATH',}

#TASK 8 

}

