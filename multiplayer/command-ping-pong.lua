--- @type WalletTemplateInfo
local template = {
    name = 'Server: Command Example - Ping-Pong',
    version = '41.78.16',
    authors = { 'Jab' },
    description = 'external'
};

--- @template-block-start

--- @type string @The module to assign our command.
local moduleID = '__1__';
--- @type string @The command recognized by the module event handler.
local commandID = 'ping-pong';

-- The client handles receiving commands sent from the server.
if isClient() then
    Events.OnServerCommand.Add(function(module, command, args)
        -- Always check for proper module identification, otherwise every module command will fire your code.
        if module ~= moduleID then return end

        -- Only handle the command. Either encase matches or return when mis-matches occur.
        --
        -- Mis-match return example:
        --
        --     if command != commandID then return end
        --
        -- Match-encase example:
        --
        if command == commandID then
            -- This command is only fired from the server as a reponse from a request.
            print('Pong from server!');
        end
    end);

    -- Every 10 minutes in-game, we send a ping to the server. The server should respond with the same module & command.
    Events.EveryTenMinutes.Add(function()
        sendClientCommand(moduleID, commandID, {});
    end)
end

--- The server handles receiving commands sent from the client.
if isServer() then
    Events.OnClientCommand.Add(function(module, command, player, args)
        -- Always check for proper module identification, otherwise every module command will fire your code.
        if module ~= moduleID then return end

        -- Only handle the command. Either encase matches or return when mis-matches occur.
        --
        -- Mis-match return example:
        --
        --     if command != commandID then return end
        --
        -- Match-encase example:
        --
        if command == commandID then
            -- Display receiving the command.
            print('Ping from ' .. player:getUsername() .. '!');

            -- This command is fired from the client. Fire the same command back to the client and display receiving the
            -- response.
            sendServerCommand(player, module, command, {});
        end
    end);
end

--- @template-block-end
