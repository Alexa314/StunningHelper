local utils = require("utils")
local CustomOffsetLightning = {}

CustomOffsetLightning.name = "StunningHelper/CustomOffsetLightning"
CustomOffsetLightning.depth = -1000100
CustomOffsetLightning.fillColor = {0.55, 0.97, 0.96, 0.4}
CustomOffsetLightning.borderColor = {0.99, 0.96, 0.47, 1.0}
CustomOffsetLightning.nodeLineRenderType = "line"
CustomOffsetLightning.nodeLimits = {0, 1}
CustomOffsetLightning.placements = {
    name = "Custom Offset Lightning",
    alternativeName = "Custom Offset Electricity",
    data = {
        width = 8,
        height = 8,
        perLevel = false,
        moveTime = 5.0,
        offset = 0
    }
}

return CustomOffsetLightning