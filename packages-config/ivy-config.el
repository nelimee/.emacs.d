(use-package ivy
  :config
  (ivy-mode 1)
  ;; Virtual buffers (messages, infos, logs, ...) are highligted.
  (setq ivy-use-virtual-buffers t)  
  (setq ivy-count-format "(%d/%d) ")
  ;; Add fuzzy matching for file searching.
  ;; See https://oremacs.com/swiper/#completion-styles
  (setq ivy-re-builders-alist
        '((read-file-name-internal . ivy--regex-fuzzy) ;; fuzzy
          (t . ivy--regex-plus)))                      ;; default
  )

(use-package counsel
  :config
  (counsel-mode 1)
  )

(use-package swiper)
