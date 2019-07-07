(use-package cider
  :config
  (setq nrepl-log-messages t)
  ;(setq cider-default-cljs-repl 'figwheel)
  (setq cider-cljs-lein-repl
      "(do (require 'figwheel-sidecar.repl-api)
           (figwheel-sidecar.repl-api/start-figwheel!)
           (figwheel-sidecar.repl-api/cljs-repl))")
  (add-hook 'clojure-mode-hook 'cider-mode)
  (add-hook 'cider-repl-mode-hook #'company-mode)
  (add-hook 'cider-mode-hook #'company-mode)
  (add-hook 'cider-mode-hook #'eldoc-mode)
  (add-hook 'cider-repl-mode-hook #'eldoc-mode)
  (add-hook 'cider-mode-hook '(lambda () (local-set-key (kbd "RET") 'newline-and-indent))))
