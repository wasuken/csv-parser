(require 'asdf)

(in-package :cl-user)
(defpackage parse-test
  (:use :cl :asdf))
(in-package :parse-test)

(defsystem :parse-test
  :version "1.0.0"
  :author "wasu"
  :license "MIT"
  :components ((:module "t" :components ((:file "parse-test")))))
