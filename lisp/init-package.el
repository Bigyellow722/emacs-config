

;; restart-emacs
(use-package restart-emacs)

;; benchmark-init
(use-package benchmark-init
  :init (benchmark-init/activate)
  :hook (after-init . benchmark-init/deactivate))


(provide 'init-package)
