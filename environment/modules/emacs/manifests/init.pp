class emacs($user) {

   package { 'emacs': ensure => installed }
  
   file { "/home/$user/.emacs.d":
     ensure => directory,
     owner => "$user",
     group => "$user",
   }

   file { "/home/$user/.emacs":
     source => "puppet:///modules/emacs/dot.emacs",
     owner => "$user",
     group => "$user",
   }

   # TODO: make generic file "method"
   
   file { "/home/$user/.emacs.d/init-ghc-mod.el":
     source => "puppet:///modules/emacs/init-ghc-mod.el",
     owner => "$user",
     group => "$user",
   }

   file { "/home/$user/.emacs.d/init-evil.el":
     source => "puppet:///modules/emacs/init-evil.el",
     owner => "$user",
     group => "$user",
   }

   file { "/home/$user/.emacs.d/init-color-theme-sanityinc.el":
     source => "puppet:///modules/emacs/init-color-theme-sanityinc.el",
     owner => "$user",
     group => "$user",
   }

}
