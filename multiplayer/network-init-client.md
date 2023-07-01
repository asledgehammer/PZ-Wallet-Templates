(**NOTE**: Place this in the `media/lua/client/` folder)

Lua Network code that fires the event `OnLuaNetworkReady` when the Lua Network is fully initialied.

**Technical Notes**:
When the client's game starts, there's a few tick cycles where the lua network isn't fully established. Because of this, any client or server commands during those few ticks are voided and nothing happens as a result. With a solution like this function, we can figure out when the Lua network is fully operational as this would be the first successful command exchange between the client & server. A custom event is fired and initial network
operations can confidently fire on or after the firing of this event.
