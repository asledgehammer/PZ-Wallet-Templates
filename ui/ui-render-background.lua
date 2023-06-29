--- @type WalletTemplateInfo
local template = {
    name = 'UI: Render Coloured Background',
    version = '41.78.16',
    authors = { "Jab" },
    description = 'external'
};

--- @template-block-start

--- Draws a background color for the element.
---
--- **NOTE**: If any color channel is out of bounds, it will be clamped to either 0.0 or 1.0.
---
--- @param red number The red channel value. (0.0 -> 1.0)
--- @param green number The green channel value. (0.0 -> 1.0)
--- @param blue number The blue channel value. (0.0 -> 1.0)
--- @param alpha number The alpha / transparency value. (0.0 -> 1.0)
function __FILE_NAME__:drawBackground(red, green, blue, alpha)
    -- Ensure that all color channels are within bounds. If not, clamp them.
    if red < 0 then red = 0 elseif red > 1 then red = 1 end
    if green < 0 then green = 0 elseif green > 1 then green = 1 end
    if blue < 0 then blue = 0 elseif blue > 1 then blue = 1 end
    if alpha < 0 then alpha = 0 elseif alpha > 1 then alpha = 1 end

    -- Grab the dimensions of the element.
    --- @type number, number, number, number
    local x, y, width, height = self:getX(), self:getY(), self:getWidth(), self:getHeight();

    -- Draw the box over the entire element.
    self.javaObject:DrawTextureScaledColor(x, y, width, height, red, green, blue, alpha);
end

--- @template-block-end
