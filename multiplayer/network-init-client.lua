--- @type WalletTemplateInfo
local template = {
    name = 'Network: Initialize Lua Network (Client-Side)',
    version = '41.78.16',
    authors = { 'Jab' },
    description = 'external'
};

--- @template-block-start

-- (Must be in either `/media/lua/client/` or `/media/lua/server` to work)
if isClient() then
    -- **Technical Notes**:
    -- When the client's game starts, there's a few tick cycles where the lua network isn't fully established. Because
    -- of this, any client or server commands during those few ticks are voided and nothing happens as a result. With a
    -- solution like this function, we can figure out when the Lua network is fully operational as this would be the
    -- first successful command exchange between the client & server. A custom event is fired and initial network
    -- operations can confidently fire on or after the firing of this event.
    (function()
        -- This is to prevent multiple instances of the Lua Network initialization going on.
        if _G['__LUANET__'] then return else _G['__LUANET__'] = true; end

        LuaEventManager.AddEvent('OnLuaNetworkReady');

        -- Fires the 'init' client command each tick until a response is received.
        local counter, onTick = 5, nil;
        onTick = function()
            if counter >= 5 then
                sendClientCommand('__LUANET__', 'init', {});
                counter = 0;
            else
                counter = counter + 1;
            end
        end

        -- Handles a server response to the command attempts.
        local handleResponse = nil
        handleResponse = function(module, command)
            if module ~= '__LUANET__' or command ~= 'init' then return end
            -- Remove the event handlers as they are no longer needed / are wasteful.
            Events.OnServerCommand.Remove(handleResponse);
            Events.OnTickEvenPaused.Remove(onTick);

            -- Let Event handlers know that the Lua Network is ready to fire commands.
            triggerEvent('OnLuaNetworkReady');
        end

        -- Add the event listeners to listen, requesting a command response each tick until successful.
        Events.OnServerCommand.Add(handleResponse);
        Events.OnTickEvenPaused.Add(onTick);
    end)();
end

--- @template-block-end
