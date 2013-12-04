
package{"apache2":
	ensure => latest,
	before => File["/etc/apache2/conf.d/security"]
}

service{"apache2":
	ensure => running,
	enable => true,					# registruje spuštění služby při spuštění OS
	require => Package["apache2"]  	
}

file{"/etc/apache2/conf.d/security":	
	owner => 'root',
	mode => '600',	
	source => '/vagrant/apache/security',	
	notify => Service['apache2']	
}
