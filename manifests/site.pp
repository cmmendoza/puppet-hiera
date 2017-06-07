hiera_include('classes',[])

node 'cmtest-puppetmaster.buildandrelease.org' {
        class { 'ntp':
                servers => [ 'ntp1.corp.com', 'ntp2.corp.com' ],
        }
#}
#node 'cmtest-puppetmaster.buildandrelease.org' {
#        include ntp
#        package { 'nano':
#               ensure => '2.3.1',
#        }
#        user { 'read only user':
#               name => 'voyeur',
#                ensure => 'present',	
#	}
	include ntp
        class { 'profile::release_accounts':
                ensure => 'present',
        }
	include profile::apache
	include profile::php
	include profile::mysql
}

node 'cmtest-puppetslave.buildandrelease.org' {
	include ::role::amp
	include ::role::webserver
}

node 'cha-wordpress-1.buildandrelease.org' {
	include role::amp
	include profile::wordpress	
}

node 'cha-wordpress-2.buildandrelease.org' {
	include role::amp
	include profile::wordpress
}
