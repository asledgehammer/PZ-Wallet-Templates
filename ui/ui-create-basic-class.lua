--- @type WalletTemplateInfo
local template = {
    name = "UI: Create new basic UI class.",
    version = "41.76.18",
    authors = { "Jab" },
    description = "Creates a basic UI Element class.",
};

--- @template-block-start

require "ISUI/ISUIElement"

local __FILE_NAME__ = ISUIElement:derive("__FILE_NAME__");

function __FILE_NAME__:initialise()
    -- (Initializes the superclass first)
    ISUIElement.initialise(self);

    -- Initialize your element here.
end

--- Calculative updates for the element goes here.
function __FILE_NAME__:update()

end

--- Any pre-rendered tasks for the element goes here.
function __FILE_NAME__:prerender()

end

--- All render code goes here.
---
--- **NOTE**: The render method is called every frame.
function __FILE_NAME__:render()

end

return __FILE_NAME__;

--- @template-block-end
