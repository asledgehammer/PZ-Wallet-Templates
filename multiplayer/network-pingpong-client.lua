--- @type WalletTemplateInfo
local template = {
    name = 'Server: Command Example - Ping-Pong (Client-Side)',
    version = '41.78.16',
    authors = { 'Jab' },
    description = 'external'
};

--- @template-block-start

--- @type string @The module to assign our command.
local moduleID = 'ping-pong';
--- @type string @The command recognized by the module event handler.
local commandID = 'ping-pong';

-- The client handles receiving commands sent from the server.
if isClient() then
    Events.OnServerCommand.Add(function(module, command, args)
        -- Always check for proper module identification, otherwise every module command will fire your code.
        if module ~= 'ping-pong' or command ~= 'ping-pong' then return end

        -- This command is only fired from the server as a reponse from a request.
        print('Pong from server!');
    end);

    -- Every 10 minutes in-game, we send a ping to the server. The server should respond with the same module & command.
    Events.EveryTenMinutes.Add(function()
        sendClientCommand(moduleID, commandID, {});
    end)
end

--- @template-block-end
