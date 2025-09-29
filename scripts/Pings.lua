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
}



function pings.changeOutfit(outfitTexturePath)
    local outfitTexture = textures[outfitTexturePath]
    for _, modelPart in ipairs(outfitModelParts) do modelPart:setPrimaryTexture("CUSTOM", outfitTexture) end
end

function pings.changeEyesType(typeName)
    animations.model.changeEyes:play()
    models.model.root.Center.Torso.Neck.Head.Display.Eyes:setUVPixels(eyesTypes[typeName])
end

function pings.changeMouthType(typeName)
    animations.model.changeMouth:play()
    models.model.root.Center.Torso.Neck.Head.Display.Mouth:setUVPixels(mouthTypes[typeName], models.model.root.Center.Torso.Neck.Head.Display.Mouth:getUVPixels()[2])
end

function pings.playAnimation(modelName, animationTag, animationName)
    animations:getTags()[animationTag]:stop()
    animations[modelName][animationName]:play()
end

function pings.stopAnimations(animationTag) animations:getTags()[animationTag]:stop() end

function pings.stopAllAnimations()
    for _, animationTag in ipairs(animations:getTags()) do animationTag:stop() end
end
