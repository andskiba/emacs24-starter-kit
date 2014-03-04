;;; semantic-simple-php-by.el --- Generated parser support file

;; Copyright (C) 2014 Andrzej Skiba

;; Author: Andrzej Skiba <jedrek@jedrek-desktop>
;; Created: 2014-03-04 20:57:36+0100
;; Keywords: syntax
;; X-RCS: $Id$

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation, either version 3 of
;; the License, or (at your option) any later version.

;; This software is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; PLEASE DO NOT MANUALLY EDIT THIS FILE!  It is automatically
;; generated from the grammar file semantic-simple-php.by.

;;; History:
;;

;;; Code:

(require 'semantic/lex)
(eval-when-compile (require 'semantic/bovine))

;;; Prologue
;;
(define-lex-simple-regex-analyzer
	semantic-lex-php-simplest-class-def nil
	"[ \t]*class[ \t]+[a-zA-Z0-9_]+"
	'class-def
	)
  (define-lex-simple-regex-analyzer
	semantic-lex-php-simplest-funct-def nil
	"[ \ta-zA-Z0-9_]*function[ \t]+[a-zA-Z0-9_]+"
	'funct-def
	)
  (define-lex-simple-regex-analyzer
	semantic-lex-php-simplest-notspace nil
	"[^ \t\n]+"
	'notspace
	)
  (define-lex
	semantic-lex-php-simplest
	nil
	semantic-lex-ignore-comments
	semantic-lex-php-simplest-class-def
	semantic-lex-php-simplest-funct-def
	semantic-lex-whitespace
	semantic-lex-newline
	semantic-lex-php-simplest-notspace
	semantic-lex-default-action
	)

;;; Declarations
;;
(defconst semantic-simple-php-by--keyword-table
  (semantic-lex-make-keyword-table 'nil 'nil)
  "Table of language keywords.")

(defconst semantic-simple-php-by--token-table
  (semantic-lex-make-type-table 'nil 'nil)
  "Table of lexical tokens.")

(defconst semantic-simple-php-by--parse-table
  `(
    (bovine-toplevel 
     (script)
     ) ;; end bovine-toplevel

    (script
     (lines
      functions
      ,(semantic-lambda
        (semantic-tag-new-type
         "::"
         "class"
         (semantic-parse-region
          (car
           (car
            (nth 1 vals)))
          (cdr
           (car
            (nth 1 vals)))
          'functions-t
          1) nil))
      )
     (lines
      ,(semantic-lambda
        (semantic-tag-new-type
         "::"
         "class" nil nil))
      )
     (class-def
      lines
      functions
      ,(semantic-lambda
        (semantic-tag-new-type
         (replace-regexp-in-string
          ".*class[ 	]+"
          ""
          (nth 0 vals))
         "class"
         (semantic-parse-region
          (car
           (car
            (nth 2 vals)))
          (cdr
           (car
            (nth 2 vals)))
          'functions-t
          1) nil))
      )
     (class-def
      lines
      ,(semantic-lambda
        (semantic-tag-new-type
         (replace-regexp-in-string
          ".*class[ 	]+"
          ""
          (nth 0 vals))
         "class" nil nil))
      )
     ) ;; end script

    (anything
     (notspace
      anything)
     (whitespace
      anything)
     (notspace)
     (whitespace)
     ) ;; end anything

    (line
     (anything
      newline)
     (anything)
     (newline)
     ) ;; end line

    (lines
     (line
      lines)
     (line)
     ) ;; end lines

    (function
     (funct-def
      lines)
     ) ;; end function

    (functions
     (function
      functions
      ,(semantic-lambda
        (list
         (cons start end)))
      )
     (function
      ,(semantic-lambda
        (list
         (cons start end)))
      )
     ) ;; end functions

    (functions-t
     (funct-def
      lines
      ,(semantic-lambda
        (semantic-tag-new-function
         (replace-regexp-in-string
          "^[ 	]*"
          ""
          (nth 0 vals)) nil nil))
      )
     ) ;; end functions-t
    )
  "Parser table.")

(defun semantic-simple-php-by--install-parser ()
  "Setup the Semantic Parser."
  (setq semantic--parse-table semantic-simple-php-by--parse-table
        semantic-debug-parser-source "semantic-simple-php.by"
        semantic-debug-parser-class 'semantic-bovine-debug-parser
        semantic-flex-keywords-obarray semantic-simple-php-by--keyword-table
        ))


;;; Analyzers
;;

;;; Epilogue
;;

(provide 'semantic-simple-php-by)

;; Local Variables:
;; version-control: never
;; no-update-autoloads: t
;; End:

;;; semantic-simple-php-by.el ends here
