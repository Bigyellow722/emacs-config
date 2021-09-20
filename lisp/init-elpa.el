;; for package archives
(setq package-archives '(("melpa" . "http://elpa.emacs-china.org/melpa/")
			 ("gnu" . "http://elpa.emacs-china.org/gnu/")
			 ("org" . "http://elpa.emacs-china.org/org/")))

;; for us-package
;; initialize package
(setq package-check-signature nil)

(require 'package)

(unless (bound-and-true-p package--initialized)
  (package-initialize))

(unless package-archive-contents
  (package-refresh-contents))

;; install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; configure for use-package
(eval-and-compile
  (setq use-package-always-ensure t)
  (setq use-package-always-defer t)
  (setq use-package-always-demand nil)
  (setq use-package-expand-minimally t)
  (setq use-package-verbose t))

(require 'use-package)

(provide 'init-elpa)
