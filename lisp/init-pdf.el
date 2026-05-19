;;; init-pdf.el --- set for pdf
;;; Commentary:
;;; Code:
(use-package pdf-tools
  :ensure t
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :hook (pdf-view-mode . (lambda () (display-line-numbers-mode -1)))
  :config
  (pdf-tools-install)
  (pdf-loader-install))

(provide 'init-pdf)
