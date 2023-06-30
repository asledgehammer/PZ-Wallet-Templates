--- @type WalletTemplateInfo
local template = {
    name = "UI: Create new basic UI class.",
    version = "41.76.18",
    authors = { "Jab" },
    description = "Creates a basic UI Element class.",
};

--- @template-block-start

require "ISUI/ISUIElement"

local __1__ = ISUIElement:derive("__1__");

function __1__:initialise()
    -- (Initializes the superclass first)
    ISUIElement.initialise(self);

    -- Initialize your element here.
end

--- Calculative updates for the element goes here.
function __1__:update()

end

--- Any pre-rendered tasks for the element goes here.
function __1__:prerender()

end

--- All render code goes here.
---
--- **NOTE**: The render method is called every frame.
function __1__:render()

end

return __1__;

--- @template-block-end
