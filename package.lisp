(in-package :cl-user)
(defpackage :cd-manager
  (:use :cl)
  (:export :parse-line
           :parse-csv-line
           :open-csvfile-parse))
