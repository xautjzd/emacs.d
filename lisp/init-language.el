;;; init-language.el --- Language configure.

;;; Commentary:

;;; Code:

;; Company mode is a standard completion package that works well with lsp-mode.
(use-package company
  :ensure t
  :config
  ;; Optionally enable completion-as-you-type behavior.
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

(use-package flycheck
  :ensure t
  :diminish
  :init
  (global-flycheck-mode 1))

(use-package yafolding
  :ensure t)

(provide 'init-language)
;;; init-language.el ends here
