(load-file "~/.emacs.d/lisp/bootstrap-straight.el")
(mapc 'load (file-expand-wildcards "~/.emacs.d/packages/*.el"))

(evil-leader/set-key
  "<SPC>" 'counsel-M-x
  "fs" 'save-buffer
  "bd" 'kill-this-buffer
  "bb" 'ivy-switch-buffer

  "wv" 'evil-window-vsplit
  "ws" 'evil-window-split
  "wd" 'evil-window-delete
  "wh" 'evil-window-left
  "wl" 'evil-window-right
  "wk" 'evil-window-up
  "wj" 'evil-window-down
  "wm" 'delete-other-windows

  "hdb" 'describe-bindings
  "hdc" 'describe-char
  "hdf" 'counsel-describe-function
  "hdk" 'describe-key
  "hdp" 'describe-package
  "hdt" 'describe-theme
  "hdv" 'counsel-describe-variable

  "sp" 'counsel-ag
  )
