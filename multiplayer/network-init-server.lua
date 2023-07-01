--- @type WalletTemplateInfo
local template = {
    name = 'Network: Initialize Lua Network (Server-Side)',
    version = '41.78.16',
    authors = { 'Jab' },
    description = 'external'
};

--- @template-block-start

-- Handle and respond to the Lua Network initialization command.
-- (Must be in `media/lua/server`)
if isServer() then
    Events.OnClientCommand.Add(function(module, command, player)
        if module ~= '__LUANET__' or command ~= 'init' then return end
        sendServerCommand(player, module, command, {});
    end)
end

--- @template-block-end
