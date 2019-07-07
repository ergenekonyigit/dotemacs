(use-package ivy
  :init
  (setq ivy-initial-inputs-alist nil)
  :custom
  (ivy-use-virtual-buffers t)
  :config
  (ivy-mode 1)
  (use-package ivy-hydra
    :defer t)
  (use-package flx))

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)))

(use-package counsel
  :straight t
  :after swiper
  :bind ("C-c j" . counsel-rg)
  :config
  (counsel-mode))
