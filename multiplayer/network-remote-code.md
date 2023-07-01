**NOTES**: 
- Place this in the `media/lua/server/` folder to work on both client & server
- Requires the template `network-init` to function.

This is an example of a ClientCommand and ServerCommand implementation of "Remote Code Execution". The client requests Lua code from the server and the
server responds by sending back a simple print to the console.

(A ping is fired when the player logs in)