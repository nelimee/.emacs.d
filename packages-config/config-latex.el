(use-package tex
  :straight auctex
  :config
  ;; Turn on RefTeX in AUCTeX
  (add-hook 'TeX-mode-hook 'turn-on-reftex)
  ;; Activate nice interface between RefTeX and AUCTeX
  (setq reftex-plug-into-AUCTeX t)
  ;; Turn on folding
  ;; From https://www.gnu.org/software/auctex/manual/auctex/Folding.html
  (add-hook 'TeX-mode-hook (lambda ()
                             (TeX-fold-mode 1)))
  )
