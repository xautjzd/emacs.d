;;; init-language-lua.el --- lua configure.

;;; Commentary:

;;; Code:

(use-package lua-mode
  :ensure t)

(defun lua-format-buffer ()
  "Format the current Lua buffer using luaformatter."
  (interactive)
  (when (and (eq major-mode 'lua-mode) (executable-find "lua-format"))
    (save-excursion
      (shell-command-on-region (point-min) (point-max) "lua-format --tab-width=2 --indent-width=2" t t)
      (message "Lua code formatted with luaformatter."))))

(add-hook 'lua-mode-hook (lambda () (setq tab-width 2)))

(provide 'init-language-lua)
;;; init-language-lua.el ends here
