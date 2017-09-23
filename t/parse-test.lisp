(in-package :cl-user)
(defpackage :parse-test
  (:use :cl :prove :parse))
(in-package #:parse-test)

;;TODO
;;;一つ目はasd周りの設定ができていれば確実に処理できる。
;;;二つ目からはテストケースがこれでいいのかわかってないので要調整
;;;最低でもテスト結果変化したらバージョン管理ぐらいしてください。

;;メモ
;;;windowsファイルだと制御文字入っちゃう。
;;;当面は考慮しない。
;;;・・・がシチュエーション的に結構ありそうなので作りたい。
;;;CSVのルール↓
;;;http://itdoc.hitachi.co.jp/manuals/3020/30203698A0/swrj0068.htm

(plan 5)

(is (parse::parse-line "a,b,c")
    '("a" "b" "c"))

(is (parse::parse-csv-string "a,b,c
test,dayo,un
maji,test,dakara") '(:head ("a" "b" "c")
                     :body (("test" "dayo" "un")
                            ("maji" "test" "dakara"))))

(is (parse::parse-csv-string "えー,びー,しー
てすと,だよ,un
koれ,test,だから") '(:head ("えー" "びー" "しー")
                     :body (("てすと" "だよ" "un")
                            ("koれ" "test" "だから"))))

;;実際に読み込んでテスト
(is (parse::open-csvfile-parse "t/test.csv")
    '(:head ("a" "b" "c")
      :body (("test" "dayo" "un")
             ("maji" "test" "dakara"))))

(is (parse::parse-csv-string
     "\"テス,ト\",\"だよ\",\"これ\"
\"テスト\",\"テステス\",\"テストっと\"")
    '(:head ("テス,ト" "だよ" "これ")
      :body (("テスト" "テステス" "テストっと"))))

