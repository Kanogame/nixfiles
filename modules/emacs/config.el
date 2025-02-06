(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(global-display-line-numbers-mode)
(setq word-wrap t)

(custom-set-variables
 '(custom-enabled-themes '(dracula))
 '(custom-safe-themes
   '("691b984aa0a71fa8ad706754573c256d4536a5827bb2ee453f6531a45f54b919" default)))

(require 'evil)
(evil-mode 1)

;; ido
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode (quote both))

;; org roam setup
(setq org-startup-indented t)
(setq org-roam-directory (file-truename "~/docs/roam"))
(org-roam-db-autosync-mode)

; keymaps
;; roam
(keymap-global-set (kbd "r-f SPC") 'org-roam-node-find)
(keymap-global-set (kbd "r-f SPC") 'org-roam-node-insert)

;; autosave 
(setq auto-save-default t)

;;; Indent and formatting
(setq-default left-fringe-width  8)
(setq-default right-fringe-width 8)

;; Do not show an arrow at the top/bottomin the fringe and empty lines
(setq-default indicate-buffer-boundaries nil)
(setq-default indicate-empty-lines nil)

;; Continue wrapped lines at whitespace rather than breaking in the mid
;; dle of a word.
(setq-default word-wrap t)
