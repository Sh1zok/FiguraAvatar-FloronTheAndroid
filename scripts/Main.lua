vanilla_model.PLAYER:setVisible(false)
vanilla_model.CAPE:setVisible(false)
vanilla_model.ELYTRA:setVisible(false)
vanilla_model.ARMOR:setVisible(false)

models.model.root.Center.Torso.Neck.Head.Display:setPrimaryRenderType("CUTOUT_EMISSIVE_SOLID"):setColor(0, 1, 0)
models.model.root.Center.Torso.Neck.Head.Display.Display:setColor(0, 0.25, 0)
models.model.root.Center.Torso.Body.Jetpack.LeftEngine.Trail:setPrimaryRenderType("CUTOUT_EMISSIVE_SOLID"):setColor(0.75, 1, 0)
models.model.root.Center.Torso.Body.Jetpack.RightEngine.Trail:setPrimaryRenderType("CUTOUT_EMISSIVE_SOLID"):setColor(0.75, 1, 0)

animations.model.actionWave:setBlendTime(5):addTags("Arms")
animations.model.actionPointUp:setBlendTime(5):addTags("Arms")
animations.model.actionHandshake:setBlendTime(5):addTags("Arms")
animations.model.actionResting:setBlendTime(5):addTags("Poses"):setPriority(2)
animations.model.actionSittingOnTheFloor:setBlendTime(5):addTags("Poses"):setPriority(2)
animations.model.actionLyingOnTheBack:setBlendTime(5):addTags("Poses"):setPriority(2)
animations.model.actionLyingOnTheSide:setBlendTime(5):addTags("Poses"):setPriority(2)
animations.model.actionAFKing:setBlendTime(5):addTags("Poses"):setPriority(2)
animations.model.actionSquatting:setBlendTime(5):addTags("Poses"):setPriority(2)
animations.model.jetpack:setBlendTime(5)
animations.model.changeEyes:setPriority(2)
animations.model.changeMouth:setPriority(2)



--#region Smoothie
local smoothie = require("scripts.libraries.Smoothie")

smoothie:newSmoothHead(models.model.root.Center.Torso.Neck)
    :setStrenght(0.25)
    :setTiltMultiplier(0)
smoothie:newSmoothHead(models.model.root.Center.Torso.Neck.Head)
    :setStrenght(0.25)
    :setTiltMultiplier(2)
    :setKeepVanillaPosition(false)
smoothie:newEye(models.model.root.Center.Torso.Neck.Head.Display.Eyes.RightEye)
    :setLeftOffsetStrenght(0.33)
    :setRightOffsetStrenght(0.67)
smoothie:newEye(models.model.root.Center.Torso.Neck.Head.Display.Eyes.LeftEye)
    :setLeftOffsetStrenght(0.67)
    :setRightOffsetStrenght(0.33)

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
    if playerPose == "FALL_FLYING" or playerPose == "CROUCHING" then jetTrailScale = player:getVelocity():length() * 5 end

    if models.model.root.Center.Torso.Body.Jetpack.LeftEngine.Trail:getScale()[2] ~= jetTrailScale then
        models.model.root.Center.Torso.Body.Jetpack.LeftEngine.Trail:setScale(1, jetTrailScale, 1)
        models.model.root.Center.Torso.Body.Jetpack.RightEngine.Trail:setScale(1, jetTrailScale, 1)
    end
end
--#endregion



--#region Keybinds
if host:isHost() then
    keybinds:newKeybind("Stop All Actions", "key.keyboard.keypad.0"):onPress(function() pings.stopAnimations() end)
    keybinds:newKeybind(ArmsActionList:getActionList()[1].title, "key.keyboard.keypad.1"):onPress(function() ArmsActionList:getActionList()[1].onLeftClick() end)
    keybinds:newKeybind(ArmsActionList:getActionList()[2].title, "key.keyboard.keypad.2"):onPress(function() ArmsActionList:getActionList()[2].onLeftClick() end)
    keybinds:newKeybind(ArmsActionList:getActionList()[3].title, "key.keyboard.keypad.3"):onPress(function() ArmsActionList:getActionList()[3].onLeftClick() end)
    keybinds:newKeybind(PosesActionList:getActionList()[1].title, "key.keyboard.keypad.6"):onPress(function() PosesActionList:getActionList()[1].onLeftClick() end)
    keybinds:newKeybind(PosesActionList:getActionList()[2].title, "key.keyboard.keypad.7"):onPress(function() PosesActionList:getActionList()[2].onLeftClick() end)
    keybinds:newKeybind(PosesActionList:getActionList()[3].title, "key.keyboard.keypad.8"):onPress(function() PosesActionList:getActionList()[3].onLeftClick() end)
    keybinds:newKeybind(PosesActionList:getActionList()[4].title, "key.keyboard.keypad.9"):onPress(function() PosesActionList:getActionList()[4].onLeftClick() end)
end
--#endregion