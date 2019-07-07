(setq sp-highlight-pair-overlay nil
      sp-cancel-autoskip-on-backward-movement nil
      sp-show-pair-delay 0
      sp-show-pair-from-inside t
      ;; TODO: doesn't work,
      ;; track https://github.com/Fuco1/smartparens/issues/961
      sp-escape-quotes-after-insert nil
      sp-escape-wrapped-region nil)

;; Stolen from http://web-mode.org/ "I want to use smartparens" section
;; and modified with eval-after-load and use-package
(defun sp-web-mode-hook ()
  (setq web-mode-enable-auto-pairing nil))

(eval-after-load 'web-mode
  (add-hook 'web-mode-hook  'sp-web-mode-hook))

(defun sp-web-mode-is-code-context (id action context)
  (and (eq action 'insert)
       (not (or (get-text-property (point) 'part-side)
                (get-text-property (point) 'block-side)))))

(defun create-newline-and-enter-sexp (&rest _ignored)
  "Open a new brace or bracket expression, with relevant newlines and indent."
  (interactive)
  (if (sp-point-in-empty-sexp)
      (progn
        (newline)
        (indent-according-to-mode)
        (split-line)
        (indent-according-to-mode))
    (newline nil t)))

(use-package smartparens
  :hook (after-init . smartparens-global-mode)
  :config
  (require 'smartparens-config)
  (sp-local-pair 'web-mode "<" nil :when '(sp-web-mode-is-code-context))
  :bind (:map prog-mode-map
              ("RET" . create-newline-and-enter-sexp)))

(use-package smartparens
  :config
  (require 'smartparens-config)
  (smartparens-global-mode))

(use-package expand-region
  :bind (("C-=" . er/expand-region)
	 ("C--" . er/contract-region)))

(use-package multiple-cursors
  :init
  (progn
    ;; these need to be defined here - if they're lazily loaded with
    ;; :bind they don't work.
    (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
    (global-set-key (kbd "C->") 'mc/mark-next-like-this)
    (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
    (global-set-key (kbd "C-c C->") 'mc/mark-all-like-this)))
