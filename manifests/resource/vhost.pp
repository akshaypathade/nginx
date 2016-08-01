define nginx::resource::vhost( $port,$document_root,$servername,$vhost_name ='*',$vhost_dir) {



exec{ 'index':
command => "curl https://raw.githubusercontent.com/puppetlabs/exercise-webpage/master/index.html > /usr/share/nginx/html/index.html",
path  => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
notify => File['config_file'],
}



file{'config_file':
    path    => "${vhost_dir}/default.conf",
    ensure  => file,
    content => template('nginx/vhost.conf.erb'),
    require => Package['nginx'],
    notify  => Service['nginx'],

}
}
