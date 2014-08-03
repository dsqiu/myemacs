;; buffer switching
(iswitchb-mode 1)

(require 'bs)
(global-set-key (kbd "C-x C-b") 'bs-show)

;; provide S-up S-down S-left S-right
(windmove-default-keybindings)

;; redo/undo window layout
(setq winner-dont-bind-my-keys t)
(winner-mode t)
(global-set-key (kbd "C-x \/") 'winner-undo)
(global-set-key (kbd "C-x \\") 'winner-redo)

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
	))

(defun lutts-display-special-buffer (buf &optional data)
  "put the special buffers in the right spot (bottom rigt)"
  (message "speical buffer")
  (let ((target-window (window-at (- (frame-width) 5) (- (frame-height) 5)))
	(pop-up-windows t))
    (set-window-buffer target-window buf)
    target-window))

;; current X resolution
;(x-display-pixel-width)
;(x-display-pixel-height)
;; or
;(display-pixel-width)
;(display-pixel-height)

;; current frame dimension
;(frame-width)
;(frame-height)


(defun fix-window-horizontal-size (width)
  "Set the window's size to 80 (or prefix arg WIDTH) columns wide."
  (interactive "P")
  (enlarge-window (- (or width 80) (window-width)) 'horizontal))

(defun fix-window-vertical-size (height)
  "Set the height's size to 30 (or prefix arg WIDTH) columns wide."
  (interactive "P")
  (enlarge-window (- (or height 33) (window-height))))

;; buffer layout
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                 ;;
;;             window layout related               ;;
;;                                                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;  +-----------------------+----------------------+
;  |                       |                      |
;  |                       |                      |
;  |                       |                      |
;  +-----------------------+----------------------+
;  |                       |                      |
;  |                       |                      |
;  |                       |                      |
;  +-----------------------+----------------------+

(defun split-window-4()
  "Splite window into 4 sub-window"
  (interactive)
  (if (= 1 (length (window-list)))
      (progn (split-window-vertically)
	     (split-window-horizontally)
	     (other-window 2)
	     (split-window-horizontally)
	     )
    )
  )


(defun split-window-hor-3()
  "Splite window into 3 sub-window"
  (interactive)
  (if (= 1 (length (window-list)))
      (progn (split-window-horizontally)
	     ;(fix-window-horizontal-size (/ (display-pixel-width) 4))
	     (fix-window-horizontal-size 50)
	     (other-window 1)
	     (split-window-horizontally)
	     (other-window 1)
	     ;(fix-window-horizontal-size (/ (display-pixel-width) 4))
	     (fix-window-horizontal-size 50)
	     (other-window 2)
	     )
    )
  )


;;  +--------- +---------------+
;;  |          |               |
;;  |          |               |
;;  |          |---------------|
;;  |          |               |
;;  |          |               |
;;  +--------- +---------------+

(defun split-window-tile-3()
  "Splite window into 3 sub-window"
  (interactive)
  (if (= 1 (length (window-list)))
      (progn (split-window-horizontally)
	     (other-window 1)
	     (split-window-vertically)
	     (fix-window-vertical-size 33)
	     (fix-window-horizontal-size 90)
	     (other-window 2)
	     )
    )
  )

(global-set-key (kbd "<C-f9>")   'split-window-tile-3)

(defun lutts-switch-ab ()
  "Rolling 3 window buffers clockwise"
  (interactive)
  (select-window (get-largest-window))
  (if (= 3 (length (window-list)))
      (let ((winList (window-list)))
	(let ((1stWin (car winList))
	      (2ndWin (window-at (- (frame-width) 5) 5)))
	  (let ((1stBuf (window-buffer 1stWin))
		(2ndBuf (window-buffer 2ndWin))
		)
	    (select-window 2ndWin)
	    (setq 2ndLine (line-number-at-pos))
	    (select-window 1stWin)
	    (setq 1stLine (line-number-at-pos))
	    (set-window-buffer 1stWin 2ndBuf)
	    (goto-line 2ndLine)
	    (set-window-buffer 2ndWin 1stBuf)
	    (select-window 2ndWin)
	    (goto-line 1stLine)
	    (select-window (get-largest-window))
	    )
	  )
	)
    )
  )

(global-set-key (kbd "<f9>") 'lutts-switch-ab)

(defun lutts-goto-largest-window ()
  "goto the largest window"
  (interactive)
  (select-window (get-largest-window)))

(global-set-key (kbd "C-c e") 'lutts-goto-largest-window)


;  +----------------------+                 +----------- +-----------+
;  |                      |           \     |            |           |
;  |                      |   +-------+\    |            |           |
;  +----------------------+   +-------+/    |            |           |
;  |                      |           /     |            |           |
;  |                      |                 |            |           |
;  +----------------------+                 +----------- +-----------+

(defun split-v ()
  (interactive)
  (if (= 2 (length (window-list)))
      (let (( thisBuf (window-buffer))
	    ( nextBuf (progn (other-window 1) (buffer-name))))
	(progn   (delete-other-windows)
		 (split-window-horizontally)
		 (set-window-buffer nil thisBuf)
		 (set-window-buffer (next-window) nextBuf)
		 ))
    )
  )


;  +----------- +-----------+                  +----------------------+
;  |            |           |            \     |                      |
;  |            |           |    +-------+\    |                      |
;  |            |           |    +-------+/    +----------------------+
;  |            |           |            /     |                      |
;  |            |           |                  |                      |
;  +----------- +-----------+                  +----------------------+

(defun split-h ()
  (interactive)
  (if (= 2 (length (window-list)))
      (let (( thisBuf (window-buffer))
	    ( nextBuf (progn (other-window 1) (buffer-name))))
	(progn   (delete-other-windows)
		 (split-window-vertically)
		 (set-window-buffer nil thisBuf)
		 (set-window-buffer (next-window) nextBuf)
		 ))
    )
  )


;  +----------------------+                 +----------- +-----------+
;  |                      |           \     |            |           |
;  |                      |   +-------+\    |            |           |
;  +----------------------+   +-------+/    |            |-----------|
;  |          |           |           /     |            |           |
;  |          |           |                 |            |           |
;  +----------------------+                 +----------- +-----------+


(defun split-v-3 ()
  "Change 3 window style from horizontal to vertical"
  (interactive)
  (select-window (get-largest-window))
  (if (= 3 (length (window-list)))
      (let ((winList (window-list)))
	(let ((1stBuf (window-buffer (car winList)))
	      (2ndBuf (window-buffer (car (cdr winList))))
	      (3rdBuf (window-buffer (car (cdr (cdr winList))))))
	  (message "%s %s %s" 1stBuf 2ndBuf 3rdBuf)
	  (delete-other-windows)
	  (split-window-horizontally)
	  (set-window-buffer nil 1stBuf)
	  (other-window 1)
	  (set-window-buffer nil 2ndBuf)
	  (split-window-vertically)
	  (set-window-buffer (next-window) 3rdBuf)
	  (select-window (get-largest-window))
	  )
	)
    )
  )


;  +----------- +-----------+                  +----------------------+
;  |            |           |            \     |                      |
;  |            |           |    +-------+\    |                      |
;  |            |-----------|    +-------+/    +----------------------+
;  |            |           |            /     |           |          |
;  |            |           |                  |           |          |
;  +----------- +-----------+                  +----------------------+


(defun split-h-3 ()
  "Change 3 window style from vertical to horizontal"
  (interactive)
  (select-window (get-largest-window))
  (if (= 3 (length (window-list)))
      (let ((winList (window-list)))
	(let ((1stBuf (window-buffer (car winList)))
	      (2ndBuf (window-buffer (car (cdr winList))))
	      (3rdBuf (window-buffer (car (cdr (cdr winList))))))
	  (message "%s %s %s" 1stBuf 2ndBuf 3rdBuf)
	  (delete-other-windows)
	  (split-window-vertically)
	  (set-window-buffer nil 1stBuf)
	  (other-window 1)
	  (set-window-buffer nil 2ndBuf)
	  (split-window-horizontally)
	  (set-window-buffer (next-window) 3rdBuf)
	  (select-window (get-largest-window))
	  )
	)
    )
  )

;;  +----------- +-----------+                    +----------- +-----------+
;;  |            |     C     |            \       |            |     A     |
;;  |            |           |    +-------+\      |            |           |
;;  |     A      |-----------|    +-------+/      |     B      |-----------|
;;  |            |     B     |            /       |            |     C     |
;;  |            |           |                    |            |           |
;;  +----------- +-----------+                    +----------- +-----------+
;;
;;  +------------------------+                     +------------------------+
;;  |           A            |           \         |           B            |
;;  |                        |   +-------+\        |                        |
;;  +------------------------+   +-------+/        +------------------------+
;;  |     B     |     C      |           /         |     C     |     A      |
;;  |           |            |                     |           |            |
;;  +------------------------+                     +------------------------+


(defun roll-v-3 ()
  "Rolling 3 window buffers clockwise"
  (interactive)
  (select-window (get-largest-window))
  (if (= 3 (length (window-list)))
      (let ((winList (window-list)))
	(let ((1stWin (car winList))
	      (2ndWin (car (cdr winList)))
	      (3rdWin (car (cdr (cdr winList)))))
	  (let ((1stBuf (window-buffer 1stWin))
		(2ndBuf (window-buffer 2ndWin))
		(3rdBuf (window-buffer 3rdWin))
		)
	    (set-window-buffer 1stWin 3rdBuf)
	    (set-window-buffer 2ndWin 1stBuf)
	    (set-window-buffer 3rdWin 2ndBuf)
	    )
	  )
	)
    )
  )


;;  +----------------------+                +---------- +----------+
;;  |                      |          \     |           |          |
;;  |                      |  +-------+\    |           |          |
;;  +----------------------+  +-------+/    |           |          |
;;  |                      |          /     |           |          |
;;  |                      |                |           |          |
;;  +----------------------+                +---------- +----------+
;;
;;  +--------- +-----------+                +----------------------+
;;  |          |           |          \     |                      |
;;  |          |           |  +-------+\    |                      |
;;  |          |           |  +-------+/    +----------------------+
;;  |          |           |          /     |                      |
;;  |          |           |                |                      |
;;  +--------- +-----------+                +----------------------+

(defun change-split-type ()
  "Changes splitting from vertical to horizontal and vice-versa"
  (interactive)
  (if (= 2 (length (window-list)))
      (let ((thisBuf (window-buffer))
            (nextBuf (progn (other-window 1) (buffer-name)))
            (split-type (if (window-full-width-p)
                            'split-window-horizontally
			  'split-window-vertically)))
        (progn
          (delete-other-windows)
	  (funcall split-type)
          (set-window-buffer nil thisBuf)
          (set-window-buffer (next-window) nextBuf)))))


;;  +----------------------+                 +----------- +-----------+
;;  |                      |           \     |            |           |
;;  |                      |   +-------+\    |            |           |
;;  +----------------------+   +-------+/    |            |-----------|
;;  |          |           |           /     |            |           |
;;  |          |           |                 |            |           |
;;  +----------------------+                 +----------- +-----------+

;;  +----------- +-----------+                  +----------------------+
;;  |            |           |            \     |                      |
;;  |            |           |    +-------+\    |                      |
;;  |            |-----------|    +-------+/    +----------------------+
;;  |            |           |            /     |           |          |
;;  |            |           |                  |           |          |
;;  +----------- +-----------+                  +----------------------+

(defun change-split-type-3 ()
  "Change 3 window style from horizontal to vertical and vice-versa"
  (interactive)
  (select-window (get-largest-window))
  (if (= 3 (length (window-list)))
      (let ((winList (window-list)))
	(let ((1stBuf (window-buffer (car winList)))
	      (2ndBuf (window-buffer (car (cdr winList))))
	      (3rdBuf (window-buffer (car (cdr (cdr winList)))))
	      (split-3
	       (lambda(1stBuf 2ndBuf 3rdBuf split-1 split-2)
		 "change 3 window from horizontal to vertical and vice-versa"
		 (message "%s %s %s" 1stBuf 2ndBuf 3rdBuf)
		 (delete-other-windows)
		 (funcall split-1)
		 (set-window-buffer nil 1stBuf)
		 (other-window 1)
		 (set-window-buffer nil 2ndBuf)
		 (funcall split-2)
		 (set-window-buffer (next-window) 3rdBuf)
		 (select-window (get-largest-window))
		 ))
	      (split-type-1 nil)
	      (split-type-2 nil)
	      )
	  (if (window-full-width-p)
	      (setq split-type-1 'split-window-horizontally split-type-2 'split-window-vertically)
	    (setq split-type-1 'split-window-vertically  split-type-2 'split-window-horizontally))
	  (funcall split-3 1stBuf 2ndBuf 3rdBuf split-type-1 split-type-2)

	  ))))

;; 'change-split-type-2’ and ‘change-split-type-3’ can be further merged into one function that automatically
;; detects split type and changes vertical to horizontal or vice-versa, like this:
(defun change-split-type ()
  "Changes splitting from vertical to horizontal and vice-versa"
  (interactive)
  (if (= 2 (length (window-list)))
      (change-split-type-2)
    (change-split-type-3)
    ))
