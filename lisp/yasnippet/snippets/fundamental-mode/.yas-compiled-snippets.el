;;; Compiled snippets and support files for `fundamental-mode'
;;; .yas-setup.el support file if any:
;;;
(defun ca-all-asscs (asslist query)
  "returns a list of all corresponding values (like rassoc)"
  (cond
   ((null asslist) nil)
   (t
    (if (equal (cdr (car asslist)) query)
        (cons (car (car asslist)) (ca-all-asscs (cdr asslist) query))
      (ca-all-asscs (cdr asslist) query)))))
;;; Do not edit! File generated at Tue Oct 21 19:11:21 2014
