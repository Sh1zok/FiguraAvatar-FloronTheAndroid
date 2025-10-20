local outfitModelParts = {
    models.model.root.Center.LeftLeg,
    models.model.root.Center.RightLeg,
    models.model.root.Center.Torso.Body.Body,
    models.model.root.Center.Torso.Body.Jacket,
    models.model.root.Center.Torso.LeftArm,
    models.model.root.Center.Torso.RightArm,
    models.model.root.Center.Torso.Neck.Head.Head,
    models.model.root.Center.Torso.Neck.Head.Hat,
    models.model.root.Center.Torso.Neck.Head.Display.Display
}

local eyesTypes = {
    ["default"] = vec(0, 0),
    ["fear"] = vec(4, 0),
    ["dots"] = vec(8, 0),
    ["squeezed"] = vec(12, 0),
    ["hurt"] = vec(0, 4),
    ["angry"] = vec(4, 4),
    ["excited"] = vec(8, 4),
    ["happy"] = vec(12, 4),
    ["sad"] = vec(0, 8),
    ["squinted"] = vec(4, 8),
}

local mouthTypes = {
    ["default"] = 0,
    ["happy"] = 8,
    ["sad"] = 16,
    ["neutral"] = 24,
    ["smilingTeeth"] = 32,
    ["kitty"] = 40,
}



function pings.changeOutfit(outfitTexturePath)
    sounds:playSound("block.wool.hit", player:getPos(), 0.5, 0.5, false)

    local outfitTexture = textures[outfitTexturePath]
    for _, modelPart in ipairs(outfitModelParts) do modelPart:setPrimaryTexture("CUSTOM", outfitTexture) end
end

function pings.playAnimation(modelName, animationTag, animationName, shouldntStopOtherAnimations)
    if not shouldntStopOtherAnimations then animations:getTags()[animationTag]:stop() end
    animations[modelName][animationName]:play()
end

function pings.stopAnimations(animationTag)
    if animationTag then
        animations:getTags()[animationTag]:stop()
        return
    end

    animations:stopAll()
end
