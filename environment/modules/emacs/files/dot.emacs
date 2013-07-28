(setq inhibit-startup-message 1)
(setq inhibit-startup-echo-area-message 1)

; Scroll only only line
(setq scroll-step 1)

; Set super to meta; both alt and super are now meta
(setq x-alt-keysym 'meta)

;; Always use utf-8
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

; Never use tabs to indent
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; Showing both the line number and the column number beside the procentage.
(column-number-mode t)
;; Make the buffer only scroll one line at a time ffs!
(setq scroll-step 1)

(when (display-graphic-p)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  ;; Get rid of the damn startup message
  ;; No scrollbars -- I hope
  (scroll-bar-mode -1)
  (menu-bar-no-scroll-bar)
  (redraw-display)
  (setq visible-bell t)
  (server-start))

;; For terminal use
(menu-bar-mode -1)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(setq el-get-user-package-directory "~/.emacs.d/")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(setq my-packages '(evil
                    color-theme-sanityinc
                    
 ; This might be necessary for haskellmode-emacs:
 ; http://projects.haskell.org/pipermail/haskellmode-emacs/2011-December/000124.html
                    haskellmode-emacs

                    flymake-cursor

                    ))

(el-get 'sync my-packages)

; Ido 
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(global-set-key (kbd "M-e") 'ido-switch-buffer)
(global-set-key (kbd "M-w") 'ido-kill-buffer)
(define-key evil-normal-state-map (kbd "M-e") 'ido-switch-buffer)
(define-key evil-normal-state-map (kbd "C-`") 'find-tag)

; This will depend on an installation of ghc-mod via cabal
; TODO: the path needs to handle the version better
(add-to-list 'exec-path "/home/vagrant/.cabal/bin")
(add-to-list 'load-path "/home/vagrant/.cabal/share/ghc-mod-2.0.3")
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda ()
                               (ghc-init)
                               (flymake-mode)))

(define-key haskell-mode-map (kbd "C-1") 'ghc-flymake-display-errors)


                               
