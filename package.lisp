(in-package :cl-user)
(defpackage :cd-manager
  (:use :cl :cl-ppcre)
  (:export :parse-line
           :parse-csv-line
           :open-csvfile-parse))
