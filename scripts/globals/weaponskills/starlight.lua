------------------------
--      Starlight     -- 
------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local lvl = player:getSkillLevel(11); -- get club skill
    local damage = lvl * 0.75;
    local damagemod = damage * (tp/1000);

    local effect = target:eraseStatusEffect();
    if (effect ~= EFFECT_NONE) then
        damagemod = damagemod * 1.5;
    end
    damagemod = (1 + player:getMod(MOD_CURE_POTENCY) / 100) * damagemod;

    return 1, 0, false, damagemod;
end
