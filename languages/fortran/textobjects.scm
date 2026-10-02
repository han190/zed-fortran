; Procedures are function text objects for Vim motions and selections.
[
  (function)
  (subroutine)
  (module_procedure)
] @function.around

; Program units and derived types act as class/section text objects.
[
  (program)
  (module)
  (submodule)
  (block_data)
  (derived_type_definition)
  (interface)
] @class.around

(comment)+ @comment.around
