class nginx(
$vhost_dir    = $nginx::parmas::vhost_dir,
$document_root= $nginx::parmas::document_root,
$servername   = $nginx::parmas::servername
)inherits nginx::parmas {



include nginx::service
include nginx::package


file{"$document_root":
    ensure => directory,
    recurse => true,
    }

nginx::resource::vhost{'default':
port          => 8000,
document_root => $document_root,
servername    => $servername,
vhost_dir     => $vhost_dir,
}



}
