(defmodule websocket-app-content
  (export all))

(include-file "deps/exemplar/include/html-macros.lfe")

(defun base-page (title remaining)
  "A function to provide the base for all pages."
  (list
    (!doctype 'html)
    (html '(lang "en")
      (list
        (head
          (list
            (meta '(charset "utf-8"))
            (title title)
            (link '(rel "stylesheet" href "/css/bootstrap-min.css"))
            (link '(rel "stylesheet" href "/css/bootstrap-slate-min.css"))
            (script '(src "/js/jquery-2.1.4.min.js"))
            (script '(src "/js/bootstrap-min.js"))
            (script '(src "/js/chat.js"))))
        (body
          (main
            (list
              (websocket-app-nav:get-navbar)
              (div '(class "section")
                (div '(class "container")
                  (div '(class "row well")
                    remaining))))))))))

(defun base-sidebar-page (title sidebar remaining)
  "We can also make building HTML easier by using functions."
  (base-page title
    (list
      sidebar
      remaining)))

(defun get-sidebar-content (arg-data)
  "1-arity content API function.

  This function generates its HTML from scratch."
  (let ((title "Main Page"))
    (lfest-html-resp:ok
        (base-sidebar-page
          title
          (div '(class "col-md-3 col-sm-4 sidebar")
            (ul '(class "nav nav-stacked nav-pills")
              (websocket-app-nav:get-side-menu)))
          (div
            (list
              (h1 title)
              (h2 "Introduction")
              (div
                (p "This is the main page. Links are to the left."))))))))

(defun get-chat-content (arg-data)
  "Get the chat page"
  (let ((title "Chat Page"))
    (lfest-html-resp:ok
        (base-page
          title
          (div
            (list
              (h1 title)
              (h2 "Room #1")
              (div '(id "chat-area")
                (list
                  (div '(id "messages"))
                  (get-login-form)
                  (get-input-area)))))))))

(defun get-login-form ()
  (form '(action "#" id "form-signin" onSubmit "return connect()"
          accept-charset "utf-8")
    (list
      (h2 '(class "form-signin-heading") "Please sign in")
      (label '(for "input-nick" class "sr-only") "Chat nick")
      (input '(type "text" class "form-control" id "nick-input"
               placeholder "Your nick"))
      (button '(class "btn btn-lg btn-primary btn-block" type "submit")
        "Sign in"))))

(defun get-input-area ()
  (div '(id "user-input" hidden "true")
    (div '(class "input-group")
      (list
        (input '(type "text" class "form-control" id "user-message"
                 placeholder "Type your message here ..."))
        (span '(class "input-group-btn" type "button"
                onSubmit "sendMessage(event)")
          "Send message")))))

(defun get-content (item-id arg-data)
  "2-arity content API.

  This function generates its HTML from scratch."
  ;; we'll pretent to pull content from a data store here ...
  (let ((fetched-title "Queried Title")
        (fetched-content "Some super-great queried lorem ipsum."))
    (lfest-html-resp:ok
      (base-page
        fetched-title
        (div
          (list
            (h1 fetched-title)
            (h2 (++ "Item " item-id))
            (div (p fetched-content))))))))

(defun get-content (user-id account-id arg-data)
  "3-arity content API.

  This function generates its HTML by calling another function. This is an
  example of how one could do templating -- including putting HTML-generating
  functions in their own modules."
  ;; we'll pretent to pull content from a data store here ...
  (let ((fetched-title "Queried Title")
        (fetched-content "Some super-great queried lorem ipsum."))
    (lfest-html-resp:ok
      (base-page
        fetched-title
        (div
          (list
            (h1 fetched-title)
            (h2 (++ "Relation: "
                    user-id " (user id) | "
                    account-id " (account id)"))
            (div (p fetched-content))))))))

(defun four-oh-four (message)
  "Custom 404 page."
    (lfest-html-resp:not-found
      (base-page
        "404"
        (div
          (list
            (h1 "404 - Not Found")
            (div (p message)))))))




