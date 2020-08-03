(use-package conda
  ;; :config
  ;; Write the actual conda environment in the mode line.
  ;; (setq-default mode-line-format (cons '(:exec conda-env-current-name) mode-line-format))
  :bind (("C-c C-p a" . conda-env-activate)
         ("C-c C-p d" . conda-env-deactivate)
         )
  )

(add-hook 'python-mode-hook
      (lambda ()
        (setq indent-tabs-mode nil)
        (setq tab-width 4)
        (setq python-indent-offset 4)))

