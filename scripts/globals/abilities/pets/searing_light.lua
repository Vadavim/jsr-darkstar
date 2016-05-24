---------------------------------------------------
-- Searing Light
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
require("/scripts/globals/magic");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    local level = player:getMainLvl() * 2;
    
    if(player:getMP()<level) then
       return 87,0;
    end
    
    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
    local dINT = math.floor(pet:getStat(MOD_INT) - target:getStat(MOD_INT));
    
    local level = pet:getMainLvl()
    local damage = 48 + (level * 8) + master:getMP() / 3;
    damage = damage + (dINT * 1.5);
    damage = MobMagicalMove(pet,target,skill,damage,ELE_LIGHT,1,TP_NO_EFFECT,0);
    damage = mobAddBonuses(pet, nil, target, damage.dmg, ELE_LIGHT);
    damage = AvatarFinalAdjustments(damage,pet,skill,target,MOBSKILL_MAGICAL,MOBPARAM_NONE,1);

    master:delStatusEffect(EFFECT_ASTRAL_FLOW);
    target:delHP(damage);
    target:updateEnmityFromDamage(pet,damage);

    return damage; 
end