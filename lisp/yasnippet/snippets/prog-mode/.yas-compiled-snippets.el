;;; Compiled snippets and support files for `prog-mode'
;;; contents of the .yas-setup.el support file:
;;;
(defun yas-with-comment (str)
  (format "%s%s%s" comment-start str comment-end))
;;; Snippet definitions:
;;;
(yas-define-snippets 'prog-mode
		     '(("fi" "`(yas-with-comment \"FIXME: \")`" "fixme"
			(not
			 (eq major-mode 'sh-mode))
			nil nil nil nil nil)
		       ("t" "`(yas-with-comment \"TODO: \")`" "todo" nil nil nil nil nil nil)
		       ("x" "`(yas-with-comment \"XXX: \")`" "xxx" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Thu Jan  7 22:29:06 2016
