;;; init-language-go.el --- go configure

;;; Commentary:

;;; Code:

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

(provide 'init-language-go)
;;; init-language-go.el ends here
