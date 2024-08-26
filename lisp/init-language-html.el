;;; init-langugage-html.el --- html configure

;;; Commentary:

;;; Code:
(use-package emmet-mode
  :ensure t)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation


(provide 'init-language-html)
;;; init-language-html.el ends here
