;;; init-language-typescript.el --- typescript configure.

;;; Commentary:

;;; Code:

;; lsp ts client
(use-package typescript-mode
  :ensure t
  :hook
  (typescript-mode . lsp-deferred)
  :config
  (setq tab-width 2)
  (setq indent-tabs-mode nil))

(add-hook 'js-mode-hook
          (function (lambda ()
              (setq tab-width 2)
              (setq indent-tabs-mode nil))))

(with-eval-after-load 'js
  (define-key js-mode-map (kbd "M-.") nil))


(provide 'init-language-typescript)
;;; init-language-typescript.el ends here
