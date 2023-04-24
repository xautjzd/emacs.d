;;; init-ui.el --- UI Configuration File

;;; Commentary:

;;; Code:

;; Don't display welcome page when startup
(setq inhibit-startup-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t
      initial-scratch-message nil)

;; Maximize emacs on startup
(toggle-frame-fullscreen)

;; Disable specified modes
(mapc
 (lambda (mode)
   (when (fboundp mode)
     (funcall mode 0)))
 '(menu-bar-mode tool-bar-mode scroll-bar-mode))

;; Set default font
(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 200
                    :weight 'normal
                    :width 'normal)


;; (global-display-line-numbers-mode)
;; Display line numbers when programming
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(setq column-number-mode t)

;; Display time in mode line
(display-time-mode 1)

;; Highlight current line
(global-hl-line-mode 1)

(use-package spacemacs-theme
  :ensure t
  :defer t
  :init (load-theme 'spacemacs-dark t))

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(provide 'init-ui)
;;; init-ui.el ends here
