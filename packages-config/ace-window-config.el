(use-package ace-window
  :config
  ;; Set default keys for windows to keys in the top row of the keyboard
  ;; See https://github.com/abo-abo/ace-window#aw-keys
  (setq aw-keys '(?a ?z ?e ?r ?t ?y ?u ?i ?o))
  ;; Ignore some buffers and major modes
  ;; See https://github.com/abo-abo/ace-window#aw-ignore-on
  ;; and https://github.com/abo-abo/ace-window#aw-ignored-buffers
  (setq aw-ignore-on t)
  (setq aw-ignored-buffers '(treemacs-mode magit-status-mode))
  :bind
  ("M-o" . ace-window)
  )
