; Literals and comments

(string_literal) @string
(hollerith_constant) @string
(filename) @string
(system_lib_string) @string

(number_literal) @number
(complex_literal) @number

[
  (boolean_literal)
  (nil_literal)
  (null_literal)
] @constant.builtin

[
  (comment)
  (inline_preproc_comment)
  (multiline_preproc_comment)
] @comment

; Preprocessor and compiler directives

[
  "#define"
  "#elif"
  "#elifdef"
  "#elifndef"
  "#else"
  "#endif"
  "#if"
  "#ifdef"
  "#ifndef"
  "#include"
  (preproc_directive)
  (custom_directive)
] @preproc

; Types and declaration attributes

(intrinsic_type) @type.builtin

[
  (base_type_specifier)
  (declared_type)
  (derived_type)
  (type_name)
] @type

(base_type_specifier
  (identifier) @type)

[
  (abstract_specifier)
  (access_specifier)
  (language_binding)
  (procedure_attributes)
  (procedure_qualifier)
  (type_qualifier)
] @attribute

(public_statement
  "public" @attribute)

(private_statement
  "private" @attribute)

; Keywords

[
  "all"
  "allocate"
  "assign"
  "assignment"
  "associate"
  "backspace"
  "block"
  "blockdata"
  "call"
  "case"
  "change"
  "class"
  "classis"
  "classof"
  "close"
  "common"
  "concurrent"
  "contains"
  "continue"
  "critical"
  "cycle"
  "data"
  "deallocate"
  "defined"
  "do"
  "else"
  "elseif"
  "elsewhere"
  "end"
  "endassociate"
  "endblock"
  "endblockdata"
  "endcritical"
  "enddo"
  "endenum"
  "endenumeration"
  "endfile"
  "endforall"
  "endfunction"
  "endif"
  "endinterface"
  "endmodule"
  "endprocedure"
  "endprogram"
  "endselect"
  "endsubmodule"
  "endsubroutine"
  "endteam"
  "endtype"
  "endwhere"
  "entry"
  "enum"
  "enumeration"
  "enumerator"
  "equivalence"
  "error"
  "event"
  "exit"
  "fail"
  "final"
  "flush"
  "fmt"
  "forall"
  "form"
  "format"
  "formatted"
  "function"
  "generic"
  "go"
  "goto"
  "if"
  "image"
  "images"
  "implicit"
  "import"
  "include"
  "initial"
  "inquire"
  "interface"
  "intrinsic"
  "is"
  "label"
  "local"
  "local_init"
  "lock"
  "memory"
  "module"
  "namelist"
  "none"
  "notify"
  "nullify"
  "only"
  "open"
  "operator"
  "pause"
  "post"
  "precision"
  "print"
  "procedure"
  "program"
  "property"
  "quiet"
  "rank"
  "read"
  "reduce"
  "result"
  "return"
  "rewind"
  "select"
  "selectcase"
  "selectrank"
  "selecttype"
  "sequence"
  "statement_label"
  "statement_label_reference"
  "stop"
  "submodule"
  "subroutine"
  "sync"
  "team"
  "then"
  "to"
  "type"
  "typeis"
  "typeof"
  "unformatted"
  "unlock"
  "use"
  "wait"
  "where"
  "while"
  "write"
] @keyword

(implicit_statement
  (none) @keyword)

(implicit_statement
  "external" @keyword)

(use_statement
  "non_intrinsic" @keyword)

; Operators and punctuation

[
  "!="
  "&&"
  "*"
  "**"
  "+"
  "-"
  "/"
  "//"
  "/="
  "<"
  "<<"
  "<="
  "="
  "=="
  "=>"
  ">"
  ">="
  ">>"
  "?"
  "^"
  "|"
  "||"
  ".and."
  ".eq."
  ".eqv."
  ".ge."
  ".gt."
  ".le."
  ".lt."
  ".ne."
  ".neqv."
  ".not."
  ".or."
  (operator)
  (user_defined_operator)
] @operator

; A signed literal is parsed as a unary expression, rather than as a single
; number_literal. Highlight both parts as one numeric entity.
(unary_expression
  operator: [
    "-"
    "+"
  ] @number
  argument: (number_literal) @number)

[
  "("
  "(/"
  ")"
  "/)"
  "["
  "]"
  "<<<"
  ">>>"
] @punctuation.bracket

[
  ","
  "%"
  ":"
  "::"
  ";"
] @punctuation.delimiter

[
  "&"
  "..."
] @punctuation.special

; Names

(identifier) @variable

(number_literal
  kind: (identifier) @number)

; ISO_C_BINDING named constants. This includes GNU Fortran's documented
; integer-128 and unsigned-integer extensions:
; https://gcc.gnu.org/onlinedocs/gfortran/ISO_005fC_005fBINDING.html
(
  (identifier) @constant.builtin
  (#match? @constant.builtin "(?i)^(c_int|c_short|c_long|c_long_long|c_signed_char|c_size_t|c_int8_t|c_int16_t|c_int32_t|c_int64_t|c_int128_t|c_int_least8_t|c_int_least16_t|c_int_least32_t|c_int_least64_t|c_int_least128_t|c_int_fast8_t|c_int_fast16_t|c_int_fast32_t|c_int_fast64_t|c_int_fast128_t|c_intmax_t|c_intptr_t|c_ptrdiff_t)$")
)

(
  (identifier) @constant.builtin
  (#match? @constant.builtin "(?i)^(c_float|c_double|c_long_double|c_float128|c_float_complex|c_double_complex|c_long_double_complex|c_float128_complex|c_bool|c_char)$")
)

(
  (identifier) @constant.builtin
  (#match? @constant.builtin "(?i)^(c_unsigned|c_unsigned_short|c_unsigned_char|c_unsigned_long|c_unsigned_long_long|c_uintmax_t|c_uint8_t|c_uint16_t|c_uint32_t|c_uint64_t|c_uint128_t|c_uint_fast8_t|c_uint_fast16_t|c_uint_fast32_t|c_uint_fast64_t|c_uint_fast128_t|c_uint_least8_t|c_uint_least16_t|c_uint_least32_t|c_uint_least64_t|c_uint_least128_t)$")
)

(
  (identifier) @constant.builtin
  (#match? @constant.builtin "(?i)^(c_null_char|c_alert|c_backspace|c_form_feed|c_new_line|c_carriage_return|c_horizontal_tab|c_vertical_tab|c_null_ptr|c_null_funptr)$")
)

; ISO_FORTRAN_ENV named constants. GNU Fortran's documentation spells the
; initial-team constant "INTIAL_TEAM"; the standard identifier is INITIAL_TEAM.
; https://gcc.gnu.org/onlinedocs/gfortran/ISO_005fFORTRAN_005fENV.html
(
  (identifier) @constant.builtin
  (#match? @constant.builtin "(?i)^(atomic_int_kind|atomic_logical_kind|character_kinds|character_storage_size|current_team|error_unit|file_storage_size|initial_team|input_unit|int8|int16|int32|int64|integer_kinds|iostat_end|iostat_eor|iostat_inquire_internal_unit|numeric_storage_size|logical_kinds|output_unit|parent_team)$")
)

(
  (identifier) @constant.builtin
  (#match? @constant.builtin "(?i)^(real32|real64|real128|real_kinds|stat_locked|stat_locked_other_image|stat_stopped_image|stat_failed_image|stat_unlocked|uint8|uint16|uint32|uint64)$")
)

; A kind selector is an identifier in the grammar, but is part of the literal.
; Keep it numeric even when its name is also an ISO_FORTRAN_ENV constant.
(number_literal) @number

(number_literal
  kind: (identifier) @number)

[
  (statement_label)
  (statement_label_reference)
] @label

(parameters
  (identifier) @variable.parameter)

(program_statement
  (name) @title)

(module_statement
  (name) @type)

(submodule_statement
  (module_name) @type
  (name) @type)

(function_statement
  (name) @function)

(subroutine_statement
  (name) @function)

(module_procedure_statement
  (name) @function)

(end_type_statement
  (name) @type)

(end_function_statement
  (name) @function)

(end_subroutine_statement
  (name) @function)

(end_module_procedure_statement
  (name) @function)

(subroutine_call
  (identifier) @function)

; GNU Fortran intrinsic procedures. This list is taken from:
; https://gcc.gnu.org/onlinedocs/gfortran/Intrinsic-Procedures.html
;
; Fortran is case-insensitive. Restrict these matches to a function-like call
; or the target of a CALL statement so parameters and variables with names
; such as kind, len, and unit retain their normal highlighting.

(
  [
    (call_expression
      (identifier) @function
      (argument_list))
    (subroutine_call
      subroutine: (identifier) @function)
  ]
  (#match? @function "(?i)^(abort|abs|access|achar|acos|acosd|acosh|acospi|adjustl|adjustr|aimag|aint|alarm|all|allocated|and|anint|any|asin|asind|asinh|asinpi|associated|atan|atan2|atan2d|atan2pi|atand|atanh|atanpi|atomic_add|atomic_and|atomic_cas|atomic_define|atomic_fetch_add|atomic_fetch_and|atomic_fetch_or|atomic_fetch_xor|atomic_or|atomic_ref|atomic_xor)$")
)

(
  [
    (call_expression
      (identifier) @function
      (argument_list))
    (subroutine_call
      subroutine: (identifier) @function)
  ]
  (#match? @function "(?i)^(backtrace|bessel_j0|bessel_j1|bessel_jn|bessel_y0|bessel_y1|bessel_yn|bge|bgt|bit_size|ble|blt|btest)$")
)

; ISO_C_BINDING intrinsic procedures documented by GNU Fortran:
; https://gcc.gnu.org/onlinedocs/gfortran/ISO_005fC_005fBINDING.html
(
  [
    (call_expression
      (identifier) @function.builtin
      (argument_list))
    (subroutine_call
      subroutine: (identifier) @function.builtin)
  ]
  (#match? @function.builtin "(?i)^(c_associated|c_f_pointer|c_f_procpointer|c_funloc|c_loc|c_sizeof)$")
)

; ISO_FORTRAN_ENV intrinsic procedures documented by GNU Fortran:
; https://gcc.gnu.org/onlinedocs/gfortran/ISO_005fFORTRAN_005fENV.html
(
  [
    (call_expression
      (identifier) @function.builtin
      (argument_list))
    (subroutine_call
      subroutine: (identifier) @function.builtin)
  ]
  (#match? @function.builtin "(?i)^(compiler_options|compiler_version)$")
)

(
  [
    (call_expression
      (identifier) @function
      (argument_list))
    (subroutine_call
      subroutine: (identifier) @function)
  ]
  (#match? @function "(?i)^(c_f_strpointer|ceiling|char|chdir|chmod|cmplx|co_broadcast|co_max|co_min|co_reduce|co_sum|command_argument_count|complex|conjg|cos|cosd|cosh|coshape|cospi|cotan|cotand|count|cpu_time|cshift|ctime)$")
)

(
  [
    (call_expression
      (identifier) @function
      (argument_list))
    (subroutine_call
      subroutine: (identifier) @function)
  ]
  (#match? @function "(?i)^(date_and_time|dble|dcmplx|digits|dim|dot_product|dprod|dreal|dshiftl|dshiftr|dtime)$")
)

(
  [
    (call_expression
      (identifier) @function
      (argument_list))
    (subroutine_call
      subroutine: (identifier) @function)
  ]
  (#match? @function "(?i)^(eoshift|epsilon|erf|erfc|erfc_scaled|etime|event_query|execute_command_line|exit|exp|exponent|extends_type_of)$")
)

(
  [
    (call_expression
      (identifier) @function
      (argument_list))
    (subroutine_call
      subroutine: (identifier) @function)
  ]
  (#match? @function "(?i)^(f_c_string|fdate|fget|fgetc|findloc|floor|flush|fnum|fput|fputc|fraction|free|fseek|fstat|ftell)$")
)

(
  [
    (call_expression
      (identifier) @function
      (argument_list))
    (subroutine_call
      subroutine: (identifier) @function)
  ]
  (#match? @function "(?i)^(gamma|gerror|get_command|get_command_argument|get_environment_variable|get_team|getarg|getcwd|getenv|getgid|getlog|getpid|getuid|gmtime)$")
)

(
  [
    (call_expression
      (identifier) @function
      (argument_list))
    (subroutine_call
      subroutine: (identifier) @function)
  ]
  (#match? @function "(?i)^(hostnm|huge|hypot)$")
)

(
  [
    (call_expression
      (identifier) @function
      (argument_list))
    (subroutine_call
      subroutine: (identifier) @function)
  ]
  (#match? @function "(?i)^(iachar|iall|iand|iany|iargc|ibclr|ibits|ibset|ichar|idate|ieor|ierrno|image_index|index|int|int2|int8|ior|iparity|irand|is_contiguous|is_iostat_end|is_iostat_eor|isatty|ishft|ishftc|isnan|itime)$")
)

(
  [
    (call_expression
      (identifier) @function
      (argument_list))
    (subroutine_call
      subroutine: (identifier) @function)
  ]
  (#match? @function "(?i)^(kill|kind)$")
)

(
  [
    (call_expression
      (identifier) @function
      (argument_list))
    (subroutine_call
      subroutine: (identifier) @function)
  ]
  (#match? @function "(?i)^(lbound|lcobound|leadz|len|len_trim|lge|lgt|link|lle|llt|lnblnk|loc|log|log10|log_gamma|logical|lshift|lstat|ltime)$")
)

(
  [
    (call_expression
      (identifier) @function
      (argument_list))
    (subroutine_call
      subroutine: (identifier) @function)
  ]
  (#match? @function "(?i)^(malloc|maskl|maskr|matmul|max|maxexponent|maxloc|maxval|mclock|mclock8|merge|merge_bits|min|minexponent|minloc|minval|mod|modulo|move_alloc|mvbits)$")
)

(
  [
    (call_expression
      (identifier) @function
      (argument_list))
    (subroutine_call
      subroutine: (identifier) @function)
  ]
  (#match? @function "(?i)^(nearest|new_line|nint|norm2|not|null|num_images)$")
)

(
  [
    (call_expression
      (identifier) @function
      (argument_list))
    (subroutine_call
      subroutine: (identifier) @function)
  ]
  (#match? @function "(?i)^(or|out_of_range)$")
)

(
  [
    (call_expression
      (identifier) @function
      (argument_list))
    (subroutine_call
      subroutine: (identifier) @function)
  ]
  (#match? @function "(?i)^(pack|parity|perror|popcnt|poppar|precision|present|product)$")
)

(
  [
    (call_expression
      (identifier) @function
      (argument_list))
    (subroutine_call
      subroutine: (identifier) @function)
  ]
  (#match? @function "(?i)^(radix|ran|rand|random_init|random_number|random_seed|range|real|rename|repeat|reshape|rrspacing|rshift)$")
)

(
  [
    (call_expression
      (identifier) @function
      (argument_list))
    (subroutine_call
      subroutine: (identifier) @function)
  ]
  (#match? @function "(?i)^(same_type_as|scale|scan|secnds|second|selected_char_kind|selected_int_kind|selected_logical_kind|selected_real_kind|selected_unsigned_kind|set_exponent|shape|shifta|shiftl|shiftr|sign|signal|sin|sind|sinh|sinpi|size|sizeof|sleep|spacing|split|spread|sqrt|srand|stat|storage_size|sum|symlnk|system|system_clock)$")
)

(
  [
    (call_expression
      (identifier) @function
      (argument_list))
    (subroutine_call
      subroutine: (identifier) @function)
  ]
  (#match? @function "(?i)^(tan|tand|tanh|tanpi|team_number|this_image|time|time8|tiny|trailz|transfer|transpose|trim|ttynam)$")
)

(
  [
    (call_expression
      (identifier) @function
      (argument_list))
    (subroutine_call
      subroutine: (identifier) @function)
  ]
  (#match? @function "(?i)^(ubound|ucobound|uint|umask|umaskl|umaskr|unlink|unpack)$")
)

(
  [
    (call_expression
      (identifier) @function
      (argument_list))
    (subroutine_call
      subroutine: (identifier) @function)
  ]
  (#match? @function "(?i)^(verify)$")
)

(
  [
    (call_expression
      (identifier) @function
      (argument_list))
    (subroutine_call
      subroutine: (identifier) @function)
  ]
  (#match? @function "(?i)^(xor)$")
)

(keyword_argument
  name: (identifier) @property)

(derived_type_member_expression
  (type_member) @property)

; In fixed-form source, a C, c, or * in column one denotes a comment. The
; grammar does not model those lines, so recover their highlighting from the
; error node that covers the line. Keep this rule last so it takes precedence
; over captures nested inside the error node.
((ERROR) @comment
  (#match? @comment "^[Cc*]"))
