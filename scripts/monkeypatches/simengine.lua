local simengine = include("sim/engine")
local moveUnit = simengine.moveUnit
simengine.moveUnit = function(self, unit, ...)
    local ability = unit:ownsAbility("luna4s_cloak")
    local wasActive = ability and ability.userUnit:hasTrait("luna4s_active")

    local result = {moveUnit(self, unit, ...)}

    if ability then
        ability:onMoveUnit(wasActive)
    end

    return unpack(result)
end
