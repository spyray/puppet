class performance::profile::collectd_server {
#anchor { 'performance::profile::collectd_server::begin': }

  class { '::collectd':
    purge        => true,
    recurse      => true,
    purge_config => true,
    include      => hiera('collectd::collectd_server::include'),
  }

  class { '::collectd::plugin::network':
    server       =>  hiera('collectd::plugin::network::server'),
    serverport   =>  hiera('collectd::plugin::network::serverport'),
    listen       =>  hiera('collectd::plugin::network::server'),
    listenport   =>  hiera('collectd::plugin::network::serverport'),
  }

  class { '::collectd::plugin::rrdtool':
    datadir      =>  hiera('collectd::plugin::rrdtool::datadir'),
  }

  collectd::plugin::python {
    'locust_plugin':
      modulepath    => '/usr/lib/collectd',
      module        => 'locust_plugin',
      script_source => 'puppet:///modules/performance/files/locust_plugin.py',
#      config        => {'Cluster' => 'locust'},
  }

  collectd::plugin { 'logfile': }

#anchor { 'performance::profile::collectd_server::end': }
#Anchor['performance::profile::collectd_server::begin'] -> Class['::collectd'] -> Anchor['performance::profile::collectd_server::end']
}
