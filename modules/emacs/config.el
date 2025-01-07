(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(global-display-line-numbers-mode)
(setq word-wrap t)

(require 'evil)
(evil-mode 1)

;; ido
(ido-mode 1)
(ido-everywhere 1)

;; org roam setup
(setq org-startup-indented t)
(setq org-roam-directory (file-truename "~/docs/roam"))
(org-roam-db-autosync-mode)