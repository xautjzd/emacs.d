;;; init-editor.el --- Editor configuration.

;;; Commentary:

;;; Code:

(prefer-coding-system 'utf-8)
(set-language-environment "utf-8")

;; Ask y or n instead of yes or no
(defalias 'yes-or-no-p 'y-or-n-p)

(setq sh-set-shell "zsh")

(if (eq system-type 'darwin)
    (use-package exec-path-from-shell
      :ensure t
      :config
      (exec-path-from-shell-initialize)))

(electric-pair-mode 1)
(show-paren-mode 1)

;; Stop create backup files(~)
(setq make-backup-files nil)
;; (setq backup-directory-alist
;;       `((".*" . ,temporary-file-directory)))

;; Disable lockfiles, format: .#
(setq create-lockfiles nil)
; (setq lock-file-name-transforms
;       `((".*" ,temporary-file-directory t)))

;; Auto save file, format: #xx#
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Select help window for viewing when using C-h k
(setq-default help-window-select t)

;; Autoindent open-*-lines
(defvar newline-and-indent t
  "Modify the behavior of the open-*-line functions to cause them to autoindent.")

;; Auto insert mode
(auto-insert-mode t)  ;;; Enable global auto insert mode
(setq auto-insert-directory "~/.emacs.d/auto-insert-templates/")
;;(setq auto-insert-query nil) ;;; If you don't want to be prompted before insertion

;; Behave like vi's o command
(defun open-next-line (arg)
  "Move to the next line and then opens a line. See also `newline-and-indent'."
  (interactive "p")
  (end-of-line)
  (open-line arg)
  (forward-line 1)
  (when newline-and-indent
    (indent-according-to-mode)))

(global-set-key (kbd "C-o") 'open-next-line)

;; Behave like vi's O command
(defun open-previous-line (arg)
  "Open a new line before the current one. 
     See also `newline-and-indent'."
  (interactive "p")
  (beginning-of-line)
  (open-line arg)
  (when newline-and-indent
    (indent-according-to-mode)))

(global-set-key (kbd "M-o") 'open-previous-line)

(use-package which-key
  :ensure t
  :diminish
  :config
  (setq which-key-side-window-location 'right)
  (setq which-key-show-early-on-C-h t)
  (setq which-key-side-window-max-width 0.4)
  (which-key-mode))


(provide 'init-editor)
;;; init-editor.el ends here
