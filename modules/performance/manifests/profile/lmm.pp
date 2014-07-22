class kvaas::profile::lmm {
   class {'::lmm':
     broker_list => hiera('kvaas::lmm::broker_list'),
     apikey      => hiera('kvaas::lmm::apikey'),
     tenant_id   => hiera('kvaas::lmm::tenant_id'),
     role        => hiera('role'),
   }
}
