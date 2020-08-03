;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                            Disabling GUI things                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(menu-bar-mode -1)
(tooltip-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                             Fonts and encoding                             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(prefer-coding-system 'utf-8)
;; Set default font
(set-face-attribute 'default nil
                    :family "SauceCodePro Nerd Font"
                    :height 110
                    :weight 'normal
                    :width 'normal)

;; Maximise Emacs on startup
;; From https://emacs.stackexchange.com/a/3008
;; The second line works better on my OS, so I keep only the second one.
;; (add-to-list 'default-frame-alist '(fullscreen . maximized))
(toggle-frame-maximized)

;; Sometimes emacs asks us to write 'yes' or 'no'. This is too long.
;; Change it to one press on the keys 'y' or 'n'.
(fset 'yes-or-no-p 'y-or-n-p)
;; Prevent Extraneous Tabs
;; See https://www.gnu.org/software/emacs/manual/html_node/eintr/Indent-Tabs-Mode.html
(setq-default indent-tabs-mode nil)
;; Lines that does not fit into the screen will be **visually** (not in the real file)
;; truncated.
;; See first comment at https://stackoverflow.com/a/3282132/4810787
(setq-default truncate-lines nil)
(setq-default truncate-partial-width-windows nil)
(setq-default word-wrap t)

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


(setq c-basic-offset 4)
(setq tab-width 4)
(setq-default indent-tabs-mode nil)
