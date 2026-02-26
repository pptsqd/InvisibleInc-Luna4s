local SimUnit = include("sim/simunit")
local setInvisible = SimUnit.setInvisible
SimUnit.setInvisible = function(self, state, duration, ...)
    local ability = self:ownsAbility("luna4s_cloak")
    if ability then
        ability:onSetInvisible(state, duration)
    end
    return setInvisible(self, state, duration, ...)
end
local countAugments = SimUnit.countAugments
SimUnit.countAugments = function(self, ...)
    if self:hasTrait("luna4s_activating") then
        return 0
    end
    return countAugments(self, ...)
end
