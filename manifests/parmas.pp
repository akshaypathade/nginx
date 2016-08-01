class nginx::parmas{


$document_root = '/usr/share/nginx/html'
$vhost_dir     = '/etc/nginx/conf.d'

 if($::fqdn){
     $servername = $::fqdn
  }

  else {
           $servername = $::hostname
                }




}
