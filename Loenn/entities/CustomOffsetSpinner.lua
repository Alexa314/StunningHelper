local drawableSpriteStruct = require("structs.drawable_sprite")
local enums = require("consts.celeste_enums")
local utils = require("utils")

local spinnerConnectionDistanceSquared = 24 * 24
local dustEdgeColor = {1.0, 0.0, 0.0}

local defaultSpinnerColor = "blue"
local unknownSpinnerColor = "blue"
local spinnerColors = {
    "blue",
    "red",
    "purple",
    "core",
    "rainbow"
}
local colorOptions = {}

for _, color in ipairs(spinnerColors) do
    colorOptions[utils.titleCase(color)] = color
end

-- Doesn't have textures directly, handled by code
local customSpinnerColors = {
    core = "red",
    rainbow = "white"
}

local CustomOffsetSpinner = {}

CustomOffsetSpinner.name = "StunningHelper/CustomOffsetSpinner"
CustomOffsetSpinner.fieldInformation = {
    color = {
        options = colorOptions,
        editable = false
    }
}
CustomOffsetSpinner.placements = {
    {
    name = "Custom Offset Spinner",
    data = {
        offset = 0,
        attachToSolid = false,
        color = "blue"
    }
    }
}

for _, color in ipairs(spinnerColors) do
    table.insert(CustomOffsetSpinner.placements, {
        data = {
            color = color,
            dust = false,
            attachToSolid = false,
            offset = 0
        }
    })
end

local function getSpinnerTexture(entity, color, foreground)
    local prefix = (foreground or foreground == nil) and "fg_" or "bg_"

    return "danger/crystal/" .. prefix .. color .. "00"
end

local function getSpinnerSprite(entity, foreground)
    -- Prevent color from spinner to tint the drawable sprite
    local color = string.lower(entity.color or defaultSpinnerColor)
    local position = {
        x = entity.x,
        y = entity.y
    }

    if customSpinnerColors[color] then
        color = customSpinnerColors[color]
    end

    local texture = getSpinnerTexture(entity, color, foreground)
    local sprite = drawableSpriteStruct.fromTexture(texture, position)

    -- Check if texture color exists, otherwise use default color
    -- Needed because Rainbow and Core colors doesn't have textures
    if sprite then
        return sprite

    else
        texture = getSpinnerTexture(entity, unknownSpinnerColor, foreground)

        return drawableSpriteStruct.fromTexture(texture, position)
    end
end

local function getConnectionSprites(room, entity)
    -- TODO - This can create some overlaps, can be improved later

    local sprites = {}

    for _, target in ipairs(room.entities) do
        if target == entity then
            break
        end

        if entity._name == target._name and not target.dust and entity.attachToSolid == target.attachToSolid then
            if utils.distanceSquared(entity.x, entity.y, target.x, target.y) < spinnerConnectionDistanceSquared then
                local connectorData = {
                    x = math.floor((entity.x + target.x) / 2),
                    y = math.floor((entity.y + target.y) / 2),
                    color = entity.color
                }
                local sprite = getSpinnerSprite(connectorData, false)

                sprite.depth = -8499

                table.insert(sprites, sprite)
            end
        end
    end

    return sprites
end

function CustomOffsetSpinner.depth(room, entity)
    return -8500
end

function CustomOffsetSpinner.sprite(room, entity)
    local sprites = getConnectionSprites(room, entity)
    local mainSprite = getSpinnerSprite(entity)

    table.insert(sprites, mainSprite)

    return sprites
end

function CustomOffsetSpinner.selection(room, entity)
    return utils.rectangle(entity.x - 8, entity.y - 8, 16, 16)
end

return CustomOffsetSpinner