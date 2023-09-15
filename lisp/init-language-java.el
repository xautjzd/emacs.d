;;; init-language-java.el --- java configure.

;;; Commentary:

;;; Code:

;; lsp java client
(use-package lsp-java
  :ensure t
  :hook
  (java-mode . lsp-deferred)
  :config
  (setq lsp-java-vmargs '("-Xmx2G" "-Xms100m" "-Dsun.zip.disableMemoryMapping=true"))
  (setq lsp-java-jdt-download-url  "https://download.eclipse.org/jdtls/milestones/0.57.0/jdt-language-server-0.57.0-202006172108.tar.gz"))

(provide 'init-language-java)
;;; init-language-java.el ends here
