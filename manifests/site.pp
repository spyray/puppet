node default {
  case hiera('role') {
      'collectd_agent': {
                class { '::performance::role::collectd_agent': }
      }
      'collectd_agent_cassandra': {
                class { '::performance::role::collectd_agent_cassandra': }
      }
      'collectd_server': {
                class { '::performance::role::collectd_server': }
      }

      default:    {warning('Bad role.')}
  }
}
