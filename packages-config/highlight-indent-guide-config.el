(use-package highlight-indent-guides
  :config
  (setq highlight-indent-guides-method 'character)
  :hook
  (c++-mode . highlight-indent-guides-mode)
  )
