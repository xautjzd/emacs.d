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
  :commands lsp-ui-mode
  :config
  ;; more lsp ui cofig, please refer: https://emacs-lsp.github.io/lsp-mode/tutorials/how-to-turn-off/
  (setq lsp-ui-doc-show-with-cursor t)
  (setq lsp-ui-doc-position "at-point"))

(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-errors-list)

;; LSP end

(provide 'init-lsp)
;;; init-lsp.el ends here
