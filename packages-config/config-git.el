(use-package magit
  :defer t
  :config
  (use-package gitignore-mode)
  :bind (("C-x g" . magit-status)))


(use-package evil-magit
  :defer t
  :requires magit)
