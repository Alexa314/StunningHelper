local drawableSpriteStruct = require("structs.drawable_sprite")
local enums = require("consts.celeste_enums")
local utils = require("utils")

local spinnerConnectionDistanceSquared = 24 * 24
local dustEdgeColor = {1.0, 0.0, 0.0}

local CustomOffsetDustBunny = {}

CustomOffsetDustBunny.name = "StunningHelper/CustomOffsetDustBunny"
CustomOffsetDustBunny.placements = {
    {
        name = "Custom Offset Dust Bunny",
        data = {
            attachToSolid = false,
            offset = 0
        }
    }
}

CustomOffsetDustBunny.depth = -50
CustomOffsetDustBunny.texture = "danger/dustcreature/base00"

function CustomOffsetDustBunny.sprite(room, entity)
    local position = {
        x = entity.x,
        y = entity.y
    }

    local baseTexture = "danger/dustcreature/base00"
    local baseOutlineTexture = "dust_creature_outlines/base00"
    local baseSprite = drawableSpriteStruct.fromTexture(baseTexture, position)
    local baseOutlineSprite = drawableSpriteStruct.fromInternalTexture(baseOutlineTexture, entity)

    baseOutlineSprite:setColor(dustEdgeColor)

    return {
        baseOutlineSprite,
        baseSprite
    }
end

function CustomOffsetDustBunny.selection(room, entity)
    local baseSprite = drawableSpriteStruct.fromTexture("danger/dustcreature/base00", entity)

    return baseSprite:getRectangle()

end

return CustomOffsetDustBunny