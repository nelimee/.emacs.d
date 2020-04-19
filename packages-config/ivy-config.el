(use-package ivy
  :config
  (ivy-mode 1)
  ;; Virtual buffers (messages, infos, logs, ...) are highligted.
  (setq ivy-use-virtual-buffers t)  
  (setq ivy-count-format "(%d/%d) ")
  )

(use-package counsel
  :config
  (counsel-mode 1)
  )

(use-package swiper)
