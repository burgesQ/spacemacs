;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs-base

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

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------

     (helm :variables
           helm-enable-auto-resize t
           helm-no-header t
           help-position 'bottom
           helm-ff-auto-update-initial-value t
           helm-use-fuzzy 'always)

     (lsp :variables
          lsp-restart 'auto-restart
          lsp-headerline-breadcrumb-enable t
          lsp-lens-enable t
          lsp-modeline-diagnostics-enable t
          ;; default segments
          lsp-modeline-code-actions-segments '(count icon))

     (dap :variables
                                        ; don't display the mouse buttons
          dap-enable-ui-controls nil
                                        ; use the auto-configure layout, but no mouse buttons
          dap-auto-configure-features '(sessions locals breakpoints expressions tooltip))

     neotree
     spacemacs-project
     syntax-checking
     version-control
     theming
     emoji
     better-defaults
     emacs-lisp
     git
     (docker :variables
             docker-dockerfile-backend 'lsp)

     (python :variables
             python-backend 'lsp)

     (org :variables
          org-enable-org-journal-support t
          org-enable-github-support t
          org-enable-reveal-js-support t
          org-projectile-file "TODOs.org")

     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)

     ;; (wakatime :variables:
     ;;           enwakatime-api-key  "12cc0e7d-58ce-458f-bb54-c74e607956e3"
     ;;           wakatime-cli-path "/home/master/.local/bin/wakatime"
     ;;           )

     (spell-checking :variables
                     ;; bug w/ emacs daemon, so ensure it's disabled
                     spell-checking-enable-auto-dictionary nil
                     spell-checking-enable-by-default nil
                     enable-flyspell-auto-completion t)

     (auto-completion :variables
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-minimum-prefix-length 1
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip t
                      auto-completion-idle-delay 1.0
                      auto-completion-enable-sort-by-usage t)

     (unicode-fonts :variables
                    unicode-fonts-enable-ligatures t
                    unicode-fonts-ligature-modes '(prog-mode))

     (markdown :variables
               markdown-live-preview-engine 'vmd)

     (c-c++ :variables
            c-c++-enable-clang-support t
            c++-enable-organize-includes-on-save t
            c-c++-enable-clang-format-on-save t
            c-c++-backend 'lsp-clangd
            c-c++-default-mode-for-headers 'c++-mode)

     (php :variables
          php-backend 'lsp)

     (javascript :variables
                 javascript-backend 'lsp
                                        ; disbale js2 warn
                 js2-mode-show-strict-warnings nil
                                        ; auto import
                 javascript-import-tool 'import-js
                                        ; add node module to local buffer
                 node-add-modules-path t
                 js2-basic-offset 2
                 js-indent-level 2
                                        ; fmt on save
                 javascript-fmt-on-save t)

     (go :variables
         go-backend 'lsp
         godoc-at-point-function 'godoc-gogetdoc
         go-format-before-save t
         gofmt-command "goimports"
         go-use-golangci-lint t
         go-tab-width 2)

     my-spaceline
     )

   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      ;; fira-code-mode
                                      ;; all-the-icons
                                      ;; spaceline-all-the-icons
                                      org-bullets
                                      olivetti)

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

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

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

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

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
   dotspacemacs-editing-style 'emacs

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 5)
                                (todos . 5))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         apropospriate-dark
                         oldlace

                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs
                                  :separator wave
                                  :separator-scale 2
                                  )

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts.
   dotspacemacs-default-font '("Fira Code"
                               :size 11.0
                               :weight regular
                               :width normal
                               :powerline-scale 1.1)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
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

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

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
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'any

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
   dotspacemacs-whitespace-cleanup 'nil

   ;; If non nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfer with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil))

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
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  (setq exec-path-from-shell-arguments '("-l")) )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."


  (setq-default
   powerline-height 36)

  ;; (neo-vc-integration '(face))
  (setq neo-theme 'icons)

  ;; ignore wanring in buffer
  (setq spacemacs-buffer--warnings nil)

  ;; https://github.com/bbatsov/projectile/issues/1302
  (setq projectile-git-submodule-command nil)

  ;; parenthesis
  (show-paren-mode 1)

  ;; no symlinks question prompted
  (setq vc-follow-symlinks t)

  ;; shortcut bs-show
  (global-set-key (kbd "C-x <down>") 'bs-show)

                                          ; c/c++
  ;; tab size is 4
  (setq c-basic-offser 4)
  ;; Prevent Extraneous Tabs
  (setq-default indent-tabs-mod nil)
  ;; indente switch case
  (c-set-offset 'case-label '+)

                                        ; shell/zsh
  (setq
   explicit-shell-file-name "/bin/zsh"
   shell-file-name "/bin/zsh"
   multi-term-program "/bin/zsh"
   ;; load zsh alias
   shell-command-switch "-ic")
  (add-hook 'term-mode-hook #'eterm-256color-mode)

  (setq olivetti-body-width 0.85)
  ;; Starts text files (like .org .txt .md) in olivetti mode
  (add-hook 'text-mode-hook 'olivetti-mode)

                                        ; git
  (setq magit-repository-directories '("~/repos/")) ; root repo
  (global-git-commit-mode t)                        ; enable speed git mode

                                        ; color
  ;; enable ansi color in term & compilation & git?
  ;; enable ansi on shell mode
  (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
  ;; ansi for git
  (ansi-color-for-comint-mode-on)
  ;; follow
  (add-to-list 'comint-output-filter-functions 'ansi-color-process-output)
  ;; fix compil color again
  (require 'ansi-color)
  (defun colorize-compilation-buffer ()
    (toggle-read-only)
    (ansi-color-apply-on-region compilation-filter-start (point))
    (toggle-read-only))
  (add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

  ;; clean spaces before save
  ;; (add-hook 'before-save-hook 'whitespace-cleanup)         ; remove extra space per lines
  (add-hook 'before-save-hook 'delete-trailing-whitespace) ; remove all extra space

  ;; stop lockfile
  (setq create-lockfiles nil)

  ;; conf mode line
  (setq display-time-24hr-format t)
  (setq display-time-format "%H:%M:%S")        ; add seconds
  (setq display-time-interval 1)               ; update every second
  (setq display-time-default-load-average nil) ; don't show load average
  (setq display-time-mail-string "")           ; don't show mail
  (display-time-mode 1)                        ; show time in mode line on startup
  ;; (spacemacs/toggle-mode-line-battery-on)      ; display battery info
  (global-visual-line-mode 1)                  ; wrap line by default
  ;;(spacemacs/toggle-highlight-long-lines-globally-on) ; highlight line over 80 col
  ;; src following:
  ;; https://out-of-cheese-error.netlify.app/spacemacs-config

  ;; ;; Text takes up 85% of the buffer
  ;; (setq olivetti-body-width 0.85)
  ;; ;; Starts text files (like .org .txt .md) in olivetti mode
  ;; (add-hook 'text-mode-hook 'olivetti-mode)

  ;; local dbg server for go-pls
  (setq lsp-gopls-server-args '("serve" "--debug=localhost:6060"))


  (with-eval-after-load "helm"
    ;; fix long helm search
    ;; https://github.com/emacs-helm/helm/issues/1976
    (setq
     helm-ff-auto-update-initial-value t
     x-wait-for-event-timeout nil)

    ;; helm tab complete
    ;; (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
    ;; (define-key helm-find-files-map (kbd "C-i") ’helm-ff-TAB)
    (define-key helm-map (kbd "TAB") #'helm-execute-persistent-action)
    (define-key helm-map (kbd "<tab>") #'helm-execute-persistent-action)
    (define-key helm-map (kbd "C-z") #'helm-select-action)
   )

  ;; helm fix ret to enter dir , backspace to go up 1 dir
  ;; https://emacs.stackexchange.com/questions/3798/how-do-i-make-pressing-ret-in-helm-find-files-open-the-directory
  (with-eval-after-load 'helm-files
    (defun fu/helm-find-files-navigate-back (orig-fun &rest args)
      (if (= (length helm-pattern) (length (helm-find-files-initial-input)))
          (helm-find-files-up-one-level 1)
        (apply orig-fun args)))
    (advice-add 'helm-ff-delete-char-backward :around #'fu/helm-find-files-navigate-back)
  )

  ;; src: https://emacs.stackexchange.com/questions/31761/how-to-use-a-separate-window-for-compilation-output
  (defun display-buffer-reuse-major-mode-window (buffer alist)
    (let* ((alist-entry (assq 'reusable-frames alist))
           (frames (cond (alist-entry (cdr alist-entry))
                         ((if (eq pop-up-frames 'graphic-only)
                              (display-graphic-p)
                            pop-up-frames)
                          0)
                         (display-buffer-reuse-frames 0)
                         (t (last-nonminibuffer-frame))))
           (window (let ((mode (with-current-buffer buffer major-mode)))
                     (if (and (eq mode (with-current-buffer (window-buffer)
                                         major-mode))
                              (not (cdr (assq 'inhibit-same-window alist))))
                         (selected-window)
                       (catch 'window
                         (walk-windows
                          (lambda (w)
                            (and (window-live-p w)
                                 (eq mode (with-current-buffer (window-buffer w)
                                            major-mode))
                                 (not (eq w (selected-window)))
                                 (throw 'window w)))
                          'nomini frames))))))
      (when (window-live-p window)
        (prog1 (window--display-buffer buffer window 'reuse alist)
          (unless (cdr (assq 'inhibit-switch-frame alist))
            (window--maybe-raise-frame (window-frame window)))))))


  (with-eval-after-load "helm"

    (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

    ;; color font and stuffs: https://zzamboni.org/post/beautifying-org-mode-in-emacs/
    (font-lock-add-keywords 'org-mode
                            '(("^ *\\([-]\\) "
                               (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

                                        ; pretty org check box
    (add-hook 'org-mode-hook (lambda ()
                               "Beautify Org Checkbox Symbol"
                               (push '("[ ]" . "☐" ) prettify-symbols-alist)
                               (push '("[X]" . "☑" ) prettify-symbols-alist)
                               (push '("[-]" . "❍" ) prettify-symbols-alist)
                               (prettify-symbols-mode)))
    (defface org-checkbox-done-text
      '((t (:foreground "#71696A")))
      "Face for the text part of a checked org-mode checkbox.")

    (setq
     ;; https://www.reddit.com/r/spacemacs/comments/hakh9c/changing_org_bullet_list/
     org-superstar-headline-bullets-list '("◉" "○" "▲" "▶" "■" "◆")

     org-agenda-files (apply 'append
		                         (mapcar
		                          (lambda (directory)
		  	                        (directory-files-recursively
		  	                         directory org-agenda-file-regexp))
		                          '("~/repo/TODOs/")))

     ;; org-agenda-files (directory-files-recursively "~/repo/sbc/" "\.org$")
     ;; org-agenda-files (list "~/repo/TODOs/TODOs.org")

                                        ; custom keyword // | mean closed for left
     org-todo-keywords
     '((sequence "IDEA" "TODO" "WIP" "REVIEW" "|" "UNASIGNED" "CANCELED" "DONE"))
                                        ; keyword colors
     org-todo-keyword-faces
     '(("IDEA" . "SlateGray")
       ("TODO" . "SlateGray")
       ("WIP" . "DarkOrchid")
       ("REVIEW" . "ForestGreen")
       ("UNASIGNED" . "Firebrick")
       ("CANCELED" . "Firebrick")
       ("DONE" . "Teal"))

                                        ; enable speed commands
     org-use-speed-commands t
                                        ; log time on done
     org-log-done 'time
                                        ; org clock ..?
     spaceline-org-clock-p t
                                        ; shift + arrow to select
     org-support-shift-select t


                                        ; Skip finished items
     org-agenda-skip-deadline-if-done t
     org-agenda-skip-scheduled-if-done t
     org-agenda-skip-timestamp-if-donee t
                                        ; Skip deleted file
     org-agenda-skip-unavailable-files t

                                        ; ailignn text under headings
     org-startup-indented t
     org-pretty-entities t
                                        ; show actually italicized text instead of /italicized text/
     org-hide-emphasis-markers t
     org-agenda-block-separator " "
     org-fontify-whole-heading-line t
     org-fontify-done-headline t
     org-fontify-quote-and-verse-blocks t)
    ;; end setq
    );; end eval-after-load org

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
 '(org-agenda-files '("~/repo/TODOs/TODOs.org" "~/repo/TODOs/daily.org"))
 '(package-selected-packages
   '(spaceline-all-the-icons all-the-icons memoize spaceline powerline projectile neotree helm-rtags helm-pydoc helm-org-rifle helm-lsp helm-gitignore helm-git-grep flx helm-company helm-c-yasnippet flyspell-correct-helm dockerfile-mode docker tablist docker-tramp add-node-modules-path yapfify web-beautify sphinx-doc pytest pyenv-mode py-isort prettier-js pippel pipenv pyvenv pip-requirements nodejs-repl lsp-python-ms lsp-pyright livid-mode skewer-mode simple-httpd live-py-mode json-navigator hierarchy json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc importmagic epc ctable concurrent cython-mode company-anaconda blacken anaconda-mode pythonic org-projectile org-category-capture oldlace-theme apropospriate-theme yasnippet-snippets vmd-mode unicode-fonts ucs-utils font-utils unfill toc-org smeargle phpunit phpcbf php-auto-yasnippets persistent-soft pcache ox-gfm orgit org-superstar org-rich-yank org-re-reveal org-present org-pomodoro alert log4e gntp org-mime org-journal org-download org-cliplink org-brain mwim mmm-mode markdown-toc magit-svn magit-section magit-gitflow magit-popup lsp-ui lsp-origami origami htmlize google-c-style godoctor go-tag go-rename go-impl go-guru go-gen-test go-fill-struct go-eldoc gnuplot gitignore-templates gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ fringe-helper git-gutter+ gh-md fuzzy forge ghub closql emacsql-sqlite emacsql treepy flyspell-popup flyspell-correct-popup flyspell-correct flycheck-ycmd flycheck-rtags flycheck-pos-tip flycheck-golangci-lint evil-org evil-magit magit git-commit with-editor transient emojify emoji-cheat-sheet-plus drupal-mode php-mode disaster dap-mode posframe lsp-treemacs bui cpp-auto-include company-ycmd ycmd request-deferred request deferred company-statistics company-rtags rtags company-quickhelp pos-tip company-go go-mode company-emoji company-c-headers company ccls lsp-mode markdown-mode spinner dash-functional browse-at-remote auto-yasnippet yasnippet auto-dictionary ac-ispell auto-complete org-plus-contrib which-key use-package treemacs-projectile treemacs-icons-dired pcre2el overseer nameless macrostep hybrid-mode helm-xref helm-themes helm-swoop helm-projectile helm-org helm-mode-manager helm-make helm-ls-git helm-flx helm-descbinds helm-ag flycheck-package flycheck-elsa evil-mc emr elisp-slime-nav dotenv-mode diminish bind-map auto-compile ace-jump-helm-line)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
