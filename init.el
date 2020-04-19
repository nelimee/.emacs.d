;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                   DEBUG                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; For the moment, no debug because it is annoying on the daily-basis.
;; Can be re-set to "t" if needed.
(setq debug-on-error nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                             Garbage collector                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Make startup faster by reducing the frequency of garbage
;; collection.  The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold (* 100 1024 1024)) ;; 100 MB

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                straight.el                                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; From https://github.com/raxod502/straight.el#integration-with-use-package-1
;; use-package does not need ":straight" as it is now by default.
;; Use ":straight nil" to override locally.
(setq straight-use-package-by-default t)
;; Avoid the utilisation of find(1) to check for modified packages. Use
;; a more lazy approach.
;; See https://github.com/raxod502/straight.el/blob/master/README.md#customizing-when-packages-are-built
(setq straight-check-for-modifications '(check-on-save))
;; From https://github.com/raxod502/straight.el#getting-started
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                use-package                                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(straight-use-package 'use-package)
;; See https://github.com/raxod502/straight.el#integration-with-use-package-1
(setq straight-use-package-by-default t)
(require 'use-package)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                 custom.el                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                              packages-config                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/packages-config/")

;; Emacs generic configuration
(load "generic-config.el")                    ;; Generic configuration like UI, font or backups
(load "theme-config.el")                      ;; UI theme configuration
(load "all-the-icons-config.el")              ;; Icons in emacs
(load "whichkey-config.el")                   ;; Pops up available keys for commands
(load "powerthesaurus-config.el")             ;; Findings synonyms online
(load "smartparens-config.el")                ;; Making parenthesis smarter
(load "flycheck-config.el")    
(load "ispell-config.el")                     ;; Checking orthograph
;; (load "esup-config.el")                       ;; Emacs startup profiler
(load "dashboard-config.el")                  ;; Nice dashboard at the start of emacs
(load "company-config.el")                    ;; Auto-completion framework
;; (load "neotree-config.el")                    ;; Tree-like view of project files
(load "treemacs-config.el")                   ;; Tree-like view of project files
(load "ivy-config.el")                        ;; Completion framework
(load "ace-window-config.el")                 ;; Window management
(load "fill-column-indicator-config.el")      ;; Window management
(load "yasnippet-config.el")                  ;; Automatic expansion

;; Developement environments
(load "lsp-config.el")
(load "projectile-config.el")
;; C++
(load "c++-config.el")             ;; C++ language mode
(load "cmake-config.el")           ;; CMake language mode
;; Docker
;; (load "docker-compose-config.el")  ;; docker-compose language mode
;; (load "dockerfile-config.el")      ;; dockerfile language mode
;; Others
(load "git-config.el")
(load "org-config.el")
(load "latex-config.el")
;; (load "python-config.el")
;; (load "markdown-config.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                             Garbage collector                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Make gc pauses faster by decreasing the threshold.
;; Do not decrease the threshold yet, I should check with esup if decreasing is
;; useful.
;; See https://github.com/emacs-lsp/lsp-mode#performance
;; (setq gc-cons-threshold (* 2 1000 1000))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                           General optimisations                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; See https://github.com/emacs-lsp/lsp-mode#performance
(setq read-process-output-max (* 5 1024 1024)) ;; 5 MB
