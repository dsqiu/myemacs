;;; compilation-onewin.el --- whole-frame window for compile buffer

;; Copyright 2009, 2010 Kevin Ryde

;; Author: Kevin Ryde <user42@zip.com.au>
;; Version: 3
;; Keywords: tools
;; EmacsWiki: CompilationMode
;; URL: http://user42.tuxfamily.org/compilation-onewin/index.html

;; compilation-onewin.el is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as published
;; by the Free Software Foundation; either version 3, or (at your option)
;; any later version.
;;
;; compilation-onewin.el is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
;; Public License for more details.
;;
;; You can get a copy of the GNU General Public License online at
;; <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; This is a few lines to show the *compilation* buffer in one window,
;; ie. make the frame one window, based on whether you last looked at it
;; that way as opposed to a split window.  See the `compilation-onewin-mode'
;; docstring below for more.

;;; Emacsen:

;; Designed for Emacs 21 and up.  Works in XEmacs 21.
;; Doesn't work in Emacs 20 (needs make-hash-table and define-minor-mode).

;;; Install:

;; Put compilation-onewin.el in one of your `load-path' directories, and get
;; the M-x compilation-onewin-mode command with the following in your
;; .emacs,
;;
;;     (autoload 'compilation-onewin-mode "compilation-onewin-mode" nil t)
;;
;; There's an autoload cookie for this if you're smart enough to use
;; `update-file-autoloads' and friends.

;;; History:

;; Version 1 - the first version
;; Version 2 - fix local variable lossage
;;           - cleanup advice on unload
;; Version 3 - carry onewin state across clone-buffer

;;; Code:

;; explicit dependency on advice.el so it's not unloaded before
;; `compilation-onewin-unload-function' runs, as that func needs the
;; `ad-find-advice' macro if running uncompiled
;;
(require 'advice)

(defvar compilation-onewin-buffer-hash
  (make-hash-table :test 'eq
                   :size 11
                   :weakness 'key)
  "Hash table of buffers to display in whole-frame window.
This is an implementation detail of `compilation-onewin-mode'.

The keys are buffers to apply \"onewin\" for compilation, held
\"weak\" so the table is cleaned automatically if a buffer is
killed.  This is basically a per-buffer tagging, but it's not
done with a buffer local variable because that would be lost by
each `compilation-mode' setup doing `kill-all-local-variables'.")

(defvar compilation-onewin-in-start nil
  "Let-bound to non-nil while `compilation-start' is executing.
This is an internal part of `compilation-onewin-mode'.")

(defun compilation-onewin-configuration-change ()
  "Notice compilation buffers in a one-window frame, or not.
This is an internal part of `compilation-onewin-mode'.

If there's just one window in the selected frame, apart from the
minibuffer window, and it's in `compilation-mode', then tag it
for \"onewin\".  If there's more than one window in the frame
untag \"onewin\" from them."

  ;; not `window-list' not in emacs20
  ;; default of count-windows and walk-windows is selected frame

  (unless compilation-onewin-in-start
    (let ((count (count-windows 'not-minibuffer)))
      (walk-windows
       (lambda (window)
         (with-current-buffer (window-buffer window)
           (if (and (eq major-mode 'compilation-mode)
                    (= 1 count))
               (puthash (current-buffer) t compilation-onewin-buffer-hash)
             (remhash (current-buffer) compilation-onewin-buffer-hash))))
       'not-minibuffer))))

(add-hook 'window-configuration-change-hook
          'compilation-onewin-configuration-change)

;; not in xemacs21, but that's ok
(defadvice clone-buffer (around compilation-onewin activate)
  "Carry onewin state to the new buffer."
  ;; Interactively the `pop-to-buffer' in clone-buffer will split the window
  ;; turning off onewin in both old and new, but try to do the right thing
  ;; for any non-popping programmatic or scripted use.
  ;;
  ;; This is done as defadvice rather than an entry in `clone-buffer-hook'
  ;; since the latter doesn't seem to give easy access to the original
  ;; buffer.
  (let ((compilation-onewin--oldbuf (current-buffer)))
    ad-do-it
    (and (boundp 'compilation-onewin-buffer-hash) ;; if unloaded in emacs21
         (gethash compilation-onewin--oldbuf compilation-onewin-buffer-hash)
         (puthash ad-return-value t compilation-onewin-buffer-hash))))

;; emacs22 up has `compilation-start'
(defadvice compilation-start (around compilation-onewin activate)
  "Display compilation buffer with a one-window frame, perhaps."
  (let ((compilation-onewin-in-start t))
    ad-do-it)
  ;; ad-return-value is the newly started compilation buffer
  (and compilation-onewin-mode ;; the mode globally
       (gethash ad-return-value compilation-onewin-buffer-hash)
       (delete-other-windows (get-buffer-window ad-return-value))))

;; emacs21,xemacs21 has `compile-internal'
;; emacs22,23 has a version of it which calls to `compile-start'
(defadvice compile-internal (around compilation-onewin activate)
  "Display compilation buffer with a one-window frame, perhaps."
  (let ((compilation-onewin-in-start t))
    ad-do-it)
  ;; ad-return-value is the newly started compilation buffer
  (and (boundp 'compilation-onewin-mode) ;; in case unloaded in emacs21
       compilation-onewin-mode ;; the mode globally
       (gethash ad-return-value compilation-onewin-buffer-hash)
       (delete-other-windows (get-buffer-window ad-return-value))))

;;;###autoload
(define-minor-mode compilation-onewin-mode
  "Show compilation buffer in one window if last used that way.
If you last looked at the *compilation* buffer in a one-window
frame then the next `compile' shows it that way, instead of the
usual split window that `compilation-start' sets up.

This is handy if you sometimes want it split and sometimes want
just one window.  The first `compile' will split as usual, but if
you `delete-window' or similar to see it in a one-window frame
then that's remembered as what's desired for the next `compile'.

The desired form is remembered separately for each
`compilation-mode' buffer, so if you have a few by renaming etc
then a recompile follows how the particular one was last
displayed.

Killing the *compilation* buffer kills its \"onewin\" state too
and a new *compilation* buffer for a new `compile' begins split
again.  Killing the buffer is an easy way to go back to split
style.

The compilation-onewin.el home page is
URL `http://user42.tuxfamily.org/compilation-onewin/index.html'"

  :group  'compilation
  :global t
  :type   'boolean
  :link   '(url-link
            :tag "compilation-onewin.el home page"
            "http://user42.tuxfamily.org/compilation-onewin/index.html"))

;; `-unload-function' only runs in emacs22 up, so must defang the defadvice
;; for when the rest of the package has been unloaded in emacs21 and
;; xemacs21.  Removing the advice is good as a cleanup though.
;;
(defun compilation-onewin-unload-function ()
  "Remove advice on `compilation-start'.
This is called by `unload-feature'."
  (dolist (func '(clone-buffer compilation-start compile-internal))
    (when (ad-find-advice func 'around 'compilation-onewin)
      (ad-remove-advice   func 'around 'compilation-onewin)
      (ad-activate        func)))
  ;; return nil to do normal unload-feature actions too, including remove
  ;; the `window-configuration-change-hook' setting above
  nil)

;;-----------------------------------------------------------------------------
;; xemacs workarounds

;; XEmacs 21.4.22 doesn't have `window-configuration-change-hook'.  Notice
;; changes instead by hooking onto functions which might change sizes or
;; create new windows.  Not sure if this is everything, but user-level
;; window creation goes through `split-window' at least.
;;
(when (eval-when-compile (featurep 'xemacs))
  ;; `fboundp' to defang the advices if rest of this file is unloaded.  In
  ;; xemacs 21.4.22 `unload-feature' doesn't run an -unload-hook or
  ;; -unload-function so advice will be left behind.
  (defadvice split-window (after compilation-onewin activate)
    "Notice window configuration change for `compilation-onewin-mode'."
    (if (fboundp 'compilation-onewin-configuration-change)
        (compilation-onewin-configuration-change)))
  (defadvice set-window-configuration (after compilation-onewin activate)
    "Notice window configuration change for `compilation-onewin-mode'."
    (if (fboundp 'compilation-onewin-configuration-change)
        (compilation-onewin-configuration-change))))

;; LocalWords: minibuffer onewin untag

(provide 'compilation-onewin)

;;; compilation-onewin.el ends here
