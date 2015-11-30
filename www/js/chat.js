var chatHost = "ws://localhost:8080/chat";
var chatArea = document.getElementById("chat-area");
var msgArea = document.getElementById("messages");
var signInArea = document.getElementById("form-signin");
var inputArea = document.getElementById("user-input");
var socketOpen = false;
var ws;
var nick;

function connect() {
    nick = document.getElementById("nick-input").value;
    chatArea.removeChild(signInArea);

    if ("WebSocket" in window) {
        msgArea.innerHTML += "Connecting ... ";
        // make sure yaws is listening on the URL
        ws = new WebSocket(chatHost);

        ws.onopen = function() {
            // Web Socket is connected. You can send data by send() method.
            // the first message will be the nick name..
            ws.send(nick);
            socketOpen = true;
            msgArea.innerHTML += "Connected.<br/>";
            inputArea.hidden = false;
        };

        ws.onmessage = function (event) {
            msgArea.innerHTML += event.data + "<br/>";
        };

        ws.onclose = function() {
            // websocket is closed.
            msgArea.innerHTML += "Closed.<br/>";

        };

        ws.onerror = function() {
            msgArea.innerHTML += "Error.<br/>";
        };

    } else {
        msgArea.innerHTML += "Your browser does not support the Websocket protocol.<br/>";
    }

    return false;
}

// function mySubmit() {
//     if (!socketOpen) {return;}
//     var userInput = document.getElementById("user-message");
//     ws.send(userInput.value)
//     // msgArea.innerHTML += userInput.value + "<br/>";
//     userInput.value = "";

//     return false;
// }

function sendMessage(event) {
    if (event.keyCode != 13 /* Return */) {
        return;
    }

    var userInput = document.getElementById("user-message");
    var msg = userInput.value.replace("\n", "");

    if (msg.length)  {
        ws.send(nick + ": " + msg);
    }

    userInput.value = "";
}
