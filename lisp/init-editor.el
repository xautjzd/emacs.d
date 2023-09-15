;;; init-editor.el --- Editor configuration.

;;; Commentary:

;;; Code:

(prefer-coding-system 'utf-8)
(set-language-environment "utf-8")

;; Ask y or n instead of yes or no
(defalias 'yes-or-no-p 'y-or-n-p)

(setq byte-compile-warnings '(not nresolved
                                  free-vars))

(setq sh-set-shell "zsh")

(if (eq system-type 'darwin)
    (use-package exec-path-from-shell
      :ensure t
      :config
      (exec-path-from-shell-initialize)
      (setq exec-path-from-shell-arguments "-l")))

;; Insert closing parenthesis when typing an open parenthesis.
(add-hook 'prog-mode-hook (lambda () (electric-pair-mode 1)))

;; Highlight matching parenthesis.
(add-hook 'prog-mode-hook (lambda () (show-paren-mode 1)))

;; Kill all the unmodified buffers that you have not used for a long time.
(midnight-mode 1)
(setq clean-buffer-list-delay-general 1)

;; Never kill buffers list here
(setq clean-buffer-list-kill-never-buffer-names (nconc clean-buffer-list-kill-never-buffer-names
                 '("*eshell*"
                   "*ielm*"
                   "*dashboard*")))

;; Stop create backup files(~)
(setq make-backup-files nil)
;; (setq backup-directory-alist
;;       `((".*" . ,temporary-file-directory)))

;; Disable lockfiles, format: .#
(setq create-lockfiles nil)
; (setq lock-file-name-transforms
;       `((".*" ,temporary-file-directory t)))

;; Disable auto save file
(setq auto-save-default nil)
(setq auto-save-list-file-prefix nil)

;; Select help window for viewing when using C-h k
(setq-default help-window-select t)
(setq user-mail-address "xautjzd@gmail.com")

;; Auto insert mode
(auto-insert-mode t)  ;;; Enable global auto insert mode
(setq auto-insert-directory "~/.emacs.d/auto-insert-templates/")
;;(setq auto-insert-query nil) ;;; If you don't want to be prompted before insertion

;; Autoindent open-*-lines
(defvar newline-and-indent t
  "Modify the behavior of the open-*-line functions to cause them to autoindent.")

;; Set custom file to ~/.emacs.d/custom.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

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
  "Open a new line before the current one. See also `newline-and-indent'."
  (interactive "p")
  (beginning-of-line)
  (open-line arg)
  (when newline-and-indent
    (indent-according-to-mode)))

(global-set-key (kbd "M-o") 'open-previous-line)

(setq eww-search-prefix "https://cn.bing.com/search?q=")    ; Use another engine for searching

(use-package which-key
  :ensure t
  :diminish
  :config
  (setq which-key-side-window-location 'right)
  (setq which-key-show-early-on-C-h t)
  (setq which-key-side-window-max-width 0.4)
  (which-key-mode))

(global-unset-key (kbd "s-l"))
;; quickly switch between visible windows
(global-set-key (kbd "M-p") 'ace-window)

;; added temporally to fix treemacs upgration bugs, refer: https://github.com/Alexander-Miller/treemacs/issues/1017 https://github.com/caldwell/build-emacs/issues/126
(add-to-list 'image-types 'svg)

;; (setq url-proxy-services '(("http" . "127.0.0.1:7890")
;;                            ("https" . "127.0.0.1:7890")))

;; select region
(defun select-current-line-to-line (end-line)
  "Select text from the current line to END-LINE."
  (interactive "nEnd line: ")
  (beginning-of-line)
  (push-mark (point))
  (goto-line end-line)
  (end-of-line)
  (activate-mark))

(provide 'init-editor)
;;; init-editor.el ends here
