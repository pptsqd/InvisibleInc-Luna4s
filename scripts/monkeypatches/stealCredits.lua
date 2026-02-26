local abilitydefs = include("sim/abilitydefs")
local simquery = include("sim/simquery")

local stealCredits = abilitydefs.lookupAbility("stealCredits")
local executeAbility = stealCredits.executeAbility
stealCredits.executeAbility = function(self, sim, unit, userUnit, ...)
    local ability = userUnit and userUnit:ownsAbility("luna4s_cloak")
    if ability and #unit:getChildren() == 0 or not simquery.canSteal(sim, userUnit, unit) then -- itemless
        ability:addCharge(sim,1)
        ability:refreshCloakDuration()
    end
    return executeAbility(self, sim, unit, userUnit, ...)
end
