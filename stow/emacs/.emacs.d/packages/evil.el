(use-package evil-leader
  :straight t
  :config
  (evil-leader/set-leader "<SPC>")
    (global-evil-leader-mode))

(use-package evil
  :straight t
  :init
  (setq evil-want-C-u-scroll t)
  :config
  ;; "hybrid" mode
  (setcdr evil-insert-state-map nil)
  (define-key evil-insert-state-map
    (read-kbd-macro evil-toggle-key) 'evil-normal-state)
  (define-key evil-insert-state-map [escape] 'evil-normal-state)

  ;; make I go to end of prompt instead of bol in eshell
  (evil-define-key 'normal eshell-mode-map (kbd "I") 'evil-eshell-insert-line)

  (evil-mode))

;;;;; 
(defun evil-eshell-insert-line (count &optional vcount)
  "Switch to insert state at beginning of current line.
Point is placed at the first non-blank character on the current
line.  The insertion will be repeated COUNT times.  If VCOUNT is
non nil it should be number > 0. The insertion will be repeated
in the next VCOUNT - 1 lines below the current one."
  (interactive "p")
  (push (point) buffer-undo-list)
  (eshell-bol)
  (setq evil-insert-count count
        evil-insert-lines nil
        evil-insert-vcount
        (and vcount
             (> vcount 1)
             (list (line-number-at-pos)
                   #'evil-first-non-blank
                   vcount)))
  (evil-insert-state 1))

