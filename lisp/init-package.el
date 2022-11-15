;;; test.el --- a simple package.Package Configuration File -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

; (defvar bootstrap-version)
; (let ((bootstrap-file
;        (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
;       (bootstrap-version 6))
;   (unless (file-exists-p bootstrap-file)
;     (with-current-buffer
;         (url-retrieve-synchronously
;          "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
;          'silent 'inhibit-cookies)
;       (goto-char (point-max))
;       (eval-print-last-sexp)))
;   (load bootstrap-file nil 'nomessage))

; ;; Install use-package
; (straight-use-package 'use-package)

; ;; Make all use-package calls use straight.el in the backend
; ;; to do the actual package installation.
; (setq straight-use-package-by-default t)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; Install use-package automatic if not installed previous
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(provide 'init-package)
;;; init-package.el ends here
