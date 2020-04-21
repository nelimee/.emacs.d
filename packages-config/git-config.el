;; From https://github.com/Alexander-Miller/treemacs/blob/20fc86d6222789b1fe6495494ad2fc17de3147d7/src/elisp/treemacs-core-utils.el#L931
(defun nelimee--magit-set-width (width)
  "Set the width of the magit buffer to WIDTH."
  (unless (one-window-p)
    (let ((window-size-fixed)
          (w (max width window-min-width)))
      (cond
       ((> (window-width) w)
        (shrink-window-horizontally  (- (window-width) w)))
       ((< (window-width) w)
        (enlarge-window-horizontally (- w (window-width))))))))

(defun nelimee--magit-status (&optional directory cache)
  (interactive)
  ;; The modeline is not useful in magit, hide it!
  ;; From https://github.com/hlissner/emacs-doom-themes/blob/8d5ddbbb72752fdd981407bdc2e33d917675e919/doom-themes-ext-treemacs.el
  (magit-status directory cache)
  (setq mode-line-format nil)
  (set-window-dedicated-p (selected-window) t)
  (let ((window-size-fixed))
    (nelimee--magit-set-width 60))
  )

(use-package magit
  :defer t
  :hook
  ;; Automatically refresh magit status buffer on save.
  ;; See https://magit.vc/manual/magit/Automatic-Refreshing-of-Magit-Buffers.html#Automatic-Refreshing-of-Magit-Buffers
  (after-save . magit-after-save-refresh-status)
  :bind (("C-c g" . nelimee--magit-status)))


(use-package evil-magit
  :defer t
  :requires magit)

(use-package gitignore-mode
  :defer t
  :requires magit)
