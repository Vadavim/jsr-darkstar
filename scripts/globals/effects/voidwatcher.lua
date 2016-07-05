-----------------------------------
--
--     EFFECT_POISON
--
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/jsr_utils");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    local master = target:getMaster();
    if (master == nil) then
        return;
    end
    local regen = target:getLocalVar("indiRegen");
    local str = target:getLocalVar("indiStr");
    local vit = target:getLocalVar("indiVit");
    local chr = target:getLocalVar("indiChr");
    local int = target:getLocalVar("indiInt");
    local agi = target:getLocalVar("indiAgi");
    local dex = target:getLocalVar("indiDex");
    local mnd = target:getLocalVar("indiMnd");
    local precision = target:getLocalVar("indiPrecision");
    local voidance = target:getLocalVar("indiVoidance");
    local barrier = target:getLocalVar("indiBarrier");
    local fury = target:getLocalVar("indiFury");
    local focus = target:getLocalVar("indiFocus");
    local attunement = target:getLocalVar("indiAttunement");
    local acumen = target:getLocalVar("indiAcumen");
    local fend = target:getLocalVar("indiFend");
    local refresh = target:getLocalVar("indiRefresh");
    local degen = target:getLocalVar("indiDegen");
    local count = target:getLocalVar("indiCount");
    local power = effect:getPower();
    local level = target:getMainLvl();
    if (power % (11 - math.floor(level / 10))  == 0 and not master:hasStatusEffect(EFFECT_BOLSTER)) then
        target:setLocalVar("indiDegen", degen + 1);
    end
    effect:setPower(power + 1);



    -- Take damage over time
    local damage = 1 + math.random(degen / 2, degen);
    damage = damage * 1.5;
    if (master:hasStatusEffect(EFFECT_ECLIPTIC_ATTRITION)) then
        damage = damage * 2;
    elseif (master:hasStatusEffect(EFFECT_LASTING_EMANATION)) then
        damage = damage * 0.5;
        if (damage < 1) then damage = 1; end;
    end

    if (not master:hasStatusEffect(EFFECT_BOLSTER)) then
        target:delHP(damage);
    end




    -- apply effects to party

    local party = master:getParty();
    local mult = 1;
    if (master:hasStatusEffect(EFFECT_BOLSTER)) then
        mult = mult * 1.33;
    elseif (master:hasStatusEffect(EFFECT_ECLIPTIC_ATTRITION))
        then mult = 1.33;
    end;




    local skill = master:getSkillLevel(SKILL_GEO);
    if (party ~= nil) then
        for i,member in ipairs(party) do
            if (target:checkDistance(member) <= 9.5) then

                if (regen > 0) then
                    member:addStatusEffect(EFFECT_REGEN_II, (1 + skill * 0.04) * mult * (1 + (regen - 1) / 100), 0, 6);
                end;

                if (str > 0) then
                    member:addStatusEffect(EFFECT_STR_BOOST_II, (4 + skill * 0.035) * mult * (1 + (str - 1) / 100), 0, 6);
                end;

                if (vit > 0) then
                    member:addStatusEffect(EFFECT_VIT_BOOST_II, (4 + skill * 0.035) * mult * (1 + (vit - 1) / 100), 0, 6);
                end;

                if (dex > 0) then
                    member:addStatusEffect(EFFECT_DEX_BOOST_II, (4 + skill * 0.035) * mult * (1 + (dex - 1) / 100), 0, 6);
                end;

                if (agi > 0) then
                    member:addStatusEffect(EFFECT_AGI_BOOST_II, (4 + skill * 0.035) * mult * (1 + (agi - 1) / 100), 0, 6);
                end;

                if (int > 0) then
                    member:addStatusEffect(EFFECT_INT_BOOST_II, (4 + skill * 0.035) * mult * (1 + (int - 1) / 100), 0, 6);
                end;

                if (chr > 0) then
                    member:addStatusEffect(EFFECT_CHR_BOOST_II, (4 + skill * 0.035) * mult * (1 + (chr - 1) / 100), 0, 6);
                end;

                if (mnd > 0) then
                    member:addStatusEffect(EFFECT_MND_BOOST_II, (4 + skill * 0.035) * mult * (1 + (mnd - 1) / 100), 0, 6);
                end;

                if (precision > 0) then
                    member:addStatusEffect(EFFECT_ACCURACY_BOOST_II, (8 + skill * 0.025) * mult * (1 + (precision - 1) / 100), 0, 6);
                end;

                if (barrier > 0) then
                    member:addStatusEffect(EFFECT_DEFENSE_BOOST_II, (6 + skill * 0.025) * mult * (1 + (barrier - 1) / 100), 0, 6);
                end;

                if (voidance > 0) then
                    member:addStatusEffect(EFFECT_EVASION_BOOST_II, (8 + skill * 0.025) * mult * (1 + (voidance - 1) / 100), 0, 6);
                end;

                if (fend > 0) then
                    member:addStatusEffect(EFFECT_MAGIC_DEF_BOOST_II, (6 + skill * 0.025) * mult * (1 + (fend - 1) / 100), 0, 6);
                end;

                if (fury > 0) then
                    member:addStatusEffect(EFFECT_ATTACK_BOOST_II, (5 + skill * 0.025) * mult * (1 + (fury - 1) / 100), 0, 6);
                end;

                if (acumen > 0) then
                    member:addStatusEffect(EFFECT_MAGIC_ATK_BOOST_II, (8 + skill * 0.025) * mult * (1 + (acumen - 1) / 100), 0, 6);
                end;

                if (focus > 0) then
                    member:addStatusEffect(EFFECT_MAGIC_ACC_BOOST_II, (6 + skill * 0.025) * mult * (1 + (focus - 1) / 100), 0, 6);
                end;

                if (attunement > 0) then
                    member:addStatusEffect(EFFECT_MAGIC_EVASION_BOOST_II, (10 + skill * 0.025) * mult * (1 + (attunement - 1) / 100), 0, 6);
                end;

                if (refresh > 0) then
                    member:addStatusEffect(EFFECT_REFRESH_II, (1 + skill * 0.005) * mult * (1 + (refresh - 1) / 100), 0, 6);
                end;



            end

        end
    end


end;


-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
end;
