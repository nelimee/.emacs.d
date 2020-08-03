(use-package projectile
  :init
  ;; Set some paths where projectile should search for projects
  (setq projectile-project-search-path '("~/projects/"
                                         ;; "~/thesis/total/repositories/"
                                         ;; "~/PycharmProjects/"
                                         "~/thesis/papers/"
                                         ;; "~/thesis/presentations/"
                                         )
        )
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  ;; I want to sort by most recent, so I need to avoid alien mode
  ;; and use hybrid mode instead.
  (setq projectile-indexing-method 'hybrid)
  (setq projectile-sort-order 'recentf)
  (projectile-mode +1)
  )
