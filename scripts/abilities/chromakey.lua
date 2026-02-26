local abilityutil = include("sim/abilities/abilityutil")
local util = include("modules/util")

local colorList = {
    {0, 255, 0},
    {255, 0, 0},
    {0, 0, 255},
    {127, 0, 255},
    {0, 127, 255},
}

local _M = {
    name = STRINGS.LUNA4S.ABILITIES.CHROMAKEY,
    profile_icon = "gui/icons/action_icons/Action_icon_Small/icon-item_peek_small.png",
    HUDpriority = 6,
    alwaysShow = true,
    canUseWhileDragging = true,
    iconColor = util.color(0.45, 0.75, 0.45),
    iconColorHover = util.color.WHITE,
    selectedIndex = nil,
    selectedColor = nil
}

function _M:getName(sim, abilityOwner, ...)
    return self.name
end

function _M:createToolTip(sim, abilityOwner, ...)
    if self.selectedIndex then
        local bytes = colorList[self.selectedIndex]
        local hex = string.format("%02X%02X%02X", bytes[1], bytes[2], bytes[3])
        return abilityutil.formatToolTip(STRINGS.LUNA4S.ABILITIES.CHROMAKEY, string.format("Color: #%s\nClick to Cycle", hex), 0)
    else
        return abilityutil.formatToolTip(STRINGS.LUNA4S.ABILITIES.CHROMAKEY, STRINGS.UI.HUD_OFF, 0)
    end
end

function _M:canUseAbility(sim, abilityOwner, ...)
    return true
end

function _M:executeAbility(sim, abilityOwner, ...)
    -- cycle logic
    if not self.selectedIndex then
        self.selectedIndex = 1
    else
        self.selectedIndex = self.selectedIndex + 1
        if self.selectedIndex > #colorList then
            self.selectedIndex = nil
        end
    end

    -- set color
    if self.selectedIndex then
        self.selectedColor = util.color.fromBytes(unpack(colorList[self.selectedIndex]))
    else
        self.selectedColor = nil
    end
end

return _M
