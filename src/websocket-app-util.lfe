(defmodule websocket-app-util
  (export all))

(defun get-websocket-app-version ()
  (lutil:get-app-src-version "src/websocket-app.app.src"))

(defun get-versions ()
  (++ (lutil:get-version)
      `(#(websocket-app ,(get-websocket-app-version)))))
