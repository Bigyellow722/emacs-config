;; for Operation System
(defconst *is-mac* (eq system-type 'darwin)
  "OS is Mac")
(defconst *is-linux* (eq system-type 'gnu/linux)
  "OS is Linux")
(defconst *is-windows* (or (eq system-type 'ms-dos) (eq system-type 'windows-nt))
  "OS is Windows")

(setq backup-directory-alist (quote (("." . "~/.backups"))))

(provide 'init-const)
