;;; package --- init org mode
;;; Commentary:
;;; Code:
(require 'org)
(add-hook 'org-mode-hook
	  (lambda()
	    (setq truncate-lines nil)
	    (imenu-add-to-menubar "Imenu")
	    ))

(org-babel-do-load-languages
	     'org-babel-load-languages
	     '((dot . t)))

(require 'org-tempo)

(provide 'init-org-mode)
;;; init-org-mode.el ends here
