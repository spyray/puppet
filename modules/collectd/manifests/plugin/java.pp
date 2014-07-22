#
class collectd::plugin::java (
  $ensure         = present,
  $service_addr   = '127.0.0.1',
  $service_port   = '7199',
) {

  collectd::plugin {'java':
    ensure  => $ensure,
    content => template('collectd/plugin/java.conf.erb'),
  }
}
