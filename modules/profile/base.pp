class profile::base {
	# setup users
	$users = hiera_array('user')

	$users.each |$username| {
		user { $username:
			ensure 	=> present,
			shell 	=> '/bin/bash'
			groups 	=> ['adm', 'users']
		}

	}
}