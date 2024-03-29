;;; init-tool.el --- tool configure.

;;; Commentary:

;;; Code:

(use-package go-translate
  :ensure t
  :config
  (setq gts-translate-list '(("en" "zh") ("zh" "en") ("zh" "ja") ("ja" "zh") ("en" "ja") ("ja" "en")))
  (setq gts-default-translator
	(gts-translator
	 :picker (gts-prompt-picker)
	 :engines (list (gts-google-rpc-engine) (gts-bing-engine))
	 :render (gts-buffer-render))))

(use-package restclient
  :ensure t
  :mode ("\\.http\\'" . restclient-mode))

(provide 'init-tool)
;;; init-tool.el ends here
