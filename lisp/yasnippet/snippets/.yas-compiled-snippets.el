;;; Compiled snippets and support files for `snippets'
;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("rename_add_contr.py" "#!/usr/bin/env python\nimport os\nimport re\nfrom os.path import join\nfrom shutil import move\n\n\ndef rename(root, f):\n    if f.endswith('.yasnippet'):\n        base, _ = f.split('.')\n        print(\"move %s to %s\" % (join(root, f), join(root, base)))\n        move(join(root, f), join(root, base))\n\n\nCONT = \"# contributor: Andrea crotti\\n# --\"\nEND = \"# --\\n\\n\"\n\norig = \"# --\\n\\n\"\nto  = \"# --\\n\"\n\ndef insert(root, f, orig, to):\n    fname = join(root, f)\n    text = open(fname).read()\n    nex_text = re.sub(orig, to, text)\n    open(fname, 'w').write(nex_text)\n\nif __name__ == '__main__':\n    for root, dirs, files in os.walk('.'):\n        if \"mode\" in root:\n            # os.popen(\"git add *yasnippet\")\n            for f in files:\n                rename(root, f)\n                # insert(root, f, orig, to)\n\n\n            \n" "rename_add_contr.py" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("proj" "<project name=\"${1:test}\" default=\"${2:compile}\" basedir=\"${3:.}\">\n\n$0\n</project>" "project" nil nil nil nil nil nil)
		       ("prop" "<property name=\"${1:name}\" value=\"${2:value}\" />\n$0" "property" nil nil nil nil nil nil)
		       ("target" "<target name=\"${1:compile}\" ${2:other}>\n        $0\n</target>" "target" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("ass" "assert($0);" "assert" nil nil nil nil nil nil)
		       ("beginend" "${1:v}.begin(), $1.end" "v.begin(), v.end()" nil nil nil nil nil nil)
		       ("req" "BOOST_REQUIRE( ${1:condition} );\n$0" "boost_require" nil
			("boost")
			nil nil nil nil)
		       ("err" "cerr << $0;\n" "cerr" nil nil nil nil nil nil)
		       ("cin" "cin >> $0;" "cin" nil nil nil nil nil nil)
		       ("cls" "class ${1:Name}\n{\npublic:\n    ${1:$(yas/substr yas-text \"[^: ]*\")}();\n    ${2:virtual ~${1:$(yas/substr yas-text \"[^: ]*\")}();}\n};\n$0" "class" nil nil nil nil nil nil)
		       ("c[" "const ${1:Type}& operator[](${2:int index}) const\n{\n        $0\n}" "const_[]" nil nil nil nil nil nil)
		       ("ct" "${1:Class}::$1(${2:args}) ${3: : ${4:init}}\n{\n        $0\n}" "constructor" nil nil nil nil nil nil)
		       ("cout" "`(progn (save-excursion) (goto-char (point-min)) (unless (re-search-forward\n\"^using\\\\s-+namespace std;\" nil 'no-errer) \"std::\"))\n`cout << $0${1: << '${2:\\n}'};" "cout" nil nil nil nil nil nil)
		       ("cpp" "#include \"`(file-name-nondirectory (file-name-sans-extension (buffer-file-name)))`.h\"" "cpp" nil nil nil nil nil nil)
		       ("cstd" "#include <cstdlib>" "cstd" nil nil nil nil nil nil)
		       ("d+=" "${1:MyClass}& operator+=(${2:const $1 &});" "d+=" nil nil nil nil nil nil)
		       ("<<" "friend std::ostream& operator<<(std::ostream&, const ${1:Class}&);" "d_operator<<" nil nil nil nil nil nil)
		       ("[" "${1:Type}& operator[](${2:int index});" "d_operator[]" nil nil nil nil nil nil)
		       ("c[" "const ${1:Type}& operator[](${2:int index}) const;" "d_operator[]_const" nil nil nil nil nil nil)
		       (">>" "friend std::istream& operator>>(std::istream&, const ${1:Class}&);" "d_operator>>" nil nil nil nil nil nil)
		       ("<<" "friend std::ostream& operator<<(std::ostream&, const ${1:Class}&);" "d_operator<<" nil nil nil nil nil nil)
		       ("dl" "delete ${1:pointer};" "delete" nil nil nil nil nil nil)
		       ("dla" "delete[] ${1:arr};" "delete[]" nil nil nil nil nil nil)
		       ("doc" "/**\n * $0\n */" "doc" nil nil nil nil nil nil)
		       ("cast" "check_and_cast<${1:Type} *>(${2:msg});" "dynamic_casting" nil nil nil nil nil nil)
		       ("enum" "enum ${1:NAME}{\n$0\n};" "enum" nil nil nil nil nil nil)
		       ("fixt" "BOOST_FIXTURE_TEST_SUITE( ${1:name}, ${2:Fixture} )\n\n$0\n\nBOOST_AUTO_TEST_SUITE_END()" "fixture" nil nil nil nil nil nil)
		       ("fori" "for (${1:auto }${2:it} = ${3:var}.begin(); $2 != $3.end(); ++$2) {\n    $0\n}" "fori" nil nil nil nil nil nil)
		       ("fr" "friend $0;" "friend" nil nil nil nil nil nil)
		       ("f" "${1:type} ${2:name}(${3:args})${4: const};" "fun_declaration" nil nil nil nil nil nil)
		       ("f" "${1:type} ${2:Class}::${3:name}(${4:args})${5: const}\n{\n        $0\n}" "function" nil nil nil nil nil nil)
		       ("gtest" "#include <gtest/gtest.h>" "gtest" nil
			("testing")
			nil nil nil nil)
		       ("ignore" "${1:std::}cin.ignore(std::numeric_limits<std::streamsize>::max(), '\\n');" "ignore" nil nil nil nil nil nil)
		       ("il" "inline $0" "inline" nil nil nil nil nil nil)
		       ("io" "#include <iostream>" "io" nil nil nil nil nil nil)
		       ("iter" "${1:std::}${2:vector<int>}::iterator ${3:iter};\n" "iterator" nil nil nil nil nil nil)
		       ("map" "std::map<${1:type1}$0> ${2:var};" "map" nil nil nil nil nil nil)
		       ("mod" "class ${1:Class} : public cSimpleModule\n{\n   $0\n}" "module" nil nil nil nil nil nil)
		       ("ns" "namespace ${1:Namespace} {\n\n          `yas/selected-text`\n\n}  // $1" "namespace" nil nil nil nil nil nil)
		       ("ns" "namespace " "namespace ..." nil nil nil nil nil nil)
		       ("!=" "bool ${1:MyClass}::operator!=(const $1 &other) const\n{\n    return !(*this == other);\n}" "operator!=" nil
			("operator overloading")
			nil nil nil nil)
		       ("+" "${1:MyClass} $1::operator+(const $1 &other)\n{\n    $1 result = *this;\n    result += other;\n    return result;\n}" "operator+" nil
			("operator overloading")
			nil nil nil nil)
		       ("+=" "${1:MyClass}& $1::operator+=(${2:const $1 &rhs})\n{\n  $0\n  return *this;\n}" "operator+=" nil
			("operator overloading")
			nil nil nil nil)
		       ("=" "${1:MyClass}& $1::operator=(const $1 &rhs)\n{\n    // Check for self-assignment!\n    if (this == &rhs)\n      return *this;\n    $0\n    return *this;\n}" "operator=" nil
			("operator overloading")
			nil nil nil nil)
		       ("==" "bool ${1:MyClass}::operator==(const $1 &other) const\n{\n     $0\n}" "operator==" nil
			("operator overloading")
			nil nil nil nil)
		       ("[]" "${1:Type}& operator[](${2:int index})\n{\n        $0\n}" "operator[]" nil
			("operator overloading")
			nil nil nil nil)
		       (">>" "std::istream& operator>>(std::istream& is, const ${1:Class}& ${2:c})\n{\n         $0\n	 return is;\n}" "operator>>" nil
			("operator overloading")
			nil nil nil nil)
		       ("<<" "std::ostream& operator<<(std::ostream& os, const ${1:Class}& ${2:c})\n{\n         $0\n         return os;\n}" "operator<<" nil
			("operator overloading")
			nil nil nil nil)
		       ("os" "#include <ostream>" "ostream" nil nil nil nil nil nil)
		       ("pack" "void cNetCommBuffer::pack(${1:type})\n{\n\n}\n\n$0" "pack" nil nil nil nil nil nil)
		       ("pr" "private:\n        $0" "private" nil nil nil nil nil nil)
		       ("pt" "protected:\n        $0" "protected" nil nil nil nil nil nil)
		       ("pb" "public:\n        $0" "public" nil nil nil nil nil nil)
		       ("ss" "#include <sstream>" "<sstream>" nil nil nil nil nil nil)
		       ("std" "using namespace std;" "std" nil nil nil nil nil nil)
		       ("st" "std::$0" "std::" nil nil nil nil nil nil)
		       ("str" "#include <string>" "str" nil nil nil nil nil nil)
		       ("temp" "template<${1:$$(yas/choose-value '(\"typename\" \"class\"))} ${2:T}>\n$0" "template" nil nil nil nil nil nil)
		       ("tc" "BOOST_AUTO_TEST_CASE( ${1:test_case} )\n{\n        $0\n}" "test case" nil
			("testing")
			nil nil nil nil)
		       ("test_main" "int main(int argc, char **argv)\n{\n      ::testing::InitGoogleTest(&argc, argv);\n       return RUN_ALL_TESTS();\n}" "test_main" nil
			("testing")
			nil nil nil nil)
		       ("ts" "BOOST_AUTO_TEST_SUITE( ${1:test_suite1} )\n\n$0\n\nBOOST_AUTO_TEST_SUITE_END()" "test_suite" nil
			("testing")
			nil nil nil nil)
		       ("th" "this" "this" nil nil nil nil nil nil)
		       ("throw" "throw ${1:MyError}($0);" "throw" nil nil nil nil nil nil)
		       ("try" "try {\n    $0\n} catch (${1:type}) {\n\n}\n" "try" nil nil nil nil nil nil)
		       ("tryw" "try {\n    `(or yas/selected-text (car kill-ring))`\n} catch ${1:Exception} {\n\n}\n" "tryw" nil nil nil nil nil nil)
		       ("using" "using namespace ${std};\n$0" "using namespace ... " nil nil nil nil nil nil)
		       ("vec" "std::vector<${1:Class}> ${2:var}${3:(${4:10}, $1($5))};" "vector" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("ass" "#include <assert.h>\n$0" "assert" nil nil nil nil nil nil)
		       ("compile" "// -*- compile-command: \"${1:gcc -Wall -o ${2:dest} ${3:file}}\" -*-" "compile" nil nil nil nil nil nil)
		       ("d" "#define $0" "define" nil nil nil nil nil nil)
		       ("fopen" "FILE *${fp} = fopen(${\"file\"}, \"${r}\");" "FILE *fp = fopen(..., ...);" nil nil nil nil nil nil)
		       ("malloc" "malloc(sizeof($1)${2: * ${3:3}});\n$0" "malloc" nil nil nil nil nil nil)
		       ("packed" "__attribute__((__packed__))$0" "packed" nil nil nil nil nil nil)
		       ("pr" "printf(\"${1:format string}\"${2: ,a0,a1});" "printf" nil nil nil nil nil nil)
		       ("io" "#include <stdio.h>" "stdio" nil nil nil nil nil nil)
		       ("std" "#include <stdlib.h>\n" "stdlib" nil nil nil nil nil nil)
		       ("str" "#include <string.h>" "string" nil nil nil nil nil nil)
		       ("union" "typedef union {\n        $0\n} ${1:name};" "union" nil nil nil nil nil nil)
		       ("uni" "#include <unistd.h>" "unistd" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
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


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("action" "action: ${0:nothing}" "action" nil nil nil nil nil nil)
		       ("bash" "bash \"${1:install something}\" do\n  user \"${2:root}\"\n  cwd \"${3:/tmp}\"\n  creates \"${4:maybe}\"\n  code <<-EOH\n    STATUS=0\n    $0 || STATUS=1\n    exit $STATUS\n  EOH\nend" "bash" nil nil nil nil nil nil)
		       ("cookbook_file" "cookbook_file \"${1:/tmp/file}\" do\n  owner \"${2:root}\"\n  group \"${3:root}\"\n  mode \"${4:0644}\"\n  source \"${5:my-filename}\"\nend" "cookbook_file" nil nil nil nil nil nil)
		       ("cron" "cron \"${1:name}\" do\n  hour \"${2:5}\"\n  minute \"${3:0}\"\n\n  command \"${4:/bin/true}\"\nend" "cron" nil nil nil nil nil nil)
		       ("cronf" "cron \"${1:name}\" do\n  hour \"${2:*}\"\n  minute \"${3:*}\"\n  day \"${4:*}\"\n  weekday \"${6:*}\"\n  command \"${7:/bin/true}\"\n  user \"${8:root}\"\n  mailto \"${9:root@example.com}\"\n  path \"${10:/bin:/usr/bin}\"\n  home \"${11:/tmp}\"\n  shell \"${12:/bin/bash}\"\nend\n" "cronf" nil nil nil nil nil nil)
		       ("deploy" "deploy \"/my/deploy/dir\" do\n  repo \"git@github.com/whoami/provideroject\"\n  revision \"abc123\" # or \"HEAD\" or \"TAG_for_1.0\" or (subversion) 	\"1234\"\n  user \"deploy_ninja\"\n  enable_submodules true\n  migrate true\n  migration_command \"rake db:migrate\"\n  environment \"RAILS_ENV\" => \"production\", \"OTHER_ENV\" => \"foo\"\n  shallow_clone true\n  action :deploy # or :rollback\n  restart_command \"touch tmp/restart.txt\"\n  git_ssh_wrapper \"wrap-ssh4git.sh\"\n  scm_provider Chef::Provider::Git # is the default, for svn: Chefhef::Provider::Subversion\nend\n" "deploy" nil nil nil nil nil nil)
		       ("directory" "directory \"${1:name}\" do\n  owner \"root\"\n  group \"root\"\n  mode \"0755\"\n\n  action :create\nend\n" "directory" nil nil nil nil nil nil)
		       ("directoryf" "directory \"${1:name}\" do\n  owner \"$create{2:root}\"\n  group \"${3:root}\"\n  mode \"${4:0755}\"\n  path \"${5:name}\"\n  recursive ${6:false}\n\n  action :${7:create}\nend\n" "directoryf" nil nil nil nil nil nil)
		       ("env" "env \"${1:RAILS_ENV}\" do\n  value \"${2:production}\"\nend" "env" nil nil nil nil nil nil)
		       ("execute" "execute \"${1:name}\" do\n  command \"${2:ls -la}\"\n  creates \"${3:/tmp/something}\"\n\n  action :${4:run}\nend" "execute" nil nil nil nil nil nil)
		       ("executef" "execute \"${1:name}\" do\n  command \"${2:ls -la}\"\n  creates \"$ls{3:/tmp/something}\"\n  cwd \"${4:/tmp}\"\n  environment ({${5:'HOME' => '/home/myhome'}})\n  user \"${6:root}\"\n  group \"${7:root}\"\n  path \"${8:['/opt/bin','/opt/sbin']}\"\n  timeout ${9:3600}\n  returns ${10:0}\n  umask \"${11:022}umask\"\n\n  action :${12:run}\nend" "executef" nil nil nil nil nil nil)
		       ("file" "file \"${1:name}\" do\n  owner \"root\"\n  group \"root\"\n  mode \"0644\"\n\n  action :create\nend" "file" nil nil nil nil nil nil)
		       ("filef" "file \"${1:name}\" do\n  path \"${3:path}\"\n  backup ${4:5}\n  owner \"${5:root}\"\n  group \"${6:root}\"\n  mode \"${7:0644}\"\n  content \"${8:content here}\"\n\n  action :${2:create}\nend" "filef" nil nil nil nil nil nil)
		       ("git" "git \"${1:/home/user/deployment}\" do\n  repository \"${2:git@github.com:gitsite/deploymentployment.git}\"\n  reference \"${3:master}\"\n  user \"${4:user}\"\n  group \"${5:templateest}\"\n  action :sync\nend" "git" nil nil nil nil nil nil)
		       ("group" "group \"${1:name}\" do\n  gid ${2:999}\n  members [${3:'paco','vicente'}]\n\n  action :create\nend" "group" nil nil nil nil nil nil)
		       ("http_request" "http_request \"${1:some message}\" do\n  url \"${2:http://example.com/check_in}\"\nend" "http_request" nil nil nil nil nil nil)
		       ("http_requestp" "http_request \"${1:posting data}\" do\n  action :post\n  url 		\"${2:http://example.com/check_in}\"\n  message ${3::some => \"data\"}\n  headers (${4:\\{\"AUTHORIZATION\" => authorization\\}})\nend" "http_requestp" nil nil nil nil nil nil)
		       ("ignore_failure" "ignore_failure ${0:true}" "ignore_failure" nil nil nil nil nil nil)
		       ("inc" "include_recipe \"${1:example::recipe}\"" "inc" nil nil nil nil nil nil)
		       ("link" "link \"${1:/tmp/passwd}\" do\n  to \"${2:/etc/passwd}\"\nend" "link" nil nil nil nil nil nil)
		       ("linkf" "link \"${1:/tmp/passwd}\" do\n  to \"${2:/etc/passwd}\"\n  link_type :${3:symbolic}\n  owner \"${4:root}\"\n  group \"${5:root}\"\nend" "linkf" nil nil nil nil nil nil)
		       ("log" "log (\"${1:your string to log}\") { level :${2:debug} }" "log" nil nil nil nil nil nil)
		       ("machine" "machine \"${1:name}\" do\n  role '${2:web}'\n  recipe '${3:web}'\n  chef_environment '${4:_default}'\n  converge true\nend\n" "machine" nil nil nil nil nil nil)
		       ("meta" "maintainer       \"${1:YOUR_COMPANY_NAME}\"\nmaintainer_email \"${2:YOUR_EMAIL}\"\nlicense          \"${3:All rights reserved}\"\ndescription      \"${4:Installs/Configures example}\"\nlong_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))\nversion          \"${5:0.0.1}\"" "meta" nil nil nil nil nil nil)
		       ("not_if" "not_if \"${1}\"" "not_if" nil nil nil nil nil nil)
		       ("notifies" "notifies :${1:restart}, \"${2:service}[${3:name}]\"" "notifies" nil nil nil nil nil nil)
		       ("only_if" "only_if \"${1}\"" "only_if" nil nil nil nil nil nil)
		       ("pac" "package \"${1:name}\" do\n  action :${2:install}\n  version \"${3:1.0-1}\"\nend" "pac" nil nil nil nil nil nil)
		       ("pak" "package \"${1:name}\" do\n  action :${2:install}\n  version \"${3:1.0-1}\"\nend" "pak" nil nil nil nil nil nil)
		       ("provider" "provider Chef::Provider::${0:Package::Rubygems}" "provider" nil nil nil nil nil nil)
		       ("python" "python \"${1:install something}\" do\n  user \"${2:root}\"\n  cwd \"${3:/tmp}\"\n  code <<-EOH\n    $0\n  EOH\nend" "python" nil nil nil nil nil nil)
		       ("remote_file" "remote_file \"${1:/tmp/remote_file}\" do\n  owner \"${2:root}\"\n  group \"${3:root}\"\n  mode \"${4:0644}\"\n  source \"${5:http://www.example.com/remote_file}\"\n  checksum \"${6:sha256checksum}\"\nend" "remote_file" nil nil nil nil nil nil)
		       ("retries" "retries ${1:1}\nretry_delay ${2:2}" "retries" nil nil nil nil nil nil)
		       ("role" "name \"${1:role name}\"\n  description \"${2:Description for the role}\"\n  env_run_lists \"${3:role name}\" => [\n  ]\n  run_list \"\"\n  default_attributes(\n  ${4::attribute => \"example\"}\n  )\n" "role" nil nil nil nil nil nil)
		       ("ruby" "ruby_block \"${1:reload client config}\" do\n  block do\n    ${0:Chef::Config.from_file(\"/Chefetc/chef/client.rb\")}\n  end\nend" "ruby" nil nil nil nil nil nil)
		       ("script" "script \"${1:do something}\" do\n  interpreter \"bash\"\n  user \"${2:root}\"\n  cwd \"${3:/tmp}\"\n  creates \"${4:maybe}\"\n  code <<-EOH\n    STATUS=0\n    $0 || STATUS=1\n    exit $STATUS\n    EOH\nend\n" "script" nil nil nil nil nil nil)
		       ("service" "service \"${1:name}\" do\n  supports :status => ${2:true}, :restart => ${3:true}, :truereload => ${4:true}\n  action ${5:[ :enable, :start ]}\nend" "service" nil nil nil nil nil nil)
		       ("servicep" "service \"${1:name}\" do\n  pattern \"${2:pattern}\"\n  supports :status => ${3:true}, :restart => ${4:true}, :reload => ${5:true}\n  action ${6:[ :enable, :start ]}\nend" "servicep" nil nil nil nil nil nil)
		       ("subscribes" "subscribes :${1:restart}, \"${2:template}[${3:name}]\"" "subscribes" nil nil nil nil nil nil)
		       ("supports" "supports :status => :${1:true}, :restart => :${2:true}, :reload => :${3:true}" "supports" nil nil nil nil nil nil)
		       ("template" "template \"${1:name}\" do\n  source \"${2:source}.erb\"\n  owner \"root\"\n  group \"root\"\n  mode \"0644\"\nend\n" "template" nil nil nil nil nil nil)
		       ("templatev" "template \"${1:name}\" do\n  source \"${2:source}.erb\"\n  owner \"root\"\n  group \"root\"\n  node \"0644\"\n  variables( ${3::config_var => node[:configs][:config_var]} 	)\nend\n" "templatev" nil nil nil nil nil nil)
		       ("user" "user \"${1:random}\" do\n  action :create\n  comment \"${2:Random User}\"\n  uid ${3:1000}\n  gid \"${4:users}\"\n  home \"${5:/home/random}\"\n  shell \"${6:/bin/zsh}\"\n  password \"${7:\\$1\\$JJsvHslV\\$szsCjVEroftprNn4JHtDi.}\"\n  supports :manage_home =>manage_home true \nend\n" "user" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("bench" "(dotimes [_ 5 ]$>\n  (time (dotimes [i 1000000]$>\n  $0$>\n  )))$>" "bench" nil nil nil nil nil nil)
		       ("bp" "(swank.core/break)\n" "bp" nil nil nil nil nil nil)
		       ("def" "(def $0)\n" "def" nil nil nil nil nil nil)
		       ("defm" "(defmacro $1\n  \"$2\"$>\n  [$3]$>\n  $0)$>\n" "defmacro" nil nil nil nil nil nil)
		       ("defn" "(defn $1\n  \"$2\"$>\n  [$3]$>\n  $0)$>\n" "defn" nil nil nil nil nil nil)
		       ("defr" "(defrecord\n  ^{\"$1\"}$>\n  $2$>\n  [$3]$>\n  $0)$>\n" "defrecord" nil nil nil nil nil nil)
		       ("deft" "(deftype\n  ^{\"$1\"}$>\n  $2$>\n  [$3]$>\n  $0)$>" "deftype" nil nil nil nil nil nil)
		       ("doseq" "(doseq [$1 $2]\n  $3)$>\n$0" "doseq" nil nil nil nil nil nil)
		       ("fn" "(fn [$1]\n  $0)$>\n" "fn" nil nil nil nil nil nil)
		       ("for" "(for [$1 $2]\n  $3)$>\n" "for" nil nil nil nil nil nil)
		       ("if" "(if $1\n  $2$>\n  $3)$>\n$0\n" "if" nil nil nil nil nil nil)
		       ("ifl" "(if-let [$1 $2]\n  $3)$>\n$0" "ifl" nil nil nil nil nil nil)
		       ("import" "(:import ($1))$>" "import" nil nil nil nil nil nil)
		       ("is" "(is (= $1 $2))\n" "is" nil nil nil nil nil nil)
		       ("let" "(let [$1 $2]$>\n  $3)$>\n$0\n" "let" nil nil nil nil nil nil)
		       ("map" "(map $1 $2)" "map" nil nil nil nil nil nil)
		       ("map" "(map #($1) $2)$>" "map lambda" nil nil nil nil nil nil)
		       ("mdoc" "^{:doc \"$1\"}" "mdoc" nil nil nil nil nil nil)
		       ("ns" "(ns `(flet ((try-src-prefix\n	  (path src-pfx)\n	  (let ((parts (split-string path src-pfx)))\n	    (if (= 2 (length parts))\n		(second parts)\n	      nil))))\n    (let* ((p (buffer-file-name))\n           (p2 (first\n		(remove-if-not '(lambda (x) x)\n			       (mapcar\n				'(lambda (pfx)\n				   (try-src-prefix p pfx))\n				'(\"/src/cljs/\" \"/src/clj/\" \"/src/\")))))\n	   (p3 (file-name-sans-extension p2))\n	   (p4 (mapconcat '(lambda (x) x)\n		 (split-string p3 \"/\")\n		 \".\")))\n      (replace-regexp-in-string \"_\" \"-\" p4)))`)" "ns" nil nil nil nil nil nil)
		       ("opts" "{:keys [$1]$>\n :or {$2}$>\n :as $3}$>" "opts" nil nil nil nil nil nil)
		       ("pr" "(prn $1)\n$0" "pr" nil nil nil nil nil nil)
		       ("print" "(println $1)\n$0" "print" nil nil nil nil nil nil)
		       ("reduce" "(reduce ${1:(fn [p n] $0)} $2)\n" "reduce" nil nil nil nil nil nil)
		       ("require" "(:require [$1 :as $2])$>" "require" nil nil nil nil nil nil)
		       ("test" "(deftest $1\n  (is (= $2))$>\n  $0)$>\n" "test" nil nil nil nil nil nil)
		       ("try" "(try\n$1$>\n(catch ${2:Exception} e$>\n$3$>))$>" "try" nil nil nil nil nil nil)
		       ("use" "(:use [$1 :refer [$2]])$>" "use" nil nil nil nil nil nil)
		       ("when" "(when $1\n      $2)$>\n$0$>\n" "when" nil nil nil nil nil nil)
		       ("whenl" "(when-let [$1 $2]\n  $3)$>\n  $0$>" "whenl" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("bench" "(dotimes [_ 5 ]$>\n  (time (dotimes [i 1000000]$>\n  $0$>\n  )))$>" "bench" nil nil nil nil nil nil)
		       ("bp" "(swank.core/break)\n" "bp" nil nil nil nil nil nil)
		       ("def" "(def $0)\n" "def" nil nil nil nil nil nil)
		       ("defm" "(defmacro $1\n  \"$2\"$>\n  [$3]$>\n  $0)$>\n" "defmacro" nil nil nil nil nil nil)
		       ("defn" "(defn $1\n  \"$2\"$>\n  [$3]$>\n  $0)$>\n" "defn" nil nil nil nil nil nil)
		       ("defr" "(defrecord\n  ^{\"$1\"}$>\n  $2$>\n  [$3]$>\n  $0)$>\n" "defrecord" nil nil nil nil nil nil)
		       ("deft" "(deftype\n  ^{\"$1\"}$>\n  $2$>\n  [$3]$>\n  $0)$>" "deftype" nil nil nil nil nil nil)
		       ("doseq" "(doseq [$1 $2]\n  $3)$>\n$0" "doseq" nil nil nil nil nil nil)
		       ("fn" "(fn [$1]\n  $0)$>\n" "fn" nil nil nil nil nil nil)
		       ("for" "(for [$1 $2]\n  $3)$>\n" "for" nil nil nil nil nil nil)
		       ("if" "(if $1\n  $2$>\n  $3)$>\n$0\n" "if" nil nil nil nil nil nil)
		       ("ifl" "(if-let [$1 $2]\n  $3)$>\n$0" "ifl" nil nil nil nil nil nil)
		       ("import" "(:import ($1))$>" "import" nil nil nil nil nil nil)
		       ("is" "(is (= $1 $2))\n" "is" nil nil nil nil nil nil)
		       ("let" "(let [$1 $2]$>\n  $3)$>\n$0\n" "let" nil nil nil nil nil nil)
		       ("map" "(map $1 $2)" "map" nil nil nil nil nil nil)
		       ("map" "(map #($1) $2)$>" "map lambda" nil nil nil nil nil nil)
		       ("mdoc" "^{:doc \"$1\"}" "mdoc" nil nil nil nil nil nil)
		       ("ns" "(ns `(flet ((try-src-prefix\n	  (path src-pfx)\n	  (let ((parts (split-string path src-pfx)))\n	    (if (= 2 (length parts))\n		(second parts)\n	      nil))))\n    (let* ((p (buffer-file-name))\n           (p2 (first\n		(remove-if-not '(lambda (x) x)\n			       (mapcar\n				'(lambda (pfx)\n				   (try-src-prefix p pfx))\n				'(\"/src/cljs/\" \"/src/clj/\" \"/src/\")))))\n	   (p3 (file-name-sans-extension p2))\n	   (p4 (mapconcat '(lambda (x) x)\n		 (split-string p3 \"/\")\n		 \".\")))\n      (replace-regexp-in-string \"_\" \"-\" p4)))`)" "ns" nil nil nil nil nil nil)
		       ("opts" "{:keys [$1]$>\n :or {$2}$>\n :as $3}$>" "opts" nil nil nil nil nil nil)
		       ("pr" "(prn $1)\n$0" "pr" nil nil nil nil nil nil)
		       ("print" "(println $1)\n$0" "print" nil nil nil nil nil nil)
		       ("reduce" "(reduce ${1:(fn [p n] $0)} $2)\n" "reduce" nil nil nil nil nil nil)
		       ("require" "(:require [$1 :as $2])$>" "require" nil nil nil nil nil nil)
		       ("test" "(deftest $1\n  (is (= $2))$>\n  $0)$>\n" "test" nil nil nil nil nil nil)
		       ("try" "(try\n$1$>\n(catch ${2:Exception} e$>\n$3$>))$>" "try" nil nil nil nil nil nil)
		       ("use" "(:use [$1 :refer [$2]])$>" "use" nil nil nil nil nil nil)
		       ("when" "(when $1\n      $2)$>\n$0$>\n" "when" nil nil nil nil nil nil)
		       ("whenl" "(when-let [$1 $2]\n  $3)$>\n  $0$>" "whenl" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
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


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("sec" "Section \"${1:Device}\"\n        $0\nEndSection" "section" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("ev" "EV << \"${1:string}\"$0;" "EV" nil nil nil nil nil nil)
		       ("emit" "emit(${1:signal_id}, ${2:long});" "emit_signal" nil nil nil nil nil nil)
		       ("intuni" "intuniform(${1:0}, ${2:1})" "intuniform" nil nil nil nil nil nil)
		       ("math" "#include <cmath>" "math" nil nil nil nil nil nil)
		       ("nan" "isnan(${1:x})" "nan" nil nil nil nil nil nil)
		       ("omnet" "#include <omnetpp.h>" "omnet" nil nil nil nil nil nil)
		       ("par" "${1:var} = par(\"${2:par}\");" "parameter_omnetpp" nil nil nil nil nil nil)
		       ("sched" "scheduleAt(simTime()+${1:1.0}, ${2:event});" "scheduleAt" nil nil nil nil nil nil)
		       ("uni" "uniform(${1:0}, ${2:1})" "uniform" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("attrib" "/// <summary>\n/// $3\n/// </summary>\nprivate $1 $2;" "private attribute ....;" nil nil nil nil nil nil)
		       ("attrib" "/// <summary>\n/// $3\n/// </summary>\nprivate $1 $2;\n\n/// <summary>\n/// $4\n/// </summary>\n/// <value>$5</value>\npublic $1 $2\n{\n    get {\n        return this.$2;\n    }\n    set {\n        this.$2 = value;\n    }\n}" "private attribute ....; public property ... ... { ... }" nil nil nil nil nil nil)
		       ("attrib" "/// <summary>\n/// $3\n/// </summary>\nprivate $1 ${2:$(if (> (length yas-text) 0) (format \"_%s%s\" (downcase (substring yas-text 0 1)) (substring yas-text 1 (length yas-text))) \"\")};\n\n/// <summary>\n/// ${3:Description}\n/// </summary>\n/// <value><c>$1</c></value>\npublic ${1:Type} ${2:Name}\n{\n    get {\n        return this.${2:$(if (> (length yas-text) 0) (format \"_%s%s\" (downcase (substring yas-text 0 1)) (substring yas-text 1 (length yas-text))) \"\")};\n    }\n    set {\n        this.${2:$(if (> (length yas-text) 0) (format \"_%s%s\" (downcase (substring yas-text 0 1)) (substring yas-text 1 (length yas-text))) \"\")} = value;\n    }\n}" "private _attribute ....; public Property ... ... { ... }" nil nil nil nil nil nil)
		       ("class" "${5:public} class ${1:Name}\n{\n    #region Ctor & Destructor\n    /// <summary>\n    /// ${3:Standard Constructor}\n    /// </summary>\n    public $1($2)\n    {\n    }\n\n    /// <summary>\n    /// ${4:Default Destructor}\n    /// </summary>    \n    public ~$1()\n    {\n    }\n    #endregion\n}" "class ... { ... }" nil nil nil nil nil nil)
		       ("comment" "/// <summary>\n/// $1\n/// </summary>" "/// <summary> ... </summary>" nil nil nil nil nil nil)
		       ("comment" "/// <param name=\"$1\">$2</param>" "/// <param name=\"...\"> ... </param>" nil nil nil nil nil nil)
		       ("comment" "/// <returns>$1</returns>" "/// <param name=\"...\"> ... </param>" nil nil nil nil nil nil)
		       ("comment" "/// <exception cref=\"$1\">$2</exception>" "/// <exception cref=\"...\"> ... </exception>" nil nil nil nil nil nil)
		       ("method" "/// <summary>\n/// ${5:Description}\n/// </summary>${2:$(if (string= (upcase yas-text) \"VOID\") \"\" (format \"%s%s%s\" \"\\n/// <returns><c>\" yas-text \"</c></returns>\"))}\n${1:public} ${2:void} ${3:MethodName}($4)\n{\n$0\n}" "public void Method { ... }" nil nil nil nil nil nil)
		       ("namespace" "namespace $1\n{\n$0\n}" "namespace .. { ... }" nil nil nil nil nil nil)
		       ("prop" "/// <summary>\n/// $5\n/// </summary>\n/// <value>$6</value>\n$1 $2 $3\n{\n    get {\n        return this.$4;\n    }\n    set {\n        this.$4 = value;\n    }\n}" "property ... ... { ... }" nil nil nil nil nil nil)
		       ("region" "#region $1\n$0\n#endregion" "#region ... #endregion" nil nil nil nil nil nil)
		       ("using" "using $1;" "using ...;" nil nil nil nil nil nil)
		       ("using" "using System;" "using System;" nil nil nil nil nil nil)
		       ("using" "using System.$1;" "using System....;" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("bg" "background-color: #${1:DDD};" "background-color: ..." nil nil nil nil nil nil)
		       ("bg.1" "background-image: url($1);" "background-image: ..." nil nil nil nil nil nil)
		       ("bor" "border: ${1:1px} ${2:solid} #${3:999};" "border size style color" nil nil nil nil nil nil)
		       ("cl" "clear: $1;\n" "clear: ..." nil nil nil nil nil nil)
		       ("disp.block" "display: block;\n" "display: block" nil nil nil nil nil nil)
		       ("disp.inline" "display: inline;\n" "display: inline" nil nil nil nil nil nil)
		       ("disp.none" "display: none;\n" "display: none" nil nil nil nil nil nil)
		       ("ff" "font-family: $1;\n" "font-family: ..." nil nil nil nil nil nil)
		       ("fs" "font-size: ${12px};\n" "font-size: ..." nil nil nil nil nil nil)
		       ("mar.bottom" "margin-bottom: $1;\n" "margin-bottom: ..." nil nil nil nil nil nil)
		       ("mar.left" "margin-left: $1;\n" "margin-left: ..." nil nil nil nil nil nil)
		       ("mar.mar" "margin: $1;\n" "margin: ..." nil nil nil nil nil nil)
		       ("mar.margin" "margin: ${top} ${right} ${bottom} ${left};\n" "margin top right bottom left" nil nil nil nil nil nil)
		       ("mar.right" "margin-right: $1;\n" "margin-right: ..." nil nil nil nil nil nil)
		       ("mar.top" "margin-top: $1;\n" "margin-top: ..." nil nil nil nil nil nil)
		       ("pad.bottom" "padding-bottom: $1;\n" "padding-bottom: ..." nil nil nil nil nil nil)
		       ("pad.left" "padding-left: $1;\n" "padding-left: ..." nil nil nil nil nil nil)
		       ("pad.pad" "padding: $1;\n" "padding: ..." nil nil nil nil nil nil)
		       ("pad.padding" "padding: ${top} ${right} ${bottom} ${left};\n" "padding: top right bottom left" nil nil nil nil nil nil)
		       ("pad.right" "padding-right: $1;\n" "padding-right: ..." nil nil nil nil nil nil)
		       ("pad.top" "padding-top: $1;\n" "padding-top: ..." nil nil nil nil nil nil)
		       ("-v" "$1: $2;\n-webkit-$1: $2;\n-moz-$1: $2;\n-ms-$1: $2;\n-o-$1: $2;" "-vendor-prefix" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("case" "case $1 do\n  $0\nend\n" "case" nil nil nil nil nil nil)
		       ("cond" "cond do\n  $0\nend\n" "cond" nil nil nil nil nil nil)
		       ("def" "def ${1:method}${2:(${3:args})} do\n  $0\nend\n" "def" nil nil nil nil nil nil)
		       ("defmacro" "defmacro $1 do\n	$0\nend\n" "defmacro" nil nil nil nil nil nil)
		       ("defmacrop" "defmacrop $1 do\n	$0\nend\n" "defmacrop" nil nil nil nil nil nil)
		       ("defmodule" "defmodule $1 do\n	$0\nend\n" "defmodule" nil nil nil nil nil nil)
		       ("defp" "defp $1 do\n	$0\nend\n" "defp" nil nil nil nil nil nil)
		       ("doc" "@doc \"\"\"\n$0\n\"\"\"\n" "doc" nil nil nil nil nil nil)
		       ("mdoc" "@moduledoc \"\"\"\n$0\n\"\"\"\n" "moduledoc" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("ah" "(add-hook HOOK$0 FUNCTION)" "add-hook" nil nil nil nil nil nil)
		       ("a" "(and $0)" "and" nil nil nil nil nil nil)
		       ("append" "(append $0 )" "append" nil nil nil nil nil nil)
		       ("apply" "(apply $0 )" "apply" nil nil nil nil nil nil)
		       ("aref" "(aref ARRAY$0 INDEX)" "aref" nil nil nil nil nil nil)
		       ("aset" "(aset ARRAY$0 IDX NEWELT)" "aset" nil nil nil nil nil nil)
		       ("assq" "(assq KEY$0 LIST)" "assq" nil nil nil nil nil nil)
		       ("autoload" "(autoload 'FUNCNAME$0 \"FILENAME\" &optional \"DOCSTRING\" INTERACTIVE TYPE)" "autoload" nil nil nil nil nil nil)
		       ("bc" "(backward-char $0)" "backward-char" nil nil nil nil nil nil)
		       ("bol" "(beginning-of-line)" "beginning-of-line" nil nil nil nil nil nil)
		       ("botap" "(bounds-of-thing-at-point '$0) ; symbol, list, sexp, defun, filename, url, email, word, sentence, whitespace, line, page ..." "bounds-of-thing-at-point" nil nil nil nil nil nil)
		       ("bfn" "(buffer-file-name)" "buffer-file-name" nil nil nil nil nil nil)
		       ("bmp" "(buffer-modified-p $0)" "buffer-modified-p" nil nil nil nil nil nil)
		       ("bs" "(buffer-substring START$0 END)" "buffer-substring" nil nil nil nil nil nil)
		       ("bsnp" "(buffer-substring-no-properties START$0 END)" "buffer-substring-no-properties" nil nil nil nil nil nil)
		       ("car" "(car $0)" "car" nil nil nil nil nil nil)
		       ("cdr" "(cdr $0)" "cdr" nil nil nil nil nil nil)
		       ("concat" "(concat $0)" "concat" nil nil nil nil nil nil)
		       ("cond" "(cond\n(CONDITION$0 BODY)\n(CONDITION BODY)\n)" "cond" nil nil nil nil nil nil)
		       ("cc" "(condition-case $0 )" "condition-case" nil nil nil nil nil nil)
		       ("cons" "(cons $0)" "cons" nil nil nil nil nil nil)
		       ("consp" "(consp $0 )" "consp" nil nil nil nil nil nil)
		       ("cd" "(copy-directory $0 NEWNAME &optional KEEP-TIME PARENTS)" "copy-directory" nil nil nil nil nil nil)
		       ("cf" "(copy-file FILE$0 NEWNAME &optional OK-IF-ALREADY-EXISTS KEEP-TIME PRESERVE-UID-GID)" "copy-file" nil nil nil nil nil nil)
		       ("cb" "(current-buffer)" "current-buffer" nil nil nil nil nil nil)
		       ("ca" "(custom-autoload$0 SYMBOL LOAD &optional NOSET)" "custom-autoload" nil nil nil nil nil nil)
		       ("defalias" "(defalias 'SYMBOL$0 'DEFINITION &optional DOCSTRING)" "defalias" nil nil nil nil nil nil)
		       ("defcustom" "(defcustom $0 VALUE \"DOC\" &optional ARGS)" "defcustom" nil nil nil nil nil nil)
		       ("dk" "(define-key KEYMAPNAME$0 (kbd \"M-b\") 'FUNCNAME)" "define-key" nil nil nil nil nil nil)
		       ("defsubst" "(defsubst $0 )" "defsubst" nil nil nil nil nil nil)
		       ("def" "(defun ${1:fun} (${2:args})\n  ${3:(interactive${4: \"P\"})}\n  $0)" "defun" nil nil nil nil nil nil)
		       ("defvar" "(defvar $0 &optional ${1:initvalue} \"${2:docstring}\")" "defvar" nil nil nil nil nil nil)
		       ("dc" "(delete-char $0)" "delete-char" nil nil nil nil nil nil)
		       ("dd" "(delete-directory $0 &optional RECURSIVE)" "delete-directory" nil nil nil nil nil nil)
		       ("df" "(delete-file $0)" "delete-file" nil nil nil nil nil nil)
		       ("dr" "(delete-region $0 )" "delete-region" nil nil nil nil nil nil)
		       ("df" "(directory-files $0 &optional FULL MATCH NOSORT)" "directory-files" nil nil nil nil nil nil)
		       ("dired.process_marked" ";; idiom for processing a list of files in dired's marked files\n \n;; suppose myProcessFile is your function that takes a file path\n;; and do some processing on the file\n\n(defun dired-myProcessFile ()\n  \"apply myProcessFile function to marked files in dired.\"\n  (interactive)\n  (require 'dired)\n  (mapc 'myProcessFile (dired-get-marked-files))\n)\n\n;; to use it, type M-x dired-myProcessFile\n" "process marked files in dired" nil nil nil nil nil nil)
		       ("dolist" "(dolist $0 )" "dolist" nil nil nil nil nil nil)
		       ("eol" "(end-of-line)" "end-of-line" nil nil nil nil nil nil)
		       ("eq" "(eq $0)" "eq" nil nil nil nil nil nil)
		       ("equal" "(equal $0)" "equal" nil nil nil nil nil nil)
		       ("error" "(error \"$0\" &optional ARGS)" "error" nil nil nil nil nil nil)
		       ("efn" "(expand-file-name $0 )" "expand-file-name" nil nil nil nil nil nil)
		       ("format" "(format \"$0\" &optional OBJECTS)" "format" nil nil nil nil nil nil)
		       ("fboundp" "(fboundp '$0 )" "fboundp" nil nil nil nil nil nil)
		       ("fnd" "(file-name-directory $0)" "file-name-directory" nil nil nil nil nil nil)
		       ("fne" "(file-name-extension $0 &optional PERIOD)" "file-name-extension" nil nil nil nil nil nil)
		       ("fnn" "(file-name-nondirectory $0 )" "file-name-nondirectory" nil nil nil nil nil nil)
		       ("fnse" "(file-name-sans-extension $0)" "file-name-sans-extension" nil nil nil nil nil nil)
		       ("frn" "(file-relative-name $0 )" "file-relative-name" nil nil nil nil nil nil)
		       ("file.process" "(defun doThisFile (fpath)\n  \"Process the file at path FPATH ...\"\n  (let ()\n    ;; create temp buffer without undo record or font lock. (more efficient)\n    ;; first space in temp buff name is necessary\n    (set-buffer (get-buffer-create \" myTemp\"))\n    (insert-file-contents fpath nil nil nil t)\n\n    ;; process it ...\n    ;; (goto-char 0) ; move to begining of file's content (in case it was open)\n    ;; ... do something here\n    ;; (write-file fpath) ;; write back to the file\n\n    (kill-buffer \" myTemp\")))\n" "a function that process a file" nil nil nil nil nil nil)
		       ("file.read-lines" "(defun read-lines (filePath)\n  \"Return a list of lines in FILEPATH.\"\n  (with-temp-buffer\n    (insert-file-contents filePath)\n    (split-string\n     (buffer-string) \"\\n\" t)) )\n\n;; process all lines\n(mapc \n (lambda (aLine) \n   (message aLine) ; do your stuff here\n   )\n (read-lines \"inputFilePath\")\n)" "read lines of a file" nil nil nil nil nil nil)
		       ("ff" "(find-file $0 )" "find-file" nil nil nil nil nil nil)
		       ("find-replace" "(defun replace-html-chars-region (start end)\n  \"Replace “<” to “&lt;” and other chars in HTML.\nThis works on the current region.\"\n  (interactive \"r\")\n  (save-restriction \n    (narrow-to-region start end)\n    (goto-char (point-min))\n    (while (search-forward \"&\" nil t) (replace-match \"&amp;\" nil t))\n    (goto-char (point-min))\n    (while (search-forward \"<\" nil t) (replace-match \"&lt;\" nil t))\n    (goto-char (point-min))\n    (while (search-forward \">\" nil t) (replace-match \"&gt;\" nil t))\n    )\n  )\n" "find and replace on region" nil nil nil nil nil nil)
		       ("format" "(format \"$0\" &optional OBJECTS)" "format" nil nil nil nil nil nil)
		       ("fc" "(forward-char $0)" "forward-char" nil nil nil nil nil nil)
		       ("fl" "(forward-line $0 )" "forward-line" nil nil nil nil nil nil)
		       ("funcall" "(funcall $0)" "funcall" nil nil nil nil nil nil)
		       ("function" "(function $0 )" "function" nil nil nil nil nil nil)
		       ("get" "(get SYMBOL$0 PROPNAME)" "get" nil nil nil nil nil nil)
		       ("gsk" "(global-set-key (kbd \"C-$0\") 'COMMAND)" "global-set-key" nil nil nil nil nil nil)
		       ("gc" "(goto-char $0)" "goto-char" nil nil nil nil nil nil)
		       ("grabstring" "(setq $0 (buffer-substring-no-properties myStartPos myEndPos))\n" "grab buffer substring" nil nil nil nil nil nil)
		       ("grabthing" "(setq $0 (thing-at-point 'symbol))\n" "grab word under cursor" nil nil nil nil nil nil)
		       ("hash" "make-hash-table ${1:options}" "hash" nil nil nil nil nil nil)
		       ("if" "(if $0)" "if" nil nil nil nil nil nil)
		       ("i" "(insert $0)" "insert" nil nil nil nil nil nil)
		       ("ifc" "(insert-file-contents $0 &optional VISIT BEG END REPLACE)" "insert-file-contents" nil nil nil nil nil nil)
		       ("interactive" "(interactive)" "interactive" nil nil nil nil nil nil)
		       ("kbd" "(kbd \"$0\")" "kbd" nil nil nil nil nil nil)
		       ("kb" "(kill-buffer $0)" "kill-buffer" nil nil nil nil nil nil)
		       ("lambda" "(lambda ($0) \"DOCSTRING\" (interactive) BODY)" "lambda" nil nil nil nil nil nil)
		       ("length" "(length $0)" "length" nil nil nil nil nil nil)
		       ("l" "(let ($1 )\n $0\n)" "let" nil nil nil nil nil nil)
		       ("lbp" "(line-beginning-position)" "line-beginning-position" nil nil nil nil nil nil)
		       ("lep" "(line-end-position)" "line-end-position" nil nil nil nil nil nil)
		       ("list" "(list $0)" "list" nil nil nil nil nil nil)
		       ("la" "(looking-at $0)" "looking-at" nil nil nil nil nil nil)
		       ("md" "(make-directory $0 &optional PARENTS)" "make-directory" nil nil nil nil nil nil)
		       ("mlv" "(make-local-variable $0)" "make-local-variable" nil nil nil nil nil nil)
		       ("mapc" "(mapc '$0 SEQUENCE)" "mapc" nil nil nil nil nil nil)
		       ("mapcar" "(mapcar $0 )" "mapcar" nil nil nil nil nil nil)
		       ("mb" "(match-beginning N$0)" "match-beginning" nil nil nil nil nil nil)
		       ("me" "(match-end N$0)" "match-end" nil nil nil nil nil nil)
		       ("ms" "(match-string $0 )" "match-string" nil nil nil nil nil nil)
		       ("memq" "(memq ELT$0 LIST)" "memq" nil nil nil nil nil nil)
		       ("m" "(message \"FORMATSTRING$0\" &optional ARGS)" "message" nil nil nil nil nil nil)
		       ("minor" "(defvar ${1:mode}-modeline-indicator \" ${2:INDICATOR}\"\n  \"call ($1-install-mode) again if this is changed\")\n\n(defvar $1-mode nil)\n(make-variable-buffer-local '$1-mode)\n(put '$1-mode 'permanent-local t)\n\n(defun $1-mode (&optional arg)\n  \"$0\"\n  (interactive \"P\")\n  (setq $1-mode\n        (if (null arg) (not $1-mode)\n          (> (prefix-numeric-value arg) 0)))\n  (force-mode-line-update))\n\n(provide '$1-mode)" "minor_mode" nil nil nil nil nil nil)
		       ("n" "(not $0 )" "not" nil nil nil nil nil nil)
		       ("nth" "(nth N$0 LIST)" "nth" nil nil nil nil nil nil)
		       ("null" "(null $0)" "null" nil nil nil nil nil nil)
		       ("nts" "(number-to-string $0)" "number-to-string" nil nil nil nil nil nil)
		       ("o" "(or $0 )" "or" nil nil nil nil nil nil)
		       ("p" "(point)" "point" nil nil nil nil nil nil)
		       ("point-max" "(point-max)" "point-max" nil nil nil nil nil nil)
		       ("pm" "(point-min)" "point-min" nil nil nil nil nil nil)
		       ("princ" "(princ $0)" "princ" nil nil nil nil nil nil)
		       ("print" "(print $0)" "print" nil nil nil nil nil nil)
		       ("progn" "(progn $0)" "progn" nil nil nil nil nil nil)
		       ("push" "(push $0 )" "push" nil nil nil nil nil nil)
		       ("put" "(put $0 PROPNAME VALUE)" "put" nil nil nil nil nil nil)
		       ("rsb" "(re-search-backward REGEXP$0 &optional BOUND NOERROR COUNT)" "re-search-backward" nil nil nil nil nil nil)
		       ("rsf" "(re-search-forward REGEXP$0 &optional BOUND NOERROR COUNT)" "re-search-forward" nil nil nil nil nil nil)
		       ("rap" "(region-active-p)" "region-active-p" nil nil nil nil nil nil)
		       ("rb" "(region-beginning)" "region-beginning" nil nil nil nil nil nil)
		       ("re" "(region-end)" "region-end" nil nil nil nil nil nil)
		       ("rf" "(rename-file FILE$0 NEWNAME &optional OK-IF-ALREADY-EXISTS)" "rename-file" nil nil nil nil nil nil)
		       ("repeat" "(repeat $0 )" "repeat" nil nil nil nil nil nil)
		       ("rr" "(replace-regexp REGEXP$0 TO-STRING &optional DELIMITED START END)" "replace-regexp" nil nil nil nil nil nil)
		       ("rris" "(replace-regexp-in-string REGEXP$0 REP STRING &optional FIXEDCASE LITERAL SUBEXP START)" "replace-regexp-in-string" nil nil nil nil nil nil)
		       ("require" "(require $0 )" "require" nil nil nil nil nil nil)
		       ("sb" "(save-buffer $0)" "save-buffer" nil nil nil nil nil nil)
		       ("se" "(save-excursion $0)" "save-excursion" nil nil nil nil nil nil)
		       ("sb" "(search-backward \"$0\" &optional BOUND NOERROR COUNT)" "search-backward" nil nil nil nil nil nil)
		       ("sbr" "(search-backward-regexp \"$0\" &optional BOUND NOERROR COUNT)" "search-backward-regexp" nil nil nil nil nil nil)
		       ("sf" "(search-forward \"$0\" &optional BOUND NOERROR COUNT)" "search-forward" nil nil nil nil nil nil)
		       ("sfr" "(search-forward-regexp \"$0\" &optional BOUND NOERROR COUNT)" "search-forward-regexp" nil nil nil nil nil nil)
		       ("set" "(set $0 )" "set" nil nil nil nil nil nil)
		       ("sb" "(set-buffer $0 )" "set-buffer" nil nil nil nil nil nil)
		       ("sfm" "(set-file-modes $0 MODE)" "set-file-modes" nil nil nil nil nil nil)
		       ("sm" "(set-mark $0)" "set-mark" nil nil nil nil nil nil)
		       ("s" "(setq $0 )" "setq" nil nil nil nil nil nil)
		       ("scb" "(skip-chars-backward \"$0\" &optional LIM)" "skip-chars-backward" nil nil nil nil nil nil)
		       ("scf" "(skip-chars-forward \"$0\" &optional LIM)" "skip-chars-forward" nil nil nil nil nil nil)
		       ("ss" "(split-string $0 &optional SEPARATORS OMIT-NULLS)" "split-string" nil nil nil nil nil nil)
		       ("string" "(string $0 )" "string" nil nil nil nil nil nil)
		       ("sm" "(string-match \"REGEXP$0\" \"STRING\" &optional START)" "string-match" nil nil nil nil nil nil)
		       ("stn" "(string-to-number \"$0\")" "string-to-number" nil nil nil nil nil nil)
		       ("string=" "(string= $0 )" "string=" nil nil nil nil nil nil)
		       ("stringp" "(stringp $0)" "stringp" nil nil nil nil nil nil)
		       ("substring" "(substring STRING$0 FROM &optional TO)" "substring" nil nil nil nil nil nil)
		       ("tap" "(thing-at-point '$0) ; symbol, list, sexp, defun, filename, url, email, word, sentence, whitespace, line, page ..." "thing-at-point" nil nil nil nil nil nil)
		       ("traverse_dir" ";; apply a function to all files in a dir\n(require 'find-lisp)\n(mapc 'my-process-file (find-lisp-find-files \"~/myweb/\" \"\\\\.html$\"))\n" "traversing a directory" nil nil nil nil nil nil)
		       ("unless" "(unless $0)" "unless" nil nil nil nil nil nil)
		       ("v" "(vector $0)" "vector" nil nil nil nil nil nil)
		       ("when" "(when $0)" "when" nil nil nil nil nil nil)
		       ("while" "(while $0)" "while" nil nil nil nil nil nil)
		       ("wg" "(widget-get $0 )" "widget-get" nil nil nil nil nil nil)
		       ("wcb" "(with-current-buffer $0 )" "with-current-buffer" nil nil nil nil nil nil)
		       ("word-or-region" ";; example of a command that works on current word or text selection\n(defun down-case-word-or-region ()\n  \"Lower case the current word or text selection.\"\n(interactive)\n(let (pos1 pos2 meat)\n  (if (and transient-mark-mode mark-active)\n      (setq pos1 (region-beginning)\n            pos2 (region-end))\n    (setq pos1 (car (bounds-of-thing-at-point 'symbol))\n          pos2 (cdr (bounds-of-thing-at-point 'symbol))))\n\n  ; now, pos1 and pos2 are the starting and ending positions\n  ; of the current word, or current text selection if exists\n\n  ;; put your code here.\n  $0\n  ;; Some example of things you might want to do\n  (downcase-region pos1 pos2) ; example of a func that takes region as args\n  (setq meat (buffer-substring-no-properties pos1 pos2)) ; grab the text.\n  (delete-region pos1 pos2) ; get rid of it\n  (insert \"newText\") ; insert your new text\n\n  )\n)\n" "Command that works on region or word" nil nil nil nil nil nil)
		       ("<" "\"\\\\_<${1:word}\\\\_>\"" "word_regexp" nil nil nil nil nil nil)
		       ("x-dired" ";; idiom for processing a list of files in dired's marked files\n \n;; suppose myProcessFile is your function that takes a file path\n;; and do some processing on the file\n\n(defun dired-myProcessFile ()\n  \"apply myProcessFile function to marked files in dired.\"\n  (interactive)\n  (require 'dired)\n  (mapc 'myProcessFile (dired-get-marked-files))\n)\n\n;; to use it, type M-x dired-myProcessFile" "process marked files in dired" nil nil nil nil nil nil)
		       ("x-file" "(defun doThisFile (fpath)\n  \"Process the file at path FPATH ...\"\n  (let ()\n    ;; create temp buffer without undo record or font lock. (more efficient)\n    ;; first space in temp buff name is necessary\n    (set-buffer (get-buffer-create \" myTemp\"))\n    (insert-file-contents fpath nil nil nil t)\n\n    ;; process it ...\n    ;; (goto-char 0) ; move to begining of file's content (in case it was open)\n    ;; ... do something here\n    ;; (write-file fpath) ;; write back to the file\n\n    (kill-buffer \" myTemp\")))" "a function that process a file" nil nil nil nil nil nil)
		       ("x-file" "(defun read-lines (filePath)\n  \"Return a list of lines in FILEPATH.\"\n  (with-temp-buffer\n    (insert-file-contents filePath)\n    (split-string\n     (buffer-string) \"\\n\" t)) )\n\n;; process all lines\n(mapc \n (lambda (aLine) \n   (message aLine) ; do your stuff here\n   )\n (read-lines \"inputFilePath\")\n)" "read lines of a file" nil nil nil nil nil nil)
		       ("x-find-replace" "(defun replace-html-chars-region (start end)\n  \"Replace “<” to “&lt;” and other chars in HTML.\nThis works on the current region.\"\n  (interactive \"r\")\n  (save-restriction \n    (narrow-to-region start end)\n    (goto-char (point-min))\n    (while (search-forward \"&\" nil t) (replace-match \"&amp;\" nil t))\n    (goto-char (point-min))\n    (while (search-forward \"<\" nil t) (replace-match \"&lt;\" nil t))\n    (goto-char (point-min))\n    (while (search-forward \">\" nil t) (replace-match \"&gt;\" nil t))\n    )\n  )" "find and replace on region" nil nil nil nil nil nil)
		       ("x-grabstring" "(setq $0 (buffer-substring-no-properties myStartPos myEndPos))" "grab buffer substring" nil nil nil nil nil nil)
		       ("x-grabthing" "(setq $0 (thing-at-point 'symbol))" "grab word under cursor" nil nil nil nil nil nil)
		       ("x-traverse_dir" ";; apply a function to all files in a dir\n(require 'find-lisp)\n(mapc 'my-process-file (find-lisp-find-files \"~/myweb/\" \"\\\\.html$\"))" "traversing a directory" nil nil nil nil nil nil)
		       ("x-word-or-region" ";; example of a command that works on current word or text selection\n(defun down-case-word-or-region ()\n  \"Lower case the current word or text selection.\"\n(interactive)\n(let (pos1 pos2 meat)\n  (if (and transient-mark-mode mark-active)\n      (setq pos1 (region-beginning)\n            pos2 (region-end))\n    (setq pos1 (car (bounds-of-thing-at-point 'symbol))\n          pos2 (cdr (bounds-of-thing-at-point 'symbol))))\n\n  ; now, pos1 and pos2 are the starting and ending positions\n  ; of the current word, or current text selection if exists\n\n  ;; put your code here.\n  $0\n  ;; Some example of things you might want to do\n  (downcase-region pos1 pos2) ; example of a func that takes region as args\n  (setq meat (buffer-substring-no-properties pos1 pos2)) ; grab the text.\n  (delete-region pos1 pos2) ; get rid of it\n  (insert \"newText\") ; insert your new text\n\n  )\n)" "Command that works on region or word" nil nil nil nil nil nil)
		       ("yonp" "(yes-or-no-p \"PROMPT$0 \")" "y-or-n-p" nil nil nil nil nil nil)
		       ("yes-or-no-p" "(yes-or-no-p \"PROMPT$0 \")" "yes-or-no-p" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("#" "# => " "# =>" nil
			("general")
			nil nil nil nil)
		       ("=b" "=begin rdoc\n  $0\n=end" "=begin rdoc ... =end" nil
			("general")
			nil nil nil nil)
		       ("Comp" "include Comparable\n\ndef <=> other\n  $0\nend" "include Comparable; def <=> ... end" nil
			("definitions")
			nil nil nil nil)
		       ("$" "$${1:GLOBAL} = $0" "GLOB" nil nil nil nil nil nil)
		       ("all" "all? { |${e}| $0 }" "all? { |...| ... }" nil
			("collections")
			nil nil nil nil)
		       ("am" "alias_method :${new_name}, :${old_name}" "alias_method new, old" nil
			("definitions")
			nil nil nil nil)
		       ("any" "any? { |${e}| $0 }" "any? { |...| ... }" nil
			("collections")
			nil nil nil nil)
		       ("app" "if __FILE__ == $PROGRAM_NAME\n  $0\nend" "if __FILE__ == $PROGRAM_NAME ... end" nil
			("general")
			nil nil nil nil)
		       ("@" "@${1:attr} = $0" "attribute" nil nil nil nil nil nil)
		       ("bench" "require \"benchmark\"\n\nTESTS = ${1:1_000}\nBenchmark.bmbm do |x|\n  x.report(\"${2:var}\") {}\nend\n" "bench" nil nil nil nil nil nil)
		       ("bm" "Benchmark.bmbm(${1:10}) do |x|\n  $0\nend" "Benchmark.bmbm(...) do ... end" nil
			("general")
			nil nil nil nil)
		       ("case" "case ${1:object}\nwhen ${2:condition}\n  $0\nend" "case ... end" nil
			("general")
			nil nil nil nil)
		       ("cla" "class << ${self}\n  $0\nend" "class << self ... end" nil
			("definitions")
			nil nil nil nil)
		       ("cls" "class ${1:`(let ((fn (capitalize (file-name-nondirectory\n                                 (file-name-sans-extension\n				 (or (buffer-file-name)\n				     (buffer-name (current-buffer))))))))\n             (replace-regexp-in-string \"_\" \"\" fn t t))`}\n  $0\nend\n" "class ... end" nil
			("definitions")
			nil nil nil nil)
		       ("collect" "collect { |${e}| $0 }" "collect { |...| ... }" nil
			("collections")
			nil nil nil nil)
		       ("dee" "Marshal.load(Marshal.dump($0))" "deep_copy(...)" nil
			("general")
			nil nil nil nil)
		       ("def" "def ${1:method}${2:(${3:args})}\n    $0\nend" "def ... end" nil nil nil nil nil nil)
		       ("deli" "delete_if { |${e}| $0 }" "delete_if { |...| ... }" nil
			("collections")
			nil nil nil nil)
		       ("det" "detect { |${e}| $0 }" "detect { |...| ... }" nil
			("collections")
			nil nil nil nil)
		       ("dow" "downto(${0}) { |${n}|\n  $0\n}" "downto(...) { |n| ... }" nil
			("control structure")
			nil nil nil nil)
		       ("ea" "each { |${e}| $0 }" "each { |...| ... }" nil
			("collections")
			nil nil nil nil)
		       ("eac" "each_cons(${1:2}) { |${group}| $0 }" "each_cons(...) { |...| ... }" nil
			("collections")
			nil nil nil nil)
		       ("eai" "each_index { |${i}| $0 }" "each_index { |i| ... }" nil
			("collections")
			nil nil nil nil)
		       ("eav" "each_value { |${val}| $0 }" "each_value { |val| ... }" nil
			("collections")
			nil nil nil nil)
		       ("eawi" "each_with_index { |${e}, ${i}| $0 }" "each_with_index { |e, i| ... }" nil
			("collections")
			nil nil nil nil)
		       ("for" "for ${1:el} in ${2:collection}\n    $0\nend" "for" nil nil nil nil nil nil)
		       ("forin" "for ${1:element} in ${2:collection}\n  $0\nend" "for ... in ...; ... end" nil
			("control structure")
			nil nil nil nil)
		       ("form" "require 'formula'\n\nclass ${1:Name} <Formula\n  url '${2:url}'\n  homepage '${3:home}'\n  md5 '${4:md5}'\n\n  def install\n    ${5:system \"./configure\"}\n    $0\n  end\nend\n" "formula" nil nil nil nil nil nil)
		       ("if" "if ${1:condition}\n  $0\nend" "if ... end" nil
			("control structure")
			nil nil nil nil)
		       ("ife" "if ${1:condition}\n  $2\nelse\n  $3\nend" "if ... else ... end" nil
			("control structure")
			nil nil nil nil)
		       ("init" "def initialize(${1:args})\n    $0\nend" "init" nil nil nil nil nil nil)
		       ("inject" "inject(${1:0}) { |${2:injection}, ${3:element}| $0 }" "inject(...) { |...| ... }" nil
			("collections")
			nil nil nil nil)
		       ("mm" "def method_missing(method, *args)\n  $0\nend" "def method_missing ... end" nil
			("definitions")
			nil nil nil nil)
		       ("r" "attr_reader :" "attr_reader ..." nil
			("definitions")
			nil nil nil nil)
		       ("rb" "#!/usr/bin/ruby -wU\n" "/usr/bin/ruby -wU" nil
			("general")
			nil nil nil nil)
		       ("reject" "reject { |${1:element}| $0 }" "reject { |...| ... }" nil
			("collections")
			nil nil nil nil)
		       ("rel" "require_relative '$0'" "require_relative" nil
			("general")
			nil nil nil nil)
		       ("req" "require '$0'" "require \"...\"" nil
			("general")
			nil nil nil nil)
		       ("rw" "attr_accessor :" "attr_accessor ..." nil
			("definitions")
			nil nil nil nil)
		       ("select" "select { |${1:element}| $0 }" "select { |...| ... }" nil
			("collections")
			nil nil nil nil)
		       ("s" "#{$0}" "str" nil nil nil nil nil nil)
		       ("tc" "class TC_${1:Class} < Test::Unit::TestCase\n      $0\nend" "test class" nil nil nil nil nil nil)
		       ("tim" "times { |${n}| $0 }" "times { |n| ... }" nil
			("control structure")
			nil nil nil nil)
		       ("to_" "def to_s\n    \"${1:string}\"\nend\n$0" "to_" nil nil nil nil nil nil)
		       ("tu" "require 'test/unit'" "tu" nil nil nil nil nil nil)
		       ("until" "until ${condition}\n  $0\nend" "until ... end" nil
			("control structure")
			nil nil nil nil)
		       ("upt" "upto(${n}) { |${i}|\n  $0\n}" "upto(...) { |n| ... }" nil
			("control structure")
			nil nil nil nil)
		       ("w" "attr_writer :" "attr_writer ..." nil
			("definitions")
			nil nil nil nil)
		       ("when" "when ${condition}\n  $0\nend" "when ... end" nil
			("control structure")
			nil nil nil nil)
		       ("while" "while ${condition}\n  $0\nend" "while ... end" nil
			("control structure")
			nil nil nil nil)
		       ("y" ":yields: $0" ":yields: arguments (rdoc)" nil
			("general")
			nil nil nil nil)
		       ("zip" "zip(${enums}) { |${row}| $0 }" "zip(...) { |...| ... }" nil
			("collections")
			nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("act" "def act = {\n  loop {\n    react {\n      $0\n    }\n  }\n}\n" "def act = { ..}" nil nil nil nil nil nil)
		       ("act" "def act(${1:arg}: ${2:type}) = {\n  loop {\n    react {\n      $0\n    }\n  }\n}" "def act(arg: T) = { ..}" nil nil nil nil nil nil)
		       ("actor" "val a = actor {\n  loop {\n    react {\n      $0\n    }\n  }\n}" "val a = actor { ..}" nil nil nil nil nil nil)
		       ("=>" "($1) => ${2:body} $0" "(args) => ..." nil nil nil nil nil nil)
		       ("app" "object ${1:name} extends App {\n  $0\n}" "object name extends App" nil nil nil nil nil nil)
		       ("arr.new" "Array[${1:value}](${2:args}) $0" "Array[T](..)" nil nil nil nil nil nil)
		       ("arr.new" "val ${1:arr} = Array[${2:value}](${3:args}) $0" "val a = Array[T](..)" nil nil nil nil nil nil)
		       ("asof" "asInstanceOf[${1:type}] $0" "asInstanceOf[T] " nil nil nil nil nil nil)
		       ("ass" "assert(${1:x} === ${2:y}) $0" "assert(x === y)" nil nil nil nil nil nil)
		       ("ass" "assert(true) $0" "assert(true)" nil nil nil nil nil nil)
		       ("at.author" "@author ${1:name} $0" "@author name" nil nil nil nil nil nil)
		       ("at" "@param ${1:name} ${2:description} $0" "@param name description" nil nil nil nil nil nil)
		       ("at" "@return ${1:description} $0" "@return description" nil nil nil nil nil nil)
		       ("at" "@version ${1:0.1} $0" "@version number" nil nil nil nil nil nil)
		       ("!" "${1:actor} ! ${2:message} $0" "actor ! message" nil nil nil nil nil nil)
		       ("case" "case ${1:pattern} => $0" "case pattern => " nil nil nil nil nil nil)
		       ("case" "case _ => $0" "case _ =>" nil nil nil nil nil nil)
		       ("cast" "asInstanceOf[${1:type}] $0" "asInstanceOf[T] " nil nil nil nil nil nil)
		       ("cc" "case class ${1:name}(${2:arg}: ${3:type}) $0" "case class T(arg: A)" nil nil nil nil nil nil)
		       ("cl" "class ${1:name} {\n  $0\n}" "class T { .. }" nil nil nil nil nil nil)
		       ("cl" "abstract class ${1:name} {\n  $0\n}" "abstract class T { .. }" nil nil nil nil nil nil)
		       ("cl" "abstract class ${1:name}(${2:args}) {\n  $0\n}" "abstract class T(args) { .. }" nil nil nil nil nil nil)
		       ("cl" "class ${1:name}(${2:args}) {\n  $0\n}" "class T(args) { .. }" nil nil nil nil nil nil)
		       ("clof" "classOf[${1:type}] $0" "classOf[T] " nil nil nil nil nil nil)
		       ("co" "case object ${1:name} $0" "case object T" nil nil nil nil nil nil)
		       ("cons" "${1:element1} :: ${2:element2} $0" "element1 :: element2" nil nil nil nil nil nil)
		       ("cons" "${1:element1} :: Nil $0\n" "element1 :: Nil" nil nil nil nil nil nil)
		       ("def" "def ${1:name}(${2:args}) = $0" "def f(arg: T) = ..." nil nil nil nil nil nil)
		       ("def" "def ${1:name}(${2:args}) = {\n  $0\n}" "def f(arg: T) = {...}" nil nil nil nil nil nil)
		       ("def" "def ${1:name}(${2:args}): ${3:Unit} = $0" "def f(arg: T): R = ..." nil nil nil nil nil nil)
		       ("def" "def ${1:name}(${2:args}): ${3:Unit} = {\n  $0\n}" "def f(arg: T): R = {...}" nil nil nil nil nil nil)
		       ("def" "def ${1:name} = {\n  $0\n}" "def f = {...}" nil nil nil nil nil nil)
		       ("def" "def ${1:name}: ${2:Unit} = $0" "def f: R = ..." nil nil nil nil nil nil)
		       ("def" "def ${1:name}: ${3:Unit} = {\n  $0\n}" "def f: R = {...}" nil nil nil nil nil nil)
		       ("def" "def ${1:name} = $0" "def f = ..." nil nil nil nil nil nil)
		       ("doc" "/**\n * `(scala-mode-find-clstrtobj-name-doc)`\n * ${1:description}\n * $0\n */" "/** cls/trt/obj name */" nil nil nil nil nil nil)
		       ("doc" "/**\n * `(scala-mode-def-and-args-doc)`\n */" "/** method name */" nil nil nil nil nil nil)
		       ("doc.file" "/**\n * `(scala-mode-file-doc)`\n * $0\n * @author ${1:name}\n * @version ${2:0.1} \n */" "/** file name */" nil nil nil nil nil nil)
		       ("doc.file-scala" "/*                     __                                               *\\\n**     ________ ___   / /  ___     Scala $3                               **\n**    / __/ __// _ | / /  / _ |    (c) 2005-`(format-time-string \"%Y\")` , LAMP/EPFL             **\n**  __\\ \\/ /__/ __ |/ /__/ __ |    http://scala-lang.org/               **\n** /____/\\___/_/ |_/____/_/ | |                                         **\n**                          |/                                          **\n\\*                                                                      */\n/** \n * $0\n * @author ${1:name} \n * @version ${2:0.1}\n * $Id$\n */" "/** scala file */" nil nil nil nil nil nil)
		       ("doc.file-scala-api" "/*                     __                                               *\\\n**     ________ ___   / /  ___     Scala API                            **\n**    / __/ __// _ | / /  / _ |    (c) 2005-`(format-time-string \"%Y\")`, LAMP/EPFL             **\n**  __\\ \\/ /__/ __ |/ /__/ __ |    http://scala-lang.org/               **\n** /____/\\___/_/ |_/____/_/ | |                                         **\n**                          |/                                          **\n\\*                                                                      */\n/** \n * $0\n * @author ${1:name} \n * @version ${2:0.1}\n * $Id$\n */" "/** scala api file */" nil nil nil nil nil nil)
		       ("doc.scaladoc" "/**\n * ${1:description}\n * $0\n */" "/** ... */" nil nil nil nil nil nil)
		       ("expect" "expect(${1:reply}) {\n  $0\n}" "expect(value) { ..}" nil nil nil nil nil nil)
		       ("ext" "extends $0" "extends T" nil nil nil nil nil nil)
		       ("for.extract" "${1:x} <- ${2:xs}" "x <- xs" nil nil nil nil nil nil)
		       ("for" "for (${1:x} <- ${2:xs} if ${3:guard}) {\n  $0\n}" "for (x <- xs if guard) { ... }" nil nil nil nil nil nil)
		       ("for" "for (${1:x} <- ${2:xs}) {\n  $0\n}" "for (x <- xs) { ... }" nil nil nil nil nil nil)
		       ("for" "for {\n  ${1:x} <- ${2:xs}\n  ${3:x} <- ${4:xs}\n} {\n  yield $0\n}" "for {x <- xs \\ y <- ys} { yield }" nil nil nil nil nil nil)
		       ("foreach" "foreach(${1:x} => ${2:body}) $0" "foreach(x => ..)" nil nil nil nil nil nil)
		       ("hmap.new" "new HashMap[${1:key}, ${2:value}] $0" "new HashMap[K, V]" nil nil nil nil nil nil)
		       ("hmap.val-new" "val ${1:m} = new HashMap[${2:key}, ${3:value}] $0" "val m = new HashMap[K, V]" nil nil nil nil nil nil)
		       ("hset.new" "new HashSet[${1:key}] $0\n" "new HashSet[K]" nil nil nil nil nil nil)
		       ("hset.val-new" "val ${1:m} = new HashSet[${2:key}] $0" "val m = new HashSet[K]" nil nil nil nil nil nil)
		       ("if" "if (${1:condition}) {\n  $0\n}" "if (cond) { .. }" nil nil nil nil nil nil)
		       ("if" "if (${1:condition}) {\n  $2\n} else {\n  $0\n}" "if (cond) { .. } else { .. }" nil nil nil nil nil nil)
		       ("imp" "import $0" "import .." nil nil nil nil nil nil)
		       ("intercept" "intercept(classOf[${1:Exception]}) {\n  $0\n}" "intercept(classOf[T]) { ..}" nil nil nil nil nil nil)
		       ("isof" "isInstanceOf[${1:type}] $0" "isInstanceOf[T] " nil nil nil nil nil nil)
		       ("ls" "List(${1:args}, ${2:args}) $0" "List(..)" nil nil nil nil nil nil)
		       ("ls" "val ${1:l} = List(${2:args}, ${3:args}) $0" "val l = List(..)" nil nil nil nil nil nil)
		       ("main" "def main(args: Array[String]) = {\n  $0\n}" "def main(args: Array[String]) = { ... }" nil nil nil nil nil nil)
		       ("map" "map(${1:x} => ${2:body}) $0" "map(x => ..)" nil nil nil nil nil nil)
		       ("map" "Map(${1:key} -> ${2:value}) $0" "Map(key -> value)" nil nil nil nil nil nil)
		       ("match" "${1:cc} match {\n  case ${2:pattern} => $0\n}" "cc match { .. }" nil nil nil nil nil nil)
		       ("match" "${1:option} match {\n  case Full(res) => $0\n\n  case Empty =>\n\n  case Failure(msg, _, _) =>\n\n}" "can match { case Full(res) => .. }" nil nil nil nil nil nil)
		       ("match" "${1:option} match {\n  case None => $0\n  case Some(res) =>\n\n}" "option match { case None => .. }" nil nil nil nil nil nil)
		       ("mix" "trait ${1:name} {\n  $0\n}" "trait T { .. }" nil nil nil nil nil nil)
		       ("ob" "object ${1:name} extends ${2:type} $0" "object name extends T" nil nil nil nil nil nil)
		       ("pac" "package $0" "package .." nil nil nil nil nil nil)
		       ("pr.newline" "println(${1:obj}) $0" "println(..)" nil nil nil nil nil nil)
		       ("pr" "print(${1:obj}) $0" "print(..)" nil nil nil nil nil nil)
		       ("pr" "println(\"${1:msg}\") $0" "println(\"..\")" nil nil nil nil nil nil)
		       ("pr" "println(\"${1:obj}: \" + ${1:obj}) $0" "println(\"obj: \" + obj)" nil nil nil nil nil nil)
		       ("pri" "private $0" "private" nil nil nil nil nil nil)
		       ("pri.param" "private[${1:this}] $0" "private[this]" nil nil nil nil nil nil)
		       ("pro" "protected $0" "protected" nil nil nil nil nil nil)
		       ("prno" "protected[${1:this}] $0" "protected[this]" nil nil nil nil nil nil)
		       ("suite" "import org.scalatest._\n\nclass ${1:name} extends Suite {\n  $0\n}" "class T extends Suite { .. }" nil nil nil nil nil nil)
		       ("test" "//@Test\ndef test${1:name} = {\n  $0\n}" "@Test def testX = ..." nil nil nil nil nil nil)
		       ("throw" "throw new ${1:Exception}(${2:msg}) $0" "throw new Exception" nil nil nil nil nil nil)
		       ("tr" "trait ${1:name} {\n  $0\n}" "trait T { .. }" nil nil nil nil nil nil)
		       ("tr" "trait ${1:name} extends ${2:class} {\n  $0\n}" "trait T extends C { .. }" nil nil nil nil nil nil)
		       ("tr" "trait ${1:name} extends ${2:class} with ${3:trait} {\n  $0\n}" "trait T1 extends C with T2 { .. }" nil nil nil nil nil nil)
		       ("tr.with" "trait ${1:name} with ${2:trait} {\n  $0\n}" "trait T1 with T2 { .. }" nil nil nil nil nil nil)
		       ("try" "try {\n  $0\n} catch {\n  case ${1:e}: ${2:Exception} => \n    ${1:println(\\\"ERROR: \\\" + e) // TODO: handle exception}\\n}\n}" "try { .. } catch { case e => ..}" nil nil nil nil nil nil)
		       ("try" "try {\n  $0\n} catch {\n  case ${1:e}: ${2:Exception} =>\n    ${1:println(\\\"ERROR: \\\" + e) // TODO: handle exception}\\n}\n} finally {\n\n}" "try { .. } catch { case e => ..} finally { ..}" nil nil nil nil nil nil)
		       ("try" "try {\n\n} finally {\n  $0\n}" "try { .. } finally { .. }" nil nil nil nil nil nil)
		       ("tup.arrow" "${1:element1} -> ${2:element2} $0" "element1 -> element2" nil nil nil nil nil nil)
		       ("tup.paren" "(${1:element1}, ${2:element2}) $0" "(element1, element2)" nil nil nil nil nil nil)
		       ("val" "val ${1:name} = ${2:obj} $0" "val name = .." nil nil nil nil nil nil)
		       ("val" "val ${1:name} = new ${2:obj} $0" "val name = new .." nil nil nil nil nil nil)
		       ("val" "val ${1:name}: ${2:T} = ${3:obj} $0\n" "val name: T = .." nil nil nil nil nil nil)
		       ("var" "var ${1:name} = ${2:obj} $0\n" "var name = .." nil nil nil nil nil nil)
		       ("var.new" "var ${1:name} = new ${2:obj} $0\n" "var name = new .." nil nil nil nil nil nil)
		       ("var.ret" "var ${1:name}: ${2:T} = ${3:obj} $0\n" "var name: T = .." nil nil nil nil nil nil)
		       ("whi" "while (${1:condition}) {\n  $0\n}" "while(cond) { .. }" nil nil nil nil nil nil)
		       ("with" "with $0" "with T" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("b" "blist\n" "blist" nil nil nil nil nil nil)
		       ("h" "help $0" "help" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("after" "after\n    $1 -> $0\n" "after ... ->" nil nil nil nil nil nil)
		       ("begin" "begin\n    $0\nend\n" "begin ... end" nil nil nil nil nil nil)
		       ("beh" "-behaviour(${1:gen_server}).\n$0\n" "-behaviour(...)." nil nil nil nil nil nil)
		       ("case" "case $1 of\n    $0\nend\n" "case ... of ... end" nil nil nil nil nil nil)
		       ("compile" "-compile([${1:export_all}]).\n$0\n" "-compile(...)." nil nil nil nil nil nil)
		       ("def" "-define($1,$2).\n$0\n" "-define(...,...)." nil nil nil nil nil nil)
		       ("exp" "-export([${1:start/0}]).\n$0\n" "-export([])." nil nil nil nil nil nil)
		       ("fun" "fun ($1) -> $0 end\n" "fun (...) -> ... end" nil nil nil nil nil nil)
		       ("if" "if\n    $1 -> $2;\n    true -> $0\nend\n" "if ... -> ... ; true -> ... end" nil nil nil nil nil nil)
		       ("ifdef" "-ifdef($1).\n$0\n-endif.\n" "-ifdef(...). ... -endif." nil nil nil nil nil nil)
		       ("ifndef" "-ifndef($1).\n$0\n-endif.\n" "-ifndef(...). ... -endif." nil nil nil nil nil nil)
		       ("imp" "-import(${1:lists}, [${2:map/2, sum/1}]).\n$0\n" "-import([])." nil nil nil nil nil nil)
		       ("inc" "-include(\"$1\").\n$0\n" "-include(\"...\")." nil nil nil nil nil nil)
		       ("inc.lib" "-include_lib(\"$1\").\n$0\n" "-include_lib(\"...\")." nil nil nil nil nil nil)
		       ("loop" "${1:loop}($2) ->\n    receive\n	${3:_} ->\n	    $1($2)\n    end.\n$0\n" "loop(...) -> receive _ -> loop(...) end." nil nil nil nil nil nil)
		       ("mod" "-module(${1:`(file-name-nondirectory\n              (file-name-sans-extension (or (buffer-file-name) (buffer-name))))`}).\n$0\n" "-module()." nil nil nil nil nil nil)
		       ("rcv" "receive\n    $1 -> $0\nend\n" "receive ... -> ... end" nil nil nil nil nil nil)
		       ("rcv.after" "receive\nafter\n    $1 -> $0\nend\n" "receive after ... -> ... end" nil nil nil nil nil nil)
		       ("rec" "-record($1,{$2}).\n$0\n" "-record(...,{...})." nil nil nil nil nil nil)
		       ("try" "try $1 of\n    $0\ncatch\nafter\nend\n" "try ... of ... catch after end" nil nil nil nil nil nil)
		       ("undef" "-undef($1).\n$0\n" "-undef(...)." nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("au" "automatic $0 \n" "automatic" nil nil nil nil nil nil)
		       ("bd" "block data $0\n" "block data" nil nil nil nil nil nil)
		       ("c" "continue $0\n" "continue" nil nil nil nil nil nil)
		       ("ch" "character $0\n" "character" nil nil nil nil nil nil)
		       ("cx" "complex $0\n" "complex" nil nil nil nil nil nil)
		       ("dc" "double complex $0\n" "double complex" nil nil nil nil nil nil)
		       ("do" "do $1\n  $0\nend do\n" "do ... end do ..." nil nil nil nil nil nil)
		       ("dp" "double precision $0\n" "double precision" nil nil nil nil nil nil)
		       ("eq" "equivalence $0\n" "equivalence" nil nil nil nil nil nil)
		       ("forall" "forall ($1)\n  $0\nend forall" "forall ... end forall ..." nil nil nil nil nil nil)
		       ("function" "function ${1:name} (${2:arg})\n  ${3:real} :: $1\n  ${4:real, intent(in)} :: $2\n\n  $0\n\nend function $1\n" "function ... end function ..." nil nil nil nil nil nil)
		       ("ib" "implicit byte $0\n" "implicit byte" nil nil nil nil nil nil)
		       ("ic" "implicit complex $0\n" "implicit complex" nil nil nil nil nil nil)
		       ("ich" "implicit character $0\n" "implicit character" nil nil nil nil nil nil)
		       ("if" "if ( ${1:condition} ) then\n   $0\nend if\n" "if then end if" nil nil nil nil nil nil)
		       ("ii" "implicit integer $0\n" "implicit integer " nil nil nil nil nil nil)
		       ("il" "implicit logical $0\n" "implicit logical" nil nil nil nil nil nil)
		       ("in" "implicit none\n" "implicit none" nil nil nil nil nil nil)
		       ("inc" "include $0\n" "include" nil nil nil nil nil nil)
		       ("intr" "intrinsic $0\n" "intrinsic" nil nil nil nil nil nil)
		       ("ir" "implicit real $0\n" "implicit real" nil nil nil nil nil nil)
		       ("l" "logical $0\n" "logical" nil nil nil nil nil nil)
		       ("module" "module ${1:name}\n\ncontains\n\n  $0\n\nend module $1\n" "module ... end module ..." nil nil nil nil nil nil)
		       ("pa" "parameter $0\n" "parameter" nil nil nil nil nil nil)
		       ("pr" "program ${1:name}\n  ${2:implicit none}\n\n  $0\n\nend program $1\n" "program ... end program ..." nil nil nil nil nil nil)
		       ("program" "program ${1:name}\n  ${2:implicit none}\n\n  $0\n\nend program $1\n" "program .. end program" nil nil nil nil nil nil)
		       ("pure func" "pure function ${1:name} (${2:arg})\n  ${3:real} :: $1\n  ${4:real, intent(in)} :: $2\n\n  $0\n\nend function $1\n" "pure function ... end function ..." nil nil nil nil nil nil)
		       ("pure function" "pure function ${1:name} (${2:arg})\n  ${3:real} :: $1\n  ${4:real, intent(in)} :: $2\n\n  $0\n\nend function $1\n" "pure function .. end function" nil nil nil nil nil nil)
		       ("pure subroutine" "pure subroutine ${1:name} (${2:arg})\n  ${3:real, intent(in) :: $2}\n\n  $0\nend subroutine $1\n" "pure subroutine .. end subroutine" nil nil nil nil nil nil)
		       ("pure sub" "pure subroutine ${1:name} (${2:arg})\n  ${3:real, intent(in) :: $2}\n\n  $0\nend subroutine $1\n" "pure subroutine ... end subroutine ..." nil nil nil nil nil nil)
		       ("re" "read (${1:*},${2:*}) $0\n" "read (*,*)" nil nil nil nil nil nil)
		       ("st" "structure $0\n" "structure" nil nil nil nil nil nil)
		       ("su" "subroutine ${1:name} (${2:arg})\n  ${3:real, intent(in) :: $2}\n\n  $0\nend subroutine $1\n" "subroutine ... end subroutine ..." nil nil nil nil nil nil)
		       ("subroutine" "subroutine ${1:name} (${2:arg})\n  ${3:real, intent(in) :: $2}\n\n  $0\nend subroutine $1\n" "subroutine .. end subroutine" nil nil nil nil nil nil)
		       ("until" "do\n  $0\n  if (${1:condition}) exit\nend do\n" "until ... end until ..." nil nil nil nil nil nil)
		       ("where" "\nwhere (${1:condition})\n  $0\nend where\n" "where ... end where ..." nil nil nil nil nil nil)
		       ("while" "do while (${1:condition})\n  $0\nend do\n" "while ... end while ..." nil nil nil nil nil nil)
		       ("wr" "write (${1:*},${2:*}) $0\n" "write (*,*)" nil nil nil nil nil nil)))


;;; contents of the .yas-setup.el support file:
;;;
(defun ca-all-asscs (asslist query)
  "returns a list of all corresponding values (like rassoc)"
  (cond
   ((null asslist) nil)
   (t
    (if (equal (cdr (car asslist)) query)
        (cons (car (car asslist)) (ca-all-asscs (cdr asslist) query))
      (ca-all-asscs (cdr asslist) query)))))
;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("fix" "fixes #${1:100}" "fixes" nil nil nil nil nil nil)
		       ("ref" "references #${1:100}" "references" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("bench" "func Benchmark$1(b *testing.B) {\n	for i := 0; i < b.N; i++ {\n		$0\n	}\n}\n" "benchmark" nil nil nil nil nil nil)
		       ("const" "const ${1:name type} = ${2:val}\n$0" "const" nil nil nil nil nil nil)
		       ("const" "const (\n  ${1:name type} = ${2:val}\n)" "const (...)" nil nil nil nil nil nil)
		       ("dd" "fmt.Printf(\"%+v\\n\", $1) // output for debug\n$0" "debug fmt.Printf" nil nil nil nil nil nil)
		       ("def" "default:\n$0" "default" nil nil nil nil nil nil)
		       ("el" " else {\n  $0\n}" "else" nil nil nil nil nil nil)
		       ("err" "if err != nil {\n	$0\n}" "error" nil nil nil nil nil nil)
		       ("example" "func Example$1() {\n	$0\n}\n" "example" nil nil nil nil nil nil)
		       ("for" "for $1 {\n  $0\n}\n" "for" nil nil nil nil nil nil)
		       ("range" "for ${3:key}, ${2:value} := range ${1:target} {\n	$0\n}" "for range" nil nil nil nil nil nil)
		       ("func" "//\nfunc ${1:name}(${2:args}) $3 {\n  $0\n}" "func" nil nil nil nil nil nil)
		       ("if" "if $1 {\n  $0\n}" "if" nil nil nil nil nil nil)
		       ("iferr" "if err != $1 {\n  $0\n}\n" "if error" nil nil nil nil nil nil)
		       ("imp" "import \"$1\"\n$0" "import" nil nil nil nil nil nil)
		       ("imp" "import (\n  \"$0\"\n)\n" "import (...)" nil nil nil nil nil nil)
		       ("lambda" "func(${1:args}) $2 {\n  $0\n}()" "lambda func" nil nil nil nil nil nil)
		       ("main" "func main() {\n  $0\n}" "func main()" nil nil nil nil nil nil)
		       ("map" "map[${1:type}]${2:type}\n" "map" nil nil nil nil nil nil)
		       ("pr" "fmt.Printf(\"${1:%s}\\n\", ${2:args})\n$0" "fmt.Printf(...)" nil nil nil nil nil nil)
		       ("sel" "select {\ncase $1:\n  $0\n}" "select" nil nil nil nil nil nil)
		       ("sw" "switch $1 {\ncase $2:\n  $0\n}" "switch" nil nil nil nil nil nil)
		       ("at" "func Test$1(t *testing.T) {\n	$0\n}\n" "test" nil nil nil nil nil nil)
		       ("testmain" "func TestMain(m *testing.M) {\n	setup()\n	ret := m.Run()\n	if ret == 0 {\n		teardown()\n	}\n	os.Exit(ret)\n}\n\nfunc setup() {\n	$1\n}\n\nfunc teardown() {\n	$2\n}" "testmain" nil nil nil nil nil nil)
		       ("type" "type $1 $2 {\n  $0\n}" "type" nil nil nil nil nil nil)
		       ("var" "var ${1:name} ${2:type}\n$0" "var" nil nil nil nil nil nil)
		       ("var" "var (\n  ${1:name} ${2:type}\n)" "var (...)" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("class" "class ${1:Class} {\n      $0\n}" "class" nil nil nil nil nil nil)
		       ("def" "def ${1:method}(${2:args}) {\n    $0\n}" "def" nil nil nil nil nil nil)
		       ("dict" "${1:dict} = [${2:key} : ${3:value}$0]" "dict" nil nil nil nil nil nil)
		       ("for" "for (${1:var} in ${2:iter}) {\n    $0\n}\n" "for" nil nil nil nil nil nil)
		       ("pr" "println ${1:\"string\"}\n$0" "println" nil nil nil nil nil nil)
		       ("times" "${1:10}.times {\n              $0\n}                ." "times" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("case" "case ${1:var} of\n     ${2:cond} -> ${3:value}\n     $0\n     otherwise -> ${4:other}" "case" nil nil nil nil nil nil)
		       ("da" "data ${1:Type} = $2" "data" nil nil nil nil nil nil)
		       ("d" "{-\n  $0\n-}" "doc" nil nil nil nil nil nil)
		       ("efix" "(error \"FIXME: $0\")" "fixme dummy" nil nil
			((yas-indent-line 'fixed))
			nil nil nil)
		       ("fun" "${1:function-name} :: ${2:type}\n$1 ${3:arguments} $0" "fun" nil nil nil nil nil nil)
		       ("fune" "${1:function-name} :: ${2:type}\n$1 = $0error \"Not implemented: $1\"" "fune" nil nil nil nil nil nil)
		       ("import" "import${1: qualified} ${2:Module${3:(symbols)}}${4: as ${5:alias}}" "import" nil nil nil nil nil nil)
		       ("ins" "instance ${1:${2:(Show a)} => }${3:Ord} ${4:DataType} where\n$0\n" "instance" nil nil nil nil nil nil)
		       ("main" "main :: IO ()\nmain = do $0" "main function" nil nil
			((yas-indent-line 'fixed))
			nil nil nil)
		       ("mod" "module ${1:Module} where\n$0" "module" nil nil nil nil nil nil)
		       ("class" "class ${1:Class Name} where\n      $0" "new class" nil nil nil nil nil nil)
		       ("{" "{-# ${1:PRAGMA} #-}" "pragma" nil nil nil nil nil nil)
		       ("pr" "print $0" "print" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("dd" "<dd>$1</dd>" "<dd> ... </dd>" nil
			("list")
			nil nil nil nil)
		       ("dl" "<dl>\n    $0\n</dl>\n" "<dl> ... </dl>" nil
			("list")
			nil nil nil nil)
		       ("doctype" "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">" "Doctype HTML 4.01 Strict" nil
			("meta")
			nil nil nil nil)
		       ("doctype.xhml1" "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Frameset//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd\">" "DocType XHTML 1.0 frameset" nil
			("meta")
			nil nil nil nil)
		       ("doctype.xhtml1_1" "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.1//EN\" \"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd\">" "DocType XHTML 1.1" nil
			("meta")
			nil nil nil nil)
		       ("doctype.xhtml1_strict" "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">" "DocType XHTML 1.0 Strict" nil
			("meta")
			nil nil nil nil)
		       ("doctype.xhtml1_transitional" "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">" "DocType XHTML 1.0 Transitional" nil
			("meta")
			nil nil nil nil)
		       ("dt" "<dt>$1</dt>" "<dt> ... </dt>" nil
			("list")
			nil nil nil nil)
		       ("form" "<form method=\"$1\" id=\"$2\" action=\"$3\">\n  $0\n</form>" "<form method=\"...\" id=\"...\" action=\"...\"></form>" nil nil nil nil nil nil)
		       ("html" "<html>\n  $0\n</html>\n" "<html>...</html>" nil nil nil nil nil nil)
		       ("html.xmlns" "<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"${1:en}\" lang=\"${2:en}\">\n  $0\n</html>\n" "<html xmlns=\"...\">...</html>" nil nil nil nil nil nil)
		       ("link.stylesheet" "<link rel=\"${1:stylesheet}\" href=\"${2:url}\" type=\"${3:text/css}\" media=\"${4:screen}\" />" "<link stylesheet=\"...\" />" nil nil nil nil nil nil)
		       ("link.stylesheet-ie" "<!--[if IE]>\n<link rel=\"${1:stylesheet}\" href=\"${2:url}\" type=\"${3:text/css}\" media=\"${4:screen}\" />\n<![endif]-->" "<!--[if IE]><link stylesheet=\"...\" /><![endif]-->" nil nil nil nil nil nil)
		       ("mailto" "<a href=\"mailto:$1@$2\">$0</a>" "<a href=\"mailto:...@...\">...</a>" nil nil nil nil nil nil)
		       ("meta" "<meta name=\"${1:generator}\" content=\"${2:content}\" />" "<meta name=\"...\" content=\"...\" />" nil
			("meta")
			nil nil nil nil)
		       ("meta.http-equiv" "<meta http-equiv=\"${1:Content-Type}\" content=\"${2:text/html; charset=UTF-8}\" />\n" "<meta http-equiv=\"...\" content=\"...\" />" nil
			("meta")
			nil nil nil nil)
		       ("script.javascript" "<script type=\"text/javascript\">\n  $0\n</script>" "<script type=\"text/javascript\">...</script> " nil nil nil nil nil nil)
		       ("script.javascript-src" "<script type=\"text/javascript\" src=\"$1\"></script>" "<script type=\"text/javascript\" src=\"...\"></script> " nil nil nil nil nil nil)
		       ("textarea" "<textarea name=\"$1\" id=\"$2\" rows=\"$3\" cols=\"$4\" tabindex=\"$5\"></textarea>" "<textarea ...></textarea>" nil nil nil nil nil nil)
		       ("th" "<th$1>$2</th>" "<th>...</th>" nil
			("table")
			nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("apr_assert" "if (Globals.useAssertions) {\n   ${1:assert ..};\n}\n" "apr_assert" nil nil nil nil nil nil)
		       ("as" "assert ${1:expression};" "assert" nil nil nil nil nil nil)
		       ("ae" "Assert.assertEquals($1, $2);\n$0" "assertEquals" nil
			("test")
			nil nil nil nil)
		       ("cls" "class ${1:Class} {\n      $0\n}" "cls" nil nil nil nil nil nil)
		       ("c" "public ${1:Class} (${2:args}) {\n       $0\n}" "constructor" nil nil nil nil nil nil)
		       ("dt" "@Test\npublic void test${1:Name}() throws Exception {\n    $0\n}\n" "define test method" nil nil nil nil nil nil)
		       ("/*" "/**\n * ${1:documentation}\n */" "doc" nil nil nil nil nil nil)
		       ("eq" "public boolean equals(${1:Class} other) {\n       $0\n}" "equals" nil nil nil nil nil nil)
		       ("file" "public class ${1:`(file-name-base\n                    (or (buffer-file-name)\n                        (buffer-name)))`} {\n  $0\n}\n" "file_class" nil nil nil nil nil nil)
		       ("for" "for (${1:int i = 0}; ${2:i < N}; ${3:i++}) {\n    $0\n}" "for" nil nil nil nil nil nil)
		       ("fori" "for (${1:Object el} : ${2:iterator}) {\n    $0\n}\n" "fori" nil nil nil nil nil nil)
		       ("g" "public ${1:int} get${2:Field}() {\n       return ${3:field};\n}" "getter" nil nil nil nil nil nil)
		       ("if" "if (${1:condition}) {\n   $0\n}" "if" nil nil nil nil nil nil)
		       ("ife" "if (${1:cond}) {\n    $2\n}\nelse {\n     $3\n}" "ife" nil nil nil nil nil nil)
		       ("imp" "import ${1:System.};\n$0" "import" nil nil nil nil nil nil)
		       ("iterator" "public Iterator<${1:type}> iterator() {\n       $0\n}\n" "iterator" nil nil nil nil nil nil)
		       ("doc" "/**\n * $0\n *\n */" "javadoc" nil nil nil nil nil nil)
		       ("\\" "(${1:args}) -> ${2:expression};" "lambda" nil nil nil nil nil nil)
		       ("main" "public static void main(String[] args) {\n       $0\n}" "main" nil nil nil nil nil nil)
		       ("main_class" "class `(file-name-nondirectory (file-name-sans-extension (buffer-file-name)))`\n{\npublic static void main(String args[])\n{\n$0\n}\n}" "main_class" nil nil nil nil nil nil)
		       ("m" "${1:public} ${2:void} ${3:name}(${4:args}) {\n            $0\n}" "method" nil nil nil nil nil nil)
		       ("new" "${1:Type} ${2:obj} = new ${3:Constr}(${4:args});\n$0" "new" nil nil nil nil nil nil)
		       ("o" "@Override\n$0" "override" nil nil nil nil nil nil)
		       ("param" "@param ${1:paramater} $0" "param" nil nil nil nil nil nil)
		       ("printf" "System.out.printf(\"$0%n\");" "printf" nil nil nil nil nil nil)
		       ("pr" "System.out.println(\"${1:text}\");\n$0" "println" nil nil nil nil nil nil)
		       ("r" "return $0" "return" nil nil nil nil nil nil)
		       ("test" "@Test\npublic void test_${1:Case}() {\n       $0\n}" "test" nil nil nil nil nil nil)
		       ("tc" "import junit.framework.*;\nimport junit.textui.*;\n\npublic class Test${1:Class} extends TestCase {\n       protected void setUp() {\n                 $0\n       }\n}" "testClass" nil nil nil nil nil nil)
		       ("." "this.$1 = $1;\n$0" "this" nil nil nil nil nil nil)
		       ("toStr" "public String toString() {\n       $0\n}" "toString" nil nil nil nil nil nil)
		       ("try" "try {\n    $0\n}\ncatch (${1:Throwable e}) {\n      ${2:System.out.println(\"Error \" + e.getMessage());\n      e.printStackTrace();}\n}\n" "try" nil nil nil nil nil nil)
		       ("val" "final ${1:int} ${2:n} = $0;" "value" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("al" "alert($0);" "alert" nil nil nil nil nil nil)
		       ("class" "var ${1:name} = new Class({\n  initialize: function($2) {\n    $0\n  }\n});" "Class" nil nil nil nil nil nil)
		       ("com" "/*\n * $0\n */" "comment (/* ... */)" nil nil nil nil nil nil)
		       ("dbg" "debugger;" "debugger" nil nil nil nil nil nil)
		       ("each" "${1:collection}.each(function($2) {\n  $0\n});" "each" nil nil nil nil nil nil)
		       ("el" "else {\n  $0\n}" "else" nil nil nil nil nil nil)
		       ("ev.add" "addEvent('${1:event}', function($2) {\n  $0\n});" "addEvent" nil nil nil nil nil nil)
		       ("ev.fire" "fireEvent('$0')" "fireEvent" nil nil nil nil nil nil)
		       ("for" "for(var ${1:i} = ${2:0}; $1 < ${3:collection}.length; $1++) {\n  $0\n}" "for" nil nil nil nil nil nil)
		       ("f" "function ${1:name}(${2:arg}) {\n         $0\n}" "function" nil nil nil nil nil nil)
		       ("if" "if (${1:condition}) {\n  $0\n}" "if" nil nil nil nil nil nil)
		       ("init" "initialize: function($1) {\n  $0\n}" "Constructor" nil nil nil nil nil nil)
		       ("log" "console.log($0);" "console.log" nil nil nil nil nil nil)
		       ("req.html" "new Request.HTML({\n  onSuccess: function(responseTree, responseElements, responseHTML, responseJavaScript) {\n    $0\n  }\n}).${1:get}(${2:url});" "html" nil nil nil nil nil nil)
		       ("req.json" "new Request.JSON({\n  onSuccess: function(responseJSON, responseText) {\n    $0\n  }\n}).${1:send}(${2:url});" "json" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("al" "alert($0);" "alert" nil nil nil nil nil nil)
		       ("class" "var ${1:name} = new Class({\n  initialize: function($2) {\n    $0\n  }\n});" "Class" nil nil nil nil nil nil)
		       ("com" "/*\n * $0\n */" "comment (/* ... */)" nil nil nil nil nil nil)
		       ("dbg" "debugger;" "debugger" nil nil nil nil nil nil)
		       ("each" "${1:collection}.each(function($2) {\n  $0\n});" "each" nil nil nil nil nil nil)
		       ("el" "else {\n  $0\n}" "else" nil nil nil nil nil nil)
		       ("ev.add" "addEvent('${1:event}', function($2) {\n  $0\n});" "addEvent" nil nil nil nil nil nil)
		       ("ev.fire" "fireEvent('$0')" "fireEvent" nil nil nil nil nil nil)
		       ("for" "for(var ${1:i} = ${2:0}; $1 < ${3:collection}.length; $1++) {\n  $0\n}" "for" nil nil nil nil nil nil)
		       ("f" "function ${1:name}(${2:arg}) {\n         $0\n}" "function" nil nil nil nil nil nil)
		       ("if" "if (${1:condition}) {\n  $0\n}" "if" nil nil nil nil nil nil)
		       ("init" "initialize: function($1) {\n  $0\n}" "Constructor" nil nil nil nil nil nil)
		       ("log" "console.log($0);" "console.log" nil nil nil nil nil nil)
		       ("req.html" "new Request.HTML({\n  onSuccess: function(responseTree, responseElements, responseHTML, responseJavaScript) {\n    $0\n  }\n}).${1:get}(${2:url});" "html" nil nil nil nil nil nil)
		       ("req.json" "new Request.JSON({\n  onSuccess: function(responseJSON, responseText) {\n    $0\n  }\n}).${1:send}(${2:url});" "json" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("ac" "\\newacronym{${1:label}}{${1:$(upcase yas-text)}}{${2:Name}}" "acronym" nil nil nil nil nil nil)
		       ("al" "\\begin{alertblock}{$2}\n        $0\n\\end{alertblock}" "alertblock" nil nil nil nil nil nil)
		       ("alg" "\\begin{algorithmic}\n$0\n\\end{algorithmic}\n" "alg" nil nil nil nil nil nil)
		       ("begin" "\\begin{${1:environment}}\n$0\n\\end{$1}" "begin" nil nil nil nil nil nil)
		       ("bl" "\\begin{block}{$1}\n        $0\n\\end{block}" "block" nil nil nil nil nil nil)
		       ("G" "\\Gls{${1:label}}" "Gls" nil nil nil nil nil nil)
		       ("ca" "\\caption{$0}" "caption" nil nil nil nil nil nil)
		       ("c" "\\cite{$1} $0" "cite" nil nil nil nil nil nil)
		       ("code" "\\begin{lstlisting}\n$0\n\\end{lstlisting}" "code" nil nil nil nil nil nil)
		       ("cols" "\\begin{columns}\n  \\begin{column}{.${1:5}\\textwidth}\n  $0\n  \\end{column}\n\n  \\begin{column}{.${2:5}\\textwidth}\n\n  \\end{column}\n\\end{columns}" "columns" nil nil nil nil nil nil)
		       ("e" "\\emph{$1}$0" "emph" nil nil nil nil nil nil)
		       ("enum" "\\begin{enumerate}\n\\item $0\n\\end{enumerate}" "enumerate" nil nil nil nil nil nil)
		       ("fig" "\\begin{figure}[ht]\n  \\centering\n  \\includegraphics[${1:options}]{figures/${2:path.pdf}}\n  \\caption{\\label{fig:${3:label}} $0}\n\\end{figure}\n" "figure" nil nil nil nil nil nil)
		       ("frac" "\\frac{${1:numerator}}{${2:denominator}}$0" "frac" nil nil nil nil nil nil)
		       ("fr" "\\begin{frame}${1:[$2]}\n        ${3:\\frametitle{$4}}\n        $0\n\\end{frame}" "frame" nil nil nil nil nil nil)
		       ("g" "\\gls{${1:label}}" "gls" nil nil nil nil nil nil)
		       ("gp" "\\glspl{${1:label}}" "glspl" nil nil nil nil nil nil)
		       ("if" "\\IF {$${1:cond}$}\n    $0\n\\ELSE\n\\ENDIF \n" "if" nil nil nil nil nil nil)
		       ("ig" "\\includegraphics${1:[$2]}{$0}" "includegraphics" nil nil nil nil nil nil)
		       ("-" "\\item $0" "item" nil nil nil nil nil nil)
		       ("it" "\\begin{itemize}\n\\item $0\n\\end{itemize}" "itemize" nil nil nil nil nil nil)
		       ("lab" "\\label{$0}" "label" nil nil nil nil nil nil)
		       ("lst" "\\begin{lstlisting}[float,label=lst:${1:label},caption=nextHopInfo: ${2:caption}]\n$0\n\\end{lstlisting}" "listing" nil nil nil nil nil nil)
		       ("movie" "\\begin{center}\n\\includemovie[\n  label=test,\n  controls=false,\n  text={\\includegraphics[width=4in]{${1:image.pdf}}}\n]{4in}{4in}{${2:video file}}\n\n\\movieref[rate=3]{test}{Play Fast}\n\\movieref[rate=1]{test}{Play Normal Speed} \n\\movieref[rate=0.2]{test}{Play Slow}\n\\movieref[resume]{test}{Pause/Resume}\n" "movie" nil nil nil nil nil nil)
		       ("cmd" "\\newcommand{\\\\${1:name}}${2:[${3:0}]}{$0}" "newcommand" nil nil nil nil nil nil)
		       ("gl" "\\newglossaryentry{${1:AC}}{name=${2:Andrea Crotti}${3:, description=${4:description}}}" "newglossaryentry" nil nil nil nil nil nil)
		       ("no" "\\note{$0}" "note" nil nil nil nil nil nil)
		       ("py" "\\lstset{language=python}\n\\begin[language=python]{lstlisting}\n$0\n\\end{lstlisting}" "python" nil nil nil nil nil nil)
		       ("q" "\\question{$0}" "question" nil nil nil nil nil nil)
		       ("sec" "\\section{${1:name}}\n\\label{sec:${2:label}}\n\n$0" "section" nil nil nil nil nil nil)
		       ("sf" "\\subfigure[${1:caption}]{\n  \\label{fig:${2:label}} \n  \\includegraphics[width=.${3:3}\\textwidth]{${4:path}}}\n$0" "subf" nil nil nil nil nil nil)
		       ("subfig" "\\begin{figure}[ht]\n  \\centering\n  \\subfigure[$1]\n  {\\label{fig:${2:label}} \n    \\includegraphics[width=.${3:5}\\textwidth]{${4:path}}}\n\n  \\caption{${5:caption}}\n\\label{fig:${6:label}}\n\\end{figure}\n" "subfigure" nil nil nil nil nil nil)
		       ("sub" "\\subsection{${1:name}}\n\\label{subsec:${2:label}}\n\n$0" "subsec" nil nil nil nil nil nil)
		       ("b" "\\textbf{$1}$0" "textbf" nil nil nil nil nil nil)
		       ("pkg" "\\usepackage{$0}" "usepackage" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("defun" "(defun ${1:fun} (${2:args})\n       $0\n)" "defun" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("cls" "(defclass ${1:name} (${2:inherits})\n   (${4:slot})\n   (:documentation \"${3:doc}\"))\n$0\n" "class" nil nil nil nil nil nil)
		       ("/*" "#|${1:type the comment here}|#\n$0\n" "comment" nil nil nil nil nil nil)
		       ("defp" "(defpackage #:${1:name}\n   (:nicknames #:${2:nick})\n   (:use #:cl #:closer-mop #:${3:package})\n   (:shadow :${4.symbol})\n   (:shadowing-import-from #:${5:package} #:${6:symbol})\n   (:export :$0))\n" "defpackage" nil nil nil nil nil nil)
		       ("do" "(do ((${1:var1} ${2:init-form} ${3:step-form})\n     (${4:var2} ${5:init-form} ${6:step-form}))  \n    (${7:condition} ${8:return-value})\n    (${9:body}))\n$0\n" "do" nil nil nil nil nil nil)
		       ("for" "(dotimes (${1:var} ${2:count-form})\n         ${3:body})\n$0\n" "do" nil nil nil nil nil nil)
		       ("foreach" "(dolist (${1:var} ${2:list-form})\n        ${3:body})\n$0\n" "do" nil nil nil nil nil nil)
		       ("print" "(format t \"~& $0 ~%\")\n" "format" nil nil nil nil nil nil)
		       ("if" "(when (${1:condition})\n      (${2:then-do-this}))\n$0\n" "if" nil nil nil nil nil nil)
		       ("ifelse" "\n(if (${1:condition})\n    (${2:then})\n    (${3:else}))\n$0\n" "ifelse (...) (...) (...) ..." nil nil nil nil nil nil)
		       ("ifnot" "\n(unless (${1:condition})\n        (${2:then-do-this}))\n$0\n" "ifnot (...) (...)  ..." nil nil nil nil nil nil)
		       ("slot" "(${1:name} :initarg :${1:$(yas/substr yas-text \"[^: ]*\")}\n           :initform (error \":${1:$(yas/substr yas-text \"[^: ]*\")} must be specified\")\n           ;; :accessor ${1:$(yas/substr yas-text \"[^: ]*\")}\n           :reader ${1:$(yas/substr yas-text \"[^: ]*\")}-changed\n           :writer set-${1:$(yas/substr yas-text \"[^: ]*\")}\n           :type\n           :allocation ${3::class :instance}\n           :documentation \"${2:about-slot}\")\n$0\n" "slot" nil nil nil nil nil nil)
		       ("switch" "\n(cond (${1:case1} (${2:do-this}))\n      (${3:case2} (${4:do-this}))     \n      (t ${5:default}))\n$0\n" "switch" nil nil nil nil nil nil)
		       ("typecast" "(coerce ${1:object} ${2:type})\n$0\n" "cast" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("fun" "function ()\n         ${1:return something}\nend" "fun" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("def" "define(\\`${1:macro}',\\`${2:subst}').\n$0" "def" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("noinst" "noinst_HEADERS = $0" "noinst_HEADERS" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("phony" ".PHONY: $0" "PHONY" nil nil nil nil nil nil)
		       ("echo" "@echo ${1:\"message to output\"}\n" "echo" nil nil nil nil nil nil)
		       ("gen" "all: ${1:targets}\n\n$0\n\nclean:\n        ${2:clean actions}\n" "gen" nil nil nil nil nil nil)
		       ("if" "@if [ ${1:cond} ]\n    then $0\nfi\n" "if" nil nil nil nil nil nil)
		       ("$" "$(${1:VAR})$0" "var" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("ps" "$(patsubst ${1:from},${2:to},${3:src})" "patsubst" nil nil nil nil nil nil)
		       ("ph" ".PHONY = $0" "phony" nil nil nil nil nil nil)
		       ("wl" "$(wildcard $0)" "wildcard" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("all" "all:\n        $0" "all" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("var" "${1:int} ${2:n} = $0;" "variable" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("+" "+ ${1:Text}\n+$0\n" "Unordered List" nil nil nil nil nil nil)
		       ("-" "- ${1:Text}\n-$0\n" "Unordered List" nil nil nil nil nil nil)
		       ("_" "_${1:Text}_ $0\n" "Emphasis" nil nil nil nil nil nil)
		       ("__" "**${1:Text}** $0\n" "Strong" nil nil nil nil nil nil)
		       ("`" "\\`${1:Code}\\` $0\n" "Inline Code" nil nil nil nil nil nil)
		       ("h1.1" "# ${1:Header 1} #\n\n$0\n" "Header 1 (#)" nil nil nil nil nil nil)
		       ("h1.2" "${1:Header 1}\n${1:$(make-string (string-width yas-text) ?\\=)}\n\n$0\n" "Header 1 (=)" nil nil nil nil nil nil)
		       ("h2.1" "## ${1:Header 1} ##\n\n$0\n" "Header 2 (##)" nil nil nil nil nil nil)
		       ("h2.2" "${1:Header 2}\n${1:$(make-string (string-width yas-text) ?\\-)}\n\n$0\n" "Header 2 (-)" nil nil nil nil nil nil)
		       ("h3" "### ${1:Header 3} ###\n\n$0\n" "Header 3" nil nil nil nil nil nil)
		       ("h4" "#### ${1:Header 4} ####\n\n$0\n" "Header 4" nil nil nil nil nil nil)
		       ("h5" "##### ${1:Header 5} #####\n\n$0\n" "Header 5" nil nil nil nil nil nil)
		       ("h6" "###### ${1:Header 6} ######\n\n$0\n" "Header 6" nil nil nil nil nil nil)
		       ("hr.1" "\n----------\n\n$0\n" "Horizontal Rule (-)" nil nil nil nil nil nil)
		       ("hr.2" "\n*******\n\n$0\n" "Horizontal Rule (*)" nil nil nil nil nil nil)
		       ("img" "![${1:Alt Text}](${2:URL} $3) $0\n" "Image" nil nil nil nil nil nil)
		       ("link" "[${1:Link Text}](${2:URL} $3) $0\n" "Link" nil nil nil nil nil nil)
		       ("ol" "${1:1}. ${2:Text}\n${1:$(number-to-string (1+ (string-to-number yas-text)))}. $0\n" "Ordered List" nil nil nil nil nil nil)
		       ("rimg" "![${1:Alt Text}][$2] $0\n" "Referenced Image" nil nil nil nil nil nil)
		       ("rlb" "[${1:Reference}]: ${2:URL} $3\n$0\n" "Reference Label" nil nil nil nil nil nil)
		       ("rlink" "[${1:Link Text}][$2] $0\n" "Reference Link" nil nil nil nil nil nil)
		       ("utf8" "<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />\n$0\n" "utf-8 encoding" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("chan" "channel Channel extends ${1:ned.DelayChannel} {\n        $0\n}\n" "chan" nil nil nil nil nil nil)
		       ("conn" "connections${1: allowunconnected}:\n                $0" "connections" nil nil nil nil nil nil)
		       ("for" "for ${1:i}=${2:0}..${3:sizeof(port)-1} {\n    $0\n}" "for" nil nil nil nil nil nil)
		       ("imp" "import ned.${1:Package};" "import" nil nil nil nil nil nil)
		       ("net" "network ${1:Name}\n{\n        submodules:\n           $2\n        connections:\n           $3\n}" "network" nil nil nil nil nil nil)
		       ("simple" "simple ${1:Component}${2: extends ${3:Component}}\n{\n    $0\n}" "simple" nil nil nil nil nil nil)
		       ("sub" "submodules:\n   $0" "submodules" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("tossim" "#ifndef TOSSIM\n        $0\n#endif" "TOSSIM" nil nil nil nil nil nil)
		       ("command" "command ${1:void} ${2:naMe}($3) {\n\n}" "command" nil nil nil nil nil nil)
		       ("dbg" "dbg(\"${1:Module}\", \"${2:message}\"${3:, ${4:var list}});" "dbg" nil nil nil nil nil nil)
		       ("event" "event ${1:void} ${2:On.Event}($3) {\n      $0\n}" "event" nil nil nil nil nil nil)
		       ("ifdef" "#ifdef ${1:Macro}\n $2\n${3:#else}\n $4\n#endif" "ifdef" nil nil nil nil nil nil)
		       ("int" "interface ${1:Interface} {\n          $0\n}" "interface" nil nil nil nil nil nil)
		       ("mod" "module ${1:Module} {\n       ${2:uses interface ${3:Packet}};\n       $0\n}" "module" nil nil nil nil nil nil)
		       ("nx" "nx_uint${1:8}_t ${2:var};\n$0" "nx" nil nil nil nil nil nil)
		       ("provides" "provides interface ${1:Interface};" "provides" nil nil nil nil nil nil)
		       ("sim" "#ifdef TOSSIM\n       $0\n#endif" "sim" nil nil nil nil nil nil)
		       ("u8" "uint8_t ${1:var};\n$0" "uint8_t" nil nil nil nil nil nil)
		       ("uses" "uses interface ${1:Interface}${2: as ${3:alias}};\n$0" "uses" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("def" "!define ${1:CONSTANT} ${2:value}" "define" nil nil nil nil nil nil)
		       ("fun" "Function ${1:Name}\n         $0\nFunctionEnd" "function" nil nil nil nil nil nil)
		       ("if" "${IF} ${1:cond}\n      $0\n${ElseIf} ${2:else_cond}\n\n${EndIf}" "if" nil nil nil nil nil nil)
		       ("inc" "!include \"${Library.nsh}\"" "include" nil nil nil nil nil nil)
		       ("im" "!insermacro ${1:Name} ${2:\"args\"}" "insert_macro" nil nil nil nil nil nil)
		       ("$" "$INSTDIR" "instdir" nil nil nil nil nil nil)
		       ("macro" "!macro ${1:Name} UN\n$0\n\n!macroend" "macro" nil nil nil nil nil nil)
		       ("msg" "MessageBox MB_OK \"${1:hello}\"" "message" nil nil nil nil nil nil)
		       ("$" "$OUTDIR" "outdir" nil nil nil nil nil nil)
		       ("out" "outFile \"${1:setup}.exe\"" "outfile" nil nil nil nil nil nil)
		       ("sec" "Section \"${1:Program}\"\n        $0\nSectionEnd" "section" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("body" "<body$1>\n  $0\n</body>" "<body>...</body>" nil nil nil nil nil nil)
		       ("br" "<br />" "<br />" nil nil nil nil nil nil)
		       ("doctype" "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.1//EN\" \"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd\">" "DocType XHTML 1.1" nil
			("meta")
			nil nil nil nil)
		       ("doctype_xhtml1_strict" "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">" "DocType XHTML 1.0 Strict" nil
			("meta")
			nil nil nil nil)
		       ("doctype_xhtml1_transitional" "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">" "DocType XHTML 1.0 Transitional" nil
			("meta")
			nil nil nil nil)
		       ("form" "<form method=\"$1\" action=\"$2\">\n  $0\n</form>" "<form method=\"...\" action=\"...\"></form>" nil nil nil nil nil nil)
		       ("a" "<a href=\"$1\">$2</a>" "<a href=\"...\">...</a>" nil nil nil nil nil nil)
		       ("html" "<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"${1:en}\" lang=\"${2:en}\">\n  $0\n</html>\n" "<html xmlns=\"...\">...</html>" nil nil nil nil nil nil)
		       ("img" "<img src=\"$1\" alt=\"$2\" />" "<img src=\"...\" alt=\"...\" />" nil nil nil nil nil nil)
		       ("input" "<input type=\"$1\" name=\"$2\" value=\"$3\" />" "<input ... />" nil nil nil nil nil nil)
		       ("link" "<link rel=\"${1:stylesheet}\" href=\"${2:url}\" type=\"${3:text/css}\" media=\"${4:screen}\" />" "<link stylesheet=\"...\" />" nil nil nil nil nil nil)
		       ("meta" "<meta name=\"${1:generator}\" content=\"${2:content}\" />" "<meta name=\"...\" content=\"...\" />" nil
			("meta")
			nil nil nil nil)
		       ("name" "<a name=\"$1\"></a>" "<a name=\"...\"></a>" nil nil nil nil nil nil)
		       ("quote" "<blockquote>\n  $1\n</blockquote>" "<blockquote>...</blockquote>" nil nil nil nil nil nil)
		       ("style" "<style type=\"text/css\" media=\"${1:screen}\">\n  $0\n</style>" "<style type=\"text/css\" media=\"...\">...</style>" nil nil nil nil nil nil)
		       ("t" "<${1:tag}>$2</$1>$0" "<tag>...</tag>" nil nil nil nil nil nil)
		       ("t" "<$1 $2 />$0" "<tag.../>" nil nil nil nil nil nil)
		       ("tn" "<${1:tag}>\n  $2\n</$1>$0" "<tag> \\n...\\n</tag>" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("for" "for ${1:var} = ${2:expr}\n    $0\nendfor" "for" nil nil nil nil nil nil)
		       ("fun" "function ${1:return_val} = ${2:fname}(${3:args})\n          $0\nendfunction" "function" nil nil nil nil nil nil)
		       ("if" "if ${1:cond}\n   $0\n${2:else\n        ${3:other}}\nendif" "if" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("code_" "#+begin_${1:lang} ${2:options}\n$0\n#+end_$1" "code" nil nil nil nil nil nil)
		       ("dot_" "#+begin_src dot :file ${1:file} :cmdline -T${2:pdf} :exports none :results silent\n            $0\n#+end_src\n\n[[file:$1]]" "dot" nil nil nil nil nil nil)
		       ("elisp_" "#+begin_src emacs-lisp :tangle yes\n$0\n#+end_src" "elisp" nil nil nil nil nil nil)
		       ("emb_" "src_${1:lang}${2:[${3:where}]}{${4:code}}" "embedded" nil nil nil nil nil nil)
		       ("entry_" "#+begin_html\n---\nlayout: ${1:default}\ntitle: ${2:title}\n---\n#+end_html\n$0" "entry" nil nil nil nil nil nil)
		       ("fig_" "#+CAPTION: ${1:caption}\n#+ATTR_LaTeX: ${2:scale=0.75}\n#+LABEL: fig:${3:label}\n" "figure" nil nil nil nil nil nil)
		       ("img_" "<img src=\"$1\"\n alt=\"$2\" align=\"${3:left}\"\n title=\"${4:image title}\"\n class=\"img\"\n</img>\n$0" "img" nil nil nil nil nil nil)
		       ("latex_" "#+BEGIN_LaTeX\n$0\n#+END_LaTeX" "latex" nil nil nil nil nil nil)
		       ("matrix_" "\\left \\(\n\\begin{array}{${1:ccc}}\n${2:v1 & v2} \\\\\n$0\n\\end{array}\n\\right \\)" "matrix" nil nil nil nil nil nil)
		       ("verse_" "#+begin_verse\n        $0\n#+end_verse" "verse" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("eval" "eval {\n    ${1:# do something risky...}\n};\nif (\\$@) {\n    ${2:# handle failure...}\n}" "eval { ... } if ($@) { ... }" nil nil nil nil nil nil)
		       ("for" "for (my \\$${1:var} = 0; \\$$1 < ${2:expression}; \\$$1++) {\n    ${3:# body...}\n}" "for (...) { ... }" nil nil nil nil nil nil)
		       ("fore" "foreach my \\$${1:x} (@${2:array}) {\n    ${3:# body...}\n}" "foreach ... { ... }" nil nil nil nil nil nil)
		       ("if" "if ($1) {\n    $0\n}" "if (...) { ... }" nil nil nil nil nil nil)
		       ("ife" "if ($1) {\n    $2\n} else {\n    $3\n}" "if (...) { ... } else { ... }" nil nil nil nil nil nil)
		       ("ifee" "if ($1) {\n	${2:# body...}\n} elsif ($3) {\n	${4:# elsif...}\n} else {\n	${5:# else...}\n}" "if, elsif, else ..." nil nil nil nil nil nil)
		       ("sub" "sub ${1:function_name} {\n    $0\n}" "sub ... { ... }" nil nil nil nil nil nil)
		       ("unless" "unless ($1) {\n    $0\n}" "unless (...) { ... }" nil nil nil nil nil nil)
		       ("while" "while ($1) {\n    $0\n}" "while (...) { ... }" nil nil nil nil nil nil)
		       ("xfore" "${1:expression} foreach @${2:array};" "... foreach ..." nil nil nil nil nil nil)
		       ("xif" "${1:expression} if ${2:condition}" "... if ..." nil nil nil nil nil nil)
		       ("xunless" "${1:expression} unless ${2:condition}" "... unless ..." nil nil nil nil nil nil)
		       ("xwhile" "${1:expression} while ${2:condition};" "... while ..." nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("Cask" "(source gnu)\n(source melpa)\n\n(package-file \"popup.el\")\n\n(development\n (depends-on \"ert\"))\n" "Cask" nil nil nil nil nil nil)
		       ("Makefile" "EMACS ?= emacs\nCASK ?= cask\nEMACS23=emacs23\n\nELPA_DIR = \\\n	.cask/$(shell $(EMACS) -Q --batch --eval '(princ emacs-version)')/elpa\n\n.PHONY: test test-nw test-emacs23 test-emacs23-nw travis-ci\n\ntest:\n	$(CASK) exec $(EMACS) -Q -L . -l tests/run-test.el\n\ntest-nw:\n	$(CASK) exec $(EMACS) -Q -nw -L . -l tests/run-test.el\n\ntest-emacs23: tests/ert.el\n	${EMACS23} -Q -L . -l test/ert.el -l tests/run-test.el\n\ntest-emacs23-nw: tests/ert.el\n	$(EMACS23) -Q -nw -L . -l test/ert.el -l tests/run-test.el\n\ntravis-ci: elpa\n	$(CASK) exec $(EMACS) -batch -Q -l tests/run-test.el\n\nelpa: $(ELPA_DIR)\n$(ELPA_DIR): Cask\n	$(CASK) install\n	touch $@\n" "Makefile" nil nil nil nil nil nil)
		       ("README.md" "popup.el\n========\n\n[![Build Status](https://secure.travis-ci.org/auto-complete/popup-el.png)](http://travis-ci.org/auto-complete/popup-el)\n\nOverview\n--------\n\npopup.el is a visual popup user interface library for Emacs. This\nprovides a basic API and common UI widgets such as popup tooltips and\npopup menus.\n\nScreenshots\n-----------\n\n**Tooltip**\n\n![](http://cx4a.org/software/popup/popup1.png)\n\n**Popup Menu**\n\n![](http://cx4a.org/software/popup/popup2.png)\n\n**Popup Cascade Menu**\n\n![](http://cx4a.org/software/popup/popup3.png)\n\nInstallation\n------------\n\nInstall `popup.el` into your `load-path` directory. If you have\n`install-elisp` or `auto-install`, you also be able to install\n`popup.el` like:\n\n    ;; install-elisp\n    (install-elisp \"https://github.com/m2ym/popup-el/raw/master/popup.el\")\n    ;; auto-install\n    (auto-install-from-url \"https://github.com/m2ym/popup-el/raw/master/popup.el\")\n\npopwin is tested under GNU Emacs 22 or later.\n\nPopup Items\n-----------\n\nElements of `popup-list` have to be popup items. A popup item is\nsubstantially a string but it may involve some text-properties. There\nare two ways to make popup items. One is just using strings. Another\nis to use the `popup-make-item` function, which just returns the string\nafter adding text-properties of its keywords. Effective text-properties\nare:\n\n* `value` -- This represents the **real** value of the item. This will\n  be used when returning the value but not the item (or string) from\n  some synchronous functions such as `popup-menu*`.\n* `face` -- The background face of the item. The value of `popup-face`\n  will be overridden.\n* `selection-face` -- The selection face of the item. The value of\n  `popup-selection-face` will be overridden.\n* `document` -- The documentation string or function of the item.\n* `summary` -- The summary string of the item. This will be shown\n  inline with the item.\n* `symbol` -- The symbol character of the item.\n* `sublist` -- The sublist of the item. This is effective only with\n  `popup-cascade-menu`.\n\nAll of properties can be accessed by `popup-item-<property>` utility function.\n\n### Function: `popup-item-propertize`\n\n    popup-item-propertize item &rest properties => item\n\nSame as `propertize` except that this avoids overriding existed value\nwith `nil` property.\n\n### Function: `popup-make-item`\n\n    popup-make-item name &key value popup-face selection-face sublist\n    document symbol summary => item\n\nThe utility function of `popup-item-propertize`.\n\nPopups\n------\n\nThis section describes the basic data structures and operations of\npopups.\n\n### Struct: `popup`\n\nAny instance of `popup` structure has the following fields (some\nunimportant fields are not listed):\n\n* `point`\n* `row` -- The line number.\n* `column`\n* `width` -- Max width of `popup` instance.\n* `height` -- Max height of `popup` instance.\n* `min-height`\n* `current-height`\n* `direction` -- Positive number means forward, negative number means\n  backward.\n* `parent` -- The parent of `popup` instance.\n* `face` -- The background face.\n* `selection-face`\n* `margin-left`\n* `margin-right`\n* `scroll-bar` -- Non-nil means `popup` instance has a scroll bar.\n* `symbol` -- Non-nil means `popup` instance has a space for\n  displaying symbols of item.\n* `cursor` -- The current position of `list`.\n* `scroll-top` -- The offset of scrolling.\n* `list` -- The contents of `popup` instance in a list of items\n  (strings).\n* `original-list` -- Same as `list` except that this is not filtered.\n\nAll of these fields can be accessed by `popup-<field>` function.\n\n### Function: `popup-create`\n\n    popup-create point width height &key min-height max-width around face\n    selection-face scroll-bar margin-left margin-right symbol parent\n    parent-offset => popup\n\nCreate a popup instance at `POINT` with `WIDTH` and `HEIGHT`.\n\n`MIN-HEIGHT` is the minimal height of the popup. The default value is 0.\n\n`MAX-WIDTH` is the maximum width of the popup. The default value is\nnil (no limit). If a floating point, the value refers to the ratio of\nthe window. If an integer, limit is in characters.\n\nIf `AROUND` is non-nil, the popup will be displayed around the point\nbut not at the point.\n\n`FACE` is the background face of the popup. The default value is\n`popup-face`.\n\n`SELECTION-FACE` is the foreground (selection) face of the popup The\ndefault value is `popup-face`.\n\nIf `SCROLL-BAR` is non-nil, the popup will have a scroll bar at the\nright.\n\nIf `MARGIN-LEFT` is non-nil, the popup will have a margin at the left.\n\nIf `MARGIN-RIGHT` is non-nil, the popup will have a margin at the\nright.\n\n`SYMBOL` is a single character which indicates the kind of the item.\n\n`PARENT` is the parent popup instance. If `PARENT` is omitted, the popup\nwill be a root instance.\n\n`PARENT-OFFSET` is a row offset from the parent popup.\n\nHere is an example:\n\n    (setq popup (popup-create (point) 10 10))\n    (popup-set-list popup '(\"Foo\" \"Bar\" \"Baz\"))\n    (popup-draw popup)\n    ;; do something here\n    (popup-delete popup)\n\n### Function: `popup-delete`\n\n    popup-delete popup\n\nDelete the `POPUP`.\n\n### Function: `popup-live-p`\n\n    popup-live-p popup => boolean\n\n### Function: `popup-set-list`\n\n    popup-set-list popup list\n\nSet the contents of the `POPUP`. `LIST` has to be popup items.\n\n### Function: `popup-draw`\n\n    popup-draw popup\n\nDraw the contents of the `POPUP`.\n\n### Function: `popup-hide`\n\n    popup-hide popup\n\nHide the `POPUP`. To show again, call `popup-draw`.\n\n### Function: `popup-hidden-p`\n\n    popup-hidden-p popup\n\nReturn non-nil if the `POPUP` is hidden.\n\n### Function: `popup-select`\n\n    popup-select popup index\n\nSelect the item of `INDEX` of the `POPUP`.\n\n### Function: `popup-selected-item`\n\n    popup-selected-item popup => item\n\nReturn the selected item of the `POPUP`.\n\nReturn non-nil if the `POPUP` is still alive.\n\n### Function: `popup-next`\n\n    popup-next popup\n\nSelect the next item of the `POPUP`.\n\n### Function: `popup-previous`\n\n    popup-previous popup\n\nSelect the next item of the `POPUP`.\n\n### Function: `popup-scroll-down`\n\n    popup-scroll-down popup n\n\nScroll down `N` items of the `POPUP`. This won't wrap.\n\n### Function: `popup-scroll-up`\n\n    popup-scroll-up popup n\n\nScroll up `N` items of the `POPUP`. This won't wrap.\n\n### Function: `popup-isearch`\n\n    popup-isearch popup &key cursor-color keymap callback help-delay\n    => boolean\n\nEnter incremental search event loop of `POPUP`.\n\nTooltips\n--------\n\nA tooltip is an useful visual UI widget for displaying information\nsomething about what cursor points to.\n\n### Function: `popup-tip`\n\n    popup-tip string &key point around width height min-height max-width\n    truncate margin margin-left margin-right scroll-bar parent\n    parent-offset nowait nostrip prompt\n\nShow a tooltip with message `STRING` at `POINT`. This function is\nsynchronized unless `NOWAIT` specified. Almost all arguments are same as\n`popup-create` except for `TRUNCATE`, `NOWAIT`, `NOSTRIP` and `PROMPT`.\n\nIf `TRUNCATE` is non-nil, the tooltip can be truncated.\n\nIf `NOWAIT` is non-nil, this function immediately returns the tooltip\ninstance without entering event loop.\n\nIf `NOSTRIP` is non-nil, `STRING` properties are not stripped.\n\n`PROMPT` is a prompt string used when reading events during the event\nloop.\n\nHere is an example:\n\n    (popup-tip \"Hello, World!\")\n    ;; reach here after the tooltip disappeared\n\nPopup Menus\n-----------\n\nPopup menu is an useful visual UI widget for prompting users to\nselect an item of a list.\n\n### Function: `popup-menu*`\n\n    popup-menu* list &key point around width height margin margin-left\n    margin-right scroll-bar symbol parent parent-offset keymap\n    fallback help-delay nowait prompt isearch isearch-cursor-color\n    isearch-keymap isearch-callback initial-index => selected-value\n\nShow a popup menu of `LIST` at `POINT`. This function returns the value\nof the selected item. Almost all arguments are same as `popup-create`\nexcept for `KEYMAP`, `FALLBACK`, `HELP-DELAY`, `PROMPT`, `ISEARCH`,\n`ISEARCH-CURSOR-COLOR`, `ISEARCH-KEYMAP`, and `ISEARCH-CALLBACK`.\n\nIf `KEYMAP` is provided, it is a keymap which is used when processing\nevents during event loop.\n\nIf `FALLBACK` is provided, it is a function taking two arguments; a key\nand a command. `FALLBACK` is called when no special operation is found\non the key. The default value is `popup-menu-fallback`, which does\nnothing.\n\n`HELP-DELAY` is a delay of displaying helps.\n\nIf `NOWAIT` is non-nil, this function immediately returns the menu\ninstance without entering event loop.\n\n`PROMPT` is a prompt string when reading events during event loop.\n\nIf `ISEARCH` is non-nil, do isearch as soon as displaying the popup\nmenu.\n\n`ISEARCH-CURSOR-COLOR` is a cursor color during isearch. The default\nvalue is `popup-isearch-cursor-color'.\n\n`ISEARCH-KEYMAP` is a keymap which is used when processing events\nduring event loop. The default value is `popup-isearch-keymap`.\n\n`ISEARCH-CALLBACK` is a function taking one argument.  `popup-menu`\ncalls `ISEARCH-CALLBACK`, if specified, after isearch finished or\nisearch canceled. The arguments is whole filtered list of items.\n\nIf `INITIAL-INDEX` is non-nil, this is an initial index value for\n`popup-select`. Only positive integer is valid.\n\nHere is an example:\n\n    (popup-menu* '(\"Foo\" \"Bar\" \"Baz\"))\n    ;; => \"Baz\" if you select Baz\n    (popup-menu* (list (popup-make-item \"Yes\" :value t)\n                       (popup-make-item \"No\" :value nil)))\n    ;; => t if you select Yes\n\n### Function: `popup-cascade-menu`\n\nSame as `popup-menu` except that an element of `LIST` can be also a\nsub-menu if the element is a cons cell formed `(ITEM . SUBLIST)` where\n`ITEM` is an usual item and `SUBLIST` is a list of the sub menu.\n\nHere is an example:\n\n    (popup-cascade-menu '((\"Top1\" \"Sub1\" \"Sub2\") \"Top2\"))\n\n----\n\nCopyright (C) 2011  Tomohiro Matsuyama <<tomo@cx4a.org>>\n" "README.md" nil nil nil nil nil nil)
		       ("popup.el" ";;; popup.el --- Visual Popup User Interface\n\n;; Copyright (C) 2009, 2010, 2011, 2012, 2013  Tomohiro Matsuyama\n\n;; Author: Tomohiro Matsuyama <tomo@cx4a.org>\n;; Keywords: lisp\n;; Version: 0.5.0\n;; Package-Requires: ((cl-lib \"0.3\"))\n\n;; This program is free software; you can redistribute it and/or modify\n;; it under the terms of the GNU General Public License as published by\n;; the Free Software Foundation, either version 3 of the License, or\n;; (at your option) any later version.\n\n;; This program is distributed in the hope that it will be useful,\n;; but WITHOUT ANY WARRANTY; without even the implied warranty of\n;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n;; GNU General Public License for more details.\n\n;; You should have received a copy of the GNU General Public License\n;; along with this program.  If not, see <http://www.gnu.org/licenses/>.\n\n;;; Commentary:\n\n;; popup.el is a visual popup user interface library for Emacs. This\n;; provides a basic API and common UI widgets such as popup tooltips\n;; and popup menus.\n;; See README.markdown for more information.\n\n;;; Code:\n\n(require 'cl-lib)\n\n(defconst popup-version \"0.5.0\")\n\n\f\n\n;;; Utilities\n\n(defun popup-calculate-max-width (max-width)\n  \"Determines whether the width desired is\ncharacter or window proportion based, And returns the result.\"\n  (cl-typecase max-width\n    (integer max-width)\n    (float (* (ceiling (/ (round (* max-width (window-width))) 10.0)) 10))))\n\n(defvar popup-use-optimized-column-computation t\n  \"Use the optimized column computation routine.\nIf there is a problem, please set it nil.\")\n\n(defmacro popup-aif (test then &rest else)\n  \"Anaphoric if.\"\n  (declare (indent 2))\n  `(let ((it ,test))\n     (if it ,then ,@else)))\n\n(defmacro popup-awhen (test &rest body)\n  \"Anaphoric when.\"\n  (declare (indent 1))\n  `(let ((it ,test))\n     (when it ,@body)))\n\n(defun popup-x-to-string (x)\n  \"Convert any object to string effeciently.\nThis is faster than `prin1-to-string' in many cases.\"\n  (cl-typecase x\n    (string x)\n    (symbol (symbol-name x))\n    (integer (number-to-string x))\n    (float (number-to-string x))\n    (t (format \"%s\" x))))\n\n(defun popup-substring-by-width (string width)\n  \"Return a cons cell of substring and remaining string by\nsplitting with WIDTH.\"\n  ;; Expand tabs into 4 spaces\n  (setq string (replace-regexp-in-string \"\\t\" \"    \" string))\n  (cl-loop with len = (length string)\n           with w = 0\n           for l from 0\n           for c in (append string nil)\n           while (<= (cl-incf w (char-width c)) width)\n           finally return\n           (if (< l len)\n               (cons (substring string 0 l) (substring string l))\n             (list string))))\n\n(defun popup-fill-string (string &optional width max-width justify squeeze)\n  \"Split STRING into fixed width strings and return a cons cell\nlike \\(WIDTH . ROWS). Here, the car WIDTH indicates the actual\nmaxim width of ROWS.\n\nThe argument WIDTH specifies the width of filling each\nparagraph. WIDTH nil means don't perform any justification and\nword wrap. Note that this function doesn't add any padding\ncharacters at the end of each row.\n\nMAX-WIDTH, if WIDTH is nil, specifies the maximum number of\ncolumns.\n\nThe optional fourth argument JUSTIFY specifies which kind of\njustification to do: `full', `left', `right', `center', or\n`none' (equivalent to nil).  A value of t means handle each\nparagraph as specified by its text properties.\n\nSQUEEZE nil means leave whitespaces other than line breaks\nuntouched.\"\n  (if (eq width 0)\n      (error \"Can't fill string with 0 width\"))\n  (if width\n      (setq max-width width))\n  (with-temp-buffer\n    (let ((tab-width 4)\n          (fill-column width)\n          (left-margin 0)\n          (kinsoku-limit 1)\n          indent-tabs-mode\n          row rows)\n      (insert string)\n      (untabify (point-min) (point-max))\n      (if width\n          (fill-region (point-min) (point-max) justify (not squeeze)))\n      (goto-char (point-min))\n      (setq width 0)\n      (while (prog2\n                 (let ((line (buffer-substring\n                              (point) (progn (end-of-line) (point)))))\n                   (if max-width\n                       (while (progn\n                                (setq row (truncate-string-to-width line max-width)\n                                      width (max width (string-width row)))\n                                (push row rows)\n                                (if (not (= (length row) (length line)))\n                                    (setq line (substring line (length row))))))\n                     (setq width (max width (string-width line)))\n                     (push line rows)))\n                 (< (point) (point-max))\n               (beginning-of-line 2)))\n      (cons width (nreverse rows)))))\n\n(defmacro popup-save-buffer-state (&rest body)\n  (declare (indent 0))\n  `(save-excursion\n     (let ((buffer-undo-list t)\n           (inhibit-read-only t)\n           (modified (buffer-modified-p)))\n       (unwind-protect\n           (progn ,@body)\n         (set-buffer-modified-p modified)))))\n\n(defun popup-window-full-width-p (&optional window)\n  \"A portable version of `window-full-width-p'.\"\n  (if (fboundp 'window-full-width-p)\n      (window-full-width-p window)\n    (= (window-width window) (frame-width (window-frame (or window (selected-window)))))))\n\n(defun popup-truncated-partial-width-window-p (&optional window)\n  \"A portable version of `truncated-partial-width-window-p'.\"\n  (unless window\n    (setq window (selected-window)))\n  (unless (popup-window-full-width-p window)\n    (let ((t-p-w-w (buffer-local-value 'truncate-partial-width-windows\n                                       (window-buffer window))))\n      (if (integerp t-p-w-w)\n          (< (window-width window) t-p-w-w)\n        t-p-w-w))))\n\n(defun popup-current-physical-column ()\n  \"Return the current physical column.\"\n  (or (when (and popup-use-optimized-column-computation\n                 (eq (window-hscroll) 0))\n        (let ((current-column (current-column)))\n          (if (or (popup-truncated-partial-width-window-p)\n                  truncate-lines\n                  (< current-column (window-width)))\n              current-column)))\n      (car (posn-col-row (posn-at-point)))))\n\n(defun popup-vertical-motion (column direction)\n  \"A portable version of `vertical-motion'.\"\n  (if (>= emacs-major-version 23)\n      (vertical-motion (cons column direction))\n    (vertical-motion direction)\n    (move-to-column (+ (current-column) column))))\n\n(defun popup-last-line-of-buffer-p ()\n  \"Return non-nil if the cursor is at the last line of the\nbuffer.\"\n  (save-excursion (end-of-line) (/= (forward-line) 0)))\n\n(defun popup-lookup-key-by-event (function event)\n  (or (funcall function (vector event))\n      (if (symbolp event)\n          (popup-aif (get event 'event-symbol-element-mask)\n              (funcall function\n                       (vector (logior (or (get (car it) 'ascii-character)\n                                           0)\n                                       (cadr it))))))))\n\n\f\n\n;;; Core\n\n(defgroup popup nil\n  \"Visual Popup User Interface\"\n  :group 'lisp\n  :prefix \"popup-\")\n\n(defface popup-face\n  '((t (:background \"lightgray\" :foreground \"black\")))\n  \"Face for popup.\"\n  :group 'popup)\n\n(defface popup-summary-face\n  '((t (:inherit popup-face :foreground \"dimgray\")))\n  \"Face for popup summary.\"\n  :group 'popup)\n\n(defface popup-scroll-bar-foreground-face\n  '((t (:background \"black\")))\n  \"Foreground face for scroll-bar.\"\n  :group 'popup)\n\n(defface popup-scroll-bar-background-face\n  '((t (:background \"gray\")))\n  \"Background face for scroll-bar.\"\n  :group 'popup)\n\n(defvar popup-instances nil\n  \"Popup instances.\")\n\n(defvar popup-scroll-bar-foreground-char\n  (propertize \" \" 'face 'popup-scroll-bar-foreground-face)\n  \"Foreground character for scroll-bar.\")\n\n(defvar popup-scroll-bar-background-char\n  (propertize \" \" 'face 'popup-scroll-bar-background-face)\n  \"Background character for scroll-bar.\")\n\n(cl-defstruct popup\n  point row column width height min-height direction overlays keymap\n  parent depth\n  face mouse-face selection-face summary-face\n  margin-left margin-right margin-left-cancel scroll-bar symbol\n  cursor offset scroll-top current-height list newlines\n  pattern original-list)\n\n(defun popup-item-propertize (item &rest properties)\n  \"Same as `propertize' except that this avoids overriding\nexisted value with `nil' property.\"\n  (cl-loop for (k v) on properties by 'cddr\n           if v append (list k v) into props\n           finally return\n           (apply 'propertize\n                  (popup-x-to-string item)\n                  props)))\n\n(defun popup-item-property (item property)\n  \"Same as `get-text-property' except that this returns nil if\nITEM is not string.\"\n  (if (stringp item)\n      (get-text-property 0 property item)))\n\n(cl-defun popup-make-item (name\n                           &key\n                           value\n                           face\n                           mouse-face\n                           selection-face\n                           sublist\n                           document\n                           symbol\n                           summary)\n  \"Utility function to make popup item. See also\n`popup-item-propertize'.\"\n  (popup-item-propertize name\n                         'value value\n                         'popup-face face\n                         'popup-mouse-face mouse-face\n                         'selection-face selection-face\n                         'document document\n                         'symbol symbol\n                         'summary summary\n                         'sublist sublist))\n\n(defsubst popup-item-value (item)               (popup-item-property item 'value))\n(defsubst popup-item-value-or-self (item)       (or (popup-item-value item) item))\n(defsubst popup-item-face (item)                (popup-item-property item 'popup-face))\n(defsubst popup-item-mouse-face (item)          (popup-item-property item 'popup-mouse-face))\n(defsubst popup-item-selection-face (item)      (popup-item-property item 'selection-face))\n(defsubst popup-item-document (item)            (popup-item-property item 'document))\n(defsubst popup-item-summary (item)             (popup-item-property item 'summary))\n(defsubst popup-item-symbol (item)              (popup-item-property item 'symbol))\n(defsubst popup-item-sublist (item)             (popup-item-property item 'sublist))\n\n(defun popup-item-documentation (item)\n  (let ((doc (popup-item-document item)))\n    (if (functionp doc)\n        (setq doc (funcall doc (popup-item-value-or-self item))))\n    doc))\n\n(defun popup-item-show-help-1 (item)\n  (let ((doc (popup-item-documentation item)))\n    (when doc\n      (with-current-buffer (get-buffer-create \" *Popup Help*\")\n        (erase-buffer)\n        (insert doc)\n        (goto-char (point-min))\n        (display-buffer (current-buffer)))\n      t)))\n\n(defun popup-item-show-help-with-event-loop (item)\n  (save-window-excursion\n    (when (popup-item-show-help-1 item)\n      (cl-loop do (clear-this-command-keys)\n               for key = (read-key-sequence-vector nil)\n               do\n               (cl-case (key-binding key)\n                 (scroll-other-window\n                  (scroll-other-window))\n                 (scroll-other-window-down\n                  (scroll-other-window-down nil))\n                 (otherwise\n                  (setq unread-command-events (append key unread-command-events))\n                  (cl-return)))))))\n\n(defun popup-item-show-help (item &optional persist)\n  \"Display the documentation of ITEM with `display-buffer'. If\nPERSIST is nil, the documentation buffer will be closed\nautomatically, meaning interal event loop ensures the buffer to\nbe closed. Otherwise, the buffer will be just displayed as\nusual.\"\n  (when item\n    (if (not persist)\n        (popup-item-show-help-with-event-loop item)\n      (popup-item-show-help-1 item))))\n\n(defun popup-set-list (popup list)\n  (popup-set-filtered-list popup list)\n  (setf (popup-pattern popup) nil)\n  (setf (popup-original-list popup) list))\n\n(defun popup-set-filtered-list (popup list)\n  (let ((offset\n         (if (> (popup-direction popup) 0)\n             0\n           (max (- (popup-height popup) (length list)) 0))))\n    (setf (popup-list popup) list\n          (popup-offset popup) offset)))\n\n(defun popup-selected-item (popup)\n  (nth (popup-cursor popup) (popup-list popup)))\n\n(defun popup-selected-line (popup)\n  (- (popup-cursor popup) (popup-scroll-top popup)))\n\n(defun popup-line-overlay (popup line)\n  (aref (popup-overlays popup) line))\n\n(defun popup-selected-line-overlay (popup)\n  (popup-line-overlay popup (popup-selected-line popup)))\n\n(defun popup-hide-line (popup line)\n  (let ((overlay (popup-line-overlay popup line)))\n    (overlay-put overlay 'display nil)\n    (overlay-put overlay 'after-string nil)))\n\n(defun popup-line-hidden-p (popup line)\n  (let ((overlay (popup-line-overlay popup line)))\n    (and (eq (overlay-get overlay 'display) nil)\n         (eq (overlay-get overlay 'after-string) nil))))\n\n(cl-defun popup-set-line-item (popup\n                               line\n                               &key\n                               item\n                               face\n                               mouse-face\n                               margin-left\n                               margin-right\n                               scroll-bar-char\n                               symbol\n                               summary\n                               summary-face\n                               keymap)\n  (let* ((overlay (popup-line-overlay popup line))\n         (content (popup-create-line-string popup (popup-x-to-string item)\n                                            :margin-left margin-left\n                                            :margin-right margin-right\n                                            :symbol symbol\n                                            :summary summary\n                                            :summary-face summary-face))\n         (start 0)\n         (prefix (overlay-get overlay 'prefix))\n         (postfix (overlay-get overlay 'postfix))\n         end)\n    (put-text-property 0 (length content) 'popup-item item content)\n    (put-text-property 0 (length content) 'keymap keymap content)\n    ;; Overlap face properties\n    (when (get-text-property start 'face content)\n      (setq start (next-single-property-change start 'face content)))\n    (while (and start (setq end (next-single-property-change start 'face content)))\n      (put-text-property start end 'face face content)\n      (setq start (next-single-property-change end 'face content)))\n    (when start\n      (put-text-property start (length content) 'face face content))\n    (when mouse-face\n      (put-text-property 0 (length content) 'mouse-face mouse-face content))\n    (unless (overlay-get overlay 'dangle)\n      (overlay-put overlay 'display (concat prefix (substring content 0 1)))\n      (setq prefix nil\n            content (concat (substring content 1))))\n    (overlay-put overlay\n                 'after-string\n                 (concat prefix\n                         content\n                         scroll-bar-char\n                         postfix))))\n\n(cl-defun popup-create-line-string (popup\n                                    string\n                                    &key\n                                    margin-left\n                                    margin-right\n                                    symbol\n                                    summary\n                                    summary-face)\n  (let* ((popup-width (popup-width popup))\n         (summary-width (string-width summary))\n         (content-width (max\n                         (min popup-width (string-width string))\n                         (- popup-width\n                            (if (> summary-width 0)\n                                (+ summary-width 2)\n                              0))))\n         (string (car (popup-substring-by-width string content-width)))\n         (string-width (string-width string))\n         (spacing (max (- popup-width string-width summary-width)\n                       (if (> popup-width string-width) 1 0)))\n         (truncated-summary\n          (car (popup-substring-by-width\n                summary (max (- popup-width string-width spacing) 0)))))\n    (when summary-face\n      (put-text-property 0 (length truncated-summary)\n                         'face summary-face truncated-summary))\n    (concat margin-left\n            string\n            (make-string spacing ? )\n            truncated-summary\n            symbol\n            margin-right)))\n\n(defun popup-live-p (popup)\n  \"Return non-nil if POPUP is alive.\"\n  (and popup (popup-overlays popup) t))\n\n(defun popup-child-point (popup &optional offset)\n  (overlay-end\n   (popup-line-overlay\n    popup\n    (or offset\n        (popup-selected-line popup)))))\n\n(defun popup-calculate-direction (height row)\n  \"Return a proper direction when displaying a popup on this\nwindow. HEIGHT is the a height of the popup, and ROW is a line\nnumber at the point.\"\n  (let* ((remaining-rows (- (max 1 (- (window-height)\n                                      (if mode-line-format 1 0)\n                                      (if header-line-format 1 0)))\n                            (count-lines (window-start) (point))))\n         (enough-space-above (> row height))\n         (enough-space-below (<= height remaining-rows)))\n    (if (and enough-space-above\n             (not enough-space-below))\n        -1\n      1)))\n\n(cl-defun popup-create (point\n                        width\n                        height\n                        &key\n                        min-height\n                        max-width\n                        around\n                        (face 'popup-face)\n                        mouse-face\n                        (selection-face face)\n                        (summary-face 'popup-summary-face)\n                        scroll-bar\n                        margin-left\n                        margin-right\n                        symbol\n                        parent\n                        parent-offset\n                        keymap)\n  \"Create a popup instance at POINT with WIDTH and HEIGHT.\n\nMIN-HEIGHT is a minimal height of the popup. The default value is\n0.\n\nMAX-WIDTH is the maximum width of the popup. The default value is\nnil (no limit). If a floating point, the value refers to the ratio of\nthe window. If an integer, limit is in characters.\n\nIf AROUND is non-nil, the popup will be displayed around the\npoint but not at the point.\n\nFACE is a background face of the popup. The default value is POPUP-FACE.\n\nSELECTION-FACE is a foreground (selection) face of the popup The\ndefault value is POPUP-FACE.\n\nIf SCROLL-BAR is non-nil, the popup will have a scroll bar at the\nright.\n\nIf MARGIN-LEFT is non-nil, the popup will have a margin at the\nleft.\n\nIf MARGIN-RIGHT is non-nil, the popup will have a margin at the\nright.\n\nSYMBOL is a single character which indicates a kind of the item.\n\nPARENT is a parent popup instance. If PARENT is omitted, the\npopup will be a root instance.\n\nPARENT-OFFSET is a row offset from the parent popup.\n\nKEYMAP is a keymap that will be put on the popup contents.\"\n  (or margin-left (setq margin-left 0))\n  (or margin-right (setq margin-right 0))\n  (unless point\n    (setq point\n          (if parent (popup-child-point parent parent-offset) (point))))\n  (when max-width\n    (setq width (min width (popup-calculate-max-width max-width))))\n  (save-excursion\n    (goto-char point)\n    (let* ((row (line-number-at-pos))\n           (column (popup-current-physical-column))\n           (overlays (make-vector height nil))\n           (popup-width (+ width\n                           (if scroll-bar 1 0)\n                           margin-left\n                           margin-right\n                           (if symbol 2 0)))\n           margin-left-cancel\n           (window (selected-window))\n           (window-start (window-start))\n           (window-hscroll (window-hscroll))\n           (window-width (window-width))\n           (right (+ column popup-width))\n           (overflow (and (> right window-width)\n                          (>= right popup-width)))\n           (foldable (and (null parent)\n                          (>= column popup-width)))\n           (direction (or\n                       ;; Currently the direction of cascade popup won't be changed\n                       (and parent (popup-direction parent))\n\n                       ;; Calculate direction\n                       (popup-calculate-direction height row)))\n           (depth (if parent (1+ (popup-depth parent)) 0))\n           (newlines (max 0 (+ (- height (count-lines point (point-max))) (if around 1 0))))\n           current-column)\n      ;; Case: no newlines at the end of the buffer\n      (when (> newlines 0)\n        (popup-save-buffer-state\n          (goto-char (point-max))\n          (insert (make-string newlines ?\\n))))\n\n      ;; Case: the popup overflows\n      (if overflow\n          (if foldable\n              (progn\n                (cl-decf column (- popup-width margin-left margin-right))\n                (unless around (move-to-column column)))\n            (when (not truncate-lines)\n              ;; Truncate.\n              (let ((d (1+ (- popup-width (- window-width column)))))\n                (cl-decf popup-width d)\n                (cl-decf width d)))\n            (cl-decf column margin-left))\n        (cl-decf column margin-left))\n\n      ;; Case: no space at the left\n      (when (and (null parent)\n                 (< column 0))\n        ;; Cancel margin left\n        (setq column 0)\n        (cl-decf popup-width margin-left)\n        (setq margin-left-cancel t))\n\n      (dotimes (i height)\n        (let (overlay begin w (dangle t) (prefix \"\") (postfix \"\"))\n          (when around\n            (popup-vertical-motion column direction))\n          (setq around t\n                current-column (popup-current-physical-column))\n\n          (when (> current-column column)\n            (backward-char)\n            (setq current-column (popup-current-physical-column)))\n          (when (< current-column column)\n            ;; Extend short buffer lines by popup prefix (line of spaces)\n            (setq prefix (make-string\n                          (+ (if (= current-column 0)\n                                 (- window-hscroll (current-column))\n                               0)\n                             (- column current-column))\n                          ? )))\n\n          (setq begin (point))\n          (setq w (+ popup-width (length prefix)))\n          (while (and (not (eolp)) (> w 0))\n            (setq dangle nil)\n            (cl-decf w (char-width (char-after)))\n            (forward-char))\n          (if (< w 0)\n              (setq postfix (make-string (- w) ? )))\n\n          (setq overlay (make-overlay begin (point)))\n          (overlay-put overlay 'window window)\n          (overlay-put overlay 'dangle dangle)\n          (overlay-put overlay 'prefix prefix)\n          (overlay-put overlay 'postfix postfix)\n          (overlay-put overlay 'width width)\n          (aset overlays\n                (if (> direction 0) i (- height i 1))\n                overlay)))\n      (cl-loop for p from (- 10000 (* depth 1000))\n               for overlay in (nreverse (append overlays nil))\n               do (overlay-put overlay 'priority p))\n      (let ((it (make-popup :point point\n                            :row row\n                            :column column\n                            :width width\n                            :height height\n                            :min-height min-height\n                            :direction direction\n                            :parent parent\n                            :depth depth\n                            :face face\n                            :mouse-face mouse-face\n                            :selection-face selection-face\n                            :summary-face summary-face\n                            :margin-left margin-left\n                            :margin-right margin-right\n                            :margin-left-cancel margin-left-cancel\n                            :scroll-bar scroll-bar\n                            :symbol symbol\n                            :cursor 0\n                            :offset 0\n                            :scroll-top 0\n                            :current-height 0\n                            :list nil\n                            :newlines newlines\n                            :overlays overlays\n                            :keymap keymap)))\n        (push it popup-instances)\n        it))))\n\n(defun popup-delete (popup)\n  \"Delete POPUP instance.\"\n  (when (popup-live-p popup)\n    (popup-hide popup)\n    (mapc 'delete-overlay (popup-overlays popup))\n    (setf (popup-overlays popup) nil)\n    (setq popup-instances (delq popup popup-instances))\n    ;; Restore newlines state\n    (let ((newlines (popup-newlines popup)))\n      (when (> newlines 0)\n        (popup-save-buffer-state\n          (goto-char (point-max))\n          (dotimes (i newlines)\n            (if (and (char-before)\n                     (= (char-before) ?\\n))\n                (delete-char -1)))))))\n  nil)\n\n(defun popup-draw (popup)\n  \"Draw POPUP.\"\n  (cl-loop with height = (popup-height popup)\n           with min-height = (popup-min-height popup)\n           with popup-face = (popup-face popup)\n           with mouse-face = (popup-mouse-face popup)\n           with selection-face = (popup-selection-face popup)\n           with summary-face-0 = (popup-summary-face popup)\n           with list = (popup-list popup)\n           with length = (length list)\n           with thum-size = (max (/ (* height height) (max length 1)) 1)\n           with page-size = (/ (+ 0.0 (max length 1)) height)\n           with scroll-bar = (popup-scroll-bar popup)\n           with margin-left = (make-string (if (popup-margin-left-cancel popup) 0 (popup-margin-left popup)) ? )\n           with margin-right = (make-string (popup-margin-right popup) ? )\n           with symbol = (popup-symbol popup)\n           with cursor = (popup-cursor popup)\n           with scroll-top = (popup-scroll-top popup)\n           with offset = (popup-offset popup)\n           with keymap = (popup-keymap popup)\n           for o from offset\n           for i from scroll-top\n           while (< o height)\n           for item in (nthcdr scroll-top list)\n           for page-index = (* thum-size (/ o thum-size))\n           for face = (if (= i cursor)\n                          (or (popup-item-selection-face item) selection-face)\n                        (or (popup-item-face item) popup-face))\n           for summary-face = (unless (= i cursor) summary-face-0)\n           for empty-char = (propertize \" \" 'face face)\n           for scroll-bar-char = (if scroll-bar\n                                     (cond\n                                      ((and (not (eq scroll-bar :always))\n                                            (<= page-size 1))\n                                       empty-char)\n                                      ((and (> page-size 1)\n                                            (>= cursor (* page-index page-size))\n                                            (< cursor (* (+ page-index thum-size) page-size)))\n                                       popup-scroll-bar-foreground-char)\n                                      (t\n                                       popup-scroll-bar-background-char))\n                                   \"\")\n           for sym = (if symbol\n                         (concat \" \" (or (popup-item-symbol item) \" \"))\n                       \"\")\n           for summary = (or (popup-item-summary item) \"\")\n\n           do\n           ;; Show line and set item to the line\n           (popup-set-line-item popup o\n                                :item item\n                                :face face\n                                :mouse-face mouse-face\n                                :margin-left margin-left\n                                :margin-right margin-right\n                                :scroll-bar-char scroll-bar-char\n                                :symbol sym\n                                :summary summary\n                                :summary-face summary-face\n                                :keymap keymap)\n\n           finally\n           ;; Remember current height\n           (setf (popup-current-height popup) (- o offset))\n\n           ;; Hide remaining lines\n           (let ((scroll-bar-char (if scroll-bar (propertize \" \" 'face popup-face) \"\"))\n                 (symbol (if symbol \" \" \"\")))\n             (if (> (popup-direction popup) 0)\n                 (progn\n                   (when min-height\n                     (while (< o min-height)\n                       (popup-set-line-item popup o\n                                            :item \"\"\n                                            :face popup-face\n                                            :margin-left margin-left\n                                            :margin-right margin-right\n                                            :scroll-bar-char scroll-bar-char\n                                            :symbol symbol\n                                            :summary \"\")\n                       (cl-incf o)))\n                   (while (< o height)\n                     (popup-hide-line popup o)\n                     (cl-incf o)))\n               (cl-loop with h = (if min-height (- height min-height) offset)\n                        for o from 0 below offset\n                        if (< o h)\n                        do (popup-hide-line popup o)\n                        if (>= o h)\n                        do (popup-set-line-item popup o\n                                                :item \"\"\n                                                :face popup-face\n                                                :margin-left margin-left\n                                                :margin-right margin-right\n                                                :scroll-bar-char scroll-bar-char\n                                                :symbol symbol\n                                                :summary \"\"))))))\n\n(defun popup-hide (popup)\n  \"Hide POPUP.\"\n  (dotimes (i (popup-height popup))\n    (popup-hide-line popup i)))\n\n(defun popup-hidden-p (popup)\n  \"Return non-nil if POPUP is hidden.\"\n  (let ((hidden t))\n    (when (popup-live-p popup)\n      (dotimes (i (popup-height popup))\n        (unless (popup-line-hidden-p popup i)\n          (setq hidden nil))))\n    hidden))\n\n(defun popup-jump (popup cursor)\n  \"Jump to a position specified by CURSOR of POPUP and draw.\"\n  (let ((scroll-top (popup-scroll-top popup)))\n    ;; Do not change page as much as possible.\n    (unless (and (<= scroll-top cursor)\n                 (< cursor (+ scroll-top (popup-height popup))))\n      (setf (popup-scroll-top popup) cursor))\n    (setf (popup-cursor popup) cursor)\n    (popup-draw popup)))\n\n(defun popup-select (popup i)\n  \"Select the item at I of POPUP and draw.\"\n  (setq i (+ i (popup-offset popup)))\n  (when (and (<= 0 i) (< i (popup-height popup)))\n    (setf (popup-cursor popup) i)\n    (popup-draw popup)\n    t))\n\n(defun popup-next (popup)\n  \"Select the next item of POPUP and draw.\"\n  (let ((height (popup-height popup))\n        (cursor (1+ (popup-cursor popup)))\n        (scroll-top (popup-scroll-top popup))\n        (length (length (popup-list popup))))\n    (cond\n     ((>= cursor length)\n      ;; Back to first page\n      (setq cursor 0\n            scroll-top 0))\n     ((= cursor (+ scroll-top height))\n      ;; Go to next page\n      (setq scroll-top (min (1+ scroll-top) (max (- length height) 0)))))\n    (setf (popup-cursor popup) cursor\n          (popup-scroll-top popup) scroll-top)\n    (popup-draw popup)))\n\n(defun popup-previous (popup)\n  \"Select the previous item of POPUP and draw.\"\n  (let ((height (popup-height popup))\n        (cursor (1- (popup-cursor popup)))\n        (scroll-top (popup-scroll-top popup))\n        (length (length (popup-list popup))))\n    (cond\n     ((< cursor 0)\n      ;; Go to last page\n      (setq cursor (1- length)\n            scroll-top (max (- length height) 0)))\n     ((= cursor (1- scroll-top))\n      ;; Go to previous page\n      (cl-decf scroll-top)))\n    (setf (popup-cursor popup) cursor\n          (popup-scroll-top popup) scroll-top)\n    (popup-draw popup)))\n\n(defun popup-page-next (popup)\n  \"Select next item of POPUP per `popup-height' range.\nPages down through POPUP.\"\n  (dotimes (counter (1- (popup-height popup)))\n    (popup-next popup)))\n\n(defun popup-page-previous (popup)\n  \"Select previous item of POPUP per `popup-height' range.\nPages up through POPUP.\"\n  (dotimes (counter (1- (popup-height popup)))\n    (popup-previous popup)))\n\n(defun popup-scroll-down (popup &optional n)\n  \"Scroll down N of POPUP and draw.\"\n  (let ((scroll-top (min (+ (popup-scroll-top popup) (or n 1))\n                         (- (length (popup-list popup)) (popup-height popup)))))\n    (setf (popup-cursor popup) scroll-top\n          (popup-scroll-top popup) scroll-top)\n    (popup-draw popup)))\n\n(defun popup-scroll-up (popup &optional n)\n  \"Scroll up N of POPUP and draw.\"\n  (let ((scroll-top (max (- (popup-scroll-top popup) (or n 1))\n                         0)))\n    (setf (popup-cursor popup) scroll-top\n          (popup-scroll-top popup) scroll-top)\n    (popup-draw popup)))\n\n\f\n\n;;; Popup Incremental Search\n\n(defface popup-isearch-match\n  '((t (:background \"sky blue\")))\n  \"Popup isearch match face.\"\n  :group 'popup)\n\n(defvar popup-isearch-cursor-color \"blue\")\n\n(defvar popup-isearch-keymap\n  (let ((map (make-sparse-keymap)))\n    ;(define-key map \"\\r\"        'popup-isearch-done)\n    (define-key map \"\\C-g\"      'popup-isearch-cancel)\n    (define-key map \"\\C-b\"      'popup-isearch-close)\n    (define-key map [left]      'popup-isearch-close)\n    (define-key map \"\\C-h\"      'popup-isearch-delete)\n    (define-key map (kbd \"DEL\") 'popup-isearch-delete)\n    map))\n\n(defvar popup-menu-show-quick-help-function 'popup-menu-show-quick-help\n  \"Function used for showing quick help by `popup-menu*'.\")\n\n(defsubst popup-isearch-char-p (char)\n  (and (integerp char)\n       (<= 32 char)\n       (<= char 126)))\n\n(defun popup-isearch-filter-list (pattern list)\n  (cl-loop with regexp = (regexp-quote pattern)\n           for item in list\n           do\n           (unless (stringp item)\n             (setq item (popup-item-propertize (popup-x-to-string item)\n                                               'value item)))\n           if (string-match regexp item)\n           collect\n           (let ((beg (match-beginning 0))\n                 (end (match-end 0)))\n             (alter-text-property 0 (length item) 'face\n                                  (lambda (prop)\n                                    (unless (eq prop 'popup-isearch-match)\n                                      prop))\n                                  item)\n             (put-text-property beg end\n                                'face 'popup-isearch-match\n                                item)\n             item)))\n\n(defun popup-isearch-prompt (popup pattern)\n  (format \"Pattern: %s\" (if (= (length (popup-list popup)) 0)\n                            (propertize pattern 'face 'isearch-fail)\n                          pattern)))\n\n(defun popup-isearch-update (popup pattern &optional callback)\n  (setf (popup-cursor popup) 0\n        (popup-scroll-top popup) 0\n        (popup-pattern popup) pattern)\n  (let ((list (popup-isearch-filter-list pattern (popup-original-list popup))))\n    (popup-set-filtered-list popup list)\n    (if callback\n        (funcall callback list)))\n  (popup-draw popup))\n\n(cl-defun popup-isearch (popup\n                         &key\n                         (cursor-color popup-isearch-cursor-color)\n                         (keymap popup-isearch-keymap)\n                         callback\n                         help-delay)\n  \"Start isearch on POPUP. This function is synchronized, meaning\nevent loop waits for quiting of isearch.\n\nCURSOR-COLOR is a cursor color during isearch. The default value\nis `popup-isearch-cursor-color'.\n\nKEYMAP is a keymap which is used when processing events during\nevent loop. The default value is `popup-isearch-keymap'.\n\nCALLBACK is a function taking one argument. `popup-isearch' calls\nCALLBACK, if specified, after isearch finished or isearch\ncanceled. The arguments is whole filtered list of items.\n\nHELP-DELAY is a delay of displaying helps.\"\n  (let ((list (popup-original-list popup))\n        (pattern (or (popup-pattern popup) \"\"))\n        (old-cursor-color (frame-parameter (selected-frame) 'cursor-color))\n        prompt key binding)\n    (unwind-protect\n        (cl-block nil\n          (if cursor-color\n              (set-cursor-color cursor-color))\n          (while t\n            (setq prompt (popup-isearch-prompt popup pattern))\n            (setq key (popup-menu-read-key-sequence keymap prompt help-delay))\n            (if (null key)\n                (unless (funcall popup-menu-show-quick-help-function popup nil :prompt prompt)\n                  (clear-this-command-keys)\n                  (push (read-event prompt) unread-command-events))\n              (setq binding (lookup-key keymap key))\n              (cond\n               ((and (stringp key)\n                     (popup-isearch-char-p (aref key 0)))\n                (setq pattern (concat pattern key)))\n               ((eq binding 'popup-isearch-done)\n                (cl-return nil))\n               ((eq binding 'popup-isearch-cancel)\n                (popup-isearch-update popup \"\" callback)\n                (cl-return t))\n               ((eq binding 'popup-isearch-close)\n                (popup-isearch-update popup \"\" callback)\n                (setq unread-command-events\n                      (append (listify-key-sequence key) unread-command-events))\n                (cl-return nil))\n               ((eq binding 'popup-isearch-delete)\n                (if (> (length pattern) 0)\n                    (setq pattern (substring pattern 0 (1- (length pattern))))))\n               (t\n                (setq unread-command-events\n                      (append (listify-key-sequence key) unread-command-events))\n                (cl-return nil)))\n              (popup-isearch-update popup pattern callback))))\n      (if old-cursor-color\n          (set-cursor-color old-cursor-color)))))\n\n\f\n\n;;; Popup Tip\n\n(defface popup-tip-face\n  '((t (:background \"khaki1\" :foreground \"black\")))\n  \"Face for popup tip.\"\n  :group 'popup)\n\n(defvar popup-tip-max-width 80)\n\n(cl-defun popup-tip (string\n                     &key\n                     point\n                     (around t)\n                     width\n                     (height 15)\n                     min-height\n                     max-width\n                     truncate\n                     margin\n                     margin-left\n                     margin-right\n                     scroll-bar\n                     parent\n                     parent-offset\n                     nowait\n                     nostrip\n                     prompt\n                     &aux tip lines)\n  \"Show a tooltip of STRING at POINT. This function is\nsynchronized unless NOWAIT specified. Almost arguments are same\nas `popup-create' except for TRUNCATE, NOWAIT, and PROMPT.\n\nIf TRUNCATE is non-nil, the tooltip can be truncated.\n\nIf NOWAIT is non-nil, this function immediately returns the\ntooltip instance without entering event loop.\n\nIf `NOSTRIP` is non-nil, `STRING` properties are not stripped.\n\nPROMPT is a prompt string when reading events during event loop.\"\n  (if (bufferp string)\n      (setq string (with-current-buffer string (buffer-string))))\n\n  (unless nostrip\n    ;; TODO strip text (mainly face) properties\n    (setq string (substring-no-properties string)))\n\n  (and (eq margin t) (setq margin 1))\n  (or margin-left (setq margin-left margin))\n  (or margin-right (setq margin-right margin))\n\n  (let ((it (popup-fill-string string width popup-tip-max-width)))\n    (setq width (car it)\n          lines (cdr it)))\n\n  (setq tip (popup-create point width height\n                          :min-height min-height\n                          :max-width max-width\n                          :around around\n                          :margin-left margin-left\n                          :margin-right margin-right\n                          :scroll-bar scroll-bar\n                          :face 'popup-tip-face\n                          :parent parent\n                          :parent-offset parent-offset))\n\n  (unwind-protect\n      (when (> (popup-width tip) 0)                   ; not to be corrupted\n        (when (and (not (eq width (popup-width tip))) ; truncated\n                   (not truncate))\n          ;; Refill once again to lines be fitted to popup width\n          (setq width (popup-width tip))\n          (setq lines (cdr (popup-fill-string string width width))))\n\n        (popup-set-list tip lines)\n        (popup-draw tip)\n        (if nowait\n            tip\n          (clear-this-command-keys)\n          (push (read-event prompt) unread-command-events)\n          t))\n    (unless nowait\n      (popup-delete tip))))\n\n\f\n\n;;; Popup Menu\n\n(defface popup-menu-face\n  '((t (:inherit popup-face)))\n  \"Face for popup menu.\"\n  :group 'popup)\n\n(defface popup-menu-mouse-face\n  '((t (:background \"blue\" :foreground \"white\")))\n  \"Face for popup menu.\"\n  :group 'popup)\n\n(defface popup-menu-selection-face\n  '((t (:background \"steelblue\" :foreground \"white\")))\n  \"Face for popup menu selection.\"\n  :group 'popup)\n\n(defface popup-menu-summary-face\n  '((t (:inherit popup-summary-face)))\n  \"Face for popup summary.\"\n  :group 'popup)\n\n(defvar popup-menu-show-tip-function 'popup-tip\n  \"Function used for showing tooltip by `popup-menu-show-quick-help'.\")\n\n(defun popup-menu-show-help (menu &optional persist item)\n  (popup-item-show-help (or item (popup-selected-item menu)) persist))\n\n(defun popup-menu-documentation (menu &optional item)\n  (popup-item-documentation (or item (popup-selected-item menu))))\n\n(defun popup-menu-show-quick-help (menu &optional item &rest args)\n  (let* ((point (plist-get args :point))\n         (height (or (plist-get args :height) (popup-height menu)))\n         (min-height (min height (popup-current-height menu)))\n         (around nil)\n         (parent-offset (popup-offset menu))\n         (doc (popup-menu-documentation menu item)))\n    (when (stringp doc)\n      (if (popup-hidden-p menu)\n          (setq around t\n                menu nil\n                parent-offset nil)\n        (setq point nil))\n      (let ((popup-use-optimized-column-computation nil)) ; To avoid wrong positioning\n        (apply popup-menu-show-tip-function\n               doc\n               :point point\n               :height height\n               :min-height min-height\n               :around around\n               :parent menu\n               :parent-offset parent-offset\n               args)))))\n\n(defun popup-menu-item-of-mouse-event (event)\n  (when (and (consp event)\n             (memq (cl-first event) '(mouse-1 mouse-2 mouse-3 mouse-4 mouse-5)))\n    (let* ((position (cl-second event))\n           (object (elt position 4)))\n      (when (consp object)\n        (get-text-property (cdr object) 'popup-item (car object))))))\n\n(defun popup-menu-read-key-sequence (keymap &optional prompt timeout)\n  (catch 'timeout\n    (let ((timer (and timeout\n                      (run-with-timer timeout nil\n                                      (lambda ()\n                                        (if (zerop (length (this-command-keys)))\n                                            (throw 'timeout nil))))))\n          (old-global-map (current-global-map))\n          (temp-global-map (make-sparse-keymap))\n          (overriding-terminal-local-map (make-sparse-keymap)))\n      (substitute-key-definition 'keyboard-quit 'keyboard-quit\n                                 temp-global-map old-global-map)\n      (define-key temp-global-map [menu-bar] (lookup-key old-global-map [menu-bar]))\n      (define-key temp-global-map [tool-bar] (lookup-key old-global-map [tool-bar]))\n      (set-keymap-parent overriding-terminal-local-map keymap)\n      (if (current-local-map)\n          (define-key overriding-terminal-local-map [menu-bar]\n            (lookup-key (current-local-map) [menu-bar])))\n      (unwind-protect\n          (progn\n            (use-global-map temp-global-map)\n            (clear-this-command-keys)\n            (with-temp-message prompt\n              (read-key-sequence nil)))\n        (use-global-map old-global-map)\n        (if timer (cancel-timer timer))))))\n\n(defun popup-menu-fallback (event default))\n\n(cl-defun popup-menu-event-loop (menu\n                                 keymap\n                                 fallback\n                                 &key\n                                 prompt\n                                 help-delay\n                                 isearch\n                                 isearch-cursor-color\n                                 isearch-keymap\n                                 isearch-callback\n                                 &aux key binding)\n  (cl-block nil\n    (while (popup-live-p menu)\n      (and isearch\n           (popup-isearch menu\n                          :cursor-color isearch-cursor-color\n                          :keymap isearch-keymap\n                          :callback isearch-callback\n                          :help-delay help-delay)\n           (keyboard-quit))\n      (setq key (popup-menu-read-key-sequence keymap prompt help-delay))\n      (setq binding (and key (lookup-key keymap key)))\n      (cond\n       ((or (null key) (zerop (length key)))\n        (unless (funcall popup-menu-show-quick-help-function menu nil :prompt prompt)\n          (clear-this-command-keys)\n          (push (read-event prompt) unread-command-events)))\n       ((eq (lookup-key (current-global-map) key) 'keyboard-quit)\n        (keyboard-quit)\n        (cl-return))\n       ((eq binding 'popup-close)\n        (if (popup-parent menu)\n            (cl-return)))\n       ((memq binding '(popup-select popup-open))\n        (let* ((item (or (popup-menu-item-of-mouse-event (elt key 0))\n                         (popup-selected-item menu)))\n               (index (cl-position item (popup-list menu)))\n               (sublist (popup-item-sublist item)))\n          (unless index (cl-return))\n          (if sublist\n              (popup-aif (let (popup-use-optimized-column-computation)\n                           (popup-cascade-menu sublist\n                                               :around nil\n                                               :margin-left (popup-margin-left menu)\n                                               :margin-right (popup-margin-right menu)\n                                               :scroll-bar (popup-scroll-bar menu)\n                                               :parent menu\n                                               :parent-offset index\n                                               :help-delay help-delay\n                                               :isearch isearch\n                                               :isearch-cursor-color isearch-cursor-color\n                                               :isearch-keymap isearch-keymap\n                                               :isearch-callback isearch-callback))\n                  (and it (cl-return it)))\n            (if (eq binding 'popup-select)\n                (cl-return (popup-item-value-or-self item))))))\n       ((eq binding 'popup-next)\n        (popup-next menu))\n       ((eq binding 'popup-previous)\n        (popup-previous menu))\n       ((eq binding 'popup-page-next)\n        (popup-page-next menu))\n       ((eq binding 'popup-page-previous)\n        (popup-page-previous menu))\n       ((eq binding 'popup-help)\n        (popup-menu-show-help menu))\n       ((eq binding 'popup-isearch)\n        (popup-isearch menu\n                       :cursor-color isearch-cursor-color\n                       :keymap isearch-keymap\n                       :callback isearch-callback\n                       :help-delay help-delay))\n       ((commandp binding)\n        (call-interactively binding))\n       (t\n        (funcall fallback key (key-binding key)))))))\n\n(defun popup-preferred-width (list)\n  \"Return the preferred width to show LIST beautifully.\"\n  (cl-loop with tab-width = 4\n           for item in list\n           for summary = (popup-item-summary item)\n           maximize (string-width (popup-x-to-string item)) into width\n           if (stringp summary)\n           maximize (+ (string-width summary) 2) into summary-width\n           finally return\n           (let ((total (+ (or width 0) (or summary-width 0))))\n             (* (ceiling (/ total 10.0)) 10))))\n\n(defvar popup-menu-keymap\n  (let ((map (make-sparse-keymap)))\n    (define-key map \"\\r\"        'popup-select)\n    (define-key map \"\\C-f\"      'popup-open)\n    (define-key map [right]     'popup-open)\n    (define-key map \"\\C-b\"      'popup-close)\n    (define-key map [left]      'popup-close)\n\n    (define-key map \"\\C-n\"      'popup-next)\n    (define-key map [down]      'popup-next)\n    (define-key map \"\\C-p\"      'popup-previous)\n    (define-key map [up]        'popup-previous)\n\n    (define-key map [next]      'popup-page-next)\n    (define-key map [prior]     'popup-page-previous)\n\n    (define-key map [f1]        'popup-help)\n    (define-key map (kbd \"\\C-?\") 'popup-help)\n\n    (define-key map \"\\C-s\"      'popup-isearch)\n\n    (define-key map [mouse-1]   'popup-select)\n    (define-key map [mouse-4]   'popup-previous)\n    (define-key map [mouse-5]   'popup-next)\n    map))\n\n(cl-defun popup-menu* (list\n                       &key\n                       point\n                       (around t)\n                       (width (popup-preferred-width list))\n                       (height 15)\n                       max-width\n                       margin\n                       margin-left\n                       margin-right\n                       scroll-bar\n                       symbol\n                       parent\n                       parent-offset\n                       cursor\n                       (keymap popup-menu-keymap)\n                       (fallback 'popup-menu-fallback)\n                       help-delay\n                       nowait\n                       prompt\n                       isearch\n                       (isearch-cursor-color popup-isearch-cursor-color)\n                       (isearch-keymap popup-isearch-keymap)\n                       isearch-callback\n                       initial-index\n                       &aux menu event)\n  \"Show a popup menu of LIST at POINT. This function returns a\nvalue of the selected item. Almost arguments are same as\n`popup-create' except for KEYMAP, FALLBACK, HELP-DELAY, PROMPT,\nISEARCH, ISEARCH-CURSOR-COLOR, ISEARCH-KEYMAP, and\nISEARCH-CALLBACK.\n\nIf KEYMAP is a keymap which is used when processing events during\nevent loop.\n\nIf FALLBACK is a function taking two arguments; a key and a\ncommand. FALLBACK is called when no special operation is found on\nthe key. The default value is `popup-menu-fallback', which does\nnothing.\n\nHELP-DELAY is a delay of displaying helps.\n\nIf NOWAIT is non-nil, this function immediately returns the menu\ninstance without entering event loop.\n\nPROMPT is a prompt string when reading events during event loop.\n\nIf ISEARCH is non-nil, do isearch as soon as displaying the popup\nmenu.\n\nISEARCH-CURSOR-COLOR is a cursor color during isearch. The\ndefault value is `popup-isearch-cursor-color'.\n\nISEARCH-KEYMAP is a keymap which is used when processing events\nduring event loop. The default value is `popup-isearch-keymap'.\n\nISEARCH-CALLBACK is a function taking one argument.  `popup-menu'\ncalls ISEARCH-CALLBACK, if specified, after isearch finished or\nisearch canceled. The arguments is whole filtered list of items.\n\nIf `INITIAL-INDEX' is non-nil, this is an initial index value for\n`popup-select'. Only positive integer is valid.\"\n  (and (eq margin t) (setq margin 1))\n  (or margin-left (setq margin-left margin))\n  (or margin-right (setq margin-right margin))\n  (if (and scroll-bar\n           (integerp margin-right)\n           (> margin-right 0))\n      ;; Make scroll-bar space as margin-right\n      (cl-decf margin-right))\n  (setq menu (popup-create point width height\n                           :max-width max-width\n                           :around around\n                           :face 'popup-menu-face\n                           :mouse-face 'popup-menu-mouse-face\n                           :selection-face 'popup-menu-selection-face\n                           :summary-face 'popup-menu-summary-face\n                           :margin-left margin-left\n                           :margin-right margin-right\n                           :scroll-bar scroll-bar\n                           :symbol symbol\n                           :parent parent\n                           :parent-offset parent-offset))\n  (unwind-protect\n      (progn\n        (popup-set-list menu list)\n        (if cursor\n            (popup-jump menu cursor)\n          (popup-draw menu))\n        (when initial-index\n          (popup-select menu\n                        (min (- (length list) 1) initial-index)))\n        (if nowait\n            menu\n          (popup-menu-event-loop menu keymap fallback\n                                 :prompt prompt\n                                 :help-delay help-delay\n                                 :isearch isearch\n                                 :isearch-cursor-color isearch-cursor-color\n                                 :isearch-keymap isearch-keymap\n                                 :isearch-callback isearch-callback)))\n    (unless nowait\n      (popup-delete menu))))\n\n(defun popup-cascade-menu (list &rest args)\n  \"Same as `popup-menu' except that an element of LIST can be\nalso a sub-menu if the element is a cons cell formed (ITEM\n. SUBLIST) where ITEM is an usual item and SUBLIST is a list of\nthe sub menu.\"\n  (apply 'popup-menu*\n         (mapcar (lambda (item)\n                   (if (consp item)\n                       (popup-make-item (car item)\n                                        :sublist (cdr item)\n                                        :symbol \">\")\n                     item))\n                 list)\n         :symbol t\n         args))\n\n(provide 'popup)\n;;; popup.el ends here\n" "popup.el" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("popup-interactive-test.el" "(require 'popup)\n\n(defmacro test (explain &rest body)\n  (declare (indent 1))\n  `(let ((buf \"*buf*\")\n         (window-config (current-window-configuration)))\n     (unwind-protect\n         (progn\n           (delete-other-windows)\n           (switch-to-buffer buf)\n           (erase-buffer)\n           (insert \" \")\n           (let ((success (progn ,@body)))\n             (unless success\n               (error \"failed: %s\" ,explain))))\n       (when popup\n         (popup-delete popup)\n         (setq popup nil))\n       (kill-buffer buf)\n       (set-window-configuration window-config))))\n\n(defmacro ui-test (prompt &rest body)\n  (declare (indent 1))\n  `(test ,prompt ,@body (yes-or-no-p ,prompt)))\n\n(defun input (key)\n  (push key unread-command-events))\n\n(defvar popup nil)\n\n(test \"popup-create\"\n  (setq popup (popup-create (point) 10 10)))\n\n(test \"popup-delete\"\n  (setq popup (popup-create (point) 10 10))\n  (popup-delete popup)\n  (not (popup-live-p popup)))\n\n(ui-test \"popup?\"\n  (setq popup (popup-create (point) 10 10))\n  (popup-set-list popup '(\"hello\" \"world\"))\n  (popup-draw popup))\n\n(ui-test \"hidden?\"\n  (setq popup (popup-create (point) 10 10))\n  (popup-set-list popup '(\"hello\" \"world\"))\n  (popup-draw popup)\n  (popup-hide popup))\n\n(ui-test \"isearch?\"\n  (setq popup (popup-create (point) 10 10))\n  (popup-set-list popup '(\"hello\" \"world\"))\n  (popup-draw popup)\n  (input ?e)\n  (popup-isearch popup))\n\n(ui-test \"tip?\"\n  (popup-tip\n   \"Start isearch on POPUP. This function is synchronized, meaning\nevent loop waits for quiting of isearch.\n\nCURSOR-COLOR is a cursor color during isearch. The default value\nis `popup-isearch-cursor-color'.\n\nKEYMAP is a keymap which is used when processing events during\nevent loop. The default value is `popup-isearch-keymap'.\n\nCALLBACK is a function taking one argument. `popup-isearch' calls\nCALLBACK, if specified, after isearch finished or isearch\ncanceled. The arguments is whole filtered list of items.\n\nHELP-DELAY is a delay of displaying helps.\"\n   :nowait t))\n\n(ui-test \"fold?\"\n  (let ((s (make-string (- (window-width) 3) ? )))\n    (insert s)\n    (setq popup (popup-tip \"long long long long line\" :nowait t))))\n\n(ui-test \"fold?\"\n  (let ((s (make-string (- (window-height) 3) ?\\n)))\n    (insert s)\n    (setq popup (popup-tip \"bla\\nbla\\nbla\\nbla\\nbla\" :nowait t))))\n\n(ui-test \"margin?\"\n  (setq popup (popup-tip \"Margin?\" :nowait t :margin t)))\n\n(ui-test \"two lines?\"\n  (setq popup (popup-tip \"Foo\\nBar\\nBaz\" :nowait t :height 2)))\n\n(ui-test \"scroll bar?\"\n  (setq popup (popup-tip \"Foo\\nBar\\nBaz\\nFez\\nOz\" :nowait t :height 3 :scroll-bar t :margin t)))\n\n(ui-test \"min-height?\"\n  (setq popup (popup-tip \"Hello\" :nowait t :min-height 10)))\n\n(ui-test \"menu?\"\n  (setq popup (popup-menu* '(\"Foo\" \"Bar\" \"Baz\") :nowait t)))\n\n(ui-test \"cascade menu?\"\n  (setq popup (popup-cascade-menu '((\"Foo\" \"Foo1\" \"Foo2\") \"Bar\" \"Baz\") :nowait t :margin t)))\n\n(ui-test \"next?\"\n  (setq popup (popup-cascade-menu '(\"Foo\" \"Bar\" \"Baz\") :nowait t :margin t))\n  (popup-next popup))\n\n(ui-test \"previous?\"\n  (setq popup (popup-cascade-menu '(\"Foo\" \"Bar\" \"Baz\") :nowait t :margin t))\n  (popup-previous popup))\n\n(ui-test \"select?\"\n  (setq popup (popup-cascade-menu '(\"Foo\" \"Bar\" \"Baz\") :nowait t :margin t))\n  (popup-select popup 1))\n\n(ui-test \"scroll-down?\"\n  (setq popup (popup-cascade-menu (loop repeat 100 collect \"Foo\") :nowait t :height 10 :margin t :scroll-bar t))\n  (popup-scroll-down popup 10))\n\n(ui-test \"scroll-up?\"\n  (setq popup (popup-cascade-menu (loop repeat 100 collect \"Foo\") :nowait t :height 10 :margin t :scroll-bar t))\n  (popup-scroll-down popup 999)\n  (popup-scroll-up popup 10))\n\n(message \"Congratulations!\")\n" "popup-interactive-test.el" nil nil nil nil nil nil)
		       ("popup-test.el" "(require 'ert)\n\n(require 'popup)\n\n(when (< (frame-width) (length \"long long long long line\"))\n  (set-frame-size (selected-frame) 80 35))\n\n(defmacro popup-test-with-common-setup (&rest body)\n  (declare (indent 0) (debug t))\n  `(save-excursion\n     (with-temp-buffer\n       (switch-to-buffer (current-buffer))\n       (delete-other-windows)\n       (erase-buffer)\n       ,@body\n       )))\n\n(defun popup-test-helper-line-move-visual (arg)\n  \"This function is workaround. Because `line-move-visual' can not work well in\nbatch mode.\"\n  (let ((cur-col\n         (- (current-column)\n            (save-excursion (vertical-motion 0) (current-column)))))\n    (vertical-motion arg)\n    (move-to-column (+ (current-column) cur-col))))\n\n(defun popup-test-helper-rectangle-match (str)\n  (let ((buffer-contents (popup-test-helper-buffer-contents)))\n    (with-temp-buffer\n      (insert buffer-contents)\n      (goto-char (point-min))\n      (let ((strings (split-string str \"\\n\")))\n        (when (search-forward (car strings) nil t)\n          (goto-char (match-beginning 0))\n          (cl-every\n           'identity\n           (mapcar\n            (lambda (elem)\n              (popup-test-helper-line-move-visual 1)\n              (looking-at (regexp-quote elem)))\n            (cdr strings))))))))\n\n(defun popup-test-helper-buffer-contents ()\n  (cl-loop with start = (point-min)\n        with contents\n        for overlay in (cl-sort (overlays-in (point-min) (point-max))\n                              '< :key 'overlay-start)\n        for overlay-start = (overlay-start overlay)\n        for overlay-end = (overlay-end overlay)\n        for prefix = (buffer-substring start overlay-start)\n        for befstr = (overlay-get overlay 'before-string)\n        for substr = (or (overlay-get overlay 'display)\n                         (buffer-substring overlay-start overlay-end))\n        for aftstr = (overlay-get overlay 'after-string)\n        collect prefix into contents\n        unless (overlay-get overlay 'invisible) collect\n        (concat befstr substr aftstr) into contents\n        do (setq start overlay-end)\n        finally (return (concat (apply 'concat contents)\n                                (buffer-substring start (point-max))))\n        ))\n\n(defun popup-test-helper-create-popup (str)\n  (setq popup (popup-create (point) 10 10))\n  (popup-set-list popup (split-string str \"\\n\"))\n  (popup-draw popup))\n\n(defun popup-test-helper-in-popup-p ()\n  (let* ((faces (get-text-property (point) 'face))\n         (faces (if (listp faces) faces (list faces))))\n    (or (memq 'popup-tip-face faces)\n        (memq 'popup-menu-face faces)\n        (memq 'popup-menu-selection-face faces)\n        (memq 'popup-face faces))))\n\n(defun popup-test-helper-popup-selected-item (str)\n  (let ((buffer-contents (popup-test-helper-buffer-contents)))\n    (with-temp-buffer\n      (insert buffer-contents)\n      (goto-char (point-min))\n      (goto-char\n       (text-property-any (point-min) (point-max)\n                          'face 'popup-menu-selection-face))\n      (looking-at str)\n      )))\n\n(defun popup-test-helper-popup-beginning-line ()\n  (let ((buffer-contents (popup-test-helper-buffer-contents)))\n    (with-temp-buffer\n      (insert buffer-contents)\n      (goto-char (point-min))\n      (let ((end (point)))\n        (while (and (not (eobp))\n                    (not (popup-test-helper-in-popup-p)))\n          (goto-char (or (next-single-property-change (point) 'face)\n                         (point-max))))\n        (if (popup-test-helper-in-popup-p)\n            ;; todo visual line\n            (line-number-at-pos (point)) nil)\n        ))))\n\n(defun popup-test-helper-popup-beginning-column ()\n  (let ((buffer-contents (popup-test-helper-buffer-contents)))\n    (with-temp-buffer\n      (insert buffer-contents)\n      (goto-char (point-min))\n      (let ((end (point)))\n        (while (and (not (eobp))\n                    (not (popup-test-helper-in-popup-p)))\n          (goto-char (or (next-single-property-change (point) 'face)\n                         (point-max))))\n        (if (popup-test-helper-in-popup-p)\n            (current-column) nil)\n        ))))\n\n(defun popup-test-helper-popup-end-line ()\n  (let ((buffer-contents (popup-test-helper-buffer-contents)))\n    (with-temp-buffer\n      (insert buffer-contents)\n      (goto-char (point-max))\n      (let ((end (point)))\n        (while (and (not (bobp))\n                    (not (popup-test-helper-in-popup-p)))\n          (setq end (point))\n          (goto-char (or (previous-single-property-change (point) 'face)\n                         (point-min))))\n        (if (popup-test-helper-in-popup-p)\n            ;; todo visual line\n            (line-number-at-pos end) nil)\n        ))))\n\n(defun popup-test-helper-popup-end-column ()\n  (let ((buffer-contents (popup-test-helper-buffer-contents)))\n    (with-temp-buffer\n      (insert buffer-contents)\n      (goto-char (point-max))\n      (let ((end (point)))\n        (while (and (not (bobp))\n                    (not (popup-test-helper-in-popup-p)))\n          (setq end (point))\n          (goto-char (or (previous-single-property-change (point) 'face)\n                         (point-min))))\n        (when (popup-test-helper-in-popup-p)\n          (goto-char end)\n          (current-column))\n        ))))\n\n(defun popup-test-helper-debug ()\n  (let ((buffer-contents (popup-test-helper-buffer-contents)))\n    (with-current-buffer (get-buffer-create \"*dump*\")\n      (erase-buffer)\n      (insert buffer-contents)\n      (buffer-string)\n      )))\n;; Test for helper method\n(ert-deftest popup-test-no-truncated ()\n  (popup-test-with-common-setup\n    (insert (make-string (- (window-width) 4) ? )) (insert \"Foo\\n\")\n    (insert (make-string (- (window-width) 4) ? )) (insert \"Bar\\n\")\n    (insert (make-string (- (window-width) 4) ? )) (insert \"Baz\\n\")\n    (should (eq t (popup-test-helper-rectangle-match \"\\\nFoo\nBar\nBaz\")))\n    ))\n\n(ert-deftest popup-test-truncated ()\n  (popup-test-with-common-setup\n    (insert (make-string (- (window-width) 2) ? )) (insert \"Foo\\n\")\n    (insert (make-string (- (window-width) 2) ? )) (insert \"Bar\\n\")\n    (insert (make-string (- (window-width) 2) ? )) (insert \"Baz\\n\")\n    (should (eq nil (popup-test-helper-rectangle-match \"\\\nFoo\nBar\nBaz\")))\n    ))\n\n(ert-deftest popup-test-misaligned ()\n  (popup-test-with-common-setup\n    (progn\n      (insert (make-string (- (window-width) 5) ? )) (insert \"Foo\\n\")\n      (insert (make-string (- (window-width) 4) ? )) (insert \"Bar\\n\")\n      (insert (make-string (- (window-width) 3) ? )) (insert \"Baz\\n\"))\n    (should (eq nil (popup-test-helper-rectangle-match \"\\\nFoo\nBar\nBaz\")))\n    ))\n;; Test for popup-el\n(ert-deftest popup-test-simple ()\n  (popup-test-with-common-setup\n    (popup-test-helper-create-popup \"\\\nfoo\nbar\nbaz\")\n    (should (popup-test-helper-rectangle-match \"\\\nfoo\nbar\nbaz\"))\n    (should (eq (popup-test-helper-popup-beginning-column) 0))))\n\n(ert-deftest popup-test-delete ()\n  (popup-test-with-common-setup\n    (popup-test-helper-create-popup \"\\\nfoo\nbar\nbaz\")\n    (popup-delete popup)\n    (should-not (popup-test-helper-rectangle-match \"\\\nfoo\nbar\nbaz\"))\n    ))\n\n(ert-deftest popup-test-hide ()\n  (popup-test-with-common-setup\n    (popup-test-helper-create-popup \"\\\nfoo\nbar\nbaz\")\n    (popup-hide popup)\n    (should-not (popup-test-helper-rectangle-match \"\\\nfoo\nbar\nbaz\"))\n    ))\n\n(ert-deftest popup-test-at-colum1 ()\n  (popup-test-with-common-setup\n    (insert \" \")\n    (popup-test-helper-create-popup \"\\\nfoo\nbar\nbaz\")\n    (should (popup-test-helper-rectangle-match \"\\\nfoo\nbar\nbaz\"))\n    (should (eq (popup-test-helper-popup-beginning-column) 1))\n    ))\n\n(ert-deftest popup-test-tip ()\n  (popup-test-with-common-setup\n    (popup-tip \"\\\nStart isearch on POPUP. This function is synchronized, meaning\nevent loop waits for quiting of isearch.\n\nCURSOR-COLOR is a cursor color during isearch. The default value\nis `popup-isearch-cursor-color'.\n\nKEYMAP is a keymap which is used when processing events during\nevent loop. The default value is `popup-isearch-keymap'.\n\nCALLBACK is a function taking one argument. `popup-isearch' calls\nCALLBACK, if specified, after isearch finished or isearch\ncanceled. The arguments is whole filtered list of items.\n\nHELP-DELAY is a delay of displaying helps.\"\n               :nowait t)\n    (should (popup-test-helper-rectangle-match \"\\\nKEYMAP is a keymap which is used when processing events during\nevent loop. The default value is `popup-isearch-keymap'.\"))\n    ))\n\n(ert-deftest popup-test-folding-long-line-right-top ()\n  (popup-test-with-common-setup\n    ;; To use window-width because Emacs 23 does not have window-body-width\n    (insert (make-string (- (window-width) 3) ? ))\n    (popup-tip \"long long long long line\" :nowait t)\n    (should (popup-test-helper-rectangle-match \"long long long long line\"))\n    (should (eq (popup-test-helper-popup-beginning-line)\n                2))\n    (should (eq (popup-test-helper-popup-end-line) 2))\n    ))\n\n(ert-deftest popup-test-folding-long-line-left-bottom ()\n  (popup-test-with-common-setup\n    (insert (make-string (- (window-body-height) 1) ?\\n))\n    (popup-tip \"long long long long line\" :nowait t)\n    (should (popup-test-helper-rectangle-match \"long long long long line\"))\n    (should (eq (popup-test-helper-popup-beginning-line)\n                (- (window-body-height) 1)))\n    (should (eq (popup-test-helper-popup-end-line) (- (window-body-height) 1)))\n    ))\n\n(ert-deftest popup-test-folding-long-line-right-bottom ()\n  (popup-test-with-common-setup\n    (insert (make-string (- (window-body-height) 1) ?\\n))\n    (insert (make-string (- (window-width) 3) ? ))\n    (popup-tip \"long long long long line\" :nowait t)\n    (should (popup-test-helper-rectangle-match \"long long long long line\"))\n    (should (eq (popup-test-helper-popup-beginning-line)\n                (- (window-body-height) 1)))\n    (should (eq (popup-test-helper-popup-end-line) (- (window-body-height) 1)))\n    ))\n\n(ert-deftest popup-test-folding-short-line-right-top ()\n  (popup-test-with-common-setup\n    (insert (make-string (- (window-width) 4) ? ))\n    (popup-tip \"\\\nbla\nbla\nbla\nbla\nbla\" :nowait t)\n    (should (popup-test-helper-rectangle-match \"\\\nbla\nbla\nbla\nbla\nbla\"))\n    (should (eq (popup-test-helper-popup-beginning-line) 2))\n    ))\n\n(ert-deftest popup-test-folding-short-line-left-bottom ()\n  (popup-test-with-common-setup\n    (insert (make-string (- (window-body-height) 1) ?\\n))\n    (popup-tip \"\\\nbla\nbla\nbla\nbla\nbla\" :nowait t)\n    (should (popup-test-helper-rectangle-match \"\\\nbla\nbla\nbla\nbla\nbla\"))\n    (should (eq (popup-test-helper-popup-end-line) (- (window-body-height) 1)))))\n\n(ert-deftest popup-test-folding-short-line-right-bottom ()\n  (popup-test-with-common-setup\n    (insert (make-string (- (window-body-height) 1) ?\\n))\n    (insert (make-string (- (window-width) 4) ? ))\n    (popup-tip \"\\\nbla\nbla\nbla\nbla\nbla\" :nowait t)\n    (should (popup-test-helper-rectangle-match \"\\\nbla\nbla\nbla\nbla\nbla\"))\n    (should (eq (popup-test-helper-popup-end-line) (- (window-body-height) 1)))\n    ))\n\n(ert-deftest popup-test-margin-at-column1 ()\n  (popup-test-with-common-setup\n    (insert \" \")\n    (popup-tip \"Margin?\" :nowait t :margin t)\n    (should (eq (popup-test-helper-popup-beginning-column)\n                0))\n    (should (popup-test-helper-rectangle-match \" Margin? \"))\n    ))\n\n(ert-deftest popup-test-margin-left ()\n  (popup-test-with-common-setup\n   (popup-tip \"Margin?\" :nowait t :margin t)\n   (should (eq (popup-test-helper-popup-beginning-column)\n               0))\n   ;; Pending: #19\n   ;; (should (popup-test-helper-rectangle-match \" Margin? \"))\n   ))\n\n(ert-deftest popup-test-margin-right ()\n  (popup-test-with-common-setup\n    (insert (make-string (- (window-width) 1) ? ))\n    (popup-tip \"Margin?\" :nowait t :margin t)\n    (should (popup-test-helper-rectangle-match \" Margin? \"))\n    ;; Pending: #19\n    ;; (should (< (popup-test-helper-popup-end-column) (window-width)))\n    ))\n\n(ert-deftest popup-test-height-limit ()\n  (popup-test-with-common-setup\n    (popup-tip \"\\\nFoo\nBar\nBaz\" :nowait t :height 2)\n    (should (popup-test-helper-rectangle-match \"\\\nFoo\nBar\"))\n    (should-not (popup-test-helper-rectangle-match \"Baz\"))\n    (should (eq (popup-test-helper-popup-beginning-line) 2))\n    (should (eq (popup-test-helper-popup-end-line)  3))\n    ))\n\n(ert-deftest popup-test-height-limit-bottom ()\n  (popup-test-with-common-setup\n    (insert (make-string (- (window-body-height) 1) ?\\n))\n    (popup-tip \"\\\nFoo\nBar\nBaz\" :nowait t :height 2)\n    (should (popup-test-helper-rectangle-match \"\\\nFoo\nBar\"))\n    (should-not (popup-test-helper-rectangle-match \"Baz\"))\n    (should (eq (popup-test-helper-popup-end-line) (- (window-body-height) 1)))\n    ))\n\n(ert-deftest popup-test-scroll-bar ()\n  (popup-test-with-common-setup\n    (let ((popup-scroll-bar-foreground-char\n           (propertize \"f\" 'face 'popup-scroll-bar-foreground-face))\n          (popup-scroll-bar-background-char\n           (propertize \"b\" 'face 'popup-scroll-bar-background-face)))\n      (popup-tip \"\\\nFoo\nBar\nBaz\nFez\nOz\"\n                 :nowait t :height 3 :scroll-bar t :margin t)\n      (should (popup-test-helper-rectangle-match \"\\\nFoo f\nBar b\nBaz b\"))\n      (should-not (popup-test-helper-rectangle-match \"Fez\"))\n      (should-not (popup-test-helper-rectangle-match \"Oz\"))\n      (should (eq (popup-test-helper-popup-beginning-line) 2))\n      (should (eq (popup-test-helper-popup-end-line)  4))\n      )))\n\n(ert-deftest popup-test-scroll-bar-right-no-margin ()\n  (popup-test-with-common-setup\n    (insert (make-string (- (window-width) 1) ? ))\n    (let ((popup-scroll-bar-foreground-char\n           (propertize \"f\" 'face 'popup-scroll-bar-foreground-face))\n          (popup-scroll-bar-background-char\n           (propertize \"b\" 'face 'popup-scroll-bar-background-face)))\n      (popup-tip \"\\\nFoo\nBar\nBaz\nFez\nOz\"\n                 :nowait t :height 3 :scroll-bar t)\n      (should (popup-test-helper-rectangle-match \"\\\nFoof\nBarb\nBazb\"))\n      (should-not (popup-test-helper-rectangle-match \"Fez\"))\n      (should-not (popup-test-helper-rectangle-match \"Oz\"))\n      (should (eq (popup-test-helper-popup-beginning-line) 2))\n      (should (eq (popup-test-helper-popup-end-line)  4))\n      )))\n\n(ert-deftest popup-test-scroll-bar-right-margin ()\n  (popup-test-with-common-setup\n    (insert (make-string (- (window-width) 1) ? ))\n    (let ((popup-scroll-bar-foreground-char\n           (propertize \"f\" 'face 'popup-scroll-bar-foreground-face))\n          (popup-scroll-bar-background-char\n           (propertize \"b\" 'face 'popup-scroll-bar-background-face)))\n      (popup-tip \"\\\nFoo\nBar\nBaz\nFez\nOz\"\n                 :nowait t :height 3 :scroll-bar t :margin t)\n      (should-not (popup-test-helper-rectangle-match \"Fez\"))\n      (should-not (popup-test-helper-rectangle-match \"Oz\"))\n      (should (eq (popup-test-helper-popup-beginning-line) 2))\n      (should (eq (popup-test-helper-popup-end-line)  4))\n      ;; Pending: #21\n      ;;       (should (popup-test-helper-rectangle-match \"\\\n      ;; Foof\n      ;; Barb\n      ;; Bazb\"))\n      )))\n\n(ert-deftest popup-test-min-height ()\n  (popup-test-with-common-setup\n    (insert (make-string (- (window-width) 1) ? ))\n    (popup-tip \"Hello\" :nowait t :min-height 10)\n    (should (popup-test-helper-rectangle-match \"Hello\"))\n    (should (eq (popup-test-helper-popup-beginning-line) 2))\n    (should (eq (popup-test-helper-popup-end-line) 11))\n    ))\n\n(ert-deftest popup-test-menu ()\n  (popup-test-with-common-setup\n    (popup-menu* '(\"Foo\" \"Bar\" \"Baz\") :nowait t)\n    (should (popup-test-helper-rectangle-match \"\\\nFoo\nBar\nBaz\"))\n    (should (eq (popup-test-helper-popup-beginning-line) 2))\n    ))\n\n(ert-deftest popup-test-cascade-menu ()\n  (popup-test-with-common-setup\n    (popup-cascade-menu\n     '((\"Foo\" \"Foo1\" \"Foo2\") \"Bar\" \"Baz\") :nowait t)\n    (should (popup-test-helper-rectangle-match \"Foo        >\"))\n    (should (popup-test-helper-rectangle-match \"\\\nFoo\nBar\nBaz\"))\n    (should-not (popup-test-helper-rectangle-match \"Foo1\"))\n    (should-not (popup-test-helper-rectangle-match \"Foo2\"))\n    (should (eq (popup-test-helper-popup-beginning-line) 2))\n    ))\n\n(ert-deftest popup-test-next ()\n  (popup-test-with-common-setup\n    (setq popup (popup-menu* '(\"Foo\" \"Bar\" \"Baz\") :nowait t))\n    (should (popup-test-helper-popup-selected-item \"Foo\"))\n    (popup-next popup)\n    (should (popup-test-helper-popup-selected-item \"Bar\"))\n    (popup-next popup)\n    (should (popup-test-helper-popup-selected-item \"Baz\"))\n    (popup-next popup)\n    (should (popup-test-helper-popup-selected-item \"Foo\"))\n    (should (popup-test-helper-rectangle-match \"Foo\\nBar\\nBaz\"))\n    (should (eq (popup-test-helper-popup-beginning-line) 2))\n    ))\n\n(ert-deftest popup-test-previous ()\n  (popup-test-with-common-setup\n    (setq popup (popup-menu* '(\"Foo\" \"Bar\" \"Baz\") :nowait t))\n    (should (popup-test-helper-popup-selected-item \"Foo\"))\n    (popup-previous popup)\n    (should (popup-test-helper-popup-selected-item \"Baz\"))\n    (popup-previous popup)\n    (should (popup-test-helper-popup-selected-item \"Bar\"))\n    (popup-previous popup)\n    (should (popup-test-helper-popup-selected-item \"Foo\"))\n    (should (popup-test-helper-rectangle-match \"\\\nFoo\nBar\nBaz\"))\n    (should (eq (popup-test-helper-popup-beginning-line) 2))\n    ))\n\n(ert-deftest popup-test-select ()\n  (popup-test-with-common-setup\n    (setq popup (popup-menu* '(\"Foo\" \"Bar\" \"Baz\") :nowait t))\n    (should (popup-test-helper-popup-selected-item \"Foo\"))\n    (popup-select popup 1)\n    (should (popup-test-helper-popup-selected-item \"Bar\"))\n    (popup-select popup 0)\n    (should (popup-test-helper-popup-selected-item \"Foo\"))\n    (popup-select popup 2)\n    (should (popup-test-helper-popup-selected-item \"Baz\"))\n    (should (popup-test-helper-rectangle-match \"\\\nFoo\nBar\nBaz\"))\n    (should (eq (popup-test-helper-popup-beginning-line) 2))\n    ))\n\n(ert-deftest popup-test-scroll-down ()\n  (popup-test-with-common-setup\n    (setq popup\n          (popup-cascade-menu (cl-loop for x to 100 collect (format \"Foo%d\" x))\n                              :nowait t :height 10 :margin t :scroll-bar t))\n    (should (popup-test-helper-rectangle-match \"\\\nFoo0\nFoo1\nFoo2\"))\n    (should (popup-test-helper-popup-selected-item \"Foo0\"))\n    (popup-scroll-down popup 10)\n    (should (popup-test-helper-popup-selected-item \"Foo10\"))\n    (popup-scroll-down popup 10)\n    (should (popup-test-helper-popup-selected-item \"Foo20\"))\n    (popup-scroll-down popup 100)\n    (should-not (popup-test-helper-rectangle-match \"Foo90\"))\n    (should (popup-test-helper-rectangle-match \"Foo91\"))\n    (should (popup-test-helper-rectangle-match \"Foo100\"))\n    (should-not (popup-test-helper-rectangle-match \"Foo0\"))\n    (should (eq (popup-test-helper-popup-beginning-line) 2))\n    ))\n\n(ert-deftest popup-test-scroll-up ()\n  (popup-test-with-common-setup\n    (setq popup\n          (popup-cascade-menu (cl-loop for x to 100 collect (format \"Foo%d\" x))\n                              :nowait t :height 10 :margin t :scroll-bar t))\n    (should (popup-test-helper-rectangle-match \"\\\nFoo0\nFoo1\nFoo2\"))\n    (should (popup-test-helper-popup-selected-item \"Foo0\"))\n    (popup-scroll-down popup 100)\n    (should (popup-test-helper-popup-selected-item \"Foo91\"))\n    (popup-scroll-up popup 10)\n    (should (popup-test-helper-popup-selected-item \"Foo81\"))\n    (popup-scroll-up popup 10)\n    (should-not (popup-test-helper-rectangle-match \"Foo70\"))\n    (should (popup-test-helper-rectangle-match \"Foo71\"))\n    (should (popup-test-helper-rectangle-match \"Foo80\"))\n    (should-not (popup-test-helper-rectangle-match \"Foo81\"))\n    (should (eq (popup-test-helper-popup-beginning-line) 2))\n    ))\n\n(ert-deftest popup-test-two-tip ()\n  (popup-test-with-common-setup\n   (popup-tip \"\\\nFoo\nBar\" :nowait t)\n   (save-excursion (insert \"\\n\"))\n   (popup-tip \"\\\nBaz\nQux\" :nowait t)\n   ;; Pending: #20\n   ;;    (should (popup-test-helper-rectangle-match \"\\\n   ;; Foo\n   ;; Bar\"))\n   ;;    (should (popup-test-helper-rectangle-match \"\\\n   ;; Baz\n   ;; Qux\"))\n   ))\n\n(ert-deftest popup-test-initial-index ()\n  (popup-test-with-common-setup\n    (setq popup (popup-menu* '(\"Foo\" \"Bar\" \"Baz\") :initial-index 0 :nowait t))\n    (should (popup-test-helper-popup-selected-item \"Foo\")))\n\n  (popup-test-with-common-setup\n    (setq popup (popup-menu* '(\"Foo\" \"Bar\" \"Baz\") :initial-index 2 :nowait t))\n    (should (popup-test-helper-popup-selected-item \"Baz\")))\n\n  (popup-test-with-common-setup\n    (setq popup (popup-menu* '(\"Foo\" \"Bar\" \"Baz\") :initial-index -1 :nowait t))\n    (should (popup-test-helper-popup-selected-item \"Foo\")))\n\n  (popup-test-with-common-setup\n    (setq popup (popup-menu* '(\"Foo\" \"Bar\" \"Baz\") :initial-index 100 :nowait t))\n    (should (popup-test-helper-popup-selected-item \"Baz\"))))\n\n(defun popup-test-helper-input (key)\n  (push key unread-command-events))\n\n(ert-deftest popup-test-isearch ()\n  (popup-test-with-common-setup\n    (popup-test-helper-create-popup \"\\\nfoo\nbar\nbaz\")\n    (popup-isearch-update popup \"a\")\n    (should (popup-test-helper-rectangle-match \"\\\nbar\nbaz\"))\n    (should-not (popup-test-helper-rectangle-match \"foo\"))\n    ))\n" "popup-test.el" nil nil nil nil nil nil)
		       ("run-test.el" ";; Usage:\n;;\n;;   cask exec emacs -Q -l tests/run-test.el           # interactive mode\n;;   cask exec emacs -batch -Q -l tests/run-test.el    # batch mode\n\n\n;; Utils\n(defun popup-test-join-path (path &rest rest)\n  \"Join a list of PATHS with appropriate separator (such as /).\n\n\\(fn &rest paths)\"\n  (if rest\n      (concat (file-name-as-directory path) (apply 'popup-test-join-path rest))\n    path))\n\n(defvar popup-test-dir (file-name-directory load-file-name))\n(defvar popup-root-dir (concat popup-test-dir \"..\"))\n\n\n;; Setup `load-path'\n(mapc (lambda (p) (add-to-list 'load-path p))\n      (list popup-test-dir\n            popup-root-dir))\n\n;; Load tests\n(load \"popup-test\")\n\n\n;; Run tests\n(if noninteractive\n    (ert-run-tests-batch-and-exit)\n  (ert t))\n" "run-test.el" nil nil nil nil nil nil)))


;;; contents of the .yas-setup.el support file:
;;;
(defun yas-with-comment (str)
  (format "%s%s%s" comment-start str comment-end))
;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("fi" "`(yas-with-comment \"FIXME: \")`" "fixme"
			(not
			 (eq major-mode 'sh-mode))
			nil nil nil nil nil)
		       ("t" "`(yas-with-comment \"TODO: \")`" "todo" nil nil nil nil nil nil)
		       ("x" "`(yas-with-comment \"XXX: \")`" "xxx" nil nil nil nil nil nil)))


;;; contents of the .yas-setup.el support file:
;;;
(defun python-split-args (arg-string)
  "Split a python argument string into ((name, default)..) tuples"
  (mapcar (lambda (x)
             (split-string x "[[:blank:]]*=[[:blank:]]*" t))
          (split-string arg-string "[[:blank:]]*,[[:blank:]]*" t)))

(defun python-args-to-docstring ()
  "return docstring format for the python arguments in yas-text"
  (let* ((indent (concat "\n" (make-string (current-column) 32)))
         (args (python-split-args yas-text))
         (max-len (if args (apply 'max (mapcar (lambda (x) (length (nth 0 x))) args)) 0))
         (formatted-args (mapconcat
                (lambda (x)
                   (concat (nth 0 x) (make-string (- max-len (length (nth 0 x))) ? ) " -- "
                           (if (nth 1 x) (concat "\(default " (nth 1 x) "\)"))))
                args
                indent)))
    (unless (string= formatted-args "")
      (mapconcat 'identity (list "Keyword Arguments:" formatted-args) indent))))

(add-hook 'python-mode-hook
          '(lambda () (set (make-local-variable 'yas-indent-line) 'fixed)))
;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("cont" "def __contains__(self, el):\n    $0" "__contains__" nil
			("dunder methods")
			nil nil nil nil)
		       ("ent" "def __enter__(self):\n    $0\n\n    return self" "__enter__" nil
			("dunder methods")
			nil nil nil nil)
		       ("ex" "def __exit__(self, type, value, traceback):\n    $0" "__exit__" nil
			("dunder methods")
			nil nil nil nil)
		       ("getit" "def __getitem__(self, ${1:key}):\n    $0" "__getitem__" nil
			("dunder methods")
			nil nil nil nil)
		       ("len" "def __len__(self):\n    $0" "__len__" nil
			("dunder methods")
			nil nil nil nil)
		       ("new" "def __new__(mcs, name, bases, dict):\n    $0\n    return type.__new__(mcs, name, bases, dict)\n" "__new__" nil
			("dunder methods")
			nil nil nil nil)
		       ("setit" "def __setitem__(self, ${1:key}, ${2:val}):\n    $0" "__setitem__" nil
			("dunder methods")
			nil nil nil nil)
		       ("a" "__all__ = [\n    $0\n]" "all" nil nil nil nil nil nil)
		       ("arg" "parser.add_argument('-$1', '--$2',\n                    $0)\n" "arg" nil
			("argparser")
			nil nil nil nil)
		       ("arg" "parser.add_argument('${1:varname}', $0)" "arg_positional" nil
			("argparser")
			nil nil nil nil)
		       ("ass" "assert $0" "assert" nil
			("testing")
			nil nil nil nil)
		       ("ae" "self.assertEqual($1, $2)" "assertEqual" nil
			("testing")
			nil nil nil nil)
		       ("af" "self.assertFalse($0)" "assertFalse" nil
			("testing")
			nil nil nil nil)
		       ("ai" "self.assertIn(${1:member}, ${2:container})" "assertIn" nil
			("testing")
			nil nil nil nil)
		       ("ane" "self.assertNotEqual($1, $2)" "assertNotEqual" nil
			("testing")
			nil nil nil nil)
		       ("ar" "self.assertRaises(${1:Exception}, ${2:fun})" "assertRaises" nil
			("testing")
			nil nil nil nil)
		       ("ar" "with self.assertRaises(${1:Exception}):\n    $0\n" "assertRaises" nil nil nil nil nil nil)
		       ("at" "self.assertTrue($0)" "assertTrue" nil
			("testing")
			nil nil nil nil)
		       ("an" "self.assertNotIn(${1:member}, ${2:container})" "assetNotIn" nil
			("testing")
			nil nil nil nil)
		       ("cdb" "from celery.contrib import rdb; rdb.set_trace()" "celery pdb" nil
			("debug")
			nil nil nil nil)
		       ("cm" "@classmethod\ndef ${1:meth}(cls, $0):\n    " "classmethod" nil
			("object oriented")
			nil nil nil nil)
		       ("cls" "class ${1:class}:\n    $0\n" "cls" nil
			("object oriented")
			nil nil nil nil)
		       ("dec" "def ${1:decorator}(func):\n    $2\n    def _$1(*args, **kwargs):\n        $3\n        ret = func(*args, **kwargs)\n        $4\n        return ret\n\n    return _$1" "dec" nil
			("definitions")
			nil nil nil nil)
		       ("dt" "def test_${1:long_name}(self):\n    $0" "deftest" nil
			("testing")
			nil nil nil nil)
		       ("tcs" "class ${1:Model}Test(TestCase):\n    $0" "django_test_class" nil
			("testing")
			nil nil nil nil)
		       ("d" "\"\"\"$0\n\"\"\"" "doc" nil nil nil nil nil nil)
		       ("doc" ">>> ${1:function calls}\n${2:desired output}\n$0" "doctest" nil
			("testing")
			nil nil nil nil)
		       ("eq" "def __eq__(self, other):\n    return self.$1 == other.$1" "__eq__" nil
			("dunder methods")
			nil nil nil nil)
		       ("for" "for ${var} in ${collection}:\n    $0" "for ... in ... : ..." nil
			("control structure")
			nil nil nil nil)
		       ("from" "from ${1:lib} import ${2:funs}" "from" nil
			("general")
			nil nil nil nil)
		       ("f" "def ${1:fun}(${2:args}):\n    $0\n" "function" nil
			("definitions")
			nil nil nil nil)
		       ("fd" "def ${1:name}($2):\n    \\\"\\\"\\\"$3\n    ${2:$(python-args-to-docstring)}\n    \\\"\\\"\\\"\n    $0" "function_docstring" nil
			("definitions")
			nil nil nil nil)
		       ("if" "if ${1:cond}:\n    $0\n" "if" nil
			("control structure")
			nil nil nil nil)
		       ("ife" "if $1:\n    $2\nelse:\n    $0\n" "ife" nil
			("control structure")
			nil nil nil nil)
		       ("ifm" "if __name__ == '__main__':\n    ${1:main()}" "ifmain" nil nil nil nil nil nil)
		       ("imp" "import ${1:lib}${2: as ${3:alias}}\n$0" "import" nil
			("general")
			nil nil nil nil)
		       ("init" "def __init__(self${1:, args}):\n    ${2:\"${3:docstring}\"\n    }$0" "init" nil
			("definitions")
			nil nil nil nil)
		       ("id" "def __init__(self$1):\n    \\\"\\\"\\\"$2\n    ${1:$(python-args-to-docstring)}\n    \\\"\\\"\\\"\n    $0" "init_docstring" nil
			("definitions")
			nil nil nil nil)
		       ("int" "import code; code.interact(local=locals())" "interact" nil nil nil nil nil nil)
		       ("itr" "import ipdb; ipdb.set_trace()" "ipdb trace" nil
			("debug")
			nil nil nil nil)
		       ("iter" "def __iter__(self):\n    return ${1:iter($2)}" "__iter__" nil
			("dunder methods")
			nil nil nil nil)
		       ("lam" "lambda ${1:x}: $0" "lambda" nil nil nil nil nil nil)
		       ("li" "[${1:el} for $1 in ${2:list}]\n$0" "list" nil
			("definitions")
			nil nil nil nil)
		       ("ln" "logger = logging.getLogger(${1:__name__})" "logger_name" nil nil nil nil nil nil)
		       ("log" "logger = logging.getLogger(\"${1:name}\")\nlogger.setLevel(logging.${2:level})\n" "logging" nil nil nil nil nil nil)
		       ("main" "def main():\n    $0" "main" nil nil nil nil nil nil)
		       ("mt" "__metaclass__ = type" "metaclass" nil
			("object oriented")
			nil nil nil nil)
		       ("m" "def ${1:method}(self${2:, $3}):\n    $0" "method" nil
			("object oriented")
			nil nil nil nil)
		       ("md" "def ${1:name}(self$2):\n    \\\"\\\"\\\"$3\n    ${2:$(python-args-to-docstring)}\n    \\\"\\\"\\\"\n    $0" "method_docstring" nil
			("object oriented")
			nil nil nil nil)
		       ("not_impl" "raise NotImplementedError" "not_impl" nil nil nil nil nil nil)
		       ("np" "import numpy as np\n$0" "np" nil
			("general")
			nil nil nil nil)
		       ("pargs" "def parse_arguments():\n    parser = argparse.ArgumentParser(description='$1')\n    $0\n    return parser.parse_args()" "parse_args" nil
			("argparser")
			nil nil nil nil)
		       ("pars" "parser = argparse.ArgumentParser(description='$1')\n$0" "parser" nil
			("argparser")
			nil nil nil nil)
		       ("ps" "pass" "pass" nil nil nil nil nil nil)
		       ("p" "print($0)" "print" nil nil nil nil nil nil)
		       ("prop" "def ${1:foo}():\n    doc = \"\"\"${2:Doc string}\"\"\"\n    def fget(self):\n        return self._$1\n\n    def fset(self, value):\n        self._$1 = value\n\n    def fdel(self):\n        del self._$1\n    return locals()\n$1 = property(**$1())\n\n$0\n" "prop" nil nil nil nil nil nil)
		       ("reg" "${1:regexp} = re.compile(r\"${2:expr}\")\n$0" "reg" nil
			("general")
			nil nil nil nil)
		       ("repr" "def __repr__(self):\n    $0" "__repr__" nil
			("dunder methods")
			nil nil nil nil)
		       ("r" "return $0" "return" nil nil nil nil nil nil)
		       ("script" "#!/usr/bin/env python\n\ndef main():\n    pass\n\nif __name__ == '__main__':\n    main()\n" "script" nil nil nil nil nil nil)
		       ("." "self.$0" "self" nil
			("object oriented")
			nil nil nil nil)
		       ("s" "self" "self_without_dot" nil
			("object oriented")
			nil nil nil nil)
		       ("sn" "self.$1 = $1" "selfassign" nil
			("object oriented")
			nil nil nil nil)
		       ("setdef" "${1:var}.setdefault(${2:key}, []).append(${3:value})" "setdef" nil nil nil nil nil nil)
		       ("setup" "from setuptools import setup\n\npackage = '${1:name}'\nversion = '${2:0.1}'\n\nsetup(name=package,\n      version=version,\n      description=\"${3:description}\",\n      url='${4:url}'$0)\n" "setup" nil
			("distribute")
			nil nil nil nil)
		       ("size" "sys.getsizeof($0)" "size" nil nil nil nil nil nil)
		       ("sm" "@staticmethod\ndef ${1:func}($0):\n" "static" nil nil nil nil nil nil)
		       ("str" "def __str__(self):\n    $0" "__str__" nil
			("dunder methods")
			nil nil nil nil)
		       ("super" "super(`(replace-regexp-in-string \"\\\\([.]\\\\)[^.]+$\" \", self).\" (python-info-current-defun) nil nil 1)`($1)\n$0" "super" nil
			("object oriented")
			nil nil nil nil)
		       ("tcs" "class Test${1:toTest}(${2:unittest.TestCase}):\n    $0\n" "test_class" nil
			("testing")
			nil nil nil nil)
		       ("tf" "import unittest\n${1:from ${2:test_file} import *}\n\n$0\n\nif __name__ == '__main__':\n    unittest.main()" "test_file" nil
			("testing")
			nil nil nil nil)
		       ("tr" "import pdb; pdb.set_trace()" "trace" nil
			("debug")
			nil nil nil nil)
		       ("try" "try:\n    $1\nexcept ${2:Exception}:\n    $0" "try" nil nil nil nil nil nil)
		       ("try" "try:\n    $1\nexcept $2:\n    $3\nelse:\n    $0" "tryelse" nil nil nil nil nil nil)
		       ("un" "def __unicode__(self):\n    $0" "__unicode__" nil
			("dunder methods")
			nil nil nil nil)
		       ("utf8" "# -*- coding: utf-8 -*-\n" "utf-8 encoding" nil nil nil nil nil nil)
		       ("wh" "while ${1:True}:\n    $0" "while" nil
			("control structure")
			nil nil nil nil)
		       ("with" "with ${1:expr}${2: as ${3:alias}}:\n    $0" "with" nil
			("control structure")
			nil nil nil nil)
		       ("fw" "from __future__ import with_statement" "with_statement" nil
			("future")
			nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("auto" ".. autoclass:: $0\n   ${1::members: ${2:members}}" "autoclass" nil nil nil nil nil nil)
		       ("auto" ".. autofunction:: $0" "autofunction" nil nil nil nil nil nil)
		       ("auto" ".. automodule:: ${1:module_name}" "automodule" nil nil nil nil nil nil)
		       ("cls" ":class:\\`$0\\`" "class" nil nil nil nil nil nil)
		       ("code" ".. code:: ${1:python}" "code" nil nil nil nil nil nil)
		       ("graph" ".. digraph:: $1\n\n   $0" "digraph" nil nil nil nil nil nil)
		       ("fun" ":function:\\`$0\\`" "function" nil nil nil nil nil nil)
		       ("graph" ".. graph:: $1\n\n   $0" "graph" nil nil nil nil nil nil)
		       ("graph" ".. graphviz::\n\n   $0" "graphviz" nil nil nil nil nil nil)
		       ("img" ".. image:: ${1:path}\n   :height: ${2:100}\n   :width: ${3:200}\n   :alt: ${4:description}\n\n$0" "image" nil nil nil nil nil nil)
		       ("inh" ".. inheritance-diagram:: $0" "inheritance" nil nil nil nil nil nil)
		       ("inc" ".. literalinclude:: ${1:path}" "literatal include" nil nil nil nil nil nil)
		       (":" ":${1:var}: $0" "meta" nil nil nil nil nil nil)
		       ("mod" ":mod: \\`$0\\`" "module" nil nil nil nil nil nil)
		       ("src" ".. parsed-literal::\n   $0" "parsed_literal" nil nil nil nil nil nil)
		       ("pause" ".. rst-class:: build" "pause" nil
			("hieroglyph")
			nil nil nil nil)
		       ("term" ":term:\\`$0\\`" "term" nil nil nil nil nil nil)
		       ("url" ".. _${1:description}: $0" "url" nil nil nil nil nil nil)
		       ("|" "| $0\n|" "verbatim" nil nil nil nil nil nil)
		       ("warn" ".. warning:\n   $0" "warning" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("#" "# => " "# =>" nil
			("general")
			nil nil nil nil)
		       ("=b" "=begin rdoc\n  $0\n=end" "=begin rdoc ... =end" nil
			("general")
			nil nil nil nil)
		       ("Comp" "include Comparable\n\ndef <=> other\n  $0\nend" "include Comparable; def <=> ... end" nil
			("definitions")
			nil nil nil nil)
		       ("$" "$${1:GLOBAL} = $0" "GLOB" nil nil nil nil nil nil)
		       ("all" "all? { |${e}| $0 }" "all? { |...| ... }" nil
			("collections")
			nil nil nil nil)
		       ("am" "alias_method :${new_name}, :${old_name}" "alias_method new, old" nil
			("definitions")
			nil nil nil nil)
		       ("any" "any? { |${e}| $0 }" "any? { |...| ... }" nil
			("collections")
			nil nil nil nil)
		       ("app" "if __FILE__ == $PROGRAM_NAME\n  $0\nend" "if __FILE__ == $PROGRAM_NAME ... end" nil
			("general")
			nil nil nil nil)
		       ("@" "@${1:attr} = $0" "attribute" nil nil nil nil nil nil)
		       ("bench" "require \"benchmark\"\n\nTESTS = ${1:1_000}\nBenchmark.bmbm do |x|\n  x.report(\"${2:var}\") {}\nend\n" "bench" nil nil nil nil nil nil)
		       ("bm" "Benchmark.bmbm(${1:10}) do |x|\n  $0\nend" "Benchmark.bmbm(...) do ... end" nil
			("general")
			nil nil nil nil)
		       ("case" "case ${1:object}\nwhen ${2:condition}\n  $0\nend" "case ... end" nil
			("general")
			nil nil nil nil)
		       ("cla" "class << ${self}\n  $0\nend" "class << self ... end" nil
			("definitions")
			nil nil nil nil)
		       ("cls" "class ${1:`(let ((fn (capitalize (file-name-nondirectory\n                                 (file-name-sans-extension\n				 (or (buffer-file-name)\n				     (buffer-name (current-buffer))))))))\n             (replace-regexp-in-string \"_\" \"\" fn t t))`}\n  $0\nend\n" "class ... end" nil
			("definitions")
			nil nil nil nil)
		       ("collect" "collect { |${e}| $0 }" "collect { |...| ... }" nil
			("collections")
			nil nil nil nil)
		       ("dee" "Marshal.load(Marshal.dump($0))" "deep_copy(...)" nil
			("general")
			nil nil nil nil)
		       ("def" "def ${1:method}${2:(${3:args})}\n    $0\nend" "def ... end" nil nil nil nil nil nil)
		       ("deli" "delete_if { |${e}| $0 }" "delete_if { |...| ... }" nil
			("collections")
			nil nil nil nil)
		       ("det" "detect { |${e}| $0 }" "detect { |...| ... }" nil
			("collections")
			nil nil nil nil)
		       ("dow" "downto(${0}) { |${n}|\n  $0\n}" "downto(...) { |n| ... }" nil
			("control structure")
			nil nil nil nil)
		       ("ea" "each { |${e}| $0 }" "each { |...| ... }" nil
			("collections")
			nil nil nil nil)
		       ("eac" "each_cons(${1:2}) { |${group}| $0 }" "each_cons(...) { |...| ... }" nil
			("collections")
			nil nil nil nil)
		       ("eai" "each_index { |${i}| $0 }" "each_index { |i| ... }" nil
			("collections")
			nil nil nil nil)
		       ("eav" "each_value { |${val}| $0 }" "each_value { |val| ... }" nil
			("collections")
			nil nil nil nil)
		       ("eawi" "each_with_index { |${e}, ${i}| $0 }" "each_with_index { |e, i| ... }" nil
			("collections")
			nil nil nil nil)
		       ("for" "for ${1:el} in ${2:collection}\n    $0\nend" "for" nil nil nil nil nil nil)
		       ("forin" "for ${1:element} in ${2:collection}\n  $0\nend" "for ... in ...; ... end" nil
			("control structure")
			nil nil nil nil)
		       ("form" "require 'formula'\n\nclass ${1:Name} <Formula\n  url '${2:url}'\n  homepage '${3:home}'\n  md5 '${4:md5}'\n\n  def install\n    ${5:system \"./configure\"}\n    $0\n  end\nend\n" "formula" nil nil nil nil nil nil)
		       ("if" "if ${1:condition}\n  $0\nend" "if ... end" nil
			("control structure")
			nil nil nil nil)
		       ("ife" "if ${1:condition}\n  $2\nelse\n  $3\nend" "if ... else ... end" nil
			("control structure")
			nil nil nil nil)
		       ("init" "def initialize(${1:args})\n    $0\nend" "init" nil nil nil nil nil nil)
		       ("inject" "inject(${1:0}) { |${2:injection}, ${3:element}| $0 }" "inject(...) { |...| ... }" nil
			("collections")
			nil nil nil nil)
		       ("mm" "def method_missing(method, *args)\n  $0\nend" "def method_missing ... end" nil
			("definitions")
			nil nil nil nil)
		       ("r" "attr_reader :" "attr_reader ..." nil
			("definitions")
			nil nil nil nil)
		       ("rb" "#!/usr/bin/ruby -wU\n" "/usr/bin/ruby -wU" nil
			("general")
			nil nil nil nil)
		       ("reject" "reject { |${1:element}| $0 }" "reject { |...| ... }" nil
			("collections")
			nil nil nil nil)
		       ("rel" "require_relative '$0'" "require_relative" nil
			("general")
			nil nil nil nil)
		       ("req" "require '$0'" "require \"...\"" nil
			("general")
			nil nil nil nil)
		       ("rw" "attr_accessor :" "attr_accessor ..." nil
			("definitions")
			nil nil nil nil)
		       ("select" "select { |${1:element}| $0 }" "select { |...| ... }" nil
			("collections")
			nil nil nil nil)
		       ("s" "#{$0}" "str" nil nil nil nil nil nil)
		       ("tc" "class TC_${1:Class} < Test::Unit::TestCase\n      $0\nend" "test class" nil nil nil nil nil nil)
		       ("tim" "times { |${n}| $0 }" "times { |n| ... }" nil
			("control structure")
			nil nil nil nil)
		       ("to_" "def to_s\n    \"${1:string}\"\nend\n$0" "to_" nil nil nil nil nil nil)
		       ("tu" "require 'test/unit'" "tu" nil nil nil nil nil nil)
		       ("until" "until ${condition}\n  $0\nend" "until ... end" nil
			("control structure")
			nil nil nil nil)
		       ("upt" "upto(${n}) { |${i}|\n  $0\n}" "upto(...) { |n| ... }" nil
			("control structure")
			nil nil nil nil)
		       ("w" "attr_writer :" "attr_writer ..." nil
			("definitions")
			nil nil nil nil)
		       ("when" "when ${condition}\n  $0\nend" "when ... end" nil
			("control structure")
			nil nil nil nil)
		       ("while" "while ${condition}\n  $0\nend" "while ... end" nil
			("control structure")
			nil nil nil nil)
		       ("y" ":yields: $0" ":yields: arguments (rdoc)" nil
			("general")
			nil nil nil nil)
		       ("zip" "zip(${enums}) { |${row}| $0 }" "zip(...) { |...| ... }" nil
			("collections")
			nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("act" "def act = {\n  loop {\n    react {\n      $0\n    }\n  }\n}\n" "def act = { ..}" nil nil nil nil nil nil)
		       ("act" "def act(${1:arg}: ${2:type}) = {\n  loop {\n    react {\n      $0\n    }\n  }\n}" "def act(arg: T) = { ..}" nil nil nil nil nil nil)
		       ("actor" "val a = actor {\n  loop {\n    react {\n      $0\n    }\n  }\n}" "val a = actor { ..}" nil nil nil nil nil nil)
		       ("=>" "($1) => ${2:body} $0" "(args) => ..." nil nil nil nil nil nil)
		       ("app" "object ${1:name} extends App {\n  $0\n}" "object name extends App" nil nil nil nil nil nil)
		       ("arr.new" "Array[${1:value}](${2:args}) $0" "Array[T](..)" nil nil nil nil nil nil)
		       ("arr.new" "val ${1:arr} = Array[${2:value}](${3:args}) $0" "val a = Array[T](..)" nil nil nil nil nil nil)
		       ("asof" "asInstanceOf[${1:type}] $0" "asInstanceOf[T] " nil nil nil nil nil nil)
		       ("ass" "assert(${1:x} === ${2:y}) $0" "assert(x === y)" nil nil nil nil nil nil)
		       ("ass" "assert(true) $0" "assert(true)" nil nil nil nil nil nil)
		       ("at.author" "@author ${1:name} $0" "@author name" nil nil nil nil nil nil)
		       ("at" "@param ${1:name} ${2:description} $0" "@param name description" nil nil nil nil nil nil)
		       ("at" "@return ${1:description} $0" "@return description" nil nil nil nil nil nil)
		       ("at" "@version ${1:0.1} $0" "@version number" nil nil nil nil nil nil)
		       ("!" "${1:actor} ! ${2:message} $0" "actor ! message" nil nil nil nil nil nil)
		       ("case" "case ${1:pattern} => $0" "case pattern => " nil nil nil nil nil nil)
		       ("case" "case _ => $0" "case _ =>" nil nil nil nil nil nil)
		       ("cast" "asInstanceOf[${1:type}] $0" "asInstanceOf[T] " nil nil nil nil nil nil)
		       ("cc" "case class ${1:name}(${2:arg}: ${3:type}) $0" "case class T(arg: A)" nil nil nil nil nil nil)
		       ("cl" "class ${1:name} {\n  $0\n}" "class T { .. }" nil nil nil nil nil nil)
		       ("cl" "abstract class ${1:name} {\n  $0\n}" "abstract class T { .. }" nil nil nil nil nil nil)
		       ("cl" "abstract class ${1:name}(${2:args}) {\n  $0\n}" "abstract class T(args) { .. }" nil nil nil nil nil nil)
		       ("cl" "class ${1:name}(${2:args}) {\n  $0\n}" "class T(args) { .. }" nil nil nil nil nil nil)
		       ("clof" "classOf[${1:type}] $0" "classOf[T] " nil nil nil nil nil nil)
		       ("co" "case object ${1:name} $0" "case object T" nil nil nil nil nil nil)
		       ("cons" "${1:element1} :: ${2:element2} $0" "element1 :: element2" nil nil nil nil nil nil)
		       ("cons" "${1:element1} :: Nil $0\n" "element1 :: Nil" nil nil nil nil nil nil)
		       ("def" "def ${1:name}(${2:args}) = $0" "def f(arg: T) = ..." nil nil nil nil nil nil)
		       ("def" "def ${1:name}(${2:args}) = {\n  $0\n}" "def f(arg: T) = {...}" nil nil nil nil nil nil)
		       ("def" "def ${1:name}(${2:args}): ${3:Unit} = $0" "def f(arg: T): R = ..." nil nil nil nil nil nil)
		       ("def" "def ${1:name}(${2:args}): ${3:Unit} = {\n  $0\n}" "def f(arg: T): R = {...}" nil nil nil nil nil nil)
		       ("def" "def ${1:name} = {\n  $0\n}" "def f = {...}" nil nil nil nil nil nil)
		       ("def" "def ${1:name}: ${2:Unit} = $0" "def f: R = ..." nil nil nil nil nil nil)
		       ("def" "def ${1:name}: ${3:Unit} = {\n  $0\n}" "def f: R = {...}" nil nil nil nil nil nil)
		       ("def" "def ${1:name} = $0" "def f = ..." nil nil nil nil nil nil)
		       ("doc" "/**\n * `(scala-mode-find-clstrtobj-name-doc)`\n * ${1:description}\n * $0\n */" "/** cls/trt/obj name */" nil nil nil nil nil nil)
		       ("doc" "/**\n * `(scala-mode-def-and-args-doc)`\n */" "/** method name */" nil nil nil nil nil nil)
		       ("doc.file" "/**\n * `(scala-mode-file-doc)`\n * $0\n * @author ${1:name}\n * @version ${2:0.1} \n */" "/** file name */" nil nil nil nil nil nil)
		       ("doc.file-scala" "/*                     __                                               *\\\n**     ________ ___   / /  ___     Scala $3                               **\n**    / __/ __// _ | / /  / _ |    (c) 2005-`(format-time-string \"%Y\")` , LAMP/EPFL             **\n**  __\\ \\/ /__/ __ |/ /__/ __ |    http://scala-lang.org/               **\n** /____/\\___/_/ |_/____/_/ | |                                         **\n**                          |/                                          **\n\\*                                                                      */\n/** \n * $0\n * @author ${1:name} \n * @version ${2:0.1}\n * $Id$\n */" "/** scala file */" nil nil nil nil nil nil)
		       ("doc.file-scala-api" "/*                     __                                               *\\\n**     ________ ___   / /  ___     Scala API                            **\n**    / __/ __// _ | / /  / _ |    (c) 2005-`(format-time-string \"%Y\")`, LAMP/EPFL             **\n**  __\\ \\/ /__/ __ |/ /__/ __ |    http://scala-lang.org/               **\n** /____/\\___/_/ |_/____/_/ | |                                         **\n**                          |/                                          **\n\\*                                                                      */\n/** \n * $0\n * @author ${1:name} \n * @version ${2:0.1}\n * $Id$\n */" "/** scala api file */" nil nil nil nil nil nil)
		       ("doc.scaladoc" "/**\n * ${1:description}\n * $0\n */" "/** ... */" nil nil nil nil nil nil)
		       ("expect" "expect(${1:reply}) {\n  $0\n}" "expect(value) { ..}" nil nil nil nil nil nil)
		       ("ext" "extends $0" "extends T" nil nil nil nil nil nil)
		       ("for.extract" "${1:x} <- ${2:xs}" "x <- xs" nil nil nil nil nil nil)
		       ("for" "for (${1:x} <- ${2:xs} if ${3:guard}) {\n  $0\n}" "for (x <- xs if guard) { ... }" nil nil nil nil nil nil)
		       ("for" "for (${1:x} <- ${2:xs}) {\n  $0\n}" "for (x <- xs) { ... }" nil nil nil nil nil nil)
		       ("for" "for {\n  ${1:x} <- ${2:xs}\n  ${3:x} <- ${4:xs}\n} {\n  yield $0\n}" "for {x <- xs \\ y <- ys} { yield }" nil nil nil nil nil nil)
		       ("foreach" "foreach(${1:x} => ${2:body}) $0" "foreach(x => ..)" nil nil nil nil nil nil)
		       ("hmap.new" "new HashMap[${1:key}, ${2:value}] $0" "new HashMap[K, V]" nil nil nil nil nil nil)
		       ("hmap.val-new" "val ${1:m} = new HashMap[${2:key}, ${3:value}] $0" "val m = new HashMap[K, V]" nil nil nil nil nil nil)
		       ("hset.new" "new HashSet[${1:key}] $0\n" "new HashSet[K]" nil nil nil nil nil nil)
		       ("hset.val-new" "val ${1:m} = new HashSet[${2:key}] $0" "val m = new HashSet[K]" nil nil nil nil nil nil)
		       ("if" "if (${1:condition}) {\n  $0\n}" "if (cond) { .. }" nil nil nil nil nil nil)
		       ("if" "if (${1:condition}) {\n  $2\n} else {\n  $0\n}" "if (cond) { .. } else { .. }" nil nil nil nil nil nil)
		       ("imp" "import $0" "import .." nil nil nil nil nil nil)
		       ("intercept" "intercept(classOf[${1:Exception]}) {\n  $0\n}" "intercept(classOf[T]) { ..}" nil nil nil nil nil nil)
		       ("isof" "isInstanceOf[${1:type}] $0" "isInstanceOf[T] " nil nil nil nil nil nil)
		       ("ls" "List(${1:args}, ${2:args}) $0" "List(..)" nil nil nil nil nil nil)
		       ("ls" "val ${1:l} = List(${2:args}, ${3:args}) $0" "val l = List(..)" nil nil nil nil nil nil)
		       ("main" "def main(args: Array[String]) = {\n  $0\n}" "def main(args: Array[String]) = { ... }" nil nil nil nil nil nil)
		       ("map" "map(${1:x} => ${2:body}) $0" "map(x => ..)" nil nil nil nil nil nil)
		       ("map" "Map(${1:key} -> ${2:value}) $0" "Map(key -> value)" nil nil nil nil nil nil)
		       ("match" "${1:cc} match {\n  case ${2:pattern} => $0\n}" "cc match { .. }" nil nil nil nil nil nil)
		       ("match" "${1:option} match {\n  case Full(res) => $0\n\n  case Empty =>\n\n  case Failure(msg, _, _) =>\n\n}" "can match { case Full(res) => .. }" nil nil nil nil nil nil)
		       ("match" "${1:option} match {\n  case None => $0\n  case Some(res) =>\n\n}" "option match { case None => .. }" nil nil nil nil nil nil)
		       ("mix" "trait ${1:name} {\n  $0\n}" "trait T { .. }" nil nil nil nil nil nil)
		       ("ob" "object ${1:name} extends ${2:type} $0" "object name extends T" nil nil nil nil nil nil)
		       ("pac" "package $0" "package .." nil nil nil nil nil nil)
		       ("pr.newline" "println(${1:obj}) $0" "println(..)" nil nil nil nil nil nil)
		       ("pr" "print(${1:obj}) $0" "print(..)" nil nil nil nil nil nil)
		       ("pr" "println(\"${1:msg}\") $0" "println(\"..\")" nil nil nil nil nil nil)
		       ("pr" "println(\"${1:obj}: \" + ${1:obj}) $0" "println(\"obj: \" + obj)" nil nil nil nil nil nil)
		       ("pri" "private $0" "private" nil nil nil nil nil nil)
		       ("pri.param" "private[${1:this}] $0" "private[this]" nil nil nil nil nil nil)
		       ("pro" "protected $0" "protected" nil nil nil nil nil nil)
		       ("prno" "protected[${1:this}] $0" "protected[this]" nil nil nil nil nil nil)
		       ("suite" "import org.scalatest._\n\nclass ${1:name} extends Suite {\n  $0\n}" "class T extends Suite { .. }" nil nil nil nil nil nil)
		       ("test" "//@Test\ndef test${1:name} = {\n  $0\n}" "@Test def testX = ..." nil nil nil nil nil nil)
		       ("throw" "throw new ${1:Exception}(${2:msg}) $0" "throw new Exception" nil nil nil nil nil nil)
		       ("tr" "trait ${1:name} {\n  $0\n}" "trait T { .. }" nil nil nil nil nil nil)
		       ("tr" "trait ${1:name} extends ${2:class} {\n  $0\n}" "trait T extends C { .. }" nil nil nil nil nil nil)
		       ("tr" "trait ${1:name} extends ${2:class} with ${3:trait} {\n  $0\n}" "trait T1 extends C with T2 { .. }" nil nil nil nil nil nil)
		       ("tr.with" "trait ${1:name} with ${2:trait} {\n  $0\n}" "trait T1 with T2 { .. }" nil nil nil nil nil nil)
		       ("try" "try {\n  $0\n} catch {\n  case ${1:e}: ${2:Exception} => \n    ${1:println(\\\"ERROR: \\\" + e) // TODO: handle exception}\\n}\n}" "try { .. } catch { case e => ..}" nil nil nil nil nil nil)
		       ("try" "try {\n  $0\n} catch {\n  case ${1:e}: ${2:Exception} =>\n    ${1:println(\\\"ERROR: \\\" + e) // TODO: handle exception}\\n}\n} finally {\n\n}" "try { .. } catch { case e => ..} finally { ..}" nil nil nil nil nil nil)
		       ("try" "try {\n\n} finally {\n  $0\n}" "try { .. } finally { .. }" nil nil nil nil nil nil)
		       ("tup.arrow" "${1:element1} -> ${2:element2} $0" "element1 -> element2" nil nil nil nil nil nil)
		       ("tup.paren" "(${1:element1}, ${2:element2}) $0" "(element1, element2)" nil nil nil nil nil nil)
		       ("val" "val ${1:name} = ${2:obj} $0" "val name = .." nil nil nil nil nil nil)
		       ("val" "val ${1:name} = new ${2:obj} $0" "val name = new .." nil nil nil nil nil nil)
		       ("val" "val ${1:name}: ${2:T} = ${3:obj} $0\n" "val name: T = .." nil nil nil nil nil nil)
		       ("var" "var ${1:name} = ${2:obj} $0\n" "var name = .." nil nil nil nil nil nil)
		       ("var.new" "var ${1:name} = new ${2:obj} $0\n" "var name = new .." nil nil nil nil nil nil)
		       ("var.ret" "var ${1:name}: ${2:T} = ${3:obj} $0\n" "var name: T = .." nil nil nil nil nil nil)
		       ("whi" "while (${1:condition}) {\n  $0\n}" "while(cond) { .. }" nil nil nil nil nil nil)
		       ("with" "with $0" "with T" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("args" "if [ $# -lt ${1:2} ]\n   then $0\nfi" "args" nil nil nil nil nil nil)
		       ("!" "#!/usr/bin/env bash\n$0" "bang" nil nil nil nil nil nil)
		       ("for" "for ${1:var} in ${2:stuff}; do\n    $0\ndone" "for loop" nil nil nil nil nil nil)
		       ("f" "function ${1:name} {\n         $0\n}" "function" nil nil nil nil nil nil)
		       ("if" "if ${1:[ -f file]}\n   then ${2:do}\nfi\n$0" "if" nil nil nil nil nil nil)
		       ("ife" "if ${1:cond}\nthen ${2:stuff}\nelse ${3:other}\nfi\n$0" "ife" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("cont" "# contributor: `user-full-name`" "cont" nil nil nil nil nil nil)
		       ("`" "\\`$0\\`" "elisp" nil nil nil nil nil nil)
		       ("field" "\\${${1:${2:n}:}$3${4:\\$(${5:lisp-fn})}\\}$0" "${ ...  } field" nil nil nil nil nil nil)
		       ("group" "# group : ${1:group}" "group" nil nil nil nil nil nil)
		       ("mirror" "\\${${2:n}:${4:\\$(${5:reflection-fn})}\\}$0" "${n:$(...)} mirror" nil nil nil nil nil nil)
		       ("vars" "# name : $1${2:\n# key : ${3:trigger-key}}${4:\n# keybinding : ${5:keybinding}}${6:\n# expand-env : (${7:})}\n# contributor : $6\n# key: vars\n# --\n$0" "Snippet header" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("column" "	,	${1:Name}		${2:Type}			${3:NOT NULL}\n" ", ColumnName ColumnType NOT NULL..." nil nil nil nil nil nil)
		       ("constraint" "CONSTRAINT [${1:PK_Name}] PRIMARY KEY ${2:CLUSTERED} ([${3:ColumnName}]) \n" "CONSTRAINT [..] PRIMARY KEY ..." nil nil nil nil nil nil)
		       ("constraint.1" "CONSTRAINT [${1:FK_Name}] FOREIGN KEY ${2:CLUSTERED} ([${3:ColumnName}]) \n" "CONSTRAINT [..] FOREIGN KEY ..." nil nil nil nil nil nil)
		       ("create" "CREATE TABLE [${1:dbo}].[${2:TableName}] \n(\n		${3:Id}		${4:INT IDENTITY(1,1)}		${5:NOT NULL}\n$0\n	CONSTRAINT [${6:PK_}] PRIMARY KEY ${7:CLUSTERED} ([$3]) \n)\nGO\n" "create table ..." nil nil nil nil nil nil)
		       ("create.1" "CREATE PROCEDURE [${1:dbo}].[${2:Name}] \n(\n		$3		$4		= ${5:NULL}		${6:OUTPUT}\n)\nAS\nBEGIN\n$0\nEND\nGO\n" "create procedure ..." nil nil nil nil nil nil)
		       ("references" "REFERENCES ${1:TableName}([${2:ColumnName}])\n" "REFERENCES ..." nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("as" "assert $0;;" "assert" nil nil nil nil nil nil)
		       ("d" "(* $0 *)" "docstring" nil nil nil nil nil nil)
		       ("for" "for ${1:cond} do\n    $0\ndone" "for" nil nil nil nil nil nil)
		       ("fun" "fun ${1:args} -> $0" "fun" nil nil nil nil nil nil)
		       ("|" "| ${1:match} -> $0" "guard" nil nil nil nil nil nil)
		       ("if" "if ${1:cond} then\n   $0\n" "ifthen" nil nil nil nil nil nil)
		       ("if" "if ${1:cond} then\n   $2\nelse\n        $0" "ifthenelse" nil nil nil nil nil nil)
		       ("let" "let ${1:var} $0" "let" nil nil nil nil nil nil)
		       ("l" "[? $1 | $0 ?]" "list_comprehension" nil nil nil nil nil nil)
		       ("m" "let main =\n    $0" "main" nil nil nil nil nil nil)
		       ("match" "match ${1:to_match} with\n      | ${2:matching} -> $0" "match" nil nil nil nil nil nil)
		       ("mod" "module ${1:A} =\n       struct\n       ${2:type t = { name : string; phone : string }}\n       $0\nend;;\n" "module" nil nil nil nil nil nil)
		       ("op" "open ${1:Module}" "open" nil nil nil nil nil nil)
		       ("pr" "Printf.printf \"${1:string}\" ${2:vals};;" "printf" nil nil nil nil nil nil)
		       ("rec" "let rec ${1:fun} ${2:args} =\n    $0" "rec" nil nil nil nil nil nil)
		       ("try" "try\n        $0\nwith\n        $1" "try" nil nil nil nil nil nil)
		       ("type" "type ${1:name} = {${2:var}: ${3:int}$0}" "type_record" nil nil nil nil nil nil)
		       ("type" "type ${1:expr} =\n     | $0" "type_type" nil nil nil nil nil nil)
		       ("val" "val ${1:fun} : $0" "val" nil nil nil nil nil nil)
		       ("wh" "while ${1:cond} do\n      $0\ndone" "while" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("as" "assert $0;;" "assert" nil nil nil nil nil nil)
		       ("d" "(* $0 *)" "docstring" nil nil nil nil nil nil)
		       ("for" "for ${1:cond} do\n    $0\ndone" "for" nil nil nil nil nil nil)
		       ("fun" "fun ${1:args} -> $0" "fun" nil nil nil nil nil nil)
		       ("|" "| ${1:match} -> $0" "guard" nil nil nil nil nil nil)
		       ("if" "if ${1:cond} then\n   $0\n" "ifthen" nil nil nil nil nil nil)
		       ("if" "if ${1:cond} then\n   $2\nelse\n        $0" "ifthenelse" nil nil nil nil nil nil)
		       ("let" "let ${1:var} $0" "let" nil nil nil nil nil nil)
		       ("l" "[? $1 | $0 ?]" "list_comprehension" nil nil nil nil nil nil)
		       ("m" "let main =\n    $0" "main" nil nil nil nil nil nil)
		       ("match" "match ${1:to_match} with\n      | ${2:matching} -> $0" "match" nil nil nil nil nil nil)
		       ("mod" "module ${1:A} =\n       struct\n       ${2:type t = { name : string; phone : string }}\n       $0\nend;;\n" "module" nil nil nil nil nil nil)
		       ("op" "open ${1:Module}" "open" nil nil nil nil nil nil)
		       ("pr" "Printf.printf \"${1:string}\" ${2:vals};;" "printf" nil nil nil nil nil nil)
		       ("rec" "let rec ${1:fun} ${2:args} =\n    $0" "rec" nil nil nil nil nil nil)
		       ("try" "try\n        $0\nwith\n        $1" "try" nil nil nil nil nil nil)
		       ("type" "type ${1:name} = {${2:var}: ${3:int}$0}" "type_record" nil nil nil nil nil nil)
		       ("type" "type ${1:expr} =\n     | $0" "type_type" nil nil nil nil nil nil)
		       ("val" "val ${1:fun} : $0" "val" nil nil nil nil nil nil)
		       ("wh" "while ${1:cond} do\n      $0\ndone" "while" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("env" "ENV{$1}$0" "ENV" nil nil nil nil nil nil)
		       ("goto" "GOTO=\"$1\"\n$0\n\nLABEL=\"$1\"" "GOTO" nil nil nil nil nil nil)
		       ("ker" "KERNEL!=\"$0\"" "KERNEL" nil nil nil nil nil nil)
		       ("add" "ACTION==\"add\", $0" "add" nil nil nil nil nil nil)
		       ("$" "$env{$1} $0" "env$" nil nil nil nil nil nil)
		       ("run" "RUN+=\"$0\"" "run" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'snippets
		     '(("entry" "${1:entry}: ${2:value}\n$0" "entry" nil nil nil nil nil nil)
		       ("list" "[$1]\n$0" "list" nil nil nil nil nil nil)
		       ("--" "--- # ${1:section}\n$0" "section" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Thu Jan  7 22:28:38 2016
