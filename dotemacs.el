(add-to-list 'load-path (expand-file-name "elisp" (concat (getenv "HOME") "/.emacs.d/lisp")))
(add-to-list 'load-path "~/.emacs.d/lisp")
(setq exec-path (split-string "/home/dsqiu/bin/opt/mips-gcc472-glibc216/bin:/home/dsqiu/Work/android/tools/sdk/adt-bundle-linux-x86_64-20140702/sdk:/home/dsqiu/Work/android/tools/studio/android-studio/bin:/home/dsqiu/Work/android/tools/ndk/android-ndk-r10:/home/dsqiu/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games" path-separator))

;(setq exec-path (concat	(split-string "/opt/mips-4.3/bin:~/bin/" path-separator) (getenv "PATH")))
(setenv "PATH" (mapconcat 'identity exec-path ":"))

(server-start)
(setq ansi-color-for-comint-mode t)
(ansi-color-for-comint-mode-on)
(customize-group 'ansi-colors)
(kill-this-buffer)

(autoload 'ansi-color-for-comint-mode-on "ansi-color" 0 t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(transient-mark-mode t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-message t)
(setq gnus-inhibit-startup-message t)
(font-lock-mode t)
(menu-bar-mode 0)
(setq x-select-enable-clipboard t)

(require 'ctypes)
(ctypes-auto-parse-mode 1)
(require 'shell-completion)
(require 'shell-command)
(shell-command-completion-mode)

;(add-hook 'after-make-frame-functions(lambda (frame)(with-selected-frame frame)))

(setq scroll-margin 0 scroll-conservatively 10000)
(setq linum-format
(lambda (line) (propertize (format (let
((w (length (number-to-string (count-lines (point-min) (point-max))))))
(concat "%" (number-to-string w) "d ")) line) 'face 'linum)))

;(require 'line-num)
(require 'linum)
(global-linum-mode 0)
(setq linum-format "%4d")
(add-hook 'find-file-hooks (lambda () (linum-mode 1)))

(require 'highlight-parentheses)

(cua-mode t)
(load "desktop")
(desktop-load-default)
(desktop-read)

(setq time-stamp-active t)
(setq time-stamp-warn-inactive t)
(setq time-stamp-format "%:y-%02m-%02d %3a %02H:%02M:%02S baiy")

(setq default-fill-column 80)
(setq suggest-key-bindings 1)

(setq user-full-name "dsqiu")
(setq user-mail-address "dsqiu@ingenic.cn")


(require 'cc-mode)

 ; yasnippet
; --------------
;(require 'yasnippet-bundle)


;;;;;;folding;;;;;;;
(load "folding")

;;
;;;;;;;;yes or no To  y or n;;;;;;;
(fset 'yes-or-no-p 'y-or-n-p)



(setq display-time-24hr-format t)
(setq display-time-day-and-date nil)
(display-time)
(add-hook 'comint-output-filter-functions
	'comint-watch-for-password-prompt)


(require 'fillcode)
(add-hook 'c-mode-common-hook' fillcode-mode)


(c-set-offset 'inline-open 0)
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)

(tool-bar-mode -1)
(setq-default kill-whole-line t)
(setq require-final-newline t)
(setq suggest-key-bindings 1)


(require 'ido)
(ido-mode t)


(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
    ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
    (t (self-insert-command (or arg 1)))))

(global-set-key "%" 'match-paren)

(setq swbuff-status-window-layout 'scroll)
(setq swbuff-clear-delay 1)
(setq swbuff-separator "|")
(setq swbuff-window-min-text-height 1)

(setq visible-bell t)

(setq inhibit-startup-message t)
(setq column-number-mode t)

(show-paren-mode t)
(setq show-paren-style 'parentheses)

(setq my-hostname 
      (replace-regexp-in-string "\\(^[[:space:]\n]*\\|[[:space:]\n]*$\\)" "" ;; like perl chomp()
        (with-output-to-string 
           (call-process "/bin/hostname" nil standard-output nil))))
(setq my-username (getenv "USER"))
(setq frame-title-format '("%b - " my-username "@" my-hostname))

(global-font-lock-mode t)

(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)
(setq search-highlight t)
(setq query-replace-highlight t)

(require 'bm)
(global-set-key (kbd "<C-f2>") 'bm-toggle)
(global-set-key (kbd "<f2>")   'bm-next)
(global-set-key (kbd "<S-f2>") 'bm-previous)

;; Book mark 1
(global-set-key [S-f1] 'bookmark-jump-default1)
(defun bookmark-jump-default1 (pos)
  "Set a default bookmark 1 default-bookmark1 at current position"
  (interactive "d")
  (bookmark-jump "default-bookmark1")
  (bookmark-set "default-bookmark1"))

(global-set-key [C-f1] 'bookmark-set-default1)
(defun bookmark-set-default1 (pos)
  "Jump to the default bookmark 1 default-bookmark1"/
  (interactive "d")
  (bookmark-set "default-bookmark1"))


;; Set the word search keys
(define-key global-map [f3] 'isearch-forward)
(define-key isearch-mode-map [f3] 'isearch-repeat-forward)

(define-key global-map [(control f)] 'isearch-forward)
(define-key isearch-mode-map [(control f)] 'isearch-repeat-forward)

(define-key global-map [C-f3] 'isearch-forward-regexp)
(define-key global-map [S-f3] 'isearch-backward)
(define-key isearch-mode-map [S-f3] 'isearch-repeat-backward)

(define-key global-map [C-r] 'isearch-backward)
(define-key isearch-mode-map [C-r] 'isearch-repeat-backward)

(define-key global-map [C-S-f3] 'isearch-backward-regexp)

;; Go to line
(global-set-key [f5] 'goto-line)

;; Search previour/next issued command
(global-set-key [S-f7] 'comint-next-matching-input-from-input)
(global-set-key [f7] 'comint-previous-matching-input-from-input)

;; Replace
(global-set-key [f9] 'query-replace)
(global-set-key [C-f9] 'query-replace-regexp)
(global-set-key [S-f9] 'query-replace-reg-t)

(defun query-replace-reg-t (to-string)
  (interactive (let (to)
		 (setq to (read-from-minibuffer
			   (format "Query-replace \"%s\" with: "
				   (get-register t))
			   nil nil nil
			   query-replace-to-history-variable nil t))
		 (list to)))
  (perform-replace (get-register t) to-string t nil nil))

(global-set-key [f10] 'replace-string)
(global-set-key [C-f10] 'replace-string-regexp)
(global-set-key [S-f10] 'replace-string-reg-t)

(defun replace-string-reg-t (to-string)
  (interactive (let (to)
		 (setq to (read-from-minibuffer
			   (format "Replace \"%s\" with: "
				   (get-register t))
			   nil nil nil
			   query-replace-to-history-variable nil t))
		 (list to)))
  (perform-replace (get-register t) to-string nil nil nil))

;;----------------------------------
(put 'scroll-left 'disabled nil)

;; other customizations

;(setq indent-tabs-mode nil)
;(setq default-tab-width 8)
;(setq tab-width 8)


(defun linux-c-mode ()
	"C mode with adjusted defaults for use with the Linux kernel."
	(interactive)
	(c-mode)
	(c-set-style "K&R")
	(setq tab-width 8)
	(setq indent-tabs-mode t)
	(setq c-basic-offset 8)
)

(defun	my-c-mode ()
	"C mode with adjusted defaults for use with the C sources."
	(interactive)
	(c-mode)
	(c-set-style "K&R")
	(setq tab-width 4)
	(setq indent-tabs-mode t)
	(setq c-basic-offset 4)
;;	(setq c-basic-offset 0)
)

(defun	my-c++-mode ()
	"C++ mode with adjusted defaults for use with the C++ sources."
	(interactive)
	(c++-mode)
	(c-set-style "K&R")
	(setq tab-width 4)
	(setq indent-tabs-mode t)
	(setq c-basic-offset 4)
)

(defun	my-asm-mode ()
	"ASM mode with adjusted defaults for use with the asm sources."
	(interactive)
	(asm-mode)
	(setq tab-width 8)
	(setq indent-tabs-mode t)
	(setq c-basic-offset 8)
)

(setq c-default-style "Linux")

(setq auto-mode-alist (cons '(".*\\.\\(inl$\\|cxx$\\|hxx$\\|cpp$\\|hpp$\\)" .
			my-c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '(".*\\.\\(inc$\\|[Ss]$\\)" .
			my-asm-mode) auto-mode-alist))
(setq auto-mode-alist (cons '(".*\\.\\(inl$\\|c$\\|h$\\)" .
			linux-c-mode) auto-mode-alist))
;(setq auto-mode-alist (cons '(".*/*linux.*/+.*\\.[ch]$" .
;			linux-c-mode) auto-mode-alist))


;; Load CEDET
(add-to-list 'load-path "~/.emacs.d/lisp/cedet_bzr/trunk/")
(require 'cedet-devel-load)
(setq ede-locate-setup-options
      '(ede-locate-cscope
	ede-locate-base))

(setq-mode-local c-mode semanticdb-find-default-throttle
                 '(project unloaded system recursive))

(semantic-load-enable-code-helpers)
(require 'cedet-cscope)
(require 'semantic/ia)
(require 'semantic/db-cscope)

(semanticdb-enable-cscope-databases)

;; Semantic
(global-semanticdb-minor-mode t)
(global-semantic-decoration-mode t)

(add-to-list 'load-path "~/.emacs.d/lisp/ecb-2.40")
(setq stack-trace-on-error nil)
(require 'ecb)
(require 'ecb-autoloads)
(setq ecb-tip-of-the-day nil)

(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)

(ecb-layout-define "my-cscope-layout" right nil
      (let ((edit-win (previous-window (selected-window) 0)))
	  (ecb-set-methods-buffer)
	  (select-window edit-win)))

(defecb-window-dedicator ecb-set-cscope-buffer " *ECB cscope-buf*"
                         (switch-to-buffer "*cscope*"))

(setq ecb-layout-name "my-cscope-layout")
(setq ecb-history-make-buckets 'never)
(define-key global-map [(f1)] 'ecb-toggle-ecb-windows)


(add-to-list 'load-path "~/.emacs.d/lisp/auto-complete")
(add-to-list 'load-path "~/.emacs.d/lisp/popup-el")
(require 'popup)
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(setq ac-trigger-commands
      (cons 'backward-delete-char-untabify ac-trigger-commands))

(require 'auto-complete-config)
(setq ac-dwim t)
(setq ac-use-quick-help t)
;(setq ac-quick-help-delay 1.0)

;(set-default 'ac-sources
;             '(ac-source-semantic ;;ac使用semantic的分析结果
; 	       ac-source-yasnippet
; 	       ac-source-abbrev
;               ac-source-words-in-buffer
;               ac-source-words-in-all-buffer
;               ac-source-imenu
;               ac-source-files-in-current-dir
;               ac-source-filename))
(set-default 'ac-sources
             '(ac-source-semantic ;;ac使用semantic的分析结果
	       ac-source-yasnippet
	       ac-source-abbrev
               ac-source-words-in-buffer
               ac-source-words-in-all-buffer
              ))
;(ac-config-default)
;; (defun my:ac-c-header-init ()
;;        (require 'auto-complete-c-headers)
;;        (add-to-list 'ac-sources	'ac-source-c-headers)
;; ;; gcc -xc++ -E -v -
;;        (add-to-list 'achead:include-directories '
;;        "/usr/include/c++/4.8
;;         /usr/include/x86_64-linux-gnu/c++/4.8
;;         /usr/include/c++/4.8/backward
;;         /usr/lib/gcc/x86_64-linux-gnu/4.8/include
;;         /usr/local/include
;;         /usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed
;;         /usr/include/x86_64-linux-gnu
;;         /usr/include"
;;        ))
;(add-hook 'c++-mode-hook 'my:ac-c-header-init)
;(add-hook 'c-mode-hook 'my:ac-c-header-init)
(setq ac-auto-start 3)
(ac-cc-mode-setup)
(global-auto-complete-mode)
(add-to-list 'load-path "~/.emacs.d/lisp/yasnippet")
(require 'yasnippet)
(yas/load-directory "~/.emacs.d/lisp/yasnippet/snippets")
(yas-global-mode t)

(require 'hideif)
(setq hide-ifdef-initially nil)
(add-hook 'c-mode-common-hook
(lambda ()
(hide-ifdef-mode 1)
))

(defun my-hide-if-0()

"hide #if 0 blocks, inspired by internet. --lgfang"
(interactive)
(require 'hideif)
(save-excursion
(goto-char (point-min))
(while (re-search-forward "^[ \t]*#if[ \t]*0" nil t) (hide-ifdef-block)) )
)
(add-hook 'c-mode-hook 'my-hide-if-0)

;;;###autoload
(defun switch-source-file ()
  (interactive)
  (let
  (setq file-name (buffer-file-name))
  (if (string-match "\\.cpp" file-name)
      (find-file (replace-regexp-in-string "\\.cpp" "\.h" file-name)))
  (if (string-match "\\.h" file-name)
      (find-file (replace-regexp-in-string "\\.h" "\.cpp" file-name)))
  )
)

(defun switch-source-buffer ()
  (interactive)
  (let
  (setq file-name (buffer-file-name))
  (if (string-match "\\.cpp" file-name)
      (switch-to-buffer (replace-regexp-in-string "\\.cpp" "\.h" (file-name-nondirectory file-name))))
  (if (string-match "\\.h" file-name)
      (switch-to-buffer (replace-regexp-in-string "\\.h" "\.cpp"  (file-name-nondirectory file-name)))))
)
(global-set-key [C-f11] 'switch-source-file)
(global-set-key [M-f11] 'switch-source-buffer)

(defun flush-source-buffer ()
  (interactive)
  (setq file-name (buffer-file-name))
  (find-file file-name)
)

(global-set-key [f8] 'flush-source-buffer)

;;;  快速切换到 shell 并 cd 到当前 buffer 所在的目录
(defun kid-switch-to-shell ()
  (interactive)
  (when (null (cdr (window-list)))
    (split-window-vertically))
  (let ((file buffer-file-name))
    (other-window 1)
    (eshell)
    (when file
      (end-of-buffer)
      (when (looking-back shell-prompt-pattern)
        (insert "cd " (file-name-directory file))
        (call-interactively 'comint-send-input)))))
(global-set-key (kbd "<f12>") 'kid-switch-to-shell)



(define-key global-map "\C-h" 'beginning-of-buffer)
(define-key global-map "\C-e" 'end-of-buffer)

;; android-mode
(add-to-list 'load-path "~/.emacs.d/lisp/android-mode/")
(require 'android-mode)
(load-file "~/.emacs.d/lisp/android-mode/android-compile.el")

(add-hook 'c++-mode-hook 'android-compile)
(add-hook 'java-mode-hook 'android-compile)

(defun dos2unix (buffer)
  "Automate M-% C-q C-m RET C-q C-j RET"
  (interactive "*b")
  (save-excursion
    (goto-char (point-min))
    (while (search-forward (string ?\C-m) nil t)
      (replace-match (string ?\C-j) nil t))))
(make-variable-buffer-local 'wcy-shell-mode-directory-changed)
(setq wcy-shell-mode-directory-changed t)

(defun wcy-shell-mode-auto-rename-buffer-output-filter (text)
  (if (and (eq major-mode 'shell-mode)
           wcy-shell-mode-directory-changed)
      (progn
        (let ((bn  (concat "sh:" default-directory)))
          (if (not (string= (buffer-name) bn))
              (rename-buffer bn t)))
        (setq wcy-shell-mode-directory-changed nil))))


(defun wcy-shell-mode-auto-rename-buffer-input-filter (text)
  (if (eq major-mode 'shell-mode)
      (if ( string-match "^[ \t]*cd *" text)
          (setq wcy-shell-mode-directory-changed t))))

(require 'flyspell) ;;非常好用的英文的拼写检查
(require 'uniquify)

(setq uniquify-buffer-name-style 'forward)

(require 'wcy-swbuff)
;; then you can use <C-tab> and <C-S-kp-tab> to switch buffer.
 (global-set-key (kbd "<C-tab>") 'wcy-switch-buffer-forward)
 (global-set-key (kbd "<C-S-kp-tab>") 'wcy-switch-buffer-backward)

(setq wcy-switch-buffer-active-buffer-face  'highlight)
(setq wcy-switch-buffer-inactive-buffer-face  'secondary-selection )

(global-set-key (kbd "<f11>") 'menu-bar-mode)

(setq strprj' (~))
(defun showmessage-compl ()
	(interactive)
	(setq title (read-from-minibuffer "Path: "))
	(if (> (length title) 0)
	(message "prj = %s." title)
	)
)
(global-set-key [(control x)(control d)] 'showmessage-compl)

(add-to-list
 'after-make-frame-functions
 (lambda (new-frame)
   (select-frame new-frame)
   (tool-bar-mode  -1)))

(require 'ascii)

;;不生成#F#文件
(setq auto-save-default nil)
;;不生成临时文件
(setq-default make-backup-files nil)

(add-to-list 'load-path "~/.emacs.d/lisp/cscope/cscope-15.8a/contrib/xcscope")
(require 'xcscope)
(define-key global-map [(control c)(f3)]  'cscope-set-initial-directory)
(define-key global-map [(control c)(f4)]  'cscope-unset-initial-directory)

(defun command-line-diff (switch)
      (let ((file1 (pop command-line-args-left))
            (file2 (pop command-line-args-left)))
        (ediff file1 file2)))
(add-to-list 'command-switch-alist '("-diff" . command-line-diff))

(load-library "ediff")
    (add-hook 'ediff-before-setup-hook 'new-frame)
    (add-hook 'ediff-quit-hook 'delete-frame)
    (setq ediff-window-setup-function 'ediff-setup-windows-plain)
    (setq ediff-split-window-function 'split-window-horizontally)

(require 'display-buffer-for-wide-screen)
;(require 'tiling)
;(define-key global-map (kbd "C-\\") 'tiling-cycle) ; accepts prefix number
;(define-key global-map (kbd "C-M-<up>") 'tiling-tile-up)
;(define-key global-map (kbd "C-M-<down>") 'tiling-tile-down)
;(define-key global-map (kbd "C-M-<right>") 'tiling-tile-right)
;(define-key global-map (kbd "C-M-<left>") 'tiling-tile-left)
(require 'show-wspace)

(global-set-key (kbd "S-<f11>") 'ws-toggle-highlight-trailing-whitespace)

(set-frame-parameter nil 'alpha '(100 90))
(add-to-list 'custom-theme-load-path "~/.emacs.d/lisp/themes/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/lisp/themes/emacs-colro-theme-solarized")
(add-to-list 'custom-theme-load-path "~/.emacs.d/lisp/themes/zenburn/zenburn-emacs")
(load-theme 'Amelie t)
;(load-theme 'zenburn t)
;(condition-case nil
;    (set-default-font "Ubuntu Mono 16")
;  (error (condition-case nil
;             (set-default-font "Cousine")
;           (error (condition-case nil
;                      (set-default-font "Monaco")
;                    (error nil))))))

(require 'window-number)
(window-number-mode)
(window-number-meta-mode)
(blink-cursor-mode 0)
(recentf-mode 1)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

(defun ceshell-buffer(arg)
  "cycle through buffers whose major mode is term-mode"
  (interactive)
  (setq works (buffer-list))
  (setq createshell 1)
  (while works
  (when (with-current-buffer (car works)
                             (string= arg (buffer-name)))
        (switch-to-buffer (car works))
	(setq createshell 0)
        (setq works nil))
   (setq works (cdr works)))
  (if( = createshell 1) (eshell))
  (if( = createshell 1) (rename-buffer arg))
 )
(defun workshell ()
  (interactive)
  (when (null (cdr (window-list)))
    (split-window-vertically))
  (let (file buffer-file-name)
;;    (other-window 1)
    (ceshell-buffer "work-shell")
    (when file
      (end-of-buffer)
      (when (looking-back shell-prompt-pattern)
        (insert "cd " (file-name-directory file))
        (call-interactively 'comint-send-input))
      )
    )
  )
(define-key global-map [f6]  'workshell)

(defun cterm-buffer(arg)
  "cycle through buffers whose major mode is term-mode"
  (interactive)
  (setq works (buffer-list))
  (setq createshell 1)
  (while works
  (when (with-current-buffer (car works)
	  (string= arg (buffer-name)))
          (switch-to-buffer (car works))
	(setq createshell 0)
	(setq works nil))
   (setq works (cdr works)))
  (if( = createshell 1) (term "/bin/bash"))
  (if( = createshell 1) (rename-buffer arg))
 )
(defun cshell-buffer(arg)
  "cycle through buffers whose major mode is term-mode"
  (interactive)
  (setq works (buffer-list))
  (setq createshell 1)
  (while works
  (when (with-current-buffer (car works)
	  (string= arg (buffer-name)))
    (switch-to-buffer (car works))
	(setq createshell 0)
	(setq works nil))
   (setq works (cdr works)))
  (if( = createshell 1) (shell))
  (if( = createshell 1) (rename-buffer arg))
 )

(defun makeshell ()
  (interactive)
  (when (null (cdr (window-list)))
    (split-window-vertically))
    (other-window 1)
    (cshell-buffer "make-shell")
    (when file
      (end-of-buffer)
      (when (looking-back shell-prompt-pattern)
	(insert "cd " (file-name-directory file))
	(call-interactively 'comint-send-input))
      )
    )


(defun logshell ()
  (interactive)
  (when (null (cdr (window-list)))
    (split-window-vertically))
    (other-window 1)
    (cshell-buffer "log-shell")
    (when file
      (end-of-buffer)
      (when (looking-back shell-prompt-pattern)
	(insert "cd " (file-name-directory file))
	(call-interactively 'comint-send-input))
      )
    )
(defun eshell/c ()
   "04Dec2001 - sailor, to clear the eshell buffer."
     (interactive)
	   (let ((inhibit-read-only t))
		    (erase-buffer)))


;;; eshell: restore arrows(up/down) to their orginal functions
(add-hook 'eshell-mode-hook
	  (lambda ()
	    (define-key eshell-mode-map [(control up)] 'eshell-previous-matching-input-from-input)
	    (define-key eshell-mode-map [(control down)] 'eshell-next-matching-input-from-input)
	    (define-key eshell-mode-map [up] 'previous-line)
	    (define-key eshell-mode-map [down] 'next-line)))

;; change eshell prompt
(defun yami-adjust-eshell-prompt (path)
(let* ( (path-components (split-string path "/"))
(len (length path-components))
(max-comp 3) )
(if (<= len max-comp)
(if (string-equal path (getenv "HOME")) "~" path)
(concat "<<" (mapconcat (lambda (str) str)
(nthcdr (- len max-comp) path-components)
"/")))))

(setq eshell-prompt-function
(lambda ()
(concat (yami-adjust-eshell-prompt (eshell/pwd))
(if (= (user-uid) 0) " # " " $ "))))

(setq special-display-function 'lutts-display-special-buffer)
(setq special-display-regexps
      '("^\\*Completions\\*$"
	"^\\*Help\\*$"
	"^\\*grep\\*$"
	"^\\*Apropos\\*$"
	"^\\*elisp macroexpansion\\*$"
	"^\\*local variables\\*$"
	"^\\*Compile-Log\\*$"
	"^\\*Quail Completions\\*$"
	"^\\*Occur\\*$"
	"^\\*frequencies\\*$"
	"^\\*compilation\\*$"
	"^\\*Locate\\*$"
	"^\\*Colors\\*$"
	"^\\*tumme-display-image\\*$"
	"^\\*SLIME Description\\*$"
	"^\\*.* output\\*$"           ; tex compilation buffer
	"^\\*TeX Help\\*$"
	"^\\*Shell Command Output\\*$"
	"^\\*Async Shell Command\\*$"
	"^\\*buffer-selection\\*$"	; C-x C-b
	"^\\*cscope\\*$"
	"^\\*xgtags\\*$"
	"^\\*GTAGS.*"
	"^\\*Backtrace\\*$"
	"^\\*scratch\\*"
	))

(defun lutts-display-special-buffer (buf &optional data)
  "put the special buffers in the right spot (bottom rigt)"
  (message "speical buffer")
  (split-window-tile-2)
  (let ((target-window (window-at (- (frame-width) 5) (- (frame-height) 5)))
	(pop-up-windows t))
    (set-window-buffer target-window buf)
    target-window)
 )

(defun fix-window-horizontal-size (width)
  "Set the window's size to 80 (or prefix arg WIDTH) columns wide."
  (interactive "P")
  (enlarge-window (- (or width 80) (window-width)) 'horizontal))

(defun fix-window-vertical-size (height)
  "Set the height's size to 30 (or prefix arg WIDTH) columns wide."
  (interactive "P")
  (enlarge-window (- (or height 33) (window-height))))

(defun split-window-tile-2()
  "Splite window into 2 sub-window"
  (interactive)
  (if (= 1 (length (window-list)))
      (progn (split-window-vertically)
	     (other-window 1)
	     (fix-window-vertical-size 10)
	     )
    )
  )

(defun split-window-tile-3()
  "Splite window into 3 sub-window"
  (interactive)
  (if (= 1 (length (window-list)))
      (progn (split-window-horizontally)
	     (other-window 1)
	     (linum-mode 0)
	     (split-window-vertically)
	     (fix-window-vertical-size 25)
	     (fix-window-horizontal-size 59)
	     (other-window 2)
	     )
    )
  )

(global-set-key [S-f6] 'split-window-tile-3)
(global-set-key [C-f6] 'rename-buffer)

;; Search previour/next issued command
;; automatically delete trailing whitespace when save buffer
(defun progmodes-hooks ()
  "Hooks for programming modes"
  (add-hook 'before-save-hook 'progmodes-write-hooks))

(defun progmodes-write-hooks ()
  "Hooks which run on file write for programming modes"
  (prog1 nil
    (delete-trailing-whitespace)))

(add-hook 'c-mode-common-hook 'progmodes-hooks)

;; Mouse operation
(global-set-key [mouse-3] 'mouse-buffer-menu)


;; Common MSWIN like keys
(global-set-key "\C-o" 'find-file)
(global-set-key "\C-s" 'save-buffer)
(global-set-key "\C-p" 'pwd)
(global-set-key [C-backspace] 'backward-kill-word)
(global-set-key [C-delete] 'kill-word)
(global-set-key "\C-d" 'kill-whole-line)
(defun kill-whole-line ()
  "Kill the whole line the cursor located"
  (interactive)
  (beginning-of-line nil)
  (kill-line nil)
  (kill-line nil))

(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(require 'highlight-symbol)
(global-set-key [(control f4)] 'highlight-symbol-at-point)
(global-set-key [f4] 'highlight-symbol-next)
(global-set-key [(shift f4)] 'highlight-symbol-prev)
(global-set-key [(meta f4)] 'highlight-symbol-prev)

(defun eshell/e (file)
      (find-file file))
(defun eshell/ee (file)
  (find-file-other-window file))

(defun eshell/ca ()
  (kill-some-buffers))

(defun transpose-buffers (arg)
  "Transpose the buffers shown in two windows."
  (interactive "p")
  (let ((selector (if (>= arg 0) 'next-window 'previous-window)))
    (while (/= arg 0)
      (let ((this-win (window-buffer))
            (next-win (window-buffer (funcall selector))))
        (set-window-buffer (selected-window) next-win)
        (set-window-buffer (funcall selector) this-win)
        (select-window (funcall selector)))
      (setq arg (if (plusp arg) (1- arg) (1+ arg))))))
(global-set-key (kbd "M-9") 'transpose-buffers)
(setq auto-save-hook nil)
(setq x-select-enable-clipboard t)
(defun kill-other-buffers ()
  "Kill all buffers but the current one.
Don't mess with special buffers."
  (interactive)
  (dolist (buffer (buffer-list))
    (unless (or (eql buffer (current-buffer)) (not (buffer-file-name buffer)))
      (kill-buffer buffer))))
(global-set-key (kbd "C-c k") 'kill-other-buffers)

(defun android-build-mode()
  "For android 4.1 build."
  (interactive)
  (let ((path (concat (android-find-build-tree-root) "prebuilts/gcc/linux-x86/mips/mipsel-linux-android-4.7/bin")))
    (message "%s" path)
    (when (not (file-exists-p path))
      (error (format "%s does not exist." path)))
    (if (> (length path) 2)
	(setenv "PATH" (concat path ":" (getenv "PATH")))
      (error "Not in a valid android tree"))
    (setenv "CROSS_COMPILE" "mipsel-linux-android-")))

(global-set-key (kbd "C-SPC") nil)
(global-set-key (kbd "C-x C-c") nil)

