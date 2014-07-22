class kvaas::profile::cassandra {
anchor { 'kvaas::profile::cassandra::begin': }
  class { '::cassandra':
    package_name               => hiera('kvaas::cassandra::package_name'),
    version                    => hiera('kvaas::cassandra::version'),
    config_path                => hiera('kvaas::cassandra::config_path'),
    include_repo               => hiera('kvaas::cassandra::include_repo'),
    repo_name                  => hiera('kvaas::cassandra::repo_name'),
    repo_baseurl               => hiera('kvaas::cassandra::repo_baseurl'),
    repo_gpgkey_url            => hiera('kvaas::cassandra::repo_gpgkey_url'),
    repo_gpgkey                => hiera('kvaas::cassandra::repo_gpgkey'),
    repo_repos                 => hiera('kvaas::cassandra::repo_repos'),
    repo_release               => hiera('kvaas::cassandra::repo_release'),
    repo_pin                   => hiera('kvaas::cassandra::repo_pin'),
    max_heap_size              => hiera('kvaas::cassandra::max_heap_size'),
    heap_newsize               => hiera('kvaas::cassandra::heap_newsize'),
    jmx_port                   => hiera('kvaas::cassandra::jmx_port'),
    additional_jvm_opts        => hiera('kvaas::cassandra::additional_jvm_opts'),
    cluster_name               => hiera('kvaas::cassandra::cluster_name'),
    listen_address             => hiera('kvaas::cassandra::listen_address'),
    start_native_transport     => hiera('kvaas::cassandra::start_native_transport'),
    start_rpc                  => hiera('kvaas::cassandra::start_rpc'),
    rpc_port                   => hiera('kvaas::cassandra::rpc_port'),
    rpc_address                => hiera('kvaas::cassandra::rpc_address'),
    native_transport_port      => hiera('kvaas::cassandra::native_transport_port'),
    storage_port               => hiera('kvaas::cassandra::storage_port'),
    data_file_directories      => hiera('kvaas::cassandra::data_file_directories'),
    commitlog_directory        => hiera('kvaas::cassandra::commitlog_directory'),
    saved_caches_directory     => hiera('kvaas::cassandra::saved_caches_directory'),
    initial_token              => hiera('kvaas::cassandra::initial_token'),
    num_tokens                 => hiera('kvaas::cassandra::num_tokens'),
    seeds                      => hiera('kvaas::cassandra::seeds'),
    auto_bootstrap             => hiera('kvaas::cassandra::auto_bootstrap'),
    concurrent_reads           => hiera('kvaas::cassandra::concurrent_reads', $::processorcount * 8),
    concurrent_writes          => hiera('kvaas::cassandra::concurrent_writes', $::processorcount * 8),  
  }

  class {'::java7tar':
    java_base    => hiera('kvaas::java7tar::java_base'),
    java_tarbar  => hiera('kvaas::java7tar::java_tarbar'),
    java_version => hiera('kvaas::java7tar::java_version'),
  }

anchor { 'kvaas::profile::cassandra::end': }
Anchor['kvaas::profile::cassandra::begin'] -> Class['::java7tar'] -> Class['::cassandra'] -> Anchor['kvaas::profile::cassandra::end']
}

