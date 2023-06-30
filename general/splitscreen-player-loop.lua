local template = {
    name = "SplitScreen: Loop through Players",
    version = "41.78.16",
    authors = { "albion" },
    description = "Loops through all players in a split-screen game."
};

--- @template-block-start

-- Split-Screen mode supports up to 4 players.
for i = 0, 3 do
    --- @type IsoPlayer|nil
    -- The next player in the array.
    local player = getSpecificPlayer(i)

    -- If the player is present. (Can be 1 to 4 players in a Split-Screen game)
    if player then
        -- (Handle player here)
    end
end

--- @template-block-end
