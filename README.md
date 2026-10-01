# Fortran syntax highlighting for Zed

A deliberately small, local-first Zed extension for Fortran syntax
highlighting and language intelligence. It uses
[`stadelmanma/tree-sitter-fortran`](https://github.com/stadelmanma/tree-sitter-fortran)
directly and starts [`fortls`](https://fortls.fortran-lang.org/) when it is
available on the workspace PATH.

## Install locally

Install a Rust toolchain first; Zed uses Cargo to build the small extension
module that launches `fortls`.

1. Open Zed's Extensions view.
2. Select **Install Dev Extension**.
3. Select this repository directory.

If the marketplace Fortran extension is installed, this development extension
uses the same `fortran` ID and overrides it until the development extension is
uninstalled.

## Supported files

The extension associates common free-form suffixes (`.f90`, `.f95`, `.f03`,
`.f08`, and `.f18`) and fixed-form suffixes (`.f`, `.for`, `.ftn`, and `.f77`)
with Fortran. Uppercase variants used for preprocessed source are included.

The pinned grammar is primarily a free-form grammar. It parses many fixed-form
statements because Fortran whitespace is mostly insignificant, and this
extension recovers column-one `C`, `c`, and `*` comment highlighting. Classic
column-six continuation is not modeled completely by the grammar. The sample
files keep that limitation visible while the parser remains an external
dependency.

## Scope

This package contains only:

- Zed extension metadata;
- Fortran language and file-suffix metadata;
- Tree-sitter highlight and folding queries; and
- a `fortls` language-server launcher; and
- free- and fixed-form visual samples.

`fortls` provides completion, navigation, hover information, and diagnostics.
Install it separately (for example, `brew install fortls` or `pip install
fortls`) and ensure it is on your PATH. It does not provide document
formatting; indentation is syntax-based, uses two spaces, and leaves `PROGRAM`,
`MODULE`, and `SUBMODULE` contents at their surrounding indentation. Folding
covers Fortran scoping units and block constructs.

## Grammar revision

The grammar is pinned in `extension.toml` to commit
`2bc0220f34ca660ec9571c54ea57ed5363338de1`.
