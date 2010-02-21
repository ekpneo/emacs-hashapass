
(require 'hmac-sha1)

(defun hashapass (token pass)
  (let ((utf8-token (encode-coding-string token 'utf-8 t))
	(utf8-pass (encode-coding-string pass 'utf-8 t)))
    (substring (base64-encode-string (hmac-sha1 utf8-pass utf8-token)) 0 8)))

(defun insert-hashapass (token pass)
  (interactive
   (list (read-string "Token: ")
	 (read-passwd "Master password: ")))
  (insert (hashapass token pass)))

(defun show-hashapass (token pass)
  (interactive
   (list (read-string "Token: ")
	 (read-passwd "Master password: ")))
  (message (hashapass token pass)))

(provide 'hashapass)