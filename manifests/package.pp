class nginx::package{
package{'curl':
ensure => installed,
before => Package['nginx'],
}


case $operatingsystem{
 'RedHat','CentOS':{

package{'epel-release':
  ensure => installed,
}


package{'nginx':
ensure  => installed,
require => Package['epel-release'],
}

}
default: {

package{'nginx':
ensure => installed,
}

}


}

}

