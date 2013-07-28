(evil-mode 1)

(setq evil-default-cursor t)
(setq evil-want-C-u-scroll 't)

(setq evil-auto-indent 1)

(define-key global-map (kbd "RET") 'newline-and-indent)

; Don't know is this should be here... (evil depends on undo-tree-mode)
(global-undo-tree-mode)
