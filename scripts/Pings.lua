local outfitModelParts = {
    models.model.root.Center.LeftLeg,
    models.model.root.Center.RightLeg,
    models.model.root.Center.Torso.Body,
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



function pings.changeOutfit(outfitTexturePath)
    local outfitTexture = texture[outfitTexturePath]
    for _, modelPart in ipairs(outfitModelParts) do modelPart:setPrimaryTexture("CUSTOM", outfitTexture) end
end

function pings.changeEyesType(typeName) models.model.root.Center.Torso.Neck.Head.Display.Eyes:setUVPixels(eyesTypes[typeName]) end
