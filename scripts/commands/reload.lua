---------------------------------------------------------------------------------------------------
-- func: reload
-- desc: Reloads a script.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
};

function onTrigger(player, shop)
    package.loaded["scripts/globals/jsr_item"] = nil;
    package.loaded["scripts/globals/magic"] = nil;
    package.loaded["scripts/globals/summon"] = nil;
    package.loaded["scripts/globals/jsr_utils"] = nil;
    package.loaded["scripts/globals/weaponskills"] = nil;
    package.loaded["scripts/commands/buy"] = nil;
    package.loaded["scripts/globals/monstertpmoves"] = nil;
end