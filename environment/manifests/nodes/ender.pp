node ender {

  $mainUser = 'ht'

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
  
  # class { 'mono':
  # }

}
