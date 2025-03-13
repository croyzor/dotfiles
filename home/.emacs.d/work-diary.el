(defvar work-diary-dir "~/notes/diary/")

(defun wd-today ()
  (interactive)
  (find-file (todays-date-file))
  (work-diary-mode))

(defun todays-date-file ()
  (concat
   (file-name-as-directory work-diary-dir)
   (format-time-string "%Y%m%d")
   ".org"))

(defun parse-wd-name (name)
  (list (string-to-number (substring name 0 4))
        (string-to-number (substring name 4 6))
        (string-to-number (substring name 6 8))
        ))

(defun wd-previous-date (yyyy mm dd)
  (if (< 1 dd)
      (list yyyy mm (- dd 1))
      (if (< 1 mm)
          (list yyyy (- mm 1) 31)
          (list (- yyyy 1) 12 31))))

(defun wd-max-date-for-month (yyyy mm)
  (cond ((= mm 2) (if (= 0 (mod yyyy 4)) 29 28))
        ((member mm '(1 3 5 7 8 10 12)) 31)
        ('t 30)))


(defun wd-next-date (yyyy mm dd)
  (let ((max-day (wd-max-date-for-month yyyy mm)))
    (cond ((and (= 12 mm) (= 31 dd)) (list (+ yyyy 1) 1 1))
          ((= max-day dd) (list yyyy (+ mm 1) 1))
          ('t (list yyyy mm (+ dd 1))))))

(defun wd-make-filename (yyyy mm dd)
  (concat (string-pad (number-to-string yyyy) 4 ?0 't)
          (string-pad (number-to-string mm)   2 ?0 't)
          (string-pad (number-to-string dd)   2 ?0 't)
          ".org"
          ))

(defun wd--previous-next (forward)
  (interactive)
  (let* ((today (buffer-file-name))
         (basename (car (last (split-string today "/"))))
         (date (car (split-string basename "\\.")))
         (current (parse-wd-name date))
         (continue 't)
         )
    (while continue
      (message (apply (lambda (a b c) (format "%d %d %d" a b c)) current))
      (let* ((date-fn (if forward 'wd-next-date 'wd-previous-date))
             (stop (and forward (string-equal today (todays-date-file))))
             (other-date (apply date-fn current))
             (other-file (concat
                          (file-name-as-directory work-diary-dir)
                          (apply 'wd-make-filename other-date)))
             )
        (if stop
            (progn (message "STOP")
                   (setq continue ()))
            (if (or (file-exists-p other-file) (string-equal other-file (todays-date-file)))
                (progn
                  (find-file other-file)
                  (work-diary-mode)
                  (setq continue ())
	          )
                (setq current other-date)
                )
            )))))

(defun wd-previous ()
  (interactive)
  (wd--previous-next ()))

(defun wd-next ()
  (interactive)
  (wd--previous-next 't))

(define-minor-mode work-diary-mode
  ""
  :lighter "WD2"
  (local-set-key (kbd "C-<") 'wd-previous)
  (local-set-key (kbd "C->") 'wd-next)
  )
