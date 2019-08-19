;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                            Disabling GUI things                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(menu-bar-mode -1)
(tooltip-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(prefer-coding-system 'utf-8)
;; Set default font
(set-face-attribute 'default nil
                    :family "SauceCodePro Nerd Font"
                    :height 110
                    :weight 'normal
                    :width 'normal)

(fset 'yes-or-no-p 'y-or-n-p)
(setq-default indent-tabs-mode nil)

;; Emacs backups and auto-save files
;; keep backup files forever, in a separate directory, and version them
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq version-control t)
(setq delete-old-versions -1)
(setq vc-make-backup-files t)
;; keep auto-save files somewhere sensible
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;; emacs history customization: put it somewhere sensible, never truncate,
;; don't store dupes, remember kill-ring and search-ring
(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode 1)
(setq history-length 2048)
(setq history-delete-duplicates t)
(setq savehist-save-minibuffer-history 1)
(setq savehist-additional-variables
      '(kill-ring
        search-ring
        regexp-search-ring))

(line-number-mode t)
(column-number-mode 1)
(size-indication-mode t)
