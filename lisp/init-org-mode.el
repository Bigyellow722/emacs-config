;;; package --- init org mode
;;; Commentary:
;;; Code:
(require 'org)
(add-hook 'org-mode-hook
	  (lambda()
	    (setq truncate-lines nil)))

(provide 'init-org-mode)
;;; init-org-mode.el ends here
