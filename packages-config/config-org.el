(use-package org
  :config
  ;; Define some templates
  (setq org-capture-templates
        '(
          ("m" "Meeting note"
           entry (file+olp+datetree "~/.org-files/meetings.org")
           "* %^{Meeting title} (%<%H:%M>)\n** Participants\n 1. %?\n** Notes\n"
           :empty-lines 1)

          ("j" "Journal entry"
           entry (file+olp+datetree "~/.org-files/journal.org")
           "* %^{Entry title} (%<%H:%M>)\n\n %?"
           :empty-lines 1)
          )
        )
  :bind (("C-c c" . org-capture)
         ("C-c l" . org-store-link)
         )
  )
