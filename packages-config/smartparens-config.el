(use-package smartparens
  :config
  (require 'smartparens-config)
  (add-hook 'TeX-mode-hook #'smartparens-mode)
  (add-hook 'python-mode-hook #'smartparens-mode)
  (add-hook 'c++-mode-hook #'smartparens-mode)
  )
