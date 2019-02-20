;; the symlinked config.org can confuse emacs (maybe symlinked init.el does as well though)
(setq vc-follow-symlinks t)

(org-babel-load-file
 (expand-file-name "config.org" user-emacs-directory))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(exwm-input-line-mode-passthrough t)
 '(org-structure-template-alist
   (quote
    (("el" "#+BEGIN_SRC emacs-lisp
?
#+END_SRC")
     ("s" "#+BEGIN_SRC ?

#+END_SRC")
     ("e" "#+BEGIN_EXAMPLE
?
#+END_EXAMPLE")
     ("q" "#+BEGIN_QUOTE
?
#+END_QUOTE")
     ("v" "#+BEGIN_VERSE
?
#+END_VERSE")
     ("V" "#+BEGIN_VERBATIM
?
#+END_VERBATIM")
     ("c" "#+BEGIN_CENTER
?
#+END_CENTER")
     ("C" "#+BEGIN_COMMENT
?
#+END_COMMENT")
     ("l" "#+BEGIN_EXPORT latex
?
#+END_EXPORT")
     ("L" "#+LaTeX: ")
     ("h" "#+BEGIN_EXPORT html
?
#+END_EXPORT")
     ("H" "#+HTML: ")
     ("a" "#+BEGIN_EXPORT ascii
?
#+END_EXPORT")
     ("A" "#+ASCII: ")
     ("i" "#+INDEX: ?")
     ("I" "#+INCLUDE: %file ?")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
