
(use-package plantuml-mode)

(setq org-plantuml-jar-path (expand-file-name (concat user-emacs-directory "plantuml-1.2024.5.jar")))
(add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
(org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))

(provide 'init-plant-uml)

;;; init-plant-uml.el ends here
