Exec["apt-get-update"] -> Package <| |>

Exec {
    path => "/usr/bin:/usr/sbin:/bin",
    logoutput => on_failure,
}

exec { "apt-get-update" :
    command => "/usr/bin/apt-get update",
    unless => "test $(expr $(date +%s) - $(stat -c %Y /var/lib/apt/lists)) -lt 604800"
}

group { "puppet": ensure => "present" }

node triton {

  $mainUser = 'vagrant'

  class { 'timezone':
    region => "Europe",
    locality => "Copenhagen",
  }

  # Rem tmux -u (unicode)
  class { 'tmux':
  }

  class { 'emacs':
    user => $mainUser,
  }

  zsh::install { $mainUser:
  }

  class { 'system':
    user => $mainUser,
  }

  class { 'mongrel2':
    user => $mainUser,
  }

  class { 'vim':
    user => $mainUser,
  }

  class { 'haskell':
  }
  
  class { 'mono':
  }

}
