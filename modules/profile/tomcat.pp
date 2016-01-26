class profile::tomcat {
	$java_version 		= hiera('java_version')
	$tomcat_users		= hiera('tomcat_users')
	$tomcat_defaults	= hiera_hash('tomcat_defaults')
	$applications		= hiera_array('war_files')

	class { 'java':
		version => $java_version
	}

	class { 'tomcat':
		install_from_source => false,
		*					=> $tomcat_defaults,
	}


	$tomcat_users.each |$user, $password| {
		tomcat::config::server::tomcat_users {
			roles	 => ['role'],
			password => $password
		}
	}

	# Alle War-Files deployen, die für das System vorgesehen sind
	$war_files.each |$war| {
		tomcat::war { $war:
			$catalina_base = '/pfad/to/catalina_base'
		}
	}



}