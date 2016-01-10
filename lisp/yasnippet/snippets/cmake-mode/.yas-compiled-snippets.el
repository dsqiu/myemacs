;;; Compiled snippets and support files for `cmake-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'cmake-mode
		     '(("exe" "add_executable($1 ${2:main.cpp})\ntarget_link_libraries($1 $3)" "add_executable" nil nil nil nil nil nil)
		       ("lib" "add_library($1 ${2:class.cpp})\ntarget_link_libraries($1 $3)" "add_library" nil nil nil nil nil nil)
		       ("min" "cmake_minimum_required(VERSION ${1:2.6})" "cmake_minimum_required" nil nil nil nil nil nil)
		       ("for" "foreach(${1:item} \\${${2:array}})\n        $0\nendforeach()" "foreach" nil nil nil nil nil nil)
		       ("fun" "function (${1:name})\n         $0\nendfunction()" "function" nil nil nil nil nil nil)
		       ("if" "if(${1:cond})\n   $0\nendif()" "if" nil nil nil nil nil nil)
		       ("if" "if(${1:cond})\n        $2\nelse(${3:cond})\n        $0\nendif()" "ifelse" nil nil nil nil nil nil)
		       ("inc"
			(progninclude
			 ($0))
			"include" nil nil nil nil nil nil)
		       ("macro" "macro(${1:name}${2: args})\n\nendmacro()" "macro" nil nil nil nil nil nil)
		       ("msg" "message(${1:STATUS }\"$0\")" "message" nil nil nil nil nil nil)
		       ("opt" "option (${1:OPT} \"${2:docstring}\" ${3:value})" "option" nil nil nil nil nil nil)
		       ("proj" "project ($0)" "project" nil nil nil nil nil nil)
		       ("set" "set(${1:var} ${2:value})" "set" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Thu Jan  7 22:29:04 2016
