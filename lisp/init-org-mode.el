;;; package --- init org mode
;;; Commentary:
;;; Code:
(require 'org)
(add-hook 'org-mode-hook
	  (lambda()
	    (setq truncate-lines nil)))

;;(setenv "PATH" (concat ":/usr/bin/" (getenv "PATH")))
(add-to-list 'exec-path "/usr/bin/")
(provide 'init-org-mode)
;;; init-org-mode.el ends here
