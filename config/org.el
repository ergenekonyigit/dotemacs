(use-package org
  :mode ("\\.org\\'" . org-mode))

(setq org-startup-indented 'f)
(setq org-directory "~/Google Drive/org")
(setq org-special-ctrl-a/e 't)
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-mobile-directory "~/Google Drive/org/")
(setq org-src-tab-acts-natively t)
(setq org-src-window-setup 'current-window)

;; no confirmation
(setq org-confirm-babel-evaluate nil)
;; syntax highlighting
(setq org-src-fontify-natively t)
;; todo states
(setq org-todo-keywords
      '((sequence "TODO" "IN PROGRESS" "|" "DONE" "ABANDONED")))
;; set key for agenda
(define-key global-map (kbd "C-c a") 'org-agenda)
(define-key global-map (kbd "C-c l") 'org-store-link)
(define-key global-map (kbd "C-c c") 'org-capture)
;; file to save to do items
(setq org-agenda-files (quote ("~/Google Drive/org/daily-todo.org")))
;; set priority range from A to C with default A
(setq org-highest-priority ?A)
(setq org-lowest-priority ?C)
(setq org-default-priority ?A)
;; open agenda in current window
(setq org-agenda-window-setup 'current-window)
;; capture todo items using C-c c t
(setq org-capture-templates
      '(("t" "todo" entry (file+headline "~/Google Drive/org/engineering-notes.org" "Today")
         "* TODO %?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))\n\n")))
;; time logging
(setq org-log-done 'time)

(use-package org-plus-contrib
  :mode (("\\.org$" . org-mode))
  :bind
  ("C-c l" . org-store-link)
  ("C-c a" . org-agenda))
