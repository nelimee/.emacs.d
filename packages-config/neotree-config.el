(use-package neotree
  :bind (("C-c n" . neotree-projectile-action))
  :config
  ;; Change root with Projectile
  ;; See https://www.emacswiki.org/emacs/NeoTree#toc9
  (setq projectile-switch-project-action 'neotree-projectile-action)
  ;; See https://emacs.stackexchange.com/a/34758
  (setq neo-autorefresh nil)
  ;; Automatically resize Neotree window.
  ;; See https://github.com/jaypei/emacs-neotree/pull/110#issuecomment-238994385
  (defun neotree-resize-window (&rest _args)
    "Resize neotree window.
https://github.com/jaypei/emacs-neotree/pull/110"
    (interactive)
    (neo-buffer--with-resizable-window
     (let ((fit-window-to-buffer-horizontally t))
       (fit-window-to-buffer))))

  (add-hook 'neo-change-root-hook #'neotree-resize-window)
  (add-hook 'neo-enter-hook #'neotree-resize-window)
  )
