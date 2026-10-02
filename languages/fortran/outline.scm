; Zed's Outline consumes @item and @name captures (rather than tags.scm).
; Capture the enclosing construct so nested procedures and types retain their
; hierarchy in the Outline panel.

(program
  (program_statement
    (name) @name)) @item

(module
  (module_statement
    (name) @name)) @item

(submodule
  (submodule_statement
    (name) @name)) @item

(block_data
  (block_data_statement
    (name) @name)) @item

(derived_type_definition
  (derived_type_statement
    (type_name) @name)) @item

(function
  (function_statement
    name: (name) @name)) @item

(subroutine
  (subroutine_statement
    name: (name) @name)) @item

(module_procedure
  (module_procedure_statement
    name: (name) @name)) @item

; In an INTERFACE, `MODULE PROCEDURE name` is represented by the grammar as a
; procedure_statement with a method_name. Its enclosing interface @item makes
; it a second-level Outline entry. This also exposes type-bound procedures
; beneath their derived type.
(procedure_statement
  (method_name) @name) @item

; Capture the complete opening statement as the label so both named generic
; interfaces (INTERFACE assignment(=)) and anonymous interfaces are visible.
; Procedures nested by the grammar inside this @item become second-level
; Outline entries automatically.
(interface
  (interface_statement) @name) @item
