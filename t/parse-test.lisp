(in-package :cl-user)
(defpackage :parse-test
  (:use :cl :prove :parse))
(in-package #:parse-test)

;;一つ目はasd周りの設定ができていれば確実に処理できる。
;;二つ目からはテストケースがこれでいいのかわかってないので要調整
;;最低でもテスト結果変化したらバージョン管理ぐらいしてください。

(plan 3)

(is (parse::parse-line "a,b,c")
    '("a" "b" "c"))

(is (parse::parse-csv-string "a,b,c
test,dayo,un
maji,test,dakara") '((:head ("a" "b" "c"))
                     (:body (("test" "dayo" "un")
                             ("maji" "test" "dakara")))))

;;実際に読み込んでテスト
(is (parse::open-csvfile-parse "t/test.csv")
    '((:head ("a" "b" "c"))
                     (:body (("test" "dayo" "un")
                             ("maji" "test" "dakara")))))
