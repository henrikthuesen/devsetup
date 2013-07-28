class mongrel2($user) {
  $version = "3.2.3"
  $archive = "zeromq-${version}.tar.gz"
  $install = "/home/$user/.install"

  file { "$install":
    ensure => "directory",
    owner => "$user",
    group => "$user",
  }

  exec { 'download_zeromq':
    command   => "/usr/bin/curl -v --progress-bar -o '$install/${archive}' 'http://download.zeromq.org/${archive}'",
    creates   => "$install/${archive}",
    user      => "$user",
    logoutput => true,
    require   => [ Package['curl'], File["$install"] ],
    before    => Exec['zeromq-untar'],
    unless => "test -e $install/$archive",
  }

  exec { 'zeromq-untar':
    command => "tar xf ${archive}",
    cwd     => "$install",
    creates => "$install/zeromq-${version}",
    user    => "$user",
    path    => ['/bin','/usr/bin'],
    unless => "test -e /usr/local/lib/libzmq.so",
  } ->
    exec { 'zeromq-configure':
      command => "$install/zeromq-${version}/configure",
      cwd     => "$install/zeromq-${version}",
      user    => "$user",
      path    => ['/bin','/usr/bin'],
      unless => "test -e /usr/local/lib/libzmq.so",
      
    } ->
      exec { 'zeromq-install':
        command => "make install",
        logoutput => true,
        cwd     => "$install/zeromq-${version}",
        user    => "root",
        path    => ['/bin','/usr/bin'],
        unless => "test -e /usr/local/lib/libzmq.so",
      }

  $m2version = "1.8.0"
  $m2archive = "mongrel2-v${m2version}.tar.gz"
      
  package {
    'sqlite3': ensure => installed;
    'libsqlite3-dev': ensure => installed;
  }
      
  exec { 'download_mongrel2':
    command   => "/usr/bin/curl -L -v --progress-bar -o '$install/${m2archive}' 'https://github.com/zedshaw/mongrel2/tarball/v${m2version}'",
    creates   => "$install/${m2archive}",
    user      => "$user",
    logoutput => true,
    require   => [ Package['curl'], File["$install"] ],
    before    => Exec['m2-untar'],
    unless => "test -e $install/$m2archive",
  }

  exec { 'm2-untar':
    command => "tar xf ${m2archive} && mv zeds* mongrel2-${m2version}",
    creates   => "$install/mongrel2-${m2version}",
    cwd     => "$install",
    user    => "$user",
    logoutput => true,
    path    => ['/bin','/usr/bin'],
  } ->
    exec { 'm2-install':
      command => "make all install",
      cwd     => "$install/mongrel2-${m2version}",
      user    => "root",
      path    => ['/bin','/usr/bin'],
      environment => 'LD_LIBRARY_PATH=/usr/local/lib/',
      require   => [ Package['sqlite3'], Package['libsqlite3-dev'], Exec['zeromq-install'] ],
      unless => "test -e /usr/local/bin/m2sh",
    } 
   
}
    
