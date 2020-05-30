(setq ring-bell-function 'ignore
      x-gtk-use-system-tooltips nil
      use-dialog-box nil
      make-backup-files nil
      auto-save-default nil
      create-lockfiles nil
      echo-keystrokes 0.5
      frame-resize-pixelwise t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
;(global-linum-mode -1)
(column-number-mode t)
(show-paren-mode t)
(delete-selection-mode 1)
(global-unset-key (kbd "C-z"))

(add-hook 'window-setup-hook 'toggle-frame-maximized t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Scrolling
(setq mouse-wheel-scroll-amount '(1)     ; scroll gentle
      mouse-wheel-progressive-speed nil  ; don't accelerate
      scroll-conservatively 101          ; don't jump to the middle of screen
      hscroll-margin 1                   ; don't you scroll that early!
      hscroll-step 1                     ; but scroll just a bit
      scroll-preserve-screen-position t) ; try to keep cursor in its position

(winner-mode t)
(defalias 'yes-or-no-p 'y-or-n-p)

;; Security hype
(setq gnutls-verify-error t
      tls-checktrust t)
