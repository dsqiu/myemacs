;;; Compiled snippets and support files for `cc-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'cc-mode
		     '(("case" "`(indent-region (- (point) 20) (+ (point) 20) nil)`case ${2:constexpr}:${3: \\{}\n    $0\n    break;\n${3:$(if (string-match \"\\{\" yas-text) \"\\}\" \"\")}" "case : {...}" nil nil nil nil nil nil)
		       ("do" "do\n{\n    $0\n} while (${1:condition});" "do { ... } while (...)" nil nil nil nil nil nil)
		       ("else" "else${1: {\n    $0\n}}" "else { ... }" nil nil nil nil nil nil)
		       ("fopen" "FILE *${fp} = fopen(${\"file\"}, \"${r}\");" "FILE *fp = fopen(..., ...);" nil nil nil nil nil nil)
		       ("for" "for (${1:i = 0}; ${2:i < N}; ${3:i++}) {\n    $0\n}\n" "for" nil nil nil nil nil nil)
		       ("forn" "for (${1:auto }${2:i} = ${3:0}; $2 < ${4:MAXIMUM}; ++$2) {\n    $0\n}\n" "for_n" nil nil nil nil nil nil)
		       ("if" "if (${1:condition}) ${2:{\n    $0\n}}" "if (...) { ... }" nil nil nil nil nil nil)
		       ("ifdef" "#ifdef ${1:MACRO}\n\n$0\n\n#endif // $1" "ifdef" nil nil nil nil nil nil)
		       ("inc" "#include <$1>" "#include <...>" nil nil nil nil nil nil)
		       ("inc" "#include \"$1\"" "#include \"...\"" nil nil nil nil nil nil)
		       ("main" "int main(${1:int argc, char *argv[]})\n{\n    $0\n    return 0;\n}\n" "main" nil nil nil nil nil nil)
		       ("math" "#include <math.h>\n$0" "math" nil nil nil nil nil nil)
		       ("once" "#ifndef ${1:`(upcase (file-name-nondirectory (file-name-sans-extension (buffer-file-name))))`_H}\n#define $1\n\n$0\n\n#endif /* $1 */" "#ifndef XXX; #define XXX; #endif" nil nil nil nil nil nil)
		       ("printf" "printf(\"${1:%s}\\\\n\"${1:$(if (string-match \"%\" yas-text) \", \" \"\\);\")\n}$2${1:$(if (string-match \"%\" yas-text) \"\\);\" \"\")}" "printf" nil nil nil nil nil nil)
		       ("struct" "struct ${1:name}\n{\n    $0\n};" "struct ... { ... }" nil nil nil nil nil nil)
		       ("switch" "switch (${1:expr}) {\ncase ${2:constexpr}:${3: \\{}\n    $0\n    break;\n${3:$(if (string-match \"\\{\" yas-text) \"\\}\\n\" \"\")}default:\n    break;\n}" "switch (...) { case : ... default: ...}" nil nil nil nil nil nil)
		       ("?" "(${1:cond}) ? ${2:then} : ${3:else};" "ternary" nil nil nil nil nil nil)
		       ("typedef" "typedef ${1:type} ${2:alias};" "typedef" nil nil nil nil nil nil)
		       ("while" "while (${1:condition}) {\n      $0\n}" "while" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Thu Jan  7 22:29:03 2016
