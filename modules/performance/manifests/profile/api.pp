class kvaas::profile::api {
anchor {'kvaas::profile::api::begin':}
 class {'::magnetodb::api':
  monit_enabled          =>  hiera('kvaas::magnetodb::api::monit_enabled'),
  verbose                =>  hiera('kvaas::magnetodb::api::verbose'),
  debug                  =>  hiera('kvaas::magnetodb::api::debug'),
  bind_host              =>  hiera('kvaas::magnetodb::api::bind_host'),
  bind_port              =>  hiera('kvaas::magnetodb::api::bind_port'),
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

 if hiera('kvaas::magnetodb::api::monit_enabled') == 'true' {
 class {'::magnetodb::monit::api':
     check_port => hiera('kvaas::magnetodb::api::bind_port')
  }
}

include '::magnetodb::client'
anchor {'kvaas::profile::api::end':}
Anchor['kvaas::profile::api::begin'] -> Class['::magnetodb::api'] -> Class['::magnetodb::client'] -> Anchor['kvaas::profile::api::end']
}

