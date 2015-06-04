-----------------------------------
--
--
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/jsr_utils");

runeType = EFFECT_TELLUS;
enspellType = 2;
strongATT = MOD_EARTHATT;
strongACC = MOD_EARTHACC;
strongDEF = MOD_THUNDERDEF;
strongRES = MOD_THUNDERRES;
weakATT = MOD_WINDATT;
weakACC = MOD_WINDACC;
weakDEF = MOD_WINDDEF;
weakRES = MOD_WINDRES;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    
    effect:addMod(strongATT,10);
    effect:addMod(strongACC,10);
    effect:addMod(strongDEF,80);
    effect:addMod(strongRES,effect:getPower() / 2 + 20);
    effect:addMod(weakATT,-5);
    effect:addMod(weakACC,-5);
    effect:addMod(weakRES,-20);
    effect:addMod(weakDEF,-40);
    
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