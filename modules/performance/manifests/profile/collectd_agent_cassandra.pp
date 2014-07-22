class performance::profile::collectd_agent_cassandra {
#anchor { 'performance::profile::collectd_agent_cassandra::begin': }

  class { '::collectd':
    purge        => true,
    recurse      => true,
    purge_config => true,
    include      => hiera('collectd::collectd_agent_cassandra::include'),
  }

  class { '::collectd::plugin::network':
    server       =>  hiera('collectd::plugin::network::server'),
    serverport   =>  hiera('collectd::plugin::network::serverport'),
  }

  class { '::collectd::plugin::java':
    service_addr  =>  hiera('collectd::plugin::java::service_addr'),
    service_port  =>  hiera('collectd::plugin::java::service_port'),
  }

  class { '::collectd::plugin::cpu': }
  class { '::collectd::plugin::df': }
  class { '::collectd::plugin::disk': }
  class { '::collectd::plugin::entropy': }
  class { '::collectd::plugin::interface': }
  class { '::collectd::plugin::irq': }
  class { '::collectd::plugin::load': }
  class { '::collectd::plugin::memory': }
  class { '::collectd::plugin::processes': }
  class { '::collectd::plugin::swap': }
  class { '::collectd::plugin::users': }

  collectd::plugin { 'logfile': }

#anchor { 'performance::profile::collectd_agent_cassandra::end': }
#Anchor['performance::profile::collectd_agent_cassandra::begin'] -> Class['::collectd'] -> Anchor['performance::profile::collectd_agent_cassandra::end']
}
