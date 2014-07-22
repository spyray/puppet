class kvaas::profile::java {

  class {'::java7tar':
    java_base    => hiera('kvaas::java7tar::java_base'),
    java_tarbar  => hiera('kvaas::java7tar::java_tarbar'),
    java_version => hiera('kvaas::java7tar::java_version'),
  }
}
