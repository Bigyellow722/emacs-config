
(defun my-python-mode-hook ()
  (setq python-shell-interpreter "python3")
  )


(add-hook 'python-mode-hook 'my-python-mode-hook)

(provide 'init-python-mode)
