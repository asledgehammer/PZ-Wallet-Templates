--- @type WalletTemplateInfo
local template = {
    name = 'Server: Command Example - Ping-Pong (Server-Side)',
    version = '41.78.16',
    authors = { 'Jab' },
    description = 'external'
};

--- @template-block-start

--- The server handles receiving commands sent from the client.
if isServer() then
    Events.OnClientCommand.Add(function(module, command, player, args)
        -- Always check for proper module identification, otherwise every module command will fire your code.
        if module ~= 'ping-pong' or command ~= 'ping-pong' then return end

        -- Display receiving the command.
        print('Ping from ' .. player:getUsername() .. '!');

        -- This command is fired from the client. Fire the same command back to the client and display receiving the
        -- response.
        sendServerCommand(player, module, command, {});
    end);
end

--- @template-block-end
