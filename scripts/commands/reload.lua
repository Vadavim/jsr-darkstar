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
end