# Changelog
All notable changes to the `l3kernel` bundle since the start of 2018
will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
this project uses date-based 'snapshot' version identifiers.

## [Unreleased]

## [2025-07-20]

### Added
- `\tl_retokenize:n`
- Support for key value expansion in `l3keys`

### Changed
- Track LuaMetaTeX changes in `\meaning` output

## [2025-07-19]

### Fixed
- Treat active chars as control sequences when breaking text into words

## [2025-07-11]

### Fixed
- Exclude math mode from word/grapheme mapping (issue \#1773)

## [2025-06-30]

### Added
- `\text_declare_(lower|title|upper)case_exclusion:n`
- `\text_map_tokens:nn` and `\text_words_map_tokens:nn`
- Module `l3str-format`, moved from `l3experimental` to stable status

## [2025-06-09]

### Fixed
- Implementation of `\iow_show:n`

## [2025-05-26]

### Added
- `\sys_finalize:`

### Changed
- Print `added`/`updated` info only after 2020-02-02

### Deprecated
- `\sys_finalise:` in favor of `\sys_finalize:`

### Fixed
- Expansion of `\file_input_raw:n` with engines other than LuaTeX

## [2025-05-19]

### Added
- Support for the Oklab and Oklch color models
- `\iow_show:n` (issue \#1532)
- `\token_if_control_symbol:N(TF)` and `\token_if_control_word:N(TF)`
- `\regex_if_match:(N|n)n(TF)` to replace `\regex_match:(N|n)n(TF)`

### Changed
- Preserve `intarray` variables across multiple dumps (issue \#1597)
- Adjust `\tl_(g)set_rescan:Nnn` to support LuaMetaTeX

### Deprecated
- `\regex_match:(N|n)n(TF)`

### Fixed
- Interaction of `.initial:n` and `.inherit:n` key properties (issue \#1738)
- Multi-level key inheritance with explicit keys at intermediate levels
  (issue \#1739)

## [2025-04-29]

### Fixed
- Support for LuaMetaTeX in generic mode (issue \#1702)

## [2025-04-14]

### Added
- Module `l3benchmark`, moved from `l3experimental` to stable status
- Module `l3opacity`, moved from `l3experimental` to stable status

### Fixed
- Filter out `\bgroup`/`\egroup` in `\text_purify:n`
- Inherit keys recursively (issue \#1720)

## [2025-03-26]

### Added
- Module `l3graphics`, moved from `l3experimental` to stable status

### Fixed
- Correct scope for `\prg_gset_conditional:Nnn`

## [2025-03-10]

### Added
- `\text_words_map_function:nN`
- Variants `\tl_head:e` and `\tl_tail:e`
- `l3tl` functions (and variants) which trim spaces from only one side
  (issue \#1673):
  - `\tl_trim_left_spaces:n`, `\tl_trim_left_spaces_apply:nN`,
    `\tl_(g)trim_left_spaces:N`
  - `\tl_trim_right_spaces:n`, `\tl_trim_right_spaces_apply:nN`,
    `\tl_(g)trim_right_spaces:N`

### Changed
- `\fp_set_function:nnn` and `\fp_set_variable:nn` now raise errors on
  undefined (fp) identifiers (issue \#1700)

### Fixed
- Avoid low-level error if keys are given without a module (issue \#1254)

## [2025-01-18]

### Changed
- Use a dedicated internal marker for `fp` and `int` expressions, allowing use
  with LuaMetaTeX (see \#1518)

### Fixed
- Missing trailing period in `\tl_analysis_log:(N|n)` output (see \#1663)
- Some state variables weren't correctly reset by `\keys_define:nn` and
    `\keys_set:nn` breaking some nested usages in edge cases

## [2025-01-14]

### Added
- `\int_step_tokens:nn`, `\int_step_tokens:nnn`, and `\int_step_tokens:nnnn`

### Deprecated
- `\sys_if_timer_exist:(TF)`

### Fixed
- Check conditionals are defined when creating variants (see \#1189)

## [2024-12-25]

### Added
- `\file_forget:n`

### Changed
- Expand 'value(s)' arg. to `\color_select:nn`, `\color_set:nnn`, etc. (see
  \#1640)

### Fixed
- Initialize color `.` properly (see \#1642)

## [2024-12-09]

### Added
- `\bitset_use:N` and `\clist_use:N`: this clarifies that bitsets and clists
  can be used with `V`-type expansion
- `\sys_if_engine_opentype:(TF)`
- Add equivalent interfaces for regex functions:
  - `\int_(g)set_regex_count:Nnn`, `\int_(g)set_regex_count:NNn`
  - `\seq_(g)set_regex_extract_once:Nnn`, `\seq_(g)set_regex_extract_once:NNn`
  - `\seq_(g)set_regex_extract_all:Nnn`, `\seq_(g)set_regex_extract_all:NNn`
  - `\seq_(g)set_regex_split:Nnn`, `\seq_(g)set_regex_split:NNn`
  - `\tl_if_regex_match:nn(TF)`, `\tl_if_regex_match:nN(TF)`
  - `\tl_regex_(g)replace_once:Nnn`, `\tl_regex_(g)replace_once:NNn`
  - `\tl_regex_(g)replace_all:Nnn`, `\tl_regex_(g)replace_all:NNn`

### Fixed
- `\prop_item:Nn` result not returned in `\exp_not:n` for linked properties
  (see \#1630)

### Removed
- `\c_catcode_active_tl`: was missing a `_`, always intended to be internal

## [2024-11-02]

### Added
- `V`-type variant for all `\<var>_set:Nn` functions

### Fixed
- Error detection in coffin code (see \#1580)

## [2024-10-09]

### Added
- `\coffin_ht_plus_dp:(N|c)`

### Fixed
- Use TU-encoding with lualatex and xelatex in `l3doc`
- Inconsistent local/global assignments in `l3doc` (see \#1593)

## [2024-09-10]

### Changed
- Increase outdent of long function names in `l3doc` (issue \#1585)

### Fixed
- `\seq_map_pairwise_function:NNN` not work with `\seq_map_break:(n)` (issue \#1587)

## [2024-08-30]

### Changed
- Reduce memory usage when building Unicode data storage
- Avoid recursive doc for `\file_if_exist:n(TF)` (issue \#1573)

### Fixed
- Handling of `ltcmd` newlines (`\obeyedline`) in `l3doc` (issue \#1577)

## [2024-08-16]

### Added
- Add quark (`\q_`) and scan mark (`\s_`) prefixes to naming scheme
  (issue \#1565)

## [2024-07-20]

### Fixed
- Implementation of deprecated `\tl_mixed_case:n(n)`
- Redo the fix for LaTeX2e key properties (issue latex3/latex2e\#1415)

## [2024-06-19]

### Fixed
- Avoid a low-level error when LaTeX2e key properties are given without a value

## [2024-05-27]

### Added
- Syntax entries of `\keys_set_groups:nnn(n)N`

### Fixed
- `\peek_analysis_map_inline:n` with active spaces (issue \#1539)

## [2024-05-08]

### Added
- Full set of variants for `\prop_(g)put_if_not_in:Nnn`
- `\keys_set_groups:nnn(n)N` to match `\keys_set_exclude_groups:nnn(n)N`

### Fixed
- Implementation of deprecated `\pdf_object_write:nn`

## [2024-04-11]

### Added
- `\prop_(g)put_if_not_in:Nnn` (renamed from `\prop_(g)put_if_new:Nnn`)
- `\intarray_if_exist:N(TF)`
- `\fparray_if_exist:N(TF)`
- Support for 'indexed' PDF objects

### Changed
- Expand object names in `\pdf_object_...` functions (issue \#1521)
- Adapt `l3doc` for `ltcmd` change to handling of newlines
  (see latex3/latex2e\#1304)
- Return active spaces from `\sys_get_query:n(nn)N` (issue \#1529)

### Fixed
- False `debug` error raised by `\cctab_const:Nn` (issue \#1508)
- Undefined `\__kernel_iwo_open:Nn` used in `\iow_shell_open:Nn`
  (issue \#1515)
- Naming of register functions in LuaMetaTeX 2.11+ (issue \#1518)
- Catcode applied to letters by `\sys_get_query:n(nn)N`

### Deprecated
- `\prop_(g)put_if_new:Nnn` (renamed to `\prop_(g)put_if_not_in:Nnn`)

## [2024-03-14]

### Added
- Macro interface for `l3sys-query`

### Changed
- Require that `expl3` is loaded at top level in generic mode
- Ensure that the dimension arguments to `\box_autosize_to_...:Nnn`
  are properly formed (issue \#1502)

### Fixed
- Typeset `TF` of internal conditionals in current color (issue \#730)
- Some functions and variables were defined locally

## [2024-02-20]

### Changed
- Improve error recovery when an invalid `prop` is used (PR \#1464) 

### Fixed
- Restore `\__kernel_msg_...:nnx(xx)` for older `xparse` support
- Prevent an infinite loop in `\debug_(on|off):n` (issue \#1442)
- Require `\sys_ensure_backend:` is used in the preamble (issue \#1442)

## [2024-02-18]

### Changed
- Work-around to enable `\prop_set_from_keyval:Nn`, etc., to avoid an error if
  `prop` is not already defined

### Fixed
- Extend debug checking to cover `\prop_(g)set_from_keyval:Nn`

## [2024-02-13]

### Added
- Checking missing `\endgroup` at the end of `\DocInclude`
- Linked storage type for large property lists (issue \#1040, pull \#1059)

### Changed
- `\meta` now typesets in `\texttt`, along with `\Arg`
- Improved the performance of `\cs_if_exist:NTF`, `\cs_if_free:NTF`,
    `\cs_if_exist_use:NTF`, and most notably their `c`-type variants.

### Fixed
- Inconsistent local/global assignments in `\vcoffin_gset:Nnn` and
  `\vcoffin_gset:Nnw`
- Tokenization by `\peek_analysis_map_inline:n` of one additional
  character after any space or brace

### Deprecated
- `\msg_gset:nnn(n)`

## [2024-01-22]

### Added
- `\keys_set_exclude_groups:nnn(nN)` to replace `\keys_set_filter:nnn(nN)`
- Flags with N-type names, like other variable types

### Changed
- Set `l3doc` option `kernel` off as-standard (issue \#1403)
- Moved `\seq_set_filter:NNn` to stable

### Deprecated
- `\keys_set_filter:nnn(nN)` in favor of  `\keys_set_exclude_groups:nnn(nN)`

## [2024-01-04]

### Added
- Documentation for `\bitset_show_named_index:N` (issue \#1372)
- `\bitset_log_named_index:N`
- `\tl_build_get_intermediate:NN`
- Support for `.default:n` values for the `unknown` handler (see issue \#67)

### Changed
- Improved method to suppress `l3bitset` where required
- Clarify behavior of `\tl_if_novalue:n(TF)` (see issue \#1402)

### Deprecated
- `\tl_build_get:NN` in favor of `\tl_build_get_intermediate:NN`

### Fixed
- Handling of `documented-as` variants in `l3doc` indexing
  (see issue \#1345)
- Missing trailing `TF` in single variant of conditional functions (issue \#1398)

## [2023-12-11]

### Changed
- Use keyval handler for `l3doc` class options

### Fixed
- Support for deprecated `pdf` module functions (issue \#1373)
- Generate stub `l3bitset` for transitional support

## [2023-12-08]

### Added
- `\c_empty_str` (issue \#1361)
- `l3bitset`: moved from `l3experimental`

### Fixed
- Return `str` (not `tl`) in `\bool_to_str:N` and `\bool_to_str:n` (issue \#1331)
- Catcode of space from `\str_set_convert:Nnnn` (issue \#1344)
- Tidy up various documentation issues (issue \#1345)

## [2023-11-09]

### Added
- Documentation for `\c_nan_fp`
- `\str_case_e:en(TF)`

### Changed
- Speed up `\str_(g)set:Nn`, `\str_const:Nn`, `\str_(g)put_left:Nn`,
  and `\str_(g)put_right:Nn`

### Fixed
- Normalization of `.inherit:n` key data (issue \#1314)

## [2023-11-01]

### Added
- `\seq_(g)set_map_e:NNn`
- Documentation for `\ExplLoaderFileDate` in `expl3.pdf`

### Changed
- Documentation improvements
- Refine action of `\text_titlecase_first:n(n)` to be focussed strictly on
  first (relevant) codepoint in the input
- Standardize "This is the (e)TeX primitive ..." in `texnote` in documentation
- Move `\tl_build_(g)begin:N`, `\tl_build_(g)end:N`, `\tl_build_(g)put_left:Nn`
  and `\tl_build_(g)right:Nn` to stable status

### Deprecated
- `\seq_(g)set_map_x:NNn` in favor of `e`-type naming

### Fixed
- `\fp_clear_variable:n` should act locally (issue \#1298)
- `\fp_clear_function:n` should act locally and correctly
- Support for `\fp_show:N` showing symbolic expressions (issue \#1301)
- Undefined `\str_case:en(TF)` (excluding `\str_case:en`)

## [2023-10-23]

### Added
- `\text_titlecase_all:n(n)`
- `\token_to_catcode:N`
- Support for symbolic variables in fp input:
  `\fp_new_variable:n`, `\fp_set_variable:nn` and `\fp_clear_variable:n`
- Support for user-defined functions in fp expressions:
  `\fp_new_function:n`, `\fp_set_function:nnn` and `\fp_clear_function:n`

### Changed
- Clarify action of `\text_titlecase_first:n(n)`
- Detect letters for titlecasing based on Unicode general category

### Deprecated
- `\text_titlecase:n(n)` as ambiguous: replaced by `\text_titlecase_all:n(n)`
- `\tl_build_(g)clear:N` in favor of `\tl_build_(g)begin:N`

### Fixed
- Support arbitrary BCP-47 locales for case-changing overrides (issue \#1239)
- Retain braces when ending titlecasing with some input structures

## [2023-10-10]

### Added
- `\iow_shipout_e:Nn`
- Documentation for `\sys_if_timer_exist_p:` and `\sys_if_timer_exist:(TF)`.
  They were supported since l3kernel 2021-05-25, along with `\sys_timer:`.
- l3doc.dtx: Support for footnotes in the function and variable environment  
- Variants `\tl_if_single:c(TF)` and `\tl_if_single_p:c` (issue \#1272)
- Key properties `.str_(g)set_e:N` and `.tl_(g)set_e:N`

### Changed
- Switch generally from `x`- to `e`-type variants
- Convert `\file_if_exist:n(TF)` to expandable status,
  adding predicate version
- Standardize variants for `\prop_(g)pop:NnN(TF)`
- Standardize variants for `\prop_(g)put:Nnn`
- Standardize variants for `\prop_(g)put_if_new:Nnn`
- Standardize variants for `\prop_(g)remove:Nn`

### Deprecated
- `\iow_shipout_x:Nn` in favor of `e`-type naming
- Key properties `.str_(g)set_x:N` and `.tl_(g)set_x:N`

### Fixed
- Rare rounding error in divisions (issue \#1264)

## [2023-08-29]

### Added
- `\c_sys_timestamp_str`

### Changed
- Rename `\tex_pdfcreationdate:D` to `\tex_creationdate:D`

## [2023-08-11]

### Changed
- Wrap long lists of variants in `l3doc` display of functions (issue \#1258)

### Fixed
- Revert 'Allow for implicit chars when case changing' (issue \#1260)

## [2023-08-03]

### Added
- `\tex_XeTeXhyphenatablelength:D`, `\tex_XeTeXinterwordspaceshaping:D`,
  `\tex_XeTeXselectorcode:D`
- Several missing `\tex_<name>:D` primitives from LuaTeX and (up)TeX

### Changed

- `\tex_protrudechars:D` now defined for XeTeX (to `\XeTeXprotrudechars`)
- Allow for optional `v` in version string argument to
  `\ProvidesExpl...`

### Fixed
- Allow for implicit chars when case changing

## [2023-06-30]

### Added
- `\codepoint_to_category:n`

### Changed
- Drop notes about slow `\expanded` emulation. `\expanded` is required since
  release 2023-05-15
- Sync engine/primitive requirements in `expl3.dtx` with code and README

### Fixed
- Case changing of Greek characters with complex NFD representation (issue \#1236)
- Error recovery when wrongly applying abs to a tuple (issue \#1238)

## [2023-06-16]

### Changed
- Exclude entries in `\l_text_case_exclude_arg_tl` from expansion in `\text_expand:n`
  (latex3/latex2e\#904)
- Generate _dialytika_ if appropriate when uppercasing Greek words starting with a
  vowel taking a breathing mark (issue \#1228)
- Retain stress diacritics when uppercasing Greek (issue \#1230)
- Expand (partial) paths in `\l_file_search_path_seq` and `\input@path`
  (see latex3/latex2e\#1086)

## [2023-06-05]

### Added
- `\cctab_gsave_current:N`, `\g_tmpa_cctab` and `\g_tmpb_cctab` (issue \#1089)
- `\prg_gset_eq_conditional:NNn` (issue \#1212)
- `\iow_shell_open:Nn` (issue \#1122)

### Deprecated
- `\tl_case:Nn(TF)`
- `expl3` package option `enable-debug` (no longer required)

### Fixed
- Set `\l_keys_value_tl` in `.initial:n` (issue \#1013)
- Support for boolean values in `expl3` package options
  `check-declarations` and `log-functions` (issue \#978)
- Allow for optional `/` at end of `\input@path` entries
  (see latex3/latex2e\#1076)

## [2023-05-22]

### Added
- Rounded out the `\use_i:nn...` functions to cover all cases taking
  one argument from up to nine arguments
- `\coffin_(g)reset_poles:N`
- `\dim_to_decimal_in_<unit>:n`, for `<unit>` types
  `cc`, `cm`, `dd`, `in`, `mm` and `pc`
- `\file_input_raw:n`
- `\int_if_zero:n(TF)`
- `\str_mdfive_hash:n`

### Changed
- Remove `\noexpand` inside math mode in `\text_expand:n`
- Re-implement `\dim_to_decimal_in_bp:n` and 
  `\dim_to_decimal_in_unit:nn` to be re-entrant (issue \#954)

### Fixed
- Omit `0123456789` from URL escaping (issue \#838)
- Leave implicit chars unchanged in `\text_expand:n` (issue \#874)
- Filtering/grouping applied to meta keys (issue \#940)
- Issue correct error message if `bool` key is set
  incorrectly using `.initial:n` (issue \#1013)
- Set `\l_keys_key_str` in `.initial:n` (issue \#1013)
- Handling of implicit chars in `\text_purify:n` (issue \#1208)

## [2023-05-15]

### Changed
- Require `\expanded` and 'pdfTeX extension' primitives,
  and thus TeX distributions from mid-2019 onward

### Fixed
- Treatment of trailing `/` in `\input@path`

## [2023-05-11]

### Added
- `\seq_map_pairwise_function:NNN` (renamed from  `\seq_mapthread_function:NNN`)

### Changed
- Moved `\seq_set_item:Nnn` to stable status
- Track seen filenames to improve performance of
  `\file_full_name:n` and dependent file operations

### Removed
- Experimental function `\seq_pop_item:NnN` from `l3candidates`
- Experimental function `\seq_mapthread_function:NNN` now renamed
  `\seq_map_pairwise_function:NNN`

## [2023-05-05]

### Added
- `\bool_case:n(TF)` (renamed from  `\bool_case_true:n(TF)`)
- `\flag_ensure_raised:n` (renamed from `\flag_raise_if_clear:n`)
- `\iow_wrap_allow_break:` (renamed from `\iow_allow_break:`)

### Changed
- Moved to stable status:
  - `\bool_(g)set_inverse:N`
  - `\c_catcode_active_space_tl`
  - `\c_sys_engine_version_str`
  - `\exp_args_generate:n`
  - `\fp_if_nan:n(TF)`
  - `\ior_get_term:nN` and `\ior_str_get_term:nN`
  - `\ior_shell_open:Nn`
  - `\msg_show_item:n`, `\msg_show_item_unbraced:n`,
    `\msg_show_item:nn`, `\msg_show_item_unbraced:nn`
- Require random number support from engine

### Removed
- Experimental functions from `l3candidates`:
  - `\bool_case_false:n(TF)`
  - `\intarray_gset_rand:Nn(n)`
  - `\intarray_to_clist:N`
  - `\peek_catcode_collect_inline:Nn`, `\peek_charcode_collect_inline:Nn` and
    `\peek_meaning_collect_inline:Nn`
  - `\prop_rand_key_value:N`
  - `\seq_set_from_function:Nnn` and `\seq_set_from_inline_x:Nnn`
  - `\sys_if_rand_exist:(TF)`
  - `\tl_range_braced:Nnn` and `\tl_range_unbraced:Nnn`
- Experimental functions now renamed
  - `\bool_case_true:n(TF)` (now `\bool_case:n(TF)`)
  - `\flag_raise_if_clear:n` (now `\flag_ensure_raised:n`)
  - `\iow_allow_break:` (now `\iow_wrap_allow_break:`)
- Experimental functions moved to kernel-internal:
  - `\msg_log_eval:Nn` and `\msg_show_eval:Nn`

## [2023-04-20]

### Changed
- Re-order arguments of `\text_declare_lowercase_mapping:nnn`,
  `\text_declare_titlecase_mapping:nnn` and
  `\text_declare_uppercase_mapping:nnn`

## [2023-04-19]

### Added
- `\box_set_clipped:N` and variants (renamed from `\box_clip:N`)
- `\text_declare_lowercase_mapping:nn(n)`,
   `\text_declare_titlecase_mapping:nn(n)`
   and `\text_declare_uppercase_mapping:nn(n)` to allow customization of
   case changing outcomes

### Changed
- `\box_set_trim:Nnnnn` and `\box_set_viewport:Nnnnn` moved to
  stable kernel

### Fixed
- Incorrect internal name in `\pdf_pagesize_gset:nn`

### Removed
- Experimental `\box_clip:N` and variants (renamed to 
  `\box_set_clipped:N`)

## [2023-03-30]

### Added
- `\tex_endlocalcontrol:D` as expl3 name for the LuaTeX primitive

### Changed
- Allow non-integer values in color expressions
- Restrict color expressions values to the range [0, 100]
- Leave Greek spacing diacritics unchanged in uppercasing

### Fixed
- Fix minor version in `\c_sys_engine_version_str` for pdfTeX and LuaTeX
  (issue [\#1186](https://github.com/latex3/latex3/issues/1186))

## [2023-02-22]

### Changed
- More defensive approach in `\codepoint_to_nfd:n`

### Fixed
- CJK character handling for (u)pTeX (issue
  [\#1171](https://github.com/latex3/latex3/issues/1171))

## [2023-02-07]

### Changed
- Swap meaning of `el` and `el-x-iota` when case changing
  Greek: match traditional LaTeX approach

### Deprecated
- `\l_text_accents_tl` and `\l_text_letterlike_tl`

## [2023-02-02]

### Fixed
- Handling of multiple accents when uppercasing Greek
  (see LaTeX2e issue
  [\#987](https://github.com/latex3/latex2e/issues/987))

## [2023-02-01]

### Fixed
- Allow for expressions within color `RGB`/`HSB` input

## [2023-01-24]

### Added
- Complete list of pdfTeX primitives

### Changed
- Leave catcode of `&` unchanged in code environment

### Fixed
- Allow for multi-part BCP47 strings in case changing
- Loading with plain TeX due to `\outer` status of `^^L`
  issue ([\#1161](https://github.com/latex3/latex3/issues/1161))

## [2023-01-16]

### Added
- `\pdf_pagesize_gset:nn`

### Fixed
- Enable `\char_generate:nn` to create active tokens which are `\outer`
  or equal to `\fi`

## [2022-12-17]

### Added
- `\codepoint_to_nfd:n`
- `\codepoint_generate:n` and `\codepoint_str_generate:n`
- `\str_casefold:n`

### Changed
- Protect `babel` shorthands from expansion

### Fixed
- Appearance of `\DescribeOption` (issue
  [\#1111](https://github.com/latex3/latex3/issues/1111))

## [2022-11-02]

### Added
- `\prg_gset_conditional:N(p)nn` and 
  `\prg_gset_protected_conditional:N(p)nn`

### Fixed
- Loading of `expl3` with ConTeXt MkIV (issue
  [\#1142](https://github.com/latex3/latex3/issues/1142))

## [2022-10-26]

### Changed
- Usage of `\exp_not:n`/`\exp_not:N` in `\peek_analysis_map_inline:n` output

### Fixed
- `\peek_analysis_map_inline:n` support for macro parameter characters (issue
  [\#1109](https://github.com/latex3/latex3/issues/1109)), for many expandable
  tokens (issue [\#1110](https://github.com/latex3/latex3/issues/1110)), and an
  esoteric case (issue [\#1113](https://github.com/latex3/latex3/issues/1113))
- Creation of a message with some engines (issue
  [\#1139](https://github.com/latex3/latex3/issues/1139))

### Deprecated
- `\char_to_nfd:N`, `\char_to_nfd:n`
- `\char_foldcase:N`, `\char_lowercase:N`, `\char_titlecase:N`,
   `\char_uppercase:N` and `str` variants
- `\char_to_utfviii_bytes:n`
- `\str_foldcase:n`

## [2022-09-28]

### Added
- Set media box for test phase documents

### Fixed
- Text case switching in `\text_titlecase_first:n` (issue
  [\#1130](https://github.com/latex3/latex3/issues/1130))

## [2022-08-30]

### Added
- `\pdf_object_new:n` and `\pdf_object_write:nnn` - support assignment of object
  type at point-of-writing (issue
  [\#1123](https://github.com/latex3/latex3/issues/1123))
- `\text_map_function:nN` and `\text_map_inline:nn` for mapping to
  graphemes in textual input
- Support for medieval Latin case changing
- `\char_to_nfd:n` to extend NFD support to 8-bit engines

### Deprecated
- `\pdf_object_new:nn` and `\pdf_object_write:nn`, in favor of
  `\pdf_object_new:n` and `\pdf_object_write:nnn`, respectively

## [2022-08-23]

### Added
- Shortened range of chars which are left unchanged when converted to
  strings with `\str_(g)set_convert:Nnnn`. 
- `\color_if_exist:n(TF)`
- Support for case changing Vietnamese characters with 8-bit engines
- Parsing of `cmy`, `tHsb` and `&spot` color models to support data exchange with
  `xcolor`

### Changed
- Replace `LaTeX3` in message text by `LaTeX`
- Approach to setting current color data from LaTeX2e

## [2022-08-05]

### Added
- Support for case changing Croatian diagraph with 8-bit engines
- Support accent removal when uppercasing Greek with 8-bit engines
- Function `\sys_ensure_backend:`

### Fixed
- Behavior of `\color_math:nn` in alignments
- Expansion of text containing unterminated `\romannumeral` primitives

## [2022-07-21]

### Fixed
- `\iow_open:N` in ConTeXt MkII

## [2022-07-15]

### Fixed
- Correct argument order in `\text_case_switch:nnnn`

## [2022-07-14]

### Changed
- Improved approach to `\text_case_switch:nnnn` expansion

## [2022-07-04]

### Added
- `\text_declare_case_equivalent:Nn`, `\text_case_switch:nnnn` and
  related mechanism to allow specialization of case changing output
  for selected commands

## [2022-07-01]

### Added
- `\cs_parameter_spec:N`

### Changed
- `\text_expand:n` now acts on active chars to support legacy input encodings

### Deprecated
- `\cs_argument_spec:N`

### Fixed
- Correct validity check performed by `\regex_show:N` (issue [\#1093](https://github.com/latex3/latex3/issues/1093))
- Closing of file handles (issue [\#1105](https://github.com/latex3/latex3/issues/1105))

## [2022-06-16]

### Fixed
- Made `\peek_analysis_map_inline:n` alignment-safe (issue [\#1090](https://github.com/latex3/latex3/issues/1090))
- Setting a boolean to itself no longer errors (issue [\#1055](https://github.com/latex3/latex3/issues/1055))

## [2022-06-02]

### Changed
- Exclude only first mandatory argument of entries in
  `\l_text_case_exclude_arg_tl` from case changing

## [2022-05-30]

### Added
- Add `\lua_load_module:n`

### Fixed
- Typo in implementation of titlecase `hy-x-yiwn`
- Definition order issue with `\str_case:Nn(TF)`

## [2022-05-04]

### Added
- Language settings `hy` and `hy-x-yiwn` for handling of ech-yiwn ligature
  uppercasing

### Changed
- Support BCP 47 properly in case changer language argument

### Fixed
- Correct `el-xiota` and `de-xeszett` to `el-x-iota` and `de-x-eszett`

## [2022-04-29]

### Added
- Language setting `el-xiota` for retention of ypogegrammeni when uppercasing
  Greek

### Changed
- Rename case-changing variant `de-alt` to `de-xeszett` to align with
  `luaotfload`
- Allow for `\lccode`/`\uccode` changes in `\char_...case:n` functions

### Fixed
- Support for ypogegrammeni in case changing Greek (see issue [\#1088](https://github.com/latex3/latex3/issues/1088))

## [2022-04-20]

### Changed
- Collect some common code from `l3backend-color`

## [2022-04-10]

### Added
- `\keys_precompile:nnN` for conversion of keyvals to fast-to-apply token
  lists
- Missing `\str_if_empty:n(TF)` (see issue [\#1071](https://github.com/latex3/latex3/issues/1071))
- Missing `\str_case:Nn(TF)` (see issue [\#1071](https://github.com/latex3/latex3/issues/1071))
- `\tex_...:D` names for primitives added in TeX Live 2022

### Changed
- Definition of `\legacy_if:n(TF)` to support primitive conditionals
- `\str_<type>case:n` now case changes codepoints above 127 with all engines
- `\char_generate:nn` now also allows to generate category 10 tokens (spaces)
  except for char code 0

### Fixed
- Handling of 'misplaced' `\protect` by `\text_expand:n`
- Nesting of `\tl_analysis_map_inline:nn`
- Naming of an error message

## [2022-02-24]

### Changed
- Better support for `\cite`, _etc._, in case changing

## [2022-02-21]

### Fixed
- Use of `\@uclclist` for case changing

## [2022-02-05]

### Added
- Distribute `l3doc.pdf` with a prominent warning about future changes
- `\color_math:nn(n)` as a functional equivalent of the new `\mathcolor`
  command in LaTeX2e

### Changed
- Documentation for horizontal coffin poles (see issue [\#1041](https://github.com/latex3/latex3/issues/1041))
- Update primitive requirements to enable loading with Prote/HINT

## [2022-01-21]

### Changed
- Auto-generate legacy switch if required in `.legacy_set_if:n`
  key property

### Fixed
- Correct creation of `.if` property
- Handling of colors created in a group once they go out-of-scope

## [2022-01-12]

### Added
- Support for validity scope for keys
- `\peek_remove_filler:n`
- `\prop_to_keyval:N`
- `\regex_match_case:nn(TF)`, `\regex_replace_case_once:nN(TF)`,
  `\regex_replace_case_all:nN(TF)`

### Changed
- Policy change: functions will no longer be removed after deprecation,
  thus the Lua functions noted below are the *last* 'stable' code to be
  removed from `l3kernel` after deprecation
- Allow indirect conversions between colorspaces through fallback models
- Move some color functions from `l3backend`

### Deprecated
- `\peek_..._ignore_spaces:N(TF)` functions
- `\sys_load_deprecation:`
- Option `undo-recent-deprecations`

### Removed
- Lua functions in `l3kernel` table

## [2021-11-22]

### Added
- Support for legacy `if` switches in `l3keys`

### Changed
- Documentation improvements
- Implementation of `intarray` data type with LuaTeX
- Better support for LuaMetaTeX

## [2021-11-12]

### Fixed
- DeviceN colorspace conversions with alternative model RGB

### Added
- `.str_set:N`, etc., key properties (issue [\#1007](https://github.com/latex3/latex3/issues/1007))
- `\bool_to_str:n` (issue [\#1010](https://github.com/latex3/latex3/issues/1010))

### Changed
- `\prop_..._from_keyval:Nn` functions now support active comma or
  equal sign (pull \#1012)

## [2021-10-18]

### Added
- Support for ICC-based color profiles
- `\color_profile_apply:nn`

## [2021-10-17]

### Changed
- Better DeviceN support

## [2021-10-12]

### Fixed
- Global assignments for `\box_gresize_to_ht_plus_dp:Nn`
  and `\coffin_gattach:NnnNnnnn`
- Conversion of DeviceN colors to device fallback

## [2021-08-27]

### Changed
- Formatting of expandable errors (issue [\#931](https://github.com/latex3/latex3/issues/931))
- Internal code for kernel messages

## [2021-07-12]

### Fixed
- Handling of multiple color models (issue [\#962](https://github.com/latex3/latex3/issues/962))

### Removed
- Functions marked for removal end-2020

## [2021-06-18]

### Fixed
- Local assignment to `\g__sys_backend_tl`
- Incorrect internal function name (issue [\#939](https://github.com/latex3/latex3/issues/939))
- Case-changing exceptions for (u)pTeX (issue [\#939](https://github.com/latex3/latex3/issues/939))
- Low-level error if accent commands are not followed by
  letter when case changing (see \#946)

## [2021-06-01]

### Fixed
- Loading when `\expanded` is not available

## [2021-05-27]

### Fixed
- Correctly detect local formats in `Mismatched LaTeX support files` error.

## [2021-05-25]

### Added
- `\msg_note:nnnnnn` (issue [\#911](https://github.com/latex3/latex3/issues/911))
- `\str_compare:nNnTF` (issue [\#927](https://github.com/latex3/latex3/issues/927))
- `\sys_timer:`
- `\prop_concat:NNN`, `\prop_put_from_keyval:Nn` (issue [\#924](https://github.com/latex3/latex3/issues/924))
- Functions to show and log various datatypes (issue [\#241](https://github.com/latex3/latex3/issues/241)):
  `\coffin_show:Nnn`, `\coffin_show:N`, `\coffin_log:Nnn`, `\coffin_log:N`,
  `\color_log:n`, `\group_show_list:`, `\group_log_list:`,
  `\ior_show:N`, `\ior_log:N`, `\iow_show:N`, `\iow_log:N`,
  `\tl_log_analysis:N`, `\tl_log_analysis:n`
- `\legacy_if_set_true:n`, `\legacy_if_set_false:n`, `\legacy_if_set:nn`
- Matching multiple regex at the same time (issue [\#433](https://github.com/latex3/latex3/issues/433)):
  `\regex_case_match:nn(TF)`,
  `\regex_case_replace_once:nN(TF)`,
  `\regex_case_replace_all:nN(TF)`

### Fixed
- Checking brace balance in all regex functions (issue [\#377](https://github.com/latex3/latex3/issues/377))
- Removing duplicates in clists when items contain commas (issue [\#917](https://github.com/latex3/latex3/issues/917))

### Changed
- Slight speed up in some elementary int/dim/skip/muskip operations and
  in setting tl or clist variables equal.
- Speed up mapping functions in l3clist, l3prop, l3seq, l3tl

## [2021-05-11]

### Added
- `\cctab_item:Nn` (issue [\#880](https://github.com/latex3/latex3/issues/880))
- `\clist_use:nnnn` and `\clist_use:nn` (issue [\#561](https://github.com/latex3/latex3/issues/561))

### Fixed
- Loading of backend in generic DVI mode (issue [\#905](https://github.com/latex3/latex3/issues/905))
- Make `\keyval_parse:nnn` alignment-safe (issue [\#896](https://github.com/latex3/latex3/issues/896))
- Control sequences and category codes in regex replacements (issue [\#909](https://github.com/latex3/latex3/issues/909))

### Changed
- Speed up `\group_align_safe_begin:` (pull \#906)

## [2021-05-07]

### Added
- Color export in comma-separated format
- `\ur{...}` escape in `l3regex` to compose regexes
- `\seq_set_split_keep_spaces:Nnn` (see \#784)
- `\seq_set_item:Nnn(TF)` and `\seq_pop_item:NnN(TF)`
- `\box_ht_plus_dp:N` (issue [\#899](https://github.com/latex3/latex3/issues/899))
- `\clist_map_tokens:nn`, `\clist_map_tokens:Nn`,
  `\str_map_tokens:nn`, `\str_map_tokens:Nn`

### Changed
- Use prevailing catcodes instead of string in regex replacement (issue [\#621](https://github.com/latex3/latex3/issues/621))
  (*Breaking change*)
- `\__kernel_file_name_sanitize:n` now uses a faster `\csname`-based
  approach to expand the file name
- Improved performance for basic conditionals
- `\pdf_version_gset:n` support for `dvips`
- Improve handling of `\exp_not:n` in `\text_expand:n` (issue [\#875](https://github.com/latex3/latex3/issues/875))
- `\file_full_name:n` now avoids calling `\pdffilesize` primitive multiple times
  on the same file
- Show printable characters explicitly in `\regex_show:n`
- Regex replacement now errors when using a submatch (`\1` etc) for which
  the regex has too few groups
- Showing complex datatypes now validates their internal structure (issue [\#884](https://github.com/latex3/latex3/issues/884))
- Indexing in l3doc: all page references before codeline references,
  improve target placement, solve pdfTeX and makeindex warnings

### Fixed
- Evaluate integer constants only once (issue [\#861](https://github.com/latex3/latex3/issues/861))
- Detect `\ior_map_inline:Nn` calls on undefined streams (issue [\#194](https://github.com/latex3/latex3/issues/194))

### Deprecated
- `l3docstrip` converted to a stub which simply loads DocStrip: use
   the latter directly

## [2021-02-18]

### Added
- `l3color`: Moved from `l3experimental`
- `l3pdf`: Moved from `l3experimental`
- `default` alias to str_convert

### Changed
- Re-ordered `interface3` documentation
- Moved `msg_show:nn(nnnn)` to stable

## [2021-02-06]

### Changed
- Use new (internal) interface for kerns

## [2021-02-02]

### Added
- `\c_zero_str`

## [2021-01-09]

### Added
- `\keyval_parse:nnn`

### Changed
- `\keyval_parse:NNn` is set equal to `\keyval_parse:nnn`

### Fixed
- Handling of encoding-specific commands in `\text_purify:n`

## [2020-12-07]

### Fixed
- `\peek_analysis_map_inline:n` with spaces and braces

## [2020-12-05]

### Fixed
- Setting of line width in vertical coffins in LaTeX

## [2020-12-03]

### Added
- `\peek_analysis_map_inline:n`
- `\peek_regex:nTF`, `\peek_regex_remove_once:nTF`, and
  `\peek_regex_replace_once:nnTF`
- `\token_case_catcode:NnTF`, `\token_case_charcode:NnTF`, and
  `\token_case_meaning:NnTF`

### Changed
- Extend `\text_expand:n` to cover `\@protected@testopt`
- Extend `\text_purify:n` to cover `\@protected@testopt`

## [2020-10-27]

### Added
- `\token_if_font_selection:N(TF)` (see \#806)

### Fixed
- Avoid relying on braced `\input` primitive syntax
- Correct expansion of environments in `\text_purify:n`
- Some aspects of `cctab` setup with 8-bit engines(issue [\#814](https://github.com/latex3/latex3/issues/814))

### Changed
- Improved performance for `tl` functions
- Extend case changer to cover all of Greek with pdfTeX

## [2020-10-05]

### Fixed
- Correctly detect LaTeX when pre-loading expl3 and setting up
  case changer
- Lua emulation of \strcmp (issue [\#813](https://github.com/latex3/latex3/issues/813))

## [2020-09-24]

### Changed
- Use Lua pseudo-primitives instead of `\directlua`
- `\token_if_primitive:N(TF)` now reports pseudo-primitives as primitives in LuaTeX

## [2020-09-06]

### Fixed
- Loading in generic mode (issue [\#800](https://github.com/latex3/latex3/issues/800))

## [2020-09-03]

### Fixed
- Save primitive definition of `\pdfoutput` with CSLaTeX

## [2020-09-01]

### Added
- `\hbox_overlap_center:n`

### Changed
- Backend setting for direct PDF output
- Backend setting for XeTeX support

### Deprecated
- Backend setting `pdfmode`

### Fixed
- `\file_compare_timestamp:nNn(TF)` in LuaTeX (issue [\#792](https://github.com/latex3/latex3/issues/792))
- Text case changing and expansion where an excluded command is equivalent
  to `\use:n`

## [2020-08-07]

### Changed
- Color selection implementation
- Performance enhancements for `\keys_set:nn`

### Fixed
- Loading generically on ConTeXt (issue [\#783](https://github.com/latex3/latex3/issues/783))

## [2020-07-17]

### Added
- `l3cctab` module for using category code tables
- `\file_parse_full_name:n` and `\file_parse_full_name_apply:nN`
- Additional `\prop_put:Nnn` variants
- `\seq_set_map_x:NNn`
- `\msg_term:nn(nnnn)`

### Fixed
- File lookup with `\input@path`
- 8-bit encodings in `\str_set_convert:Nnnn`

### Changed
- Implementation of `\file_parse_full_name:nNNN` now uses
  `\file_parse_full_name:n` internally
- `\seq_set_map:NNn` no longer `x`-expands `<inline function>`
  (`\seq_set_map_x:NNn` now does that).  Both moved to stable.

### Removed
- Functions deprecated at end of 2019

### Deprecated
- `\str_declare_eight_bit_encoding:nnn`

## [2020-06-18]

### Changed
- Use `scn` operator for separations
- Internal color model
- Internal performance enhancements
- Moved `\msg_expandable_error:nn(nnnn)` to stable.
- Moved `\seq_indexed_map_inline:Nn` and `\seq_indexed_map_function:Nn`
  to stable as `\seq_map_indexed_inline:Nn` and `\seq_map_indexed_function:Nn`.
- Internal changes to `expl3` to allow loading earlier in LaTeX2e.

## [2020-06-03]

### Added
- `\str_convert_pdfname:n`

## [2020-05-15]

### Changed
- Make `\text_purify:n` `f`-type expandable

## [2020-05-14]

### Changed
- Performance improvements in keyval processing

## [2020-05-11]

### Changed
- Internal changes to quark handling

## [2020-05-05]

### Added
- Recognize the exponent marker `E` (same as `e`) in floating point numbers

### Fixed
- Leave active characters untouched when case-changing (see \#715)

## [2020-04-06]

### Added
- Control for start-of-titlecasing: see `\l_text_titlecase_check_letter_bool`

### Fixed
- Nesting of `\seq_shuffle:N` in another sequence mapping (issue [\#687](https://github.com/latex3/latex3/issues/687))
- `\ior_shell_open:Nn` in engines other than LuaTeX - shell commands didn't
  execute, plus the command call would be left in the input stream.

## [2020-03-06]

### Added
- `\text_purify:n`

### Fixed
- Issue with case-changing Turkish

## [2020-03-03]

### Added
- `\tex...:D` coverage for TeX Live 2020 engine changes

### Changed
- New implementation for `\keyval_parse:NNn` - around 40% speed improvement,
  also *expandable*

### Fixed
- Make `expl3` reload-safe for `latexrelease` (see latex3/latex2e\#295)

## [2020-02-25]

### Changed
- Extend case-changing encoding support to Cyrillic and Greek

## [2020-02-21]

### Added
- Option `suppress-backend-headers` (see matching change in
  `l3backend`)

### Changed
- Allow `dvisvgm` driver with XeTeX (issue [\#677](https://github.com/latex3/latex3/issues/677))

### Fixed
- `undo-recent-deprecations` would not reload the deprecation code

## [2020-02-14]

### Fixed
- Interaction with some `babel` languages at the start of the document

## [2020-02-13]

### Changed
- Leave implicit tokens unchanged by `\text_expand:n`
- Extend the `de-alt` case changing locale to 8-bit engines

## [2020-02-11]

### Added
- Key property `.cs_set:Np` and variants

### Changed
- Support `\@uclclist` entries when case-changing

### Fixed
- Allow for full range of encodings when expanding text (issue [\#671](https://github.com/latex3/latex3/issues/671))
- Support `\begin`/`\end` in text expansion

## [2020-02-08]

### Added
- `\l_keys_key_str` and `\l_keys_path_str`

### Deprecated
- `\l_keys_key_tl` and `\l_keys_path_tl`, replaced by `\l_keys_key_str` and
  `\l_keys_path_str`, respectively

## [2020-02-03]

### Changed
- Minor edits to LaTeX3 News

## [2020-01-31]

### Added
- Table of Contents for combined LaTeX3 News

### Changed
- Use Lua `utf8` library if available

### Fixed
- Undefined command in box debugging code

## [2020-01-22]

### Added
- Support for command replacement in text expansion

### Changed
- Require key values for numerical key types (dim, int, etc.) (see \#661)

### Fixed
- Issue with keys where some leading spaces could be left in key names

## [2020-01-12]

### Added
- `\bool_case_true:n(TF)` and `\bool_case_false:n(TF)`
- `\file_hex_dump:n(nn)` and `\file_get_hex_dump:n(nn)N(TF)`
- `\str_<type>case:n`
- `\text_<type>case:n(n)`
- `\text_expand:n` and supporting data structures

### Changed
- Distribute LaTeX3 News
- Moved `\char_<type>case:N` to stable
- Documentation improvements

### Fixed
- Inherit key required/forbidden properties (see \#653)
- Set backend at the beginning of `\document` (see \#657)

### Deprecated
- `\str_<type>_case:n` replaced by `\str_<type>case:n`
  except `\str_mixed_case:n` replaced by `\str_titlecase:n`
- `\tl_<type>_case:n(n)` replaced by `\text_<type>case:n(n)`,
  except `\tl_mixed_case:n(n)` replaced by `\text_titlecase:n(n)`

## [2019-11-07]

### Fixed
- Handling of repeated loading of a backend (issue [\#646](https://github.com/latex3/latex3/issues/646))
- Handling of repeated loading of deprecated functions

## [2019-10-28]

### Fixed
- File searching when `\(pdf)filesize` is not available (issue \#644)

## [2019-10-27]

### Changed
- Internal structure of `\c_sys_jobname_str` altered
- Update upTeX test to follow guidance from developers

## [2019-10-24]

### Changed
- File names are now returned without quotes by `\file_full_name:n`

### Fixed
- `\file_if_exist:n(TF)`, etc., when dealing with file names containing
  spaces (see \#642)

## [2019-10-21]

### Added
- Lua function `l3kernel.shellescape()`

### Changed
- Better coverage of (u)pTeX primitives following publication of
  pTeX manual in English
- Trim spaces surrounding file names

### Removed
- HarfTeX primitives

## [2019-10-14]

### Fixed
- Correct handling of 'traditional' class options for backend

## [2019-10-11]

### Changed
- Standard backend for (u)pTeX is now `dvips`
- Minimum LuaTeX version now v0.95
- Moved `\debug_on:n`, `\debug_off:n`, `\debug_suspend:` and `\debug_resume:`
  to stable
- Accept 'traditional' class options for backend (`dvipdfmx`, `dvips`, etc.)
- Performance enhancements when loading `expl3`

### Fixed
- Handling of files with no extension
- Behavior of Lua function `l3kernel.charcat` in some circumstances
- Loading under ConTeXt

## [2019-10-02]

### Fixed
- Variants using `\exp_args` functions with more than 9 arguments (see \#636)

## [2019-09-30]

### Fixed
- File searching using `\file_full_name:n` (see \#634)

## [2019-09-28]

### Changed
- Speed up variants and reduce their `\tracingall` output
- Debug and deprecation code are now loaded independently of expl3 core
- `\file_compare_timestamp:nNn(TF)` now usable in expansion contexts
- Moved to stable:
  - `\bool_const:Nn`
  - `\dim_sign:n`
  - `\file_compare_timestamp:nNn(TF)`
  - FP `logb` operator
  - `\fp_sign:n`
  - `fparray` module
  - `\int_sign:n`
  - `\intarray_const_from_clist:Nn`
  - `\intarray_show:N`
  - `\ior_map_variable:NNn`
  - `\ior_str_map_variable:NNn`
  - `\mode_leave_vertical:`
  - `\prop_(g)set_from_clist:Nn`
  - `\prop_const_from_clist:Nn`
  - `\seq_const_from_clist:Nn`
  - `\seq_(g)shuffle:N`
  - `\sys_if_platform_unix:(TF)`
  - `\sys_if_platform_windows:(TF)`
  - `\sys_gset_rand_seed:`
  - `\sys_rand_seed:`
  - Shell access functions

### Fixed
- Key `.initial:n` property when combined with inherited keys (see \#631)

## [2019-09-19]

### Fixed
- Loading Unicode data when some chars may be active (see \#627)

## [2019-09-08]

### Fixed
- Missing internal variant (issue \#624)

## [2019-09-05]

### Added
- `\file_full_name:n`, `\file_mdfive_hash:n`, `\file_size:n`,
  `\file_timestamp:n`
- `\seq_map_tokens:Nn`, `\tl_map_tokens:nn`, `\tl_map_tokens:Nn`

### Changed
- Moved `\prop_map_tokens:Nn` to stable
- Generate chars with catcode as-supplied when case changing

## [2019-08-25]

### Added
- `\fp_if_nan:nTF`

### Changed
- Make round(.,nan)=nan with no "Invalid operation" error

### Fixed
- `\tl_rescan:nn` and `\tl_(g)set_rescan:Nnn` when single-line input
  contains a comment character (see \#607)
- Final value of the variable in `\tl_map_variable:NNn` and
  `\clist_map_variable:NNn`.
- Remove duplicate keys in `\prop_set_from_keyval:Nn` (see \#572)

## [2019-08-14]

### Deprecated
- `\c_term_ior`

### Fixed
- Coffin pole intersection in some cases (see \#605)

## [2019-07-25]

### Fixed
- Loading for `expl3` with plain TeX

## [2019-07-01]

### Added
- Moved `l3str-convert` module to `l3kernel`

### Changed
- Ensure `\msg_fatal:nn` ends the TeX run if used inside an
  hbox (see \#587)
- Moved backend code to a separate release schedule

### Fixed
- Handling of control sequences in key names (see \#594)

## [2019-05-28]

### Added
- Experimental `\file_compare_timestamp:nNn(TF)`

### Changed
- Precedence of juxtaposition (implicit multiplication) in `l3fp`
  now different for keywords/variables and factors in parentheses

## [2019-05-09]

### Added
- Experimental driver-level interfaces for image inclusion
- Experimental `\ior_shell_open:Nn`

### Fixed
- Some issues in `dvisvgm` driver

## [2019-05-07]

### Added
- `.muskip_set:N` property

### Changed
- Experimental `\driver_pdf_compress_objects:n` replaces
  `\driver_pdf_objects_(en|dis)able:`

## [2019-05-05]

### Added
- `\char_str_<target>_case:N`

### Fixed
- Infinite loop in some cases in DVI mode due to link-breaking code
  (see \#570)
- Category code of output from `\char_<target>_case:N`, and
  same issue in `\str_<target>_case:n`

## [2019-05-03]

### Added
- New `l3legacy` module containing
  - `\legacy_if:n(TF)`

### Changed
- Moved `\file_get_mdfive_hash:nN(TF)`, `\file_get_size:nN(TF)`
   and `\file_get_timestamp:nN(TF)` to stable
- Moved `\file_if_exist_input:n` and `\file_if_exist_input:nF` to stable
- Moved `\file_input_stop:` to stable
- Moved `\peek_N_type:TF` to stable

## [2019-04-21]

### Added
- Experimental support for a range of PDF concepts at the lowest
  (driver abstraction) level

## [2019-04-06]

### Changed
- Moved `\tl_if_single_token:n(TF)` to stable

### Fixed
- Support for ConTeXt from mid-December 2018

## [2019-03-26]

### Fixed
- Loading when pre-TL'18 XeTeX is in use (see \#555)

## [2019-03-05]

### Added
- `\str_log:n`, `\str_log:N`
- `TF` versions for `\file_get_...:nN` and `\ior_(str_)get:NN` functions
- `\cs_prefix_spec:N`, `\cs_argument_spec:N`, `\cs_replacement_spec:N`
- `undo-recent-deprecations` option
- `factorial` function in `l3fp`

### Changed
- Return values from `\file_get:nnN`, `\file_get_...:nN`, `\ior_get:NN`,
  `\sys_shell_get:nnN`
- Moved coffin affine transformations to stable
- Moved `\prop_count:N` to stable
- Moved `\tl_count_tokens:n` to stable
- Completed emulation of e-type argument when `\expanded` is unavailable
- Made expandable messages expand their result, like usual messages
- Made deprecation errors less intrusive by default
- Stopped providing do-nothing `\color` macro when undefined

### Deprecated
- `\token_get_prefix_spec:N`, `\token_get_arg_spec:N`,
  `\token_get_replacement_spec:N` replaced by `\cs_prefix_spec:N`,
  `\cs_argument_spec:N`, `\cs_replacement_spec:N`, respectively

### Fixed
- Treatment of inherited keys when setting only known keys (see \#548)

### Removed
- Experimental `\skip_split_finite_else_action:nnNN`
- Experimental `\tl_reverse_tokens:n`

## [2019-02-15]

### Changed
- Defensive code for redefinition of `\time`, `\day`, `\month` and `\year`

### Fixed
- Resetting of key inheritance (see \#535)
- Issue in deprecated command `\tl_set_from_file:Nnn`
  (see https://tex.stackexchange.com/q/474813/)

## [2019-02-03]

### Added
- Support for return of whole path by `\keys_set_known:nnN`-like
  function `\keys_set_known:nnnN` (see \#508)
- `.prop_(g)put:N` key property (see \#444)

### Fixed
- Handling of nested key setting when filtering, _etc._ (see \#526)
- Inheritance of default values (see \#504)

## [2019-01-28]

### Added
- Global versions of box affine functions, e.g. `\box_grotate:Nn`
- Global versions of box size adjustment functions
- `\box_(g)set_eq_drop:NN`, `\(h|v)box_unpack_drop:N`
- `\file_get:nnN` and `\file_get:nnNTF`
- Experimental functions `\sys_shell_get:nnN` and `\sys_shell_get:nnNTF`

### Changed
- `\char_generate:nn` now always takes exactly two expansions
- Move `\prg_generate_conditional_variant:Nnn` to stable
- Renamed experimental `\box_trim:Nnnnn` and `\box_viewport:Nnnnn` as
  `\box_set_trim:Nnnnn` and `\box_set_viewport:Nnnnn`, respectively

### Deprecated
- `\box_(g)set_eq_clear:NN`, replaced by `\box_(g)set_eq_drop:NN`
- `\(h|v)box_unpack_clear:N`, replaced by `\(h|v)box_unpack_drop:N`
- `\tl_(g)set_from_file(_x):Nnn`, replaced by `\file_get:nnN`

### Fixed
- Scope treatment of `\box_set_dp:N`, _etc._
- In (u)platex: detection of spaces in `\tl_rescan:nn` and related functions

### Removed
- Experimental function family `\tl_(g)set_from_shell:(N|c)nn`
  (replaced by `\sys_shell_get:nnN`)

## [2019-01-13]

### Added
- `\ior_map_variable:NNn` and `\ior_str_map_variable:NNn`

### Fixed
- Unclosed conditional with Unicode engines

## [2019-01-12]

### Changed
- Improved `expl3` loading time with LuaTeX and XeTeX
- Improved performance of `\ior_map_inline:Nn` and related functions

### Fixed
- Handling of accented characters under mixed case changing in 8-bit engines
  (see \#514)

## [2019-01-01]

### Added
- `\iow_allow_break:`

### Fixed
- Correct fp randint with zero argument (see \#507)
- Handling of `\current@color` with `(x)dvipdfmx` (see \#510)

### Removed
- Support for stand-alone `l3regex`, `l3sort`, `l3srt`, `l3tl-analysis`,
  `l3tl-build`
- `\box_resize:Nnn`
- `\box_use_clear:N`
- `\c_minus_one`
- `\file_add_path:nN`
- `\file_list:`
- `\file_path_include:n` and `\file_path_remove:n`
- `\io(r|w)_list_streams:` and `\io(r|w)_log_streams:`
- `\sort_ordered:` and `\sort_reversed:`
- `\token_new:Nn`
- Generation of invalid variants from `n`/`N` base types

## [2018-12-12]

### Changed
- Move `\tl_range:nnn` to stable

### Fixed
- Loading in ConTeXt MkIV

## [2018-12-11]

### Changed
- Enable `\char_generate:nn` to create active tokens with XeTeX

## [2018-12-06]

### Changed
- Apply `\par` only at the end of vertical boxes
- Move `\int_rand:n` to stable
- Move `\<var>_rand_item:N` to stable

### Fixed
- Typo in `\lua_shipout_e:n` (see \#503)

## [2018-11-19]

### Added
- Support for cross-compatibility primitives in XeTeX
- `\int_sign:n`, `\dim_sign:n` and `\fp_sign:n`

## [2018-10-19]

### Fixed
- Wrapping of text in messages, etc., for some line lengths (issue \#491)

## [2018-10-17]

### Added
- `\g_msg_module_documentation_prop` (see \#471)
- `\peek_remove_spaces:n`

### Changed
- Formatting of messages: now follows LaTeX2e closely

### Deprecated
- `\msg_interrupt:nn`, `\msg_log:n` and `\msg_term:n`

### Fixed
- Handling of inheritance for choice keys (issue \#483)

## [2018-09-24]

### Added
- Some driver-level support for PDF features
- `\peek_catcode_collect_inline:Nn`, `\peek_charcode_collect_inline:Nn`,
  `\peek_meaning_collect_inline:Nn`

### Fixed
- Handling of unknown keys when inheritance is active (issue \#481)

## [2018-08-23]

### Added
- `\lua_escape:e`, `\lua_now:e` and `\lua_shipout_e:n`
- `\str_case_e:nn(TF)` and `\str_if_eq:ee(TF)`
- `\sys_if_platform_unix:(TF)` and `\sys_if_platform_windows:(TF)`
- `\tl_(g)set_from_shell:Nnn`

### Deprecated
- `\lua_escape_x:n`, `\lua_now_x:n` and `\lua_shipout_x:n`
- `\str_case_x:nn(TF)` and `\str_if_eq_x:nn(TF)`

## [2018-06-14]

### Added
- Support for `e`-type argument using `\expanded` or macro emulation

## [2018-06-01]

### Added
- `CHANGELOG.md` (issue \#460)

### Fixed
- Loading `expl3` with LuaTeX/XeTeX and certain letter tokens set
  to be active (see \#462)

### Changed
- Alter `\char_codepoint_from_bytes:n` to produce four groups in all
  cases; make `f`-type expandable

## [2018-05-13]

### Fixed
- Correct date string in `expl3.dtx`
- Correct `\c_sys_engine_version_str` when using XeTeX

## [2018-05-12]

### Added
- Define `\c_zero_int` and `\c_one_int`
- Implement `\c_sys_engine_version_str`
- Implement `\seq_indexed_map_function/inline`
- Implement `\intarray_gzero:N`
- Implement `\intarray_const_from_clist:Nn`
- Implement `\bool_set_inverse:N`
- Implement `\bool_xor:nnTF` instead of just `\bool_xor_p:nn`
- Implement candidate `\int_rand:n`
- Implement `\intarray_gset_rand:Nnn`
- Implement candidate `l3fparray` module

### Changed
- Update minimal required versions of XeTeX and LuaTeX
- Deprecate named integer constants `\c_zero`. etc.
- Move all primitives to `\tex_...:D namespace`,
  deprecating older engine-dependent prefixes
- Several internal optimizations

### Fixed
- Expand boolean expression before calling `\chardef` (issue \#461)

### Removed
- Remove undocumented `\fp_function:Nw` and `\fp_new_function:Npn`

## [2018-04-30]

### Added
- Implement `\tl_analysis_map_inline:nn`
- Implement `\exp_args_generate:n` to define new `\exp_args:N...`
  functions
- Low-level `\int_value:w` function
- New experimental functions for
  - Building token lists piecewise
  - Fast manipulation of integer arrays
  - Sequence shuffling
  - `\seq_set_from_function:NnN`
  - `\char_codepoint_to_bytes:n`

### Changed
- Significant internal revision to use only internal functions
  'private' to specific modules
- Better documentation of cross-module kernel-internal functions
- Enable `\char_generate:nn` for active chars
- Renamed `\tl_show_analysis:(N|n)n` as `\tl_analysis_show:(N|n)n`
- Change `\int_rand:nn` (and rand_item functions) to better use
  the RNG
- Make prg break functions public
- Make scan marks mechanism public
- Make `\prg_do_nothing:` long rather than nopar (issue \#455)
- Several performance improvements
- Documentation improvements

### Fixed
- Only index TF, T, F functions together if they are `expl3`
  functions (issue \#453)
- Make `\infty` and `\pi` into errors in fp expressions
  (issue \#357)

### Removed
- Deprecated functions expiring at end of 2017
- Old module `.sty` files

## [2018-03-05]

### Changes
- Adjustments to `l3drivers` to support `l3draw` development in
  `l3experimental` bundle

## [2018-02-21]

### Added
- Tuple support in fp expressions
- Step functions have been added for dim variables,
  e.g. `\dim_step_inline:nnnn`

[Unreleased]: https://github.com/latex3/latex3/compare/2025-07-20...HEAD
[2025-07-20]: https://github.com/latex3/latex3/compare/2025-07-19...2025-07-20
[2025-07-19]: https://github.com/latex3/latex3/compare/2025-07-11...2025-07-19
[2025-07-11]: https://github.com/latex3/latex3/compare/2025-06-30...2025-07-11
[2025-06-30]: https://github.com/latex3/latex3/compare/2025-06-09...2025-06-30
[2025-06-09]: https://github.com/latex3/latex3/compare/2025-05-26...2025-06-09
[2025-05-26]: https://github.com/latex3/latex3/compare/2025-05-19...2025-05-26
[2025-05-19]: https://github.com/latex3/latex3/compare/2025-04-29...2025-05-19
[2025-04-29]: https://github.com/latex3/latex3/compare/2025-04-14...2025-04-29
[2025-04-14]: https://github.com/latex3/latex3/compare/2025-03-26...2025-04-14
[2025-03-26]: https://github.com/latex3/latex3/compare/2025-03-10...2025-03-26
[2025-03-10]: https://github.com/latex3/latex3/compare/2025-01-18...2025-03-10
[2025-01-18]: https://github.com/latex3/latex3/compare/2025-01-14...2025-01-18
[2025-01-14]: https://github.com/latex3/latex3/compare/2024-12-25...2025-01-14
[2024-12-25]: https://github.com/latex3/latex3/compare/2024-12-09...2024-12-25
[2024-12-09]: https://github.com/latex3/latex3/compare/2024-11-02...2024-12-09
[2024-11-02]: https://github.com/latex3/latex3/compare/2024-10-09...2024-11-02
[2024-10-09]: https://github.com/latex3/latex3/compare/2024-09-10...2024-10-09
[2024-09-10]: https://github.com/latex3/latex3/compare/2024-08-30...2024-09-10
[2024-08-30]: https://github.com/latex3/latex3/compare/2024-08-16...2024-08-30
[2024-08-16]: https://github.com/latex3/latex3/compare/2024-07-20...2024-08-16
[2024-07-20]: https://github.com/latex3/latex3/compare/2024-06-19...2024-07-20
[2024-06-19]: https://github.com/latex3/latex3/compare/2024-05-27...2024-06-19
[2024-05-27]: https://github.com/latex3/latex3/compare/2024-05-08...2024-05-27
[2024-05-08]: https://github.com/latex3/latex3/compare/2024-04-11...2024-05-08
[2024-04-11]: https://github.com/latex3/latex3/compare/2024-03-14...2024-04-11
[2024-03-14]: https://github.com/latex3/latex3/compare/2024-02-20...2024-03-14
[2024-02-20]: https://github.com/latex3/latex3/compare/2024-02-18...2024-02-20
[2024-02-18]: https://github.com/latex3/latex3/compare/2024-02-13...2024-02-18
[2024-02-13]: https://github.com/latex3/latex3/compare/2024-01-22...2024-02-13
[2024-01-22]: https://github.com/latex3/latex3/compare/2024-01-04...2024-01-22
[2024-01-04]: https://github.com/latex3/latex3/compare/2023-12-11...2024-01-04
[2023-12-11]: https://github.com/latex3/latex3/compare/2023-12-08...2023-12-11
[2023-12-08]: https://github.com/latex3/latex3/compare/2023-11-09...2023-12-08
[2023-11-09]: https://github.com/latex3/latex3/compare/2023-11-01...2023-11-09
[2023-11-01]: https://github.com/latex3/latex3/compare/2023-10-23...2023-11-01
[2023-10-23]: https://github.com/latex3/latex3/compare/2023-10-10...2023-10-23
[2023-10-10]: https://github.com/latex3/latex3/compare/2023-08-29...2023-10-10
[2023-08-29]: https://github.com/latex3/latex3/compare/2023-08-11...2023-08-29
[2023-08-11]: https://github.com/latex3/latex3/compare/2023-08-03...2023-08-11
[2023-08-03]: https://github.com/latex3/latex3/compare/2023-06-30...2023-08-03
[2023-06-30]: https://github.com/latex3/latex3/compare/2023-06-16...2023-06-30
[2023-06-16]: https://github.com/latex3/latex3/compare/2023-06-05...2023-06-16
[2023-06-05]: https://github.com/latex3/latex3/compare/2023-05-22...2023-06-05
[2023-05-22]: https://github.com/latex3/latex3/compare/2023-05-15...2023-05-22
[2023-05-15]: https://github.com/latex3/latex3/compare/2023-05-11...2023-05-15
[2023-05-11]: https://github.com/latex3/latex3/compare/2023-05-05...2023-05-11
[2023-05-05]: https://github.com/latex3/latex3/compare/2023-04-20...2023-05-05
[2023-04-20]: https://github.com/latex3/latex3/compare/2023-04-19...2023-04-20
[2023-04-19]: https://github.com/latex3/latex3/compare/2023-03-30...2023-04-19
[2023-03-30]: https://github.com/latex3/latex3/compare/2023-02-22...2023-03-30
[2023-02-22]: https://github.com/latex3/latex3/compare/2023-02-07...2023-02-22
[2023-02-07]: https://github.com/latex3/latex3/compare/2023-02-02...2023-02-07
[2023-02-02]: https://github.com/latex3/latex3/compare/2023-02-01...2023-02-02
[2023-02-01]: https://github.com/latex3/latex3/compare/2023-01-24...2023-02-01
[2023-01-24]: https://github.com/latex3/latex3/compare/2023-01-16...2023-01-24
[2023-01-16]: https://github.com/latex3/latex3/compare/2022-12-17...2023-01-16
[2022-12-17]: https://github.com/latex3/latex3/compare/2022-11-02...2022-12-17
[2022-11-02]: https://github.com/latex3/latex3/compare/2022-10-26...2022-11-02
[2022-10-26]: https://github.com/latex3/latex3/compare/2022-09-28...2022-10-26
[2022-09-28]: https://github.com/latex3/latex3/compare/2022-08-30...2022-09-28
[2022-08-30]: https://github.com/latex3/latex3/compare/2022-08-23...2022-08-30
[2022-08-23]: https://github.com/latex3/latex3/compare/2022-08-05...2022-08-23
[2022-08-05]: https://github.com/latex3/latex3/compare/2022-07-15...2022-08-05
[2022-07-15]: https://github.com/latex3/latex3/compare/2022-07-14...2022-07-15
[2022-07-14]: https://github.com/latex3/latex3/compare/2022-07-04...2022-07-14
[2022-07-04]: https://github.com/latex3/latex3/compare/2022-07-01...2022-07-04
[2022-07-01]: https://github.com/latex3/latex3/compare/2022-06-16...2022-07-01
[2022-06-16]: https://github.com/latex3/latex3/compare/2022-06-02...2022-06-16
[2022-06-02]: https://github.com/latex3/latex3/compare/2022-05-30...2022-06-02
[2022-05-30]: https://github.com/latex3/latex3/compare/2022-05-04...2022-05-30
[2022-05-04]: https://github.com/latex3/latex3/compare/2022-04-29...2022-05-04
[2022-04-29]: https://github.com/latex3/latex3/compare/2022-04-20...2022-04-29
[2022-04-20]: https://github.com/latex3/latex3/compare/2022-04-10...2022-04-20
[2022-04-10]: https://github.com/latex3/latex3/compare/2022-02-24...2022-04-10
[2022-02-24]: https://github.com/latex3/latex3/compare/2022-02-21...2022-02-24
[2022-02-21]: https://github.com/latex3/latex3/compare/2022-02-05...2022-02-21
[2022-02-05]: https://github.com/latex3/latex3/compare/2022-01-21...2022-02-05
[2022-01-21]: https://github.com/latex3/latex3/compare/2022-01-12...2022-01-21
[2022-01-12]: https://github.com/latex3/latex3/compare/2021-11-22...2022-01-12
[2021-11-22]: https://github.com/latex3/latex3/compare/2021-11-12...2021-11-22
[2021-11-12]: https://github.com/latex3/latex3/compare/2021-10-18...2021-11-12
[2021-10-18]: https://github.com/latex3/latex3/compare/2021-10-17...2021-10-18
[2021-10-17]: https://github.com/latex3/latex3/compare/2021-10-12...2021-10-17
[2021-10-12]: https://github.com/latex3/latex3/compare/2021-08-27...2021-10-12
[2021-08-27]: https://github.com/latex3/latex3/compare/2021-07-12...2021-08-27
[2021-07-12]: https://github.com/latex3/latex3/compare/2021-06-18...2021-07-12
[2021-06-18]: https://github.com/latex3/latex3/compare/2021-06-01...2021-06-18
[2021-06-01]: https://github.com/latex3/latex3/compare/2021-05-27...2021-06-01
[2021-05-27]: https://github.com/latex3/latex3/compare/2021-05-25...2021-05-27
[2021-05-25]: https://github.com/latex3/latex3/compare/2021-05-11...2021-05-25
[2021-05-11]: https://github.com/latex3/latex3/compare/2021-05-07...2021-05-11
[2021-05-07]: https://github.com/latex3/latex3/compare/2021-02-18...2021-05-07
[2021-02-18]: https://github.com/latex3/latex3/compare/2021-02-06...2021-02-18
[2021-02-06]: https://github.com/latex3/latex3/compare/2021-02-02...2021-02-06
[2021-02-02]: https://github.com/latex3/latex3/compare/2021-01-09...2021-02-02
[2021-01-09]: https://github.com/latex3/latex3/compare/2020-12-07...2021-01-09
[2020-12-07]: https://github.com/latex3/latex3/compare/2020-12-05...2020-12-07
[2020-12-05]: https://github.com/latex3/latex3/compare/2020-12-03...2020-12-05
[2020-12-03]: https://github.com/latex3/latex3/compare/2020-10-27...2020-12-03
[2020-10-27]: https://github.com/latex3/latex3/compare/2020-10-05...2020-10-27
[2020-10-05]: https://github.com/latex3/latex3/compare/2020-09-24...2020-10-05
[2020-09-24]: https://github.com/latex3/latex3/compare/2020-09-06...2020-09-24
[2020-09-06]: https://github.com/latex3/latex3/compare/2020-09-03...2020-09-06
[2020-09-03]: https://github.com/latex3/latex3/compare/2020-09-01...2020-09-03
[2020-09-01]: https://github.com/latex3/latex3/compare/2020-08-07...2020-09-01
[2020-08-07]: https://github.com/latex3/latex3/compare/2020-07-17...2020-08-07
[2020-07-17]: https://github.com/latex3/latex3/compare/2020-06-18...2020-07-17
[2020-06-18]: https://github.com/latex3/latex3/compare/2020-06-03...2020-06-18
[2020-06-03]: https://github.com/latex3/latex3/compare/2020-05-15...2020-06-03
[2020-05-15]: https://github.com/latex3/latex3/compare/2020-05-14...2020-05-15
[2020-05-14]: https://github.com/latex3/latex3/compare/2020-05-11...2020-05-14
[2020-05-11]: https://github.com/latex3/latex3/compare/2020-05-05...2020-05-11
[2020-05-05]: https://github.com/latex3/latex3/compare/2020-04-06...2020-05-05
[2020-04-06]: https://github.com/latex3/latex3/compare/2020-03-06...2020-04-06
[2020-03-06]: https://github.com/latex3/latex3/compare/2020-03-03...2020-03-06
[2020-03-03]: https://github.com/latex3/latex3/compare/2020-02-25...2020-03-03
[2020-02-25]: https://github.com/latex3/latex3/compare/2020-02-21...2020-02-25
[2020-02-21]: https://github.com/latex3/latex3/compare/2020-02-14...2020-02-21
[2020-02-14]: https://github.com/latex3/latex3/compare/2020-02-13...2020-02-14
[2020-02-13]: https://github.com/latex3/latex3/compare/2020-02-11...2020-02-13
[2020-02-11]: https://github.com/latex3/latex3/compare/2020-02-08...2020-02-11
[2020-02-08]: https://github.com/latex3/latex3/compare/2020-02-03...2020-02-08
[2020-02-03]: https://github.com/latex3/latex3/compare/2020-01-31...2020-02-03
[2020-01-31]: https://github.com/latex3/latex3/compare/2020-01-22...2020-01-31
[2020-01-22]: https://github.com/latex3/latex3/compare/2020-01-12...2020-01-22
[2020-01-12]: https://github.com/latex3/latex3/compare/2019-11-07...2020-01-12
[2019-11-07]: https://github.com/latex3/latex3/compare/2019-10-28...2019-11-07
[2019-10-28]: https://github.com/latex3/latex3/compare/2019-10-27...2019-10-28
[2019-10-27]: https://github.com/latex3/latex3/compare/2019-10-24...2019-10-27
[2019-10-24]: https://github.com/latex3/latex3/compare/2019-10-21...2019-10-24
[2019-10-21]: https://github.com/latex3/latex3/compare/2019-10-14...2019-10-21
[2019-10-14]: https://github.com/latex3/latex3/compare/2019-10-11...2019-10-14
[2019-10-11]: https://github.com/latex3/latex3/compare/2019-10-02...2019-10-11
[2019-10-02]: https://github.com/latex3/latex3/compare/2019-09-30...2019-10-02
[2019-09-30]: https://github.com/latex3/latex3/compare/2019-09-28...2019-09-30
[2019-09-28]: https://github.com/latex3/latex3/compare/2019-09-19...2019-09-28
[2019-09-19]: https://github.com/latex3/latex3/compare/2019-09-08...2019-09-19
[2019-09-08]: https://github.com/latex3/latex3/compare/2019-09-05...2019-09-08
[2019-09-05]: https://github.com/latex3/latex3/compare/2019-08-25...2019-09-05
[2019-08-25]: https://github.com/latex3/latex3/compare/2019-08-14...2019-08-25
[2019-08-14]: https://github.com/latex3/latex3/compare/2019-07-25...2019-08-14
[2019-07-25]: https://github.com/latex3/latex3/compare/2019-07-01...2019-07-25
[2019-07-01]: https://github.com/latex3/latex3/compare/2019-05-28...2019-07-01
[2019-05-28]: https://github.com/latex3/latex3/compare/2019-05-09...2019-05-28
[2019-05-09]: https://github.com/latex3/latex3/compare/2019-05-07...2019-05-09
[2019-05-07]: https://github.com/latex3/latex3/compare/2019-05-05...2019-05-07
[2019-05-05]: https://github.com/latex3/latex3/compare/2019-05-03...2019-05-05
[2019-05-03]: https://github.com/latex3/latex3/compare/2019-04-21...2019-05-03
[2019-04-21]: https://github.com/latex3/latex3/compare/2019-04-06...2019-04-21
[2019-04-06]: https://github.com/latex3/latex3/compare/2019-03-26...2019-04-06
[2019-03-26]: https://github.com/latex3/latex3/compare/2019-03-05...2019-03-26
[2019-03-05]: https://github.com/latex3/latex3/compare/2019-02-15...2019-03-05
[2019-02-15]: https://github.com/latex3/latex3/compare/2019-02-03...2019-02-15
[2019-02-03]: https://github.com/latex3/latex3/compare/2019-01-28...2019-02-03
[2019-01-28]: https://github.com/latex3/latex3/compare/2019-01-13...2019-01-28
[2019-01-13]: https://github.com/latex3/latex3/compare/2019-01-12...2019-01-13
[2019-01-12]: https://github.com/latex3/latex3/compare/2019-01-01...2019-01-12
[2019-01-01]: https://github.com/latex3/latex3/compare/2018-12-12...2019-01-01
[2018-12-12]: https://github.com/latex3/latex3/compare/2018-12-11...2018-12-12
[2018-12-11]: https://github.com/latex3/latex3/compare/2018-12-06...2018-12-11
[2018-12-06]: https://github.com/latex3/latex3/compare/2018-11-19...2018-12-06
[2018-11-19]: https://github.com/latex3/latex3/compare/2018-10-31...2018-11-19
[2018-10-31]: https://github.com/latex3/latex3/compare/2018-10-26...2018-10-31
[2018-10-26]: https://github.com/latex3/latex3/compare/2018-10-19...2018-10-26
[2018-10-19]: https://github.com/latex3/latex3/compare/2018-10-17...2018-10-19
[2018-10-17]: https://github.com/latex3/latex3/compare/2018-09-24...2018-10-17
[2018-09-24]: https://github.com/latex3/latex3/compare/2018-08-23...2018-09-24
[2018-08-23]: https://github.com/latex3/latex3/compare/2018-06-14...2018-08-23
[2018-06-14]: https://github.com/latex3/latex3/compare/2018-06-01...2018-06-14
[2018-06-01]: https://github.com/latex3/latex3/compare/2018-05-13...2018-06-01
[2018-05-13]: https://github.com/latex3/latex3/compare/2018-05-12...2018-05-13
[2018-05-12]: https://github.com/latex3/latex3/compare/2018-04-30...2018-05-12
[2018-04-30]: https://github.com/latex3/latex3/compare/2018-03-05...2018-04-30
[2018-03-05]: https://github.com/latex3/latex3/compare/2018-02-21...2018-03-05
[2018-02-21]: https://github.com/latex3/latex3/compare/2017-12-16...2018-02-21
