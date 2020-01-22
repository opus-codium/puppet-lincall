# @summary Configure click-to-call from the desktop with Linphone
#
# @param desktop_path
# @param lincall_path
# @param linphone_path
# @param update_desktop_database_path
class lincall (
  Stdlib::Absolutepath $desktop_path,
  Stdlib::Absolutepath $lincall_path,
  Stdlib::Absolutepath $linphone_path,
  Stdlib::Absolutepath $update_desktop_database_path,
) {
  $protocols = [
    'call',
    'sip',
    'tel',
  ]

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
