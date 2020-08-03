(use-package cc-mode
  :config
  ;; "*.h" are open with c-mode by default, make it c++-mode
  (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
  (setq-default fill-column 80)
  :hook
  ((c++-mode . hs-minor-mode))
  )

(use-package highlight-doxygen
  :hook
  ((c++-mode . highlight-doxygen-mode))
  )
