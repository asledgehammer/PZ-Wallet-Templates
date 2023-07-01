**NOTES**: 
- Place this in the `media/lua/client/` folder to work.
- Requires the template `network-init` to function.

This is an example of a ClientCommand and ServerCommand implementation of "Remote Code Execution". The client requests Lua code from the server and the
server responds by sending back a simple print to the console.

(A ping is fired when the player logs in)