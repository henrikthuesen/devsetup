(require 'ghc)

(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda ()
                               (ghc-init)
                               (message "ghc-mod loaded")
                               (flymake-mode)))
