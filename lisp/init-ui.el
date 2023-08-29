;;; init-ui.el --- UI Configuration File

;;; Commentary:

;;; Code:

;; Don't display welcome page when startup
(setq inhibit-startup-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t
      initial-scratch-message nil)

;; maximize frame
;; (toggle-frame-fullscreen)

;; Spacemacs theme
(unless (package-installed-p 'spacemacs-theme)
  (package-install 'spacemacs-theme))
(load-theme 'spacemacs-dark t)

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
(setq display-time-24hr-format t)
(setq display-time-default-load-average nil)

;; Highlight current line
(global-hl-line-mode 1)

;; Calendar
;; Start from monday
(setq calendar-week-start-day 1)
;; Set monospace font to fix calendar alignment
(add-hook 'calendar-mode-hook
	  (lambda () (face-remap-add-relative 'default '(:family "Courier" :height 200))))

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(provide 'init-ui)
;;; init-ui.el ends here
