local chestplateInventorySlot
function events.entity_init()
    for index = 1, #player:getNbt().Inventory do
        if player:getNbt().Inventory[index].Slot == 102 then chestplateInventorySlot = player:getNbt().Inventory[index] end
    end
end

function events.tick()
    if not player:isLoaded() then return end

    models.model.root.Center.Torso.Jetpack:setVisible(chestplateInventorySlot.id == "minecraft:elytra")
    animations.model.jetpack:setPlaying(player:getPose() == "FALL_FLYING")

    local jetTrailScale = 0
    if player:getPose() == "FALL_FLYING" then jetTrailScale = player:getVelocity():length() * 5 end

    if models.model.root.Center.Torso.Jetpack.LeftEngine.Trail:getScale()[2] ~= jetTrailScale then
        models.model.root.Center.Torso.Jetpack.LeftEngine.Trail:setScale(1, jetTrailScale, 1)
        models.model.root.Center.Torso.Jetpack.RightEngine.Trail:setScale(1, jetTrailScale, 1)
    end
end
