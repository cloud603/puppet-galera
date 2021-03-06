class galera::account_security {
  # Some installations have some default users which are not required.
  # We remove them here. You can subclass this class to overwrite this behavior.
  database_user { [ "root@${::fqdn}", "root@${::hostname}", 'root@127.0.0.1', 'root@::1',
                    "@${::fqdn}", "@${::hostname}", '@localhost', '@%' ]:
    ensure  => 'absent',
    require => Class['galera'],
  }
  database { 'test':
    ensure  => 'absent',
    require => Class['galera'],
  }
}
