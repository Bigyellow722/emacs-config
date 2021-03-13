;;; init-c-mode.el --- set for c mode
;;; Commentary:
;;; Code:
(defun my-c-mode-hook ()
  (setq c-basic-offset 4
	indent-tabs-mode t
	default-tab-width 4))

(add-hook 'c-mode-common-hook 'my-c-mode-hook)
(provide 'init-c-mode)
;;; init-c-mode.el ends here
