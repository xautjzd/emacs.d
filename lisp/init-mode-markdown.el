;;; init-mode-markdown.el --- markdown mode configure.

;;; Commentary:

;;; Code:

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md$'" . gfm-mode)
         ("\\.md$'" . markdown-mode)
         ("\\.markdown$'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(provide 'init-mode-markdown)
;;; init-mode-markdown.el ends here
