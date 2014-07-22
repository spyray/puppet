class kvaas::profile::streaming {
anchor {'kvaas::profile::streaming::begin':}
 class {'::magnetodb::streaming':
  monit_enabled          =>  hiera('kvaas::magnetodb::streaming::monit_enabled'),
  verbose                =>  hiera('kvaas::magnetodb::streaming::verbose'),
  debug                  =>  hiera('kvaas::magnetodb::streaming::debug'),
  bind_host              =>  hiera('kvaas::magnetodb::streaming::bind_host'),
  bind_port              =>  hiera('kvaas::magnetodb::streaming::bind_port'),
  auth_host              =>  hiera('kvaas::auth_host'),
  auth_port              =>  hiera('kvaas::auth_port'),
  auth_protocol          =>  hiera('kvaas::auth_protocol'),
  auth_uri               =>  hiera('kvaas::auth_uri'),
  keystone_user          =>  hiera('kvaas::magnetodb::keystone_user'),
  keystone_tenant        =>  hiera('kvaas::magnetodb::keystone_tenant'),
  keystone_password      =>  hiera('kvaas::magnetodb::keystone_password'),
  keystone_auth_version  =>  hiera('kvaas::magnetodb::keystone_auth_version'),
  seeds                  =>  hiera('kvaas::magnetodb::contact_points'),
  } 

 if hiera('kvaas::magnetodb::streaming::monit_enabled') == 'true' {
 class {'::magnetodb::monit::streaming': 
     check_port => hiera('kvaas::magnetodb::streaming::bind_port')
  }
 }

include '::magnetodb::client'
anchor {'kvaas::profile::streaming::end':}
Anchor['kvaas::profile::streaming::begin'] -> Class['::magnetodb::streaming'] -> Class['::magnetodb::client'] -> Anchor['kvaas::profile::streaming::end']
}

