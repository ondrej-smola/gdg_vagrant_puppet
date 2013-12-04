

$application_name = 'app'
$applications_root = '/usr/local/http'
$application_home = "$applications_root/$application_name"
$apache_sites_available = '/etc/apache2/sites-available' 
$apache_sites_enabled = '/etc/apache2/sites-enabled'

package{"apache2":
	ensure => latest	
}

service{"apache2":
	ensure => running,
	enable => true,					# registruje spuštění služby při spuštění OS
	require => Package["apache2"]  	
}

file{ $applications_root:
	ensure => directory,	
	mode	=> 755,
	owner => 'www-data'
}

file{ $application_home:
	ensure => directory,
	recurse	=> true,
	mode	=> 755,
	owner => 'www-data',
	source => "/vagrant/$application_name",
	require	=> File[$applications_root],	
}
->
file{"$apache_sites_available":
 ensure => directory,
 recurse => true,
 purge => true
}

file{"$apache_sites_available/${application_name}":	
	ensure => 'file',
	owner => 'www-data',
	mode => '755',	
	content => template('/vagrant/puppet/templates/apache_instance.erb'),
	require	=> File[$application_home]		
}
->
file{$apache_sites_enabled:
	recurse => true,
	purge => true,
	source => $apache_sites_available,
	notify => Service['apache2']
}
