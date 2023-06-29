# PZ-Wallet-Templates

A library of snippets & templates for the VSCode extension [PZ-Wallet](https://github.com/asledgehammer/PZ-Wallet).

## Features

-   auto-complete typing `wallet-<template>` to apply snippets & templates.

## Making a Template

If you want to make a template, first write out what you want in a `lua` environment. Once you're done testing & debugging this template, wrap the code inside of these two tags:

```lua
local template = {}

--- @template-block-start

-- (Code goes here!)

--- @template-block-end
```

Next, what you'll need to do is at the top of the file, create a table named `template` like so:

### Basic Format

```lua
--- @type WalletTemplateInfo
local template = {
    name = 'The Name of Your Template',
    authors = {'Person1', 'Person2', '...'},
    version = '41.78.16',
    description = 'A Simple description.'
}
```

### Properties:

-   name - The formal name of the template. This shows up when the tooltip displays when selecting the template.
-   authors - The authors of the template. (Can be one or many)
-   version - The version of Project Zomboid the template was made & tested in.
-   description - A markdown-supported description of the template and what it does.
    -   Can be a simple string, a string array of lines, or `external`. If it is set to `external` then PZ-Wallet will attempt to look for the same file path and name with the extension `.md`. You can write your description in a separate file if this is more convenient for you.

### Variables

Variables are supported for templates, allowing for dynamic template support. VSCode has a template completion syntax that can be forwarded through your template, such as:

```lua
-- Will ask for the user to populate the name field when the template is applied.
local greet_msg = 'Hello, ${1}!';

-- Will ask the user to select one of these options when the template is applied.
local good_day = 'Good ${2|morning|afternoon|evening}!';
```

`__FILE_NAME__` is also a variable that PZ-Wallet looks for when applying the template at runtime. This will be replaced with a Lua-variable-friendly version of the file open in the editor. (This is useful for class function templates!)

**NOTE**: All properties are optional, however a template table is required, otherwise PZ-Wallet will not load it.

### Full Example

```lua
--- [file: ui-render-background.lua]

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

```

![img](https://i.imgur.com/ZLnfTK4.png)
