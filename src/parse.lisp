(in-package #:parse)


;;初期はsplitと同じ。
;;しかしダブルコーテーション付きなどへの対応もする必要があるので
;;あえて分離している。それとできれば例外措置はここでやって
;;分割はsplitに任せたい
(defun parse-line (line)
  ;;別の言語のライブラリだとseparatorは指定できるようになってたので
  ;;ここも変わるかも
  (split "," line))

(defun split (sepa str)
  (let ((pos (search sepa str))
        (size (length sepa)))
    (if pos
        (cons (subseq str 0 pos)
              (split sepa (subseq str (+ pos size))))
        (list str))))

(defun parse-csv-string (str)
  (let ((lines (remove-if
                #'(lambda (x)
                    (= (length x) 0))
                (split '(#\Newline) str))))
    (list (cons :head (list (parse-line (car lines))))
          (cons :body (list (mapcar #'parse-line (cdr lines)))))))

(defun open-csvfile-parse (filepath)
  (parse-csv-string (all-file-read filepath)))

(defun all-file-read (filepath)
  (with-open-file (s filepath :direction :input)
  (let ((buf (make-string (file-length s))))
    (read-sequence buf s)
    buf)))
