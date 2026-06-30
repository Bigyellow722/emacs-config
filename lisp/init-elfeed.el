;;; Elfeed - RSS feed reader with Org management
(use-package elfeed
  :ensure t
  :defer t
  :commands (elfeed elfeed-search)
  :bind (("C-x w" . elfeed)                 ; quick launch
         ("C-x W" . elfeed-search))
  :custom
  (elfeed-db-directory "~/.elfeed/db")
  (elfeed-enclosure-default-dir "~/Downloads/elfeed-enclosures")
  (elfeed-search-entries-per-page 200)
  (elfeed-search-title-max-width 80)
  (elfeed-search-print-age 'abbreviate)
  (elfeed-sort-order 'descending)
  :config
  ;; Keybindings inside the *elfeed-search* buffer
  (define-key elfeed-search-mode-map (kbd "b") 'elfeed-search-browse-url)
  (define-key elfeed-search-mode-map (kbd "S") 'elfeed-search-save-enclosure)
  (define-key elfeed-search-mode-map (kbd "g") 'elfeed-update)
  (add-hook 'elfeed-new-feed-hook #'elfeed-update))

;;; Manage feeds via Org file
(use-package elfeed-org
  :ensure t
  :defer t
  :init
  ;; Set this before elfeed-org loads (it's a defcustom, safe to set early)
  (setq rmh-elfeed-org-files '("~/org/feeds.org"))
  ;; When elfeed loads, wire up elfeed-org to parse feeds.org on every invocation
  (with-eval-after-load 'elfeed
    (elfeed-org)))

(provide 'init-elfeed)
