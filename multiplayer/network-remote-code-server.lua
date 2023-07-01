--- @type WalletTemplateInfo
local template = {
    name = 'Network: Remote Code Execution (Server-Side)',
    version = '41.78.16',
    authors = { 'Jab' },
    description = 'external'
};

--- @template-block-start

--- The server handles receiving commands sent from the client.
if isServer() then
    Events.OnClientCommand.Add(function(module, command, player, args)
        -- Always check for proper module identification, otherwise every module command will fire your code.
        if module ~= 'remote-code' or command ~= 'request-code-from-server' then return end

        -- Display receiving the command.
        print('The player "' .. player:getUsername() .. '" Requested code to execute. Sending code now..');

        -- Send the payload to the player. (NOTE: Code can be personalized to clients who request)
        sendServerCommand(player, module, command, {
            code = "print('Hello! I am Lua code sent from the server and executed on the client!')"
        });
    end);
end

--- @template-block-end
