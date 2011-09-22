; CEDET PLUGIN OPTIONS
;;;;;;;;;;;;;;;;;;;;;;;;; 

(load-file "~/emacs/plugins/cedet/common/cedet.el")
(global-ede-mode 1)                      ; Enable the Project management system
(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
(global-srecode-minor-mode 1)            ; Enable template insertion menu
(require 'semantic-ia)

;; CONFIGURING PATH
;;;;;;;;;;;;;;;;;;;;;

(if (not (member "/opt/local/bin" exec-path))
	(setq exec-path
		  (append  '("/usr/local/bin"
					 "/Library/Frameworks/Python.framework/Versions/2.7/bin"
					 "/opt/local/bin"
					 "/opt/local/sbin"
					 "/Users/emish/Scripts"
					) exec-path
				   )))

;; GIT SUPPORT 
;;;;;;;;;;;;;;;;

;;(add-to-list 'load-path "~/emacs/plugins/git-emacs")
;;(require 'git-emacs)

;;for c coding 
;;(require 'semantic-gcc)
;;for any other source paths I might want to include and associated major-mode
;;(semantic-add-system-include "~/path/to/source" 'python-mode)

;; for setting the c-specific autocomplete stuff
;; (defun my-cedet-hook ()
;;   (local-set-key [(control return)] 'semantic-ia-complete-symbol)
;;   (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
;;   (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
;;   (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle))
;; (add-hook 'c-mode-common-hook 'my-cedet-hook)


;; ECB PLUGIN OPTIONS 
;;;;;;;;;;;;;;;;;;;;;;;

;; Need to add ecb install dir to emacs load path
(add-to-list 'load-path
	     "~/emacs/plugins/ecb-2.40")
(require 'ecb-autoloads)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(ecb-fix-window-size t)
 '(ecb-layout-name "left13")
 '(ecb-layout-window-sizes (quote (("left13" (nil)))))
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
 '(ecb-source-file-regexps (quote ((".*" ("\\(^\\(\\.\\|#\\)\\|\\(~$\\|\\.\\(elc\\|obj\\|o\\|class\\|lib\\|dll\\|a\\|so\\|cache\\)$\\)\\)" "^.*\\.pyc$") ("^\\.\\(emacs\\|gnus\\)$")))) nil nil "Added extra regexp for compiled files. Handy for python and others. ")
 '(ecb-source-path (quote (("/Users/emish/Projects/Stella/stella_root/stella_project" "stella"))))
 '(ecb-vc-enable-support nil)
 '(ecb-windows-width 25)
 '(indicate-empty-lines t)
 '(python-python-command "python")
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )


;; HASKELL-MODE OPTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;
(load "~/emacs/plugins/haskell-mode/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)




;; PYTHON SUPPORT
;;;;;;;;;;;;;;;;;;;
;; Most taken from http://www.saltycrane.com/blog/2010/05/my-emacs-python-environment/
(setq default-indent-tabs-mode nil)   ;; use only spaces and no tabs
(setq default-tab-width 4)

(add-to-list 'load-path "~/emacs/plugins/pymacs")
;;(require 'pymacs)
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
;; these two lines are for custom python code within the pymacs directory
;;(eval-after-load "pymacs"
;;  '(add-to-list 'pymacs-load-path YOUR-PYMACS-DIRECTORY"))

(pymacs-load "ropemacs" "rope-") ;; use rope and ropemacs
(setq ropemacs-enable-autoimport t)
;; Autocomplete support
(add-to-list 'load-path "~/emacs/plugins/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/emacs/plugins/auto-complete/ac-dict")
(ac-config-default)
;; Yasnippet support
(add-to-list 'load-path "~/emacs/plugins/yasnippet")
(require 'yasnippet-bundle)


;; Pyflake: Need to figure this out properly; works with aquamacs not emacs
;; (require 'flymake)
;; (add-to-list 'load-path "~/emacs/plugins/flymake-cursor")

;; (add-hook 'find-file-hook 'flymake-find-file-hook)
;; (when (load "flymake" t)
;;   (defun flymake-pyflakes-init ()
;;     (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                'flymake-create-temp-inplace))
;;        (local-file (file-relative-name
;;             temp-file
;;             (file-name-directory buffer-file-name))))
;;       (list "pycheckers"  (list local-file))))
;;    (add-to-list 'flymake-allowed-file-name-masks
;;              '("\\.py\\'" flymake-pyflakes-init)))
;; (load-library "flymake-cursor")
;; (global-set-key [f10] 'flymake-goto-prev-error)
;; (global-set-key [f11] 'flymake-goto-next-error)
;;end pyflake


;;Django: works, except for a deprecated call to emacs lib.
(load "~/emacs/plugins/nxhtml/autostart.el")
(setq mumamo-background-colors nil)
(add-to-list 'auto-mode-alist '("\\.html$" . django-html-mumamo-mode))

;; RANDOM EXTRAS
;;;;;;;;;;;;;;;;;;
(require 'ido) ;;Interactively DO Mode: allows you to switch buffer by any substring
(setq inhibit-startup-echo-area-message t) ;;Stop aquamacs from advertising when opened


