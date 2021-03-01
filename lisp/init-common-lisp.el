;;; init-common-lisp.el --- config for common lisp
;;; Commentary:
;;; Code:

;; sliem configure
(setq inferior-lisp-program "/usr/bin/sbcl")
(add-to-list 'load-path "~/.emacs.d/slime")
(require 'slime)
(slime-setup)
(require 'slime-autoloads)
(slime-setup '(slime-fancy slime-banner))

(provide 'init-common-lisp)

;;; init-common-lisp.el ends here
