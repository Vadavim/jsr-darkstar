-----------------------------------
--
--
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/jsr_utils");

runeType = EFFECT_GELUS;
enspellType = 5;
strongATT = MOD_ICEATT;
strongACC = MOD_ICEACC;
strongDEF = MOD_WINDDEF;
strongRES = MOD_WINDRES;
weakATT = MOD_FIREATT;
weakACC = MOD_FIREACC;
weakDEF = MOD_FIREDEF;
weakRES = MOD_FIRERES;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    
    effect:addMod(strongATT,10);
    effect:addMod(strongACC,10);
    effect:addMod(strongDEF,10);
    effect:addMod(strongRES,effect:getPower() / 2 + 20);
    effect:addMod(weakATT,-5);
    effect:addMod(weakACC,-5);
    effect:addMod(weakRES,-20);
    effect:addMod(weakDEF,-10);
    
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    local counter = target:getEffectsCount(runeType);
    local lastRune = target:getNewestRune();
    if (counter == 1 and lastRune and noDominantRune(target)) then
       target:setMod(MOD_ENSPELL,enspellType); 
       target:setMod(MOD_ENSPELL_DMG,effect:getPower());
    elseif (counter == 2) then
       target:setMod(MOD_ENSPELL,enspellType); 
       target:setMod(MOD_ENSPELL_DMG,math.floor(effect:getPower() * 1.15));
    elseif (counter == 3) then
       target:setMod(MOD_ENSPELL,enspellType); 
       target:setMod(MOD_ENSPELL_DMG,math.floor(effect:getPower() * 1.3));
    end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    target:setMod(MOD_ENSPELL_DMG,0);
	target:setMod(MOD_ENSPELL,0);
end;