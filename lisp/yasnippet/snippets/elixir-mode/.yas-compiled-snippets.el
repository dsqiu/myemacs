;;; Compiled snippets and support files for `elixir-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'elixir-mode
		     '(("case" "case $1 do\n  $0\nend\n" "case" nil nil nil nil nil nil)
		       ("cond" "cond do\n  $0\nend\n" "cond" nil nil nil nil nil nil)
		       ("def" "def ${1:method}${2:(${3:args})} do\n  $0\nend\n" "def" nil nil nil nil nil nil)
		       ("defmacro" "defmacro $1 do\n	$0\nend\n" "defmacro" nil nil nil nil nil nil)
		       ("defmacrop" "defmacrop $1 do\n	$0\nend\n" "defmacrop" nil nil nil nil nil nil)
		       ("defmodule" "defmodule $1 do\n	$0\nend\n" "defmodule" nil nil nil nil nil nil)
		       ("defp" "defp $1 do\n	$0\nend\n" "defp" nil nil nil nil nil nil)
		       ("doc" "@doc \"\"\"\n$0\n\"\"\"\n" "doc" nil nil nil nil nil nil)
		       ("mdoc" "@moduledoc \"\"\"\n$0\n\"\"\"\n" "moduledoc" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Thu Jan  7 22:29:04 2016
