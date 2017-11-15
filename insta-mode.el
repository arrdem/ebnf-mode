;;; insta-mode.el --- Highlighting for Instaparse Backus-Naur Forms

;; Copyright (C) 2017 Reid McKenzie

;; Derived from ebnf-mode.el,
;; Copyright (C) 2011 Jeramey Crawford

;; Author: Reid McKenzie <me@arrdem.com>
;; Keywords: faces
;; URL: http://github.com/arrdem/ebnf-mode

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation, either version 3 of the
;; License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see
;; <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This major mode provides basic syntax highlighting for
;; Extended/Augmented Backus-Naur Form metasyntax texts, as supported
;; by the Instaparse toolkit. For more information consult the
;; Instaparse reference
;; <https://github.com/Engelberg/instaparse/blob/master/docs/ABNF.md>

;;; Code:

;;;###autoload
(define-generic-mode 'insta-mode
  '(("(*" . "*)")) ;; Instaparse uses (* ... *) style multi-line comments
  '("=" ":=" "::=")
  '(
    ("^[^\s:=]+ " . 'font-lock-function-name-face) ;; LHS nonterminals
    ("<.*?>" . 'font-lock-builtin-face) ;; other nonterminals
    ("\|" . 'font-lock-warning-face) ;; Unordered alternation symbol
    ("/" . 'font-lock-warning-face) ;; Ordered alternation symbol
    ("#?\"[^\"]*?\"" . 'font-lock-string-face)
    ("[*+?]" . 'font-lock-negation-char-face) ;; Repetition quantifiers
    )
  '("\\.insta\\'") ;; filename suffixes
  nil ;; extra function hooks
  "Major mode for Instaparse BNF highlighting.")

(provide 'insta-mode)
