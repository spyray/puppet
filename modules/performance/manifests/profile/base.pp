class kvaas::profile::base {

anchor {'kvaas::profile::base::begin':}

  # all nodes need the OpenStack repository
   class { '::kvaas::resources::repo':
     uca_repo                 => hiera('kvaas::base::uca_repo'),
     release_repo_uca         => hiera('kvaas::base::release_repo_uca'),
     location_repo_uca        => hiera('kvaas::base::location_repo_uca'),
     repos_uca                => hiera('kvaas::base::repos_uca'),
     magnetodb_repo           => hiera('kvaas::base::magnetodb_repo'),
     release_repo_magnetodb   => hiera('kvaas::base::release_repo_magnetodb', $::lsbdistcodename),
     location_repo_magnetodb  => hiera('kvaas::base::location_repo_magnetodb'),
     repos_magnetodb          => hiera('kvaas::base::repos_magnetodb','main'),
     key_source_magnetodb     => hiera('kvaas::base::key_source_magnetodb'),
     key_repo_magnetodb       => hiera('kvaas::base::key_repo_magnetodb'),
    }

# Keystone HOSTNAME
  host { "keystone.ash2.symcpe.net":
    name         => "keystone.ash2.symcpe.net",
    ensure       => present,
    ip           => '169.254.169.251',
  }
# Magnetodb endpoint HOSTNAME
  host { "magnetodb.kvs.ash2.symcpe.net":
    ensure       => present,
    ip           => '169.254.169.245',
  }
# LMM endpoints HOSTNAMES
  host { "plmmkaash20001.prod.symcpe.net":
    ensure       => present,
    ip           => '169.254.169.246',
  }

  host { "plmmkaash20002.prod.symcpe.net":
    ensure       => present,
    ip           => '169.254.169.247',
  }

  host { "plmmkaash20003.prod.symcpe.net":
    ensure       => present,
    ip           => '169.254.169.248',
  }

  host { "plmmkaash20004.prod.symcpe.net":
    ensure       => present,
    ip           => '169.254.169.249',
  }

  host { "plmmkaash20005.prod.symcpe.net":
    ensure       => present,
    ip           => '169.254.169.250',
  }

anchor {'kvaas::profile::base::end':}
Anchor['kvaas::profile::base::begin'] -> Class['kvaas::resources::repo'] -> Anchor['kvaas::profile::base::end']
}

