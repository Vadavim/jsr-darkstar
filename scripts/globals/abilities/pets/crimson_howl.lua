---------------------------------------------------
-- Crimson Howl
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/utils");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill, summoner)
    local bonusTime = utils.clamp(summoner:getSkillLevel(SKILL_SUM) - 300, 0, 200);
    local duration = 90 + bonusTime + summoner:getMod(MOD_CHR) * 2;
    local tp = skill:getTP();
    target:addStatusEffect(EFFECT_WARCRY,10 + tp / 300,0,duration);
    skill:setMsg(MSG_BUFF);
    return EFFECT_WARCRY;
end
