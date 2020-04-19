(use-package magit
  :defer t
  :bind (("C-c g" . magit-status)))


(use-package evil-magit
  :defer t
  :requires magit)

(use-package gitignore-mode
  :defer t
  :requires magit)
