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
  )
