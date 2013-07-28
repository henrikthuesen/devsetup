class system($user) {
    
  package { 'build-essential': ensure => present }
  package { 'rxvt-unicode-256color': ensure => installed }
  package { 'xclip': ensure => installed }
  package { 'unzip': ensure => installed }
  package { "htop": ensure => installed;}
  package { 'git': ensure => installed }
  package { 'mercurial': ensure => present }
  package { 'subversion': ensure => present }
  package { 'darcs': ensure => installed }
  
  file { "/etc/default/locale":
    source => "puppet:///modules/system/locale",
    owner => "root",
    group => "root",
  }
  
  file { "/home/$user/.Xdefaults":
    source => "puppet:///modules/system/Xdefaults",
    owner => "$user",
    group => "$user",
  }

  file { "/home/$user/.fonts":
    ensure => directory,
    owner => "$user",
    group => "$user",
  } ->
  file { "/home/$user/.fonts/Monaco_Linux.ttf":
    source => "puppet:///modules/system/Monaco_Linux.ttf",
    owner => "$user",
    group => "$user",
  } ->
  exec { 'update_font_cache':
    path    => '/bin:/usr/bin',
    user    => 'root',
    command => "fc-cache -f -v ",
    require => [Package['emacs']]
  }

  
}
