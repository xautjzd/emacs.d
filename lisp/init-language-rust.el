;;; init-language-rust.el --- rust configure.

;;; Commentary:

;;; Code:

;; lsp rust client
(use-package rust-mode
  :ensure t
  :hook
  (rust-mode . lsp-deferred)
  :config
  (setq rust-format-on-save t)
  (setq indent-tabs-mode nil)
  (prettify-symbols-mode))

;; (use-package flycheck-rust
;;   :ensure t
;;   :diminish
;;   :hook
;;   (flycheck-mode . flycheck-rust-setup))

(provide 'init-language-rust)
;;; init-language-rust.el ends here
