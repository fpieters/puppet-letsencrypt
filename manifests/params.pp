class letsencrypt::params {
  $agree_tos           = true
  $unsafe_registration = false
  $manage_config       = true
  $manage_install      = true
  $manage_dependencies = true
  $configure_epel      = true
  $package_ensure      = 'installed'
  $config_file         = '/etc/letsencrypt/cli.ini'
  $path                = '/opt/letsencrypt'
  $venv_path           = '/opt/letsencrypt/.venv' # virtualenv path for vcs-installed letsencrypt
  $repo                = 'git://github.com/letsencrypt/letsencrypt.git'
  $version             = 'v0.4.0'
  $config              = {
    'server'           => 'https://acme-v01.api.letsencrypt.org/directory',
    'rsa-key-size'     => '4096',
  }

  if $::operatingsystem == 'Debian' and versioncmp($::operatingsystemrelease, '9') >= 0 {
    $install_method = 'package'
  } elsif $::operatingsystem == 'Ubuntu' and versioncmp($::operatingsystemrelease, '16.04') >= 0 {
    $install_method = 'package'
  } elsif $::osfamily == 'RedHat' {
    $install_method = 'package'
  } else {
    $install_method = 'vcs'
  }
}
