--- @type WalletTemplateInfo
local template = {
    name = 'Network: Remote Code Execution (Client-Side)',
    version = '41.78.16',
    authors = { 'Jab' },
    description = 'external'
};

--- @template-block-start

-- The client handles receiving commands sent from the server.
if isClient() then
    Events.OnServerCommand.Add(function(module, command, args)
        -- Always check for proper module identification, otherwise every module command will fire your code.
        if module ~= 'remote-code' or command ~= 'request-code-from-server' then return end

        -- Load the code received and run it.
        -- NOTE: loadstring returns a function handle. Add '()' to immediately execute the function.
        loadstring(args.code, command)();
    end);

    -- Ensures that our command fires after Lua Network initialization.
    Events.OnLuaNetworkReady.Add(function()
        sendClientCommand('remote-code', 'request-code-from-server', {});
    end);
end

--- @template-block-end
