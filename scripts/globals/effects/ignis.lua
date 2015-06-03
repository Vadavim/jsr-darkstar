-----------------------------------
--
--
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/jsr_effect");

varName = "ignis";
enspellType = 1;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    --
    
    target:addMod(MOD_FIREATT,10);
    target:addMod(MOD_FIREACC,10);
    target:addMod(MOD_ICEDEF,8);
    target:addMod(MOD_ICERES,effect:getPower() / 2 + 20);
    
    local counter = target:getVar(varName);
    
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    local counter = target:getVar(varName);
    if (counter == 1 and target:getVar("lastRune") == 1 and noDominantRune(target)) then
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
    target:delMod(MOD_ICEDEF,5);
    target:delMod(MOD_FIREATT,10);
    target:delMod(MOD_FIREACC,10);
    target:delMod(MOD_ICERES,effect:getPower() / 2 + 20);
end;