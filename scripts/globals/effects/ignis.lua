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
    target:addMod(MOD_FIREDEF,5);
    target:addMod(MOD_FIREATT,10);
    target:addMod(MOD_FIREACC,10);
    target:addMod(MOD_FIRERES,effect:getPower() / 2 + 20);
    
    local counter = target:getVar(varName);
    target:setVar("lastRune", 1);
    target:setVar(varName, counter + 1);
    
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
    target:delMod(MOD_FIREDEF,5);
    target:delMod(MOD_FIREATT,10);
    target:delMod(MOD_FIREACC,10);
    target:delMod(MOD_FIRERES,effect:getPower() / 2 + 20);
    local counter = target:getVar(varName);
    target:setVar(varName, counter - 1);
end;