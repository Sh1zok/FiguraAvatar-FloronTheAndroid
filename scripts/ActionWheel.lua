local mainPage = action_wheel:newPage()
local actionsPage = action_wheel:newPage()
local appearancePage = action_wheel:newPage()
action_wheel:setPage(actionsPage)



--#region mainPage
mainPage:newAction()
    :title("Appearance")
    :item("minecraft:leather_chestplate")
    :color(0, 0.15, 0)
    :hoverColor(0.25, 0.5, 0.25)
    :onLeftClick(function() action_wheel:setPage(appearancePage) end)

mainPage:newAction()
    :title("Actions")
    :item("minecraft:axolotl_bucket")
    :color(0, 0.375, 0)
    :hoverColor(0.25, 0.725, 0.25)
    :onLeftClick(function() action_wheel:setPage(actionsPage) end)
--#endregion



--#region actionsPage
actionsPage:newAction()
    :title("Go back")
    :item("minecraft:structure_void")
    :color(0.5, 0, 0)
    :hoverColor(0.75, 0, 0)
    :onLeftClick(function() action_wheel:setPage(mainPage) end)

ArmsActionList = actionsPage:newActionList()
    :title("Arms")
    :item("minecraft:piston")
    :color(0, 0.15, 0)
    :hoverColor(0.25, 0.5, 0.25)
    :actionList({
        [1] = {
            title = "Wave",
            onLeftClick = function() pings.playAnimation("model", "Arms", "actionWave") end,
            onRightClick = function() pings.stopAnimations("Arms") end
        },
        [2] = {
            title = "Point Up",
            onLeftClick = function() pings.playAnimation("model", "Arms", "actionPointUp") end,
            onRightClick = function() pings.stopAnimations("Arms") end
        },
        [3] = {
            title = "Handshake",
            onLeftClick = function() pings.playAnimation("model", "Arms", "actionHandshake") end,
            onRightClick = function() pings.stopAnimations("Arms") end
        }
    })

PosesActionList = actionsPage:newActionList()
    :title("Poses")
    :item("minecraft:oak_stairs")
    :color(0, 0.375, 0)
    :hoverColor(0.25, 0.725, 0.25)
    :actionList({
        [1] = {
            title = "Resting",
            onLeftClick = function() pings.playAnimation("model", "Poses", "actionResting") end,
            onRightClick = function() pings.stopAnimations("Poses") end
        },
        [2] = {
            title = "Sitting on the floor",
            onLeftClick = function() pings.playAnimation("model", "Poses", "actionSittingOnTheFloor") end,
            onRightClick = function() pings.stopAnimations("Poses") end
        },
        [3] = {
            title = "Lying on the back",
            onLeftClick = function() pings.playAnimation("model", "Poses", "actionLyingOnTheBack") end,
            onRightClick = function() pings.stopAnimations("Poses") end
        },
        [4] = {
            title = "Lying on the side",
            onLeftClick = function() pings.playAnimation("model", "Poses", "actionLyingOnTheSide") end,
            onRightClick = function() pings.stopAnimations("Poses") end
        },
        [5] = {
            title = "AFKing",
            onLeftClick = function() pings.playAnimation("model", "Poses", "actionAFK") end,
            onRightClick = function() pings.stopAnimations("Poses") end
        },
        [6] = {
            title = "Squatting",
            onLeftClick = function() pings.playAnimation("model", "Poses", "actionSquatting") end,
            onRightClick = function() pings.stopAnimations("Poses") end
        }
    })
--#endregion



--#region appearancePage
appearancePage:newAction()
    :title("Go back")
    :item("minecraft:structure_void")
    :color(0.5, 0, 0)
    :hoverColor(0.75, 0, 0)
    :onLeftClick(function() action_wheel:setPage(mainPage) end)

appearancePage:newActionList()
    :title("Eyes")
    :item("minecraft:ender_eye")
    :color(0, 0.15, 0)
    :hoverColor(0.25, 0.5, 0.25)
    :visualSize(9)
    :actionList({
        [1] = {title = "Default", onSelect = function() pings.changeEyesType("default") end},
        [2] = {title = "Fear", onSelect = function() pings.changeEyesType("fear") end},
        [3] = {title = "Dots", onSelect = function() pings.changeEyesType("dots") end},
        [4] = {title = "Squeezed", onSelect = function() pings.changeEyesType("squeezed") end},
        [5] = {title = "Hurt", onSelect = function() pings.changeEyesType("hurt") end},
        [6] = {title = "Angry", onSelect = function() pings.changeEyesType("angry") end},
        [7] = {title = "Excited", onSelect = function() pings.changeEyesType("excited") end},
        [8] = {title = "Happy", onSelect = function() pings.changeEyesType("happy") end},
        [9] = {title = "Sad", onSelect = function() pings.changeEyesType("sad") end},
        [10] = {title = "Squinted", onSelect = function() pings.changeEyesType("squinted") end},
    })

appearancePage:newActionList()
    :title("Mouth")
    :item("minecraft:note_block")
    :color(0, 0.375, 0)
    :hoverColor(0.25, 0.725, 0.25)
    :visualSize(9)
    :actionList({
        [1] = {title = "Default", onSelect = function() pings.changeMouthType("default") end},
        [2] = {title = "Happy", onSelect = function() pings.changeMouthType("happy") end},
        [3] = {title = "Sad", onSelect = function() pings.changeMouthType("sad") end},
        [4] = {title = "Neutral", onSelect = function() pings.changeMouthType("neutral") end},
        [5] = {title = "Smiling Teeth", onSelect = function() pings.changeMouthType("smilingTeeth") end},
    })

appearancePage:newActionList()
    :title("Outfits")
    :item("minecraft:chainmail_chestplate")
    :color(0, 0.15, 0)
    :hoverColor(0.25, 0.5, 0.25)
    :actionList({
        [1] = {title = "Default", onSelect = function() pings.changeOutfit("textures.Outfits.DefaultOutfit") end}
    })
--#endregion