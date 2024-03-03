

(unless (file-directory-p "~/roam-notes/")
  (progn
    (make-directory "~/roam-notes/")
    (unless (file-directory-p "~/roam-notes/daily")
      (make-directory "~/roam-notes/daily"))))


(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "~/roam-notes/")
  (org-roam-dailies-directory "daily/")
  (org-roam-db-gc-threshold most-positive-fixnum)
  :bind (("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ("C-c n l" . org-roam-buffer-toggle)
         ("C-c n u" . org-roam-ui-mode))
  :bind-keymap
  ("C-c n d" . org-roam-dailies-map)
  :config
  (require 'org-roam-dailies)
  (org-roam-db-autosync-mode))

(use-package org-roam-ui
  :ensure t
  :after org-roam
  :custom
  (org-roam-ui-sync-theme t)
  (org-roam-ui-follow t)
  (org-roam-ui-update-on-save t))


(provide 'init-org-roam)
