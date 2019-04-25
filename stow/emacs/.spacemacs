;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t

   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(javascript
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; auto-completion
     ;; better-defaults
     shell
     emacs-lisp
     git
     ivy
     markdown
     multiple-cursors
     colors
     (python :variables python-backend 'lsp)
     org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     ;; version-control
     )

   dotspacemacs-additional-packages '(
    (exwm :location (recipe :fetcher github :repo "ch11ng/exwm"))
    )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs-27.0.50")
   dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'hybrid

   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'nil

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(default
                         spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator nil :separator-scale 1.1)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal)

   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-auto-generate-layout-names nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   evil-want-Y-yank-to-eol t

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols nil

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded."
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun exwm-setup ()
  (require 'exwm)
  (defun exwm-run-google-chrome ()
    (interactive)
    (start-process "" nil "google-chrome-stable"))

  (defun exwm-run-from-input (command)
    (interactive (list (read-shell-command "$ ")))
    (start-process-shell-command command nil command))

    (defun exwm/create-functions ()
      (defun exwm/rename-buffer-to-title-name ()
        "Renames a buffer to indicate the title of the x window"
        (let* ((part1 (concat "x[" exwm-class-name "] "))
               (part2 (when (not (string-equal exwm-class-name exwm-title))
                        exwm-title))
               (name (concat part1 (or part2 "")))
               (maxlen 200))
          (exwm-workspace-rename-buffer (if (> (length name) maxlen)
                                            (concat (seq-subseq name 0 (- maxlen 3)) "...")
                                          name))))

      ;; from https://gist.github.com/3402786
      (defun toggle-maximize-buffer ()
        "Maximize buffer"
        (interactive)
        (if (and (= 1 (length (window-list)))
                 (assoc ?_ register-alist))
            (jump-to-register ?_)
          (progn
            (window-configuration-to-register ?_)
            (delete-other-windows))))

      (defun exwm-layout-toggle-fullscreen ()
        "Togggles full screen for Emacs and X windows"
        (interactive)
        (if exwm--id
            (if exwm--fullscreen
                (exwm-reset)
              (exwm-layout-set-fullscreen))
          (toggle-maximize-buffer)))

      (defvar exwm-toggle-workspace 0
        "Previously selected workspace. Used with `exwm-jump-to-last-exwm'.")

      (defadvice exwm-workspace-switch (before save-toggle-workspace activate)
        (setq exwm-toggle-workspace exwm-workspace-current-index))

      (defun exwm-jump-to-last-exwm ()
        (interactive)
        (exwm-workspace-switch exwm-toggle-workspace))

      (require 'exwm-input)
      (defmacro exwm-bind-keys (&rest bindings)
        "Bind input keys in EXWM.
              BINDINGS is a list of cons cells containing a key (string) and a command."
        `(progn
           ,@(cl-loop for (key . cmd) in bindings
                      collect `(exwm-input-set-key ,(cond
                                                     ((stringp key) (kbd key))
                                                     (t key))
                                                   (quote ,cmd))))))
    (defun exwm-monitor-switch ()
      (interactive)
      "Left monitor is workspace 0, right monitor is monitor 1"
      (exwm-workspace-switch-create (if (= 0 exwm-workspace-current-index) 1 0)))

    (defun opposite-direction (dir)
      (cond
       ((eq dir 'up) 'down)
       ((eq dir 'down) 'up)
       ((eq dir 'left) 'right)
       ((eq dir 'right) 'left)))

    (defun window-move-far (dir &optional arg)
      (dotimes (i (- (length (window-list)) 1))
        (windmove-do-window-select dir arg)))

    (defun move-window-or-workspace (dir &optional arg window)
      (let ((other-window (windmove-find-other-window dir arg window)))
        (cond ((null other-window)
               (exwm-monitor-switch)
               (window-move-far (opposite-direction dir)))
              ((and (window-minibuffer-p other-window)
                    (not (minibuffer-window-active-p other-window)))
               (user-error "Minibuffer is inactive"))
              (t
               (select-window other-window)))))

    (defun move-window-or-workspace-left ()
      (interactive)
      (move-window-or-workspace 'left))

    (defun move-window-or-workspace-right ()
      (interactive)
      (move-window-or-workspace 'right))
    (defun exwm/create-keybindings ()
      (require 'exwm-input)
     (exwm-bind-keys
       ;; programs
       ("s-r" . dmenu)
       ("s-g" . exwm-run-google-chrome)
       ("s-b" . ivy-switch-buffer)
       ("s-e" . eshell)
       ("s-R" . exwm-restart)

       ;; windows
       ("s-d" . evil-window-delete)
       ("s-v" . evil-window-vsplit)
       ("s-s" . evil-window-split)
       ("s-l" . move-window-or-workspace-right)
       ("s-h" . move-window-or-workspace-left)
       ("s-j" . evil-window-down)
       ("s-H" . evil-window-move-far-left)
       ("s-J" . evil-window-move-very-bottom)
       ("s-K" . evil-window-move-very-top)
       ("s-L" . evil-window-move-far-right)
       ("s-k" . evil-window-up)

       ("s-f" . exwm-layout-toggle-fullscreen)
       ("<s-tab>" . exwm-jump-to-last-exwm)

       ;; emacs stuff
       ("s-o" . other-window)
       ("s-g" . keyboard-quit)

       ;; leader anywhere
       ;; ("s-SPC" . leader-map-prefix)

       ;; buffers
       ("s-q" . kill-this-buffer)

       ;; junk
       ("s-[" . 'exwm-reset)
       ("s-w" . exwm-workspace-switch)
       ("s-&" . exwm-run-from-input)
       )

      (setq exwm-input-simulation-keys
            '(((kbd "c-n") . [down])
              ((kbd "c-p") . [up])
              ((kbd "c-f") . [right])
              ((kbd "c-b") . [left])
              ((kbd "c-d") . [page down])
              ((kbd "c-u") . [page right]))))

      (exwm/create-functions)
      (exwm/create-keybindings)
      ;; rename buffers on window title change
      (add-hook 'exwm-update-class-hook 'exwm/rename-buffer-to-title-name)
      (add-hook 'exwm-update-title-hook 'exwm/rename-buffer-to-title-name)
      ;; Always show all buffers
      (setq exwm-workspace-show-all-buffers t)
      (setq exwm-layout-show-all-buffers t)
      ;; start in char mode
      (add-hook 'exwm-manage-finish-hook
                (lambda () (call-interactively #'exwm-input-release-keyboard)))
      ;; enable s-SPC as leader in exwm-https://github.com/bluerogue251/DBSubsetterode
      (push ?\s-\  exwm-input-prefix-keys)
      (require 'exwm-randr)
      (setq exwm-randr-workspace-output-plist '(1 "DP-2" 2 "DP-1"))
      (add-hook 'exwm-randr-screen-change-hook
                (lambda ()
                  (start-process-shell-command
                   "xrandr" nil "xrandr --output DP-2 --right-of DP-1 --auto")))
      (exwm-randr-enable)

      (require 'exwm-systemtray)
      (exwm-systemtray-enable)
      (display-time-mode)

      (require 'exwm-config)
      (exwm-config-default)
      )

(defun dotspacemacs/user-config ()
  (exwm-setup)
  (setenv "WORKON_HOME" "/home/chills/.conda/envs")
  (setq
   powerline-scale 1
   powerline-default-separator 'bar
   )
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (web-beautify tern prettier-js livid-mode skewer-mode js2-refactor yasnippet multiple-cursors js2-mode js-doc import-js grizzl impatient-mode simple-httpd add-node-modules-path xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help rainbow-mode rainbow-identifiers color-identifiers-mode orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download org-brain htmlize gnuplot evil-org smeargle magit-svn magit-gitflow magit-popup helm-gitignore helm-git-grep gitignore-templates gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit transient git-commit with-editor wgrep smex ivy-xref ivy-purpose ivy-hydra yapfify stickyfunc-enhance pytest pyenv-mode py-isort pippel pipenv pyvenv pip-requirements live-py-mode importmagic epc ctable concurrent deferred helm-pydoc helm-gtags helm-cscope xcscope ggtags cython-mode counsel-gtags company-anaconda company blacken anaconda-mode pythonic mmm-mode markdown-toc markdown-mode gh-md exwm xelb ws-butler writeroom-mode visual-fill-column winum volatile-highlights vi-tilde-fringe uuidgen treemacs-projectile treemacs-evil treemacs ht pfuture toc-org symon string-inflection spaceline-all-the-icons spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode password-generator paradox spinner overseer org-bullets open-junk-file nameless move-text macrostep lorem-ipsum link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-xref helm-themes helm-swoop helm-purpose window-purpose imenu-list helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flycheck-package package-lint flycheck flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state iedit evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens smartparens paredit evil-args evil-anzu anzu eval-sexp-fu elisp-slime-nav editorconfig dumb-jump doom-modeline shrink-path all-the-icons memoize f dash s define-word counsel-projectile projectile counsel swiper ivy pkg-info epl column-enforce-mode clean-aindent-mode centered-cursor-mode auto-highlight-symbol auto-compile packed aggressive-indent ace-window ace-link ace-jump-helm-line helm avy helm-core popup which-key use-package pcre2el org-plus-contrib hydra lv font-lock+ evil goto-chg undo-tree dotenv-mode diminish bind-map bind-key async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight ((t (:background "white smoke")))))
)
