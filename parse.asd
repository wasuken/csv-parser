(require 'asdf)

(in-package :cl-user)
(defpackage parse
  (:use :cl :asdf))
(in-package :parse)

(defsystem :parse
  :version "1.0.0"
  :author "wasu"
  :license "MIT"
  :components ((:file "package")
               (:module "src" :components ((:file "parse"))))
  :in-order-to ((test-op (test-op parse-test))))
