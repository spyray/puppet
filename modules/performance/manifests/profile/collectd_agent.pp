class performance::profile::collectd_agent {
#anchor { 'performance::profile::collectd_agent::begin': }

  class { '::collectd':
    purge        => true,
    recurse      => true,
    purge_config => true,
    include      =>  hiera('collectd::collectd_agent::include'),
  }

  class { '::collectd::plugin::network':
    server       =>  hiera('collectd::plugin::network::server'),
    serverport   =>  hiera('collectd::plugin::network::serverport'),
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

  collectd::plugin { 'java': }
  collectd::plugin { 'logfile': }

#anchor { 'performance::profile::collectd_agent::end': }
#Anchor['performance::profile::collectd_agent::begin'] -> Class['::collectd'] -> Anchor['performance::profile::collectd_agent::end']
}
