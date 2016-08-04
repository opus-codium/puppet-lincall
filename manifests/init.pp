class lincall (
  $desktop_path = $lincall::params::desktop_path,
  $lincall_path = $lincall::params::lincall_path,
  $linphone_path = $lincall::params::linphone_path,
  $update_desktop_database_path = $lincall::params::update_desktop_database_path,
) inherits lincall::params {
  file { $desktop_path:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('lincall/lincall.desktop'),
  }

  file { $lincall_path:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('lincall/lincall.sh'),
  }

  ensure_packages(['desktop-file-utils'], { ensure => installed })

  exec { 'lincall update-desktop-database':
    command     => $update_desktop_database_path,
    refreshonly => true,
    require     => Package['desktop-file-utils'],
  }

  File[$desktop_path] ~> Exec['lincall update-desktop-database']
}
