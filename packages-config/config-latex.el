(use-package tex-site
  :straight auctex
  :init
  :config
  ;; Activate nice interface between RefTeX and AUCTeX
  (setq reftex-plug-into-AUCTeX t)
  ;; Load RefTeX
  (require 'reftex)
  ;; From https://tex.stackexchange.com/a/278060/166093
  (setq reftex-label-alist '(AMSTeX))
  ;; From https://tex.stackexchange.com/questions/139824/disabling-the-select-reference-format-menu-in-reftex
  (setq reftex-ref-macro-prompt nil)
  ;; Turn on RefTeX in AUCTeX
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
  ;; Turn on folding
  ;; From https://www.gnu.org/software/auctex/manual/auctex/Folding.html
  (add-hook 'LaTeX-mode-hook (lambda ()
                               (TeX-fold-mode 1)))
  ;; to use pdfview with auctex
  ;; From https://emacs.stackexchange.com/a/21764
  (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
        TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
        TeX-source-correlate-start-server t) ;; not sure if last line is neccessary
  )

(use-package pdf-tools
  :config
  (pdf-tools-install)
  )
