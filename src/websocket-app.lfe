(defmodule websocket-app
  (export all))

(include-lib "yaws/include/yaws_api.hrl")

(defun out (arg-data)
  "This is called by YAWS when the requested URL matches the URL specified in
  the YAWS config (see ./etc/yaws.conf) with the 'appmods' directive for the
  virtual host in question.

  In particular, this function is intended to handle all traffic for this
  app."
  ;;(lfest:out-helper arg-data #'websocket-app-routes:routes/3))
  (out-helper arg-data
              #'websocket-app-routes:routes/3
              'undefined
              'undefined))

(defun out-helper (arg-data router websocket-callback websocket-opts)
  (logjam:debug 'websocket-app
                'out-helper
                "Got arg-data: ~p"
                `(,arg-data))
  (lfest:out-helper arg-data router))
