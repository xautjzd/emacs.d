;;; init-lsp.el --- LSP configure.

;;; Commentary:

;;; Code:

;; LSP begin
(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "s-l")
  :commands (lsp lsp-deferred)
  :hook
  ;; Please install clang lsp server manually, eg: brew install llvm
  (
   (c-mode . lsp-deferred)
   (c++-mode . lsp-deferred)
   (js-mode . lsp-deferred)
   (lsp-mode . lsp-enable-which-key-integration))
  :config
  (setq read-process-output-max (* 10 1024 1024)) ;; 10M
  (setq lsp-enable-file-watchers nil))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-errors-list)

(add-hook 'js-mode-hook
  (function (lambda ()
    (setq indent-tabs-mode t
          tab-width 2))))

(with-eval-after-load 'js
  (define-key js-mode-map (kbd "M-.") nil))

;; lsp go client
(use-package go-mode
  :ensure t
  :config
  (setq gofmt-command "goimports")
  (setq tab-width 4)
  (setq indent-tabs-mode 1)
  :hook
  (go-mode . lsp-deferred)
  (before-save . gofmt-before-save))

;; lsp rust client
(use-package rust-mode
  :ensure t
  :hook
  (rust-mode . lsp-deferred)
  :config
  (setq rust-format-on-save t)
  (setq indent-tabs-mode nil))

;; lsp python client
(use-package lsp-pyright
  :ensure t
  :hook
  (python-mode . lsp-deferred))

;; lsp java client
(use-package lsp-java
  :ensure t
  :hook
  (java-mode . lsp-deferred)
  :config
  (setq lsp-java-jdt-download-url  "https://download.eclipse.org/jdtls/milestones/0.57.0/jdt-language-server-0.57.0-202006172108.tar.gz"))

;; lsp ts client
(use-package typescript-mode
  :ensure t
  :hook
  (typescript-mode . lsp-deferred)
  :config
  (setq tab-width 2)
  (setq indent-tabs-mode 1))
;; LSP end

(provide 'init-lsp)
;;; init-lsp.el ends here
