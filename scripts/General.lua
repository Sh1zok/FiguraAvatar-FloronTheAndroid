vanilla_model.PLAYER:setVisible(false)
vanilla_model.CAPE:setVisible(false)
vanilla_model.ELYTRA:setVisible(false)
vanilla_model.ARMOR:setVisible(false)
vanilla_model.HELMET_ITEM:setVisible(true)
vanilla_model.HELMET_HEAD:setVisible(true)
vanilla_model.HELMET_HAT:setVisible(true)



models.model.root.Center.Torso.Neck.Head.Display:setPrimaryRenderType("CUTOUT_EMISSIVE_SOLID"):setColor(0, 1, 0)
models.model.root.Center.Torso.Neck.Head.Display.Display:setColor(0.25)
models.model.root.Center.Torso.Body.Jetpack.LeftEngine.Trail:setPrimaryRenderType("CUTOUT_EMISSIVE_SOLID"):setColor(0, 1, 0)
models.model.root.Center.Torso.Body.Jetpack.RightEngine.Trail:setPrimaryRenderType("CUTOUT_EMISSIVE_SOLID"):setColor(0, 1, 0)



--#region Animations
animations.model.actionWave:addTags("Arms")
animations.model.actionPointUp:addTags("Arms")
animations.model.actionHandshake:addTags("Arms")
animations.model.actionCrossedArms:addTags("Arms")
animations.model.actionResting:addTags("Poses")
animations.model.actionSittingOnTheFloor:addTags("Poses")
animations.model.actionLyingOnTheBack:addTags("Poses")
animations.model.actionLyingOnTheSide:addTags("Poses")
animations.model.actionSquatting:addTags("Poses")
animations.model.actionBreakdance:addTags("Poses")
animations.model.actionAFK:addTags("HeadNDisplay")
animations.model.actionHappy:addTags("HeadNDisplay")
animations.model.actionAngry:addTags("HeadNDisplay")
animations.model.actionSad:addTags("HeadNDisplay")
animations.model.actionFear:addTags("HeadNDisplay")
animations.model.actionKitty:addTags("HeadNDisplay")
animations.model.actionSussy:addTags("HeadNDisplay")
animations.model.actionWink:addTags("HeadNDisplay")
--#endregion



--#region Smoothie
local smoothie = require("scripts.libraries.Smoothie")

smoothie:newSmoothHead(models.model.root.Center.Torso.Neck)
    :setStrength(0.25)
    :setTiltMultiplier(0)
smoothie:newSmoothHead(models.model.root.Center.Torso.Neck.Head)
    :setStrength(0.25)
    :setTiltMultiplier(2)
    :setKeepVanillaPosition(false)
smoothie:newEye(models.model.root.Center.Torso.Neck.Head.Display.Eyes.RightEye)
    :setLeftOffsetStrength(0.33)
    :setRightOffsetStrength(0.67)
smoothie:newEye(models.model.root.Center.Torso.Neck.Head.Display.Eyes.LeftEye)
    :setLeftOffsetStrength(0.67)
    :setRightOffsetStrength(0.33)

smoothie:setEyesPivot(models.model.root.Center.Torso.Neck.Head.ViewPoint)
--#endregion



--#region VoiceChatLib
local mouthModelPart = models.model.root.Center.Torso.Neck.Head.Display.Mouth
function events.tick()
    if not player:isLoaded() then return end

    local mouthUV = 16
    if voiceChat.get.smoothHostVoiceVolume < 1.00 then mouthUV = 12 end
    if voiceChat.get.smoothHostVoiceVolume < 0.50 then mouthUV = 08 end
    if voiceChat.get.smoothHostVoiceVolume < 0.15 then mouthUV = 04 end
    if voiceChat.get.smoothHostVoiceVolume < 0.05 then mouthUV = 00 end

    if mouthUV ~= mouthModelPart:getUVPixels() then mouthModelPart:setUVPixels(mouthModelPart:getUVPixels()[1], mouthUV) end
end
--#endregion



--#region Arms in first person view
local leftArmModelPart = models.model.root.Center.Torso.LeftArm
local rightArmModelPart = models.model.root.Center.Torso.RightArm

function events.render()
    renderer:setRenderLeftArm(player:getHeldItem(not player:isLeftHanded()).id == "minecraft:air")
    renderer:setRenderRightArm(player:getHeldItem(player:isLeftHanded()).id == "minecraft:air")
end

function events.render(_, context)
    if context == "FIRST_PERSON" then
        leftArmModelPart.Arm:setVisible(false)
        leftArmModelPart.Sleeve:setVisible(false)
        leftArmModelPart.SecondLayer:setVisible(false)
        leftArmModelPart.LABottom:setPos(0, 4, 0):setScale(1.5)

        rightArmModelPart.Arm:setVisible(false)
        rightArmModelPart.Sleeve:setVisible(false)
        rightArmModelPart.SecondLayer:setVisible(false)
        rightArmModelPart.RABottom:setPos(0, 4, 0):setScale(1.5)
    else
        leftArmModelPart.Arm:setVisible(true)
        leftArmModelPart.Sleeve:setVisible(true)
        leftArmModelPart.SecondLayer:setVisible(true)
        leftArmModelPart.LABottom:setPos():setScale()

        rightArmModelPart.Arm:setVisible(true)
        rightArmModelPart.Sleeve:setVisible(true)
        rightArmModelPart.SecondLayer:setVisible(true)
        rightArmModelPart.RABottom:setPos():setScale()
    end
end
--#endregion



--#region Jetpack
local isElytraEnabled = false
function events.tick()
    if not player:isLoaded() then return end

    for index = 1, #player:getNbt().Inventory do
        isElytraEnabled = false

        if player:getNbt().Inventory[index].Slot == 102 then
            isElytraEnabled = player:getNbt().Inventory[index].id == "minecraft:elytra"
            break
        end
    end

    models.model.root.Center.Torso.Body.Jetpack:setVisible(isElytraEnabled)

    if not isElytraEnabled then return end
    local playerPose = player:getPose()

    animations.model.jetpack:setPlaying(playerPose == "FALL_FLYING" or playerPose == "CROUCHING")

    local jetTrailScale = 0
    if playerPose == "FALL_FLYING" or playerPose == "CROUCHING" then jetTrailScale = player:getVelocity():length() end

    if models.model.root.Center.Torso.Body.Jetpack.LeftEngine.Trail:getScale()[2] == jetTrailScale then return end
    models.model.root.Center.Torso.Body.Jetpack.LeftEngine.Trail:setScale(1, math.max(jetTrailScale * 5 + math.min(math.random(-100, 100) / 100 * jetTrailScale, 1), 0), 1)
    models.model.root.Center.Torso.Body.Jetpack.RightEngine.Trail:setScale(1, math.max(jetTrailScale * 5 + math.min(math.random(-100, 100) / 100 * jetTrailScale, 1), 0), 1)
end
--#endregion



--#region Keybinds
if host:isHost() then
    keybinds:newKeybind("Stop All Emotions", "key.keyboard.keypad.0"):onPress(function() pings.stopAnimations("HeadNDisplay") end)
    keybinds:newKeybind(HeadNDisplay:getActionList()[1].title.text, "key.keyboard.keypad.1"):onPress(function() HeadNDisplay:getActionList()[1].onLeftClick() end)
    keybinds:newKeybind(HeadNDisplay:getActionList()[2].title.text, "key.keyboard.keypad.2"):onPress(function() HeadNDisplay:getActionList()[2].onLeftClick() end)
    keybinds:newKeybind(HeadNDisplay:getActionList()[3].title.text, "key.keyboard.keypad.3"):onPress(function() HeadNDisplay:getActionList()[3].onLeftClick() end)
    keybinds:newKeybind(HeadNDisplay:getActionList()[4].title.text, "key.keyboard.keypad.4"):onPress(function() HeadNDisplay:getActionList()[4].onLeftClick() end)
    keybinds:newKeybind(HeadNDisplay:getActionList()[5].title.text, "key.keyboard.keypad.5"):onPress(function() HeadNDisplay:getActionList()[5].onLeftClick() end)
    keybinds:newKeybind(HeadNDisplay:getActionList()[6].title.text, "key.keyboard.keypad.6"):onPress(function() HeadNDisplay:getActionList()[6].onLeftClick() end)
    keybinds:newKeybind(HeadNDisplay:getActionList()[7].title.text, "key.keyboard.keypad.7"):onPress(function() HeadNDisplay:getActionList()[7].onLeftClick() end)
end
--#endregion
