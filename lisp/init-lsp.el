;;; init-lsp.el --- LSP configure.

;;; Commentary:

;;; Code:

;; LSP begin
(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook
  ;; Please install clang lsp server manually, eg: brew install llvm
  (c-mode . lsp)
  (c++-mode . lsp)
  (js-mode . lsp)
  :config
  (setq lsp-enable-file-watchers nil))

(with-eval-after-load 'js
  (define-key js-mode-map (kbd "M-.") nil))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

;; go mode
(use-package go-mode
  :ensure t
  :config
  (setq gofmt-command "goimports")
  (setq tab-width 4)
  (setq indent-tabs-mode 1)
  :hook
  (go-mode . lsp-deferred)
  (before-save . gofmt-before-save))

;; rust mode
(use-package rust-mode
  :ensure t
  :hook
  (rust-mode . lsp-deferred)
  :config
  (setq rust-format-on-save t)
  (setq indent-tabs-mode nil))

;; lsp python
; (use-package lsp-pyright
;   :hook (python-mode . (lambda ()
;                           (require 'lsp-pyright)
;                           (lsp))))  ; or lsp-deferred

(use-package lsp-java
  :hook
  (java-mode . #'lsp)
  :config
  (setq lsp-java-java-path (substitute-in-file-name "$JAVA_HOME/bin/java")))
;; LSP end

(provide 'init-lsp)
;;; init-lsp.el ends here
