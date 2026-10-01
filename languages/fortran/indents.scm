; Indent nested Fortran scopes. PROGRAM, MODULE, and SUBMODULE deliberately
; do not appear here: their contents remain at the surrounding indentation.

; Program-unit and subprogram scopes.
(block_data
  (end_block_data_statement) @end) @indent

(interface
  (end_interface_statement) @end) @indent

(function
  (end_function_statement) @end) @indent

(subroutine
  (end_subroutine_statement) @end) @indent

(module_procedure
  (end_module_procedure_statement) @end) @indent

; Nested scoping units.
(derived_type_definition
  (end_type_statement) @end) @indent

(block_construct
  (end_block_construct_statement) @end) @indent

(associate_statement
  (end_associate_statement) @end) @indent

; Each SELECT TYPE/RANK branch has its own scope.
(select_type_statement
  (end_select_statement) @end) @indent

(type_statement) @indent

(select_rank_statement
  (end_select_statement) @end) @indent

(rank_statement) @indent

; Other multiline constructs.
(if_statement
  (end_if_statement) @end) @indent

(elseif_clause) @outdent
(elseif_clause) @indent
(else_clause) @outdent
(else_clause) @indent

(where_statement
  (end_where_statement) @end) @indent

(elsewhere_clause) @outdent
(elsewhere_clause) @indent

(forall_statement
  (end_forall_statement) @end) @indent

(do_loop
  (end_do_loop_statement) @end) @indent

(select_case_statement
  (end_select_statement) @end) @indent

(case_statement) @indent

(enum
  (end_enum_statement) @end) @indent

(coarray_team_statement
  (end_coarray_team_statement) @end) @indent

(coarray_critical_statement
  (end_coarray_critical_statement) @end) @indent
