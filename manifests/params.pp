class lincall::params {
  case $::osfamily {
    'Debian': {
      $desktop_path = '/usr/share/applications/lincall.desktop'
      $lincall_path = '/usr/bin/lincall'
      $linphone_path = '/usr/bin/linphone'
      $update_desktop_database_path = '/usr/bin/update-desktop-database'
    }
    'FreeBSD': {
      $desktop_path = '/usr/local/share/applications/lincall.desktop'
      $lincall_path = '/usr/local/bin/lincall'
      $linphone_path = '/usr/local/bin/linphone'
      $update_desktop_database_path = '/usr/local/bin/update-desktop-database'
    }
    default: {
      fail("unsupported osfamily: ${::osfamily}")
    }
  }
}
