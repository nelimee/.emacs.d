(setq lsp-keymap-prefix "C-c s")
(use-package lsp-mode
  ;;:init
  :config
  (setq lsp-enable-snippet nil)
  ;; Python
  ;; Default pyls server when not given in local variables
  (setq lsp-pyls-server-command '("~/.anaconda3/envs/pyls/bin/pyls"))
  ;; Do not enable the formatters to let pyls use Black!
  (setq lsp-pyls-plugins-autopep8-enabled nil)
  (setq lsp-pyls-plugins-yapf-enabled nil)
  ;; Arguments given to clangd server. See https://emacs-lsp.github.io/lsp-mode/lsp-mode.html#lsp-clangd
  (setq lsp-clients-clangd-args '(
                                  ;; If set to true, code completion will include index symbols that are not defined in the scopes
                                  ;; (e.g. namespaces) visible from the code completion point. Such completions can insert scope qualifiers
                                  "--all-scopes-completion"
                                  ;; Index project code in the background and persist index on disk.
                                  "--background-index"
                                  ;; Enable clang-tidy diagnostics
                                  "--clang-tidy"
                                  ;; Whether the clang-parser is used for code-completion
                                  ;;   Use text-based completion if the parser is not ready (auto)
                                  "--completion-parse=auto"
                                  ;; Granularity of code completion suggestions
                                  ;;   One completion item for each semantically distinct completion, with full type information (detailed)
                                  "--completion-style=detailed"
                                  ;; clang-format style to apply by default when no .clang-format file is found
                                  "--fallback-style=LLVM"
                                  ;; When disabled, completions contain only parentheses for function calls.
                                  ;; When enabled, completions also contain placeholders for method parameters
                                  "--function-arg-placeholders"
                                  ;; Add #include directives when accepting code completions
                                  ;;   Include what you use. Insert the owning header for top-level symbols, unless the
                                  ;;   header is already directly included or the symbol is forward-declared
                                  "--header-insertion=iwyu"
                                  ;; Prepend a circular dot or space before the completion label, depending on whether an include line will be inserted or not
                                  "--header-insertion-decorators"
                                  ;; Enable index-based features. By default, clangd maintains an index built from symbols in opened files.
                                  ;; Global index support needs to enabled separatedly
                                  "--index"
                                  ;; Attempts to fix diagnostic errors caused by missing includes using index
                                  "--suggest-missing-includes"
                                  ;; Number of async workers used by clangd. Background index also uses this many workers.
                                  "-j=4"
                                  ;; Debug options
                                  ;; "--log=verbose"
                                  ;; "--pretty"
                                  ;; "--input-mirror-file=~/.clangd.inputs"
                                  ))
  :hook
  (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
   ((c++-mode python-mode) . lsp)
   ;; if you want which-key integration
   (lsp-mode . lsp-enable-which-key-integration)
   (before-save . lsp-format-buffer)
   )
  :commands lsp
  )

(use-package lsp-ui
  :commands lsp-ui-mode
  ;; :config
  ;; (lsp-ui-doc-enable)
  )

(use-package company-lsp :commands company-lsp)
