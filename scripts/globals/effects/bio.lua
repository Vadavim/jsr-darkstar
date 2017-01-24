-----------------------------------
--
--     EFFECT_BIO
--     
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    if (target:isMob() and target:getSystem() == SYSTEM_BEASTMEN) then
            effect:setPower(math.floor(effect:getPower() * 1.5));
            effect:setSubPower(effect:getPower() + 5);
        end;
	local power = effect:getPower();
	local subpower = effect:getSubPower();
	target:addMod(MOD_ATTP,-subpower);
	target:addMod(MOD_REGEN_DOWN, power);
	target:addMod(MOD_DARKRES, -25);
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	local power = effect:getPower();
	local subpower = effect:getSubPower();
	target:delMod(MOD_ATTP,-subpower);
	target:delMod(MOD_REGEN_DOWN, power);
	target:delMod(MOD_DARKRES, -20);
end;
