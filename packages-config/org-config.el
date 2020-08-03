(use-package org
  :config
  ;; Define some templates
  (setq org-capture-templates
        '(
          ("m" "Meeting note"
           entry (file+olp+datetree "~/thesis/.org-files/meetings.org")
           "* %^{Meeting title} (%<%H:%M>)\n** Participants\n 1. %?\n** Notes\n"
           :empty-lines 1)

          ("j" "Journal entry"
           entry (file+olp+datetree "~/thesis/.org-files/journal.org")
           "* %^{Entry title} (%<%H:%M>)\n\n %?"
           :empty-lines 1)
          )
        )
  (setq org-startup-truncated nil)
  :bind (("C-c c" . org-capture)
         ("C-c l" . org-store-link)
         ("C-c a" . org-agenda))
  :hook (org-mode . auto-fill-mode)
  )

(use-package ox-hugo
  ;; :config
  ;; ;; Hugo orgmode exporter, auto-export on file save.
  ;; (require 'ox-hugo-auto-export)
  :after ox
  )

;; From https://ox-hugo.scripter.co/doc/org-capture-setup/
;; Populates only the EXPORT_FILE_NAME property in the inserted headline.
(with-eval-after-load 'org-capture
  (defun org-hugo-new-subtree-post-capture-template ()
    "Returns `org-capture' template string for new Hugo post.
See `org-capture-templates' for more information."
    (let* ((title (read-from-minibuffer "Post Title: ")) ;Prompt to enter the post title
           (fname (org-hugo-slug title)))
      (mapconcat #'identity
                 `(
                   ,(concat "* TODO " title)
                   ":PROPERTIES:"
                   ,(concat ":EXPORT_FILE_NAME: " (format-time-string "%Y-%m-%d-") fname)
                   ,(concat ":EXPORT_DATE: " (format-time-string "%Y-%m-%d"))
                   ":EXPORT_HUGO_CUSTOM_FRONT_MATTER: :toc true"
                   ":END:"
                   "%?\n")          ;Place the cursor here finally
                 "\n")))

  (add-to-list 'org-capture-templates '("h" "Hugo post"))
  (add-to-list 'org-capture-templates
               '("hq"                ;`org-capture' binding + hq
                 "Hugo post -- Quantum Computing"
                 entry
                 ;; It is assumed that below file is present in `org-directory'
                 ;; and that it has a "Quantum Computing" heading. It can even be a
                 ;; symlink pointing to the actual location of all-posts.org!
                 (file+olp "~/personnel/personal-website/content-org/all-posts.org" "Quantum Computing")
                 (function org-hugo-new-subtree-post-capture-template)))
  )

