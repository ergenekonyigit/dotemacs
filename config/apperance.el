(global-hl-line-mode t)

(global-visual-line-mode 1)
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
(fringe-mode 4)

(setq font-name "Iosevka")
(defcustom font-size 18 "My default font size")

(defun set-frame-font-size (&optional font-size)
  "Change frame font size to FONT-SIZE.
If no FONT-SIZE provided, reset the font size to its default variable."
  (let ((font-size
	   (or font-size
	       (car (get 'font-size 'standard-value)))))
    (customize-set-variable 'font-size font-size)
    (set-frame-font
     (format "%s %d" font-name font-size) nil t)))

(defun increase-frame-font ()
  "Increase frame font by one."
  (interactive)
  (set-frame-font-size (+ font-size 1)))

(defun decrease-frame-font ()
  "Decrease frame font by one."
  (interactive)
  (set-frame-font-size (- font-size 1)))

(defun reset-frame-font ()
  "Reset frame font to its default value."
  (interactive)
  (set-frame-font-size))

(add-hook 'after-init-hook 'reset-frame-font)

;; Probably good case for a hydra
(global-set-key (kbd "C-x C-0") 'reset-frame-font)
(global-set-key (kbd "C-x C--") 'decrease-frame-font)
(global-set-key (kbd "C-x C-=") 'increase-frame-font)
(global-set-key (kbd "C-x C-+") 'text-scale-adjust)

(use-package spacemacs-theme
  :defer t
  :custom
  (spacemacs-theme-comment-bg nil)
  (spacemacs-theme-comment-italic t))

(use-package kaolin-themes
  :defer t)

(use-package heaven-and-hell
  :init
  (setq heaven-and-hell-theme-type 'dark)
  (setq heaven-and-hell-themes
	  '((light . spacemacs-light)
	    (dark . kaolin-mono-dark)))
  :hook (after-init . heaven-and-hell-init-hook)
  :bind ("<f6>" . heaven-and-hell-toggle-theme))

(use-package which-key
  :init (which-key-mode))

(use-package org-bullets
  :hook (org-mode . org-bullets-mode))

(use-package minions
  :config (minions-mode 1))

(use-package darkroom-mode)

;;(use-package markdown-mode
;;  :ensure t
;;  :commands (markdown-mode gfm-mode)
;;  :mode (("README\\.md\\'" . gfm-mode)
;;         ("\\.md\\'" . markdown-mode)
;;         ("\\.markdown\\'" . markdown-mode))
;;  :init (setq markdown-command "pandoc"))
