---------------------------------------------------------------------------------------------------
-- func: @addspell <spellID> <player>
-- desc: adds the ability to use a spell to the player
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "is"
};

function onTrigger(player, spellId, target)
    player:unlockAttachment(spellId);
end;