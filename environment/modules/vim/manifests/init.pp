class vim ($user) {

  package {
    "vim": ensure => installed;
  }
  
  file { "/home/$user/.vim/":
    ensure => directory,
    owner => "$user",
    group => "$user",
  }
  
  file { "/home/$user/.vim/bundle":
    ensure => directory,
    owner => "$user",
    group => "$user",
  }
  
  file { "/home/$user/.vim/autoload":
    ensure => directory,
    owner => "$user",
    group => "$user",
  }
  
  file { "/home/$user/.vim/autoload/pathogen.vim":
    source => "puppet:///modules/vim/pathogen.vim",
    owner => "$user",
    group => "$user",
  }
  
  file { "/home/$user/.vimrc":
    source => "puppet:///modules/vim/vimrc.vim",
    owner => "$user",
    group => "$user",
  }

  
  define plugin($path, $name, $user, $vcs = "git") {
    exec { "install-vim-$name":
      command => "$vcs clone $path $name",
      cwd => "/home/$user/.vim/bundle/",
      unless => "test -d $name",
      require => [Package['git'], Package['mercurial']],
      user => "$user",
    }
  }

  # Consider cloning these
  plugin { "vim-sensible":
    path => "git://github.com/tpope/vim-sensible.git",
    name => "vim-sensible",
    user => "$user",
  }

  plugin { "vim-markdown":
    path => "git://github.com/tpope/vim-markdown.git",
    name => "vim-markdown",
    user => "$user",
  }

  plugin { "vim-dispatch":
    path => "git://github.com/tpope/vim-dispatch.git",
    name => "vim-dispatch",
    user => "$user",
  }

  # Might take a look at vim-fugitive for git and vim-mercenary for mg

  if defined(Class['mono']) {
    plugin { "Omnisharp":
      path => "git://github.com/nosami/Omnisharp.git",
      name => "omnisharp",
      user => "$user",
      } ->
      exec { "omnisharp-submodules":
        command => "git submodule update --init",
        cwd => "/home/$user/.vim/bundle/omnisharp",
        require => [Package['git']],
        unless => "test -f /home/vagrant/.vim/bundle/omnisharp/server/OmniSharp/bin/Debug/OmniSharp.exe",
        user => "$user",
        } -> 
        exec { "omnisharp-build":
          command => "xbuild /p:Platform=\"Any CPU\"",
          cwd => "/home/$user/.vim/bundle/omnisharp/server",
          require => [Package['mono-devel']],
          unless => "test -f /home/vagrant/.vim/bundle/omnisharp/server/OmniSharp/bin/Debug/OmniSharp.exe",
          user => "$user",
        }
  }
      
  plugin { "supertab":
    path => "git://github.com/ervandew/supertab",
    name => "supertab",
    user => "$user",
  }

  plugin { "l9":
    path => "git://github.com/vim-scripts/L9",
    name => "l9",
    user => "$user",
  }

  plugin { "fuzzyfinder":
    path => "https://bitbucket.org/ns9tks/vim-fuzzyfinder",
    name => "fuzzyfinder",
    user => "$user",
    vcs => "hg"
  }

  plugin { "nerdcommenter":
    path => "git://github.com/scrooloose/nerdcommenter.git",
    name => "nerdcommenter",
    user => "$user",
  }

  plugin { "nerdtree":
    path => "git://github.com/scrooloose/nerdtree",
    name => "nerdtree",
    user => "$user",
  }
  
  plugin { "surround":
    path => "git://github.com/tpope/vim-surround",
    name => "vim-surround",
    user => "$user",
  }
  
  plugin { "rainbow":
    path => "git://github.com/kien/rainbow_parentheses.vim",
    name => "rainbow",
    user => "$user",
  }

  plugin { "molokai":
    path => "git://github.com/tomasr/molokai",
    name => "molokai",
    user => "$user",
  }
    

  # TODO: molokai

  # https://github.com/msanders/snipmate.vim -- just in case 
    
}
