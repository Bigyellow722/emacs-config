;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path (expand-file-name (concat user-emacs-directory "lisp")))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))


(require 'init-const)
(require 'init-kbd)
(require 'init-start)
(require 'init-elpa)
(require 'init-package)
(require 'init-ui)
(require 'init-lsp)
(require 'init-mit-scheme)
;;(require 'init-common-lisp)
(require 'init-c-mode)
(require 'init-org-mode)
(require 'init-python-mode)
(require 'init-asm-mode)
(require 'init-org-roam)
(require 'init-plant-uml)
(require 'init-vterm)

(when (file-exists-p custom-file)
  (load-file custom-file))

;;; init.el ends here


