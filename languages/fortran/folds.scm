; Fortran scoping units and constructs with their own local scope.
; The node spans the opening statement through its matching END statement,
; so Zed can fold the whole construct while retaining its declaration.
[
  ; Program units and subprograms
  (program)
  (module)
  (submodule)
  (block_data)
  (function)
  (subroutine)
  (module_procedure)

  ; Nested scoping units
  (interface)
  (derived_type_definition)
  (block_construct)
  (associate_statement)

  ; SELECT TYPE/RANK introduce a scope for each branch.
  (select_type_statement)
  (type_statement)
  (select_rank_statement)
  (rank_statement)

  ; Other multi-statement constructs supplied by the grammar.
  (if_statement)
  (where_statement)
  (forall_statement)
  (do_loop)
  (select_case_statement)
  (enum)
  (coarray_team_statement)
  (coarray_critical_statement)
] @fold
