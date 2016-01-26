class profile::postgresql {
  $postgres_instances = hiera("postgres_instances")
  $postgres_databases = hiera("databases")
  # ... weitere Parameter
  # z.B. Grants und dergleichen

  $postgres_defaults = {
    version => '9.4',
    port  => '5432',
  }

  $postgres_instances.each |$instance_name, $options| {
    $pg_options = merge($postgres_defaults, $options)
    
    # NOTE: Forge-Modul für PostgreSQL enthält schon ein Mapping
    # von PostgreSQL-Versionen auf PostGIS-Versionen
    $postgis_version = $pg_options['version'] ? {
      '9.2' => '2.0'
      '9.4' => '2.1',
    }


    postgresql::instance { $instance_name:
      postgis_version => $postgis_version,
      *       => $pg_options
    }
  }


}