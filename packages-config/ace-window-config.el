(use-package ace-window
  :config
  ;; Set default keys for windows to keys in the middle row of the keyboard
  ;; See https://github.com/abo-abo/ace-window#aw-keys
  (setq aw-keys '(?q ?s ?d ?f ?g ?h ?j ?k ?l))
  ;; Ignore some buffers and major modes
  ;; See https://github.com/abo-abo/ace-window#aw-ignore-on
  ;; and https://github.com/abo-abo/ace-window#aw-ignored-buffers
  (setq aw-ignore-on t)
  (setq aw-ignored-buffers '(treemacs-mode))
  :bind
  ("M-o" . ace-window)
  )
