# site.pp

# role, z.B. appserver, dbsserver
$role 				= hiera('role')
# fact mit physikalischer Lokalisation, z.B. rz1
$location 			= hiera('location')
# fact mit application, z.b elena
$application		= hiera('application')
# dev, prod, test
$application_tier	= hiera('application_tier')

include "role::$role"