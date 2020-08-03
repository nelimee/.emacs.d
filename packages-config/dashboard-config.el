(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "Welcome to Emacs!")
  (setq dashboard-startup-banner 'logo)
  ;; (setq dashboard-center-content t)
  ;; To customize which widgets are displayed.
  ;; This will add the recent files, bookmarks, projects, org-agenda
  ;; and registers widgets to your dashboard each displaying 5 items.
  (setq dashboard-items '((recents  . 5)
                          (bookmarks . 5)
                          (projects . 5)
                          (agenda . 5)
                          (registers . 5)))
  ;; To add icons to the widget headings and their items
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  ;; To show navigator below the banner
  (setq dashboard-set-navigator t)
  ;; To show info about the packages loaded and the init time
  (setq dashboard-set-init-info t)
  )
