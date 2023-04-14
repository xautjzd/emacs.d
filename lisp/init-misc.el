;;; init-misc.el --- Code misc configure.

;;; Commentary:

;;; Code:

(use-package go-translate
  :ensure t
  :config
  (setq gts-translate-list '(("en" "zh") ("zh" "en") ("zh" "ja") ("ja" "zh") ("en" "ja") ("ja" "en")))
  (setq gts-default-translator
	(gts-translator
	 :picker (gts-prompt-picker)
       :engines (list (gts-bing-engine) (gts-google-engine))
       :render (gts-buffer-render))))

(provide 'init-misc)
;;; init-misc.el ends here
