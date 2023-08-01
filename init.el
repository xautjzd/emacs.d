;;; init.el --- Zhengdong's Emacs configuration.

;; Copyright (C) 2022  Zhengdong 
;; Author: Zhengdong Jiang <xautjzd@gmail.com>
;; Keywords: configuration

;;; Commentary:

;;; Code:

;; Set custom file to ~/.emacs.d/custom.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; custom scripts located in ~/.emacs.d/lisp/
(add-to-list 'load-path (concat user-emacs-directory "lisp"))

(require 'init-package)
(require 'init-ui)
(require 'init-editor)
(require 'init-git)
(require 'init-project)
(require 'init-snippet)
(require 'init-language)
(require 'init-language-rust)
(require 'init-language-emacs-lisp)
(require 'init-language-common-lisp)
(require 'init-mode-yml)
(require 'init-mode-markdown)
(require 'init-mode-org)
(require 'init-lsp)
(require 'init-key-binding)
(require 'init-misc)

;;; init.el ends here
(put 'upcase-region 'disabled nil)
