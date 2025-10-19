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
    :onLeftClick(function()
        action_wheel:setPage(appearancePage)
        sounds:playSound("block.calcite.place", player:getPos())
    end)

mainPage:newAction()
    :title("Actions")
    :item("minecraft:axolotl_bucket")
    :color(0, 0.375, 0)
    :hoverColor(0.25, 0.725, 0.25)
    :onLeftClick(function()
        action_wheel:setPage(actionsPage)
        sounds:playSound("block.calcite.place", player:getPos())
    end)
--#endregion



--#region actionsPage
actionsPage:newAction()
    :title("Go back")
    :item("minecraft:structure_void")
    :color(0.5, 0, 0)
    :hoverColor(0.75, 0, 0)
    :onLeftClick(function()
        action_wheel:setPage(mainPage)
        sounds:playSound("block.calcite.place", player:getPos())
    end)

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
        },
        [4] = {
            title = "Cross arms",
            onLeftClick = function() pings.playAnimation("model", "Arms", "actionCrossedArms") end,
            onRightClick = function() pings.stopAnimations("Arms") end
        }
    })
    :onLeftClick(function() sounds:playSound("block.lever.click", player:getPos(), 0.25, 0.6, false) end)
    :onRightClick(function() sounds:playSound("block.lever.click", player:getPos(), 0.25, 0.5, false) end)
    :onScroll(function() sounds:playSound("block.lever.click", player:getPos(), 0.25, 2, false) end)

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
            title = "Squatting",
            onLeftClick = function() pings.playAnimation("model", "Poses", "actionSquatting") end,
            onRightClick = function() pings.stopAnimations("Poses") end
        },
        [6] = {
            title = "Breakdance",
            onLeftClick = function() pings.playAnimation("model", "Poses", "actionBreakdance") end,
            onRightClick = function() pings.stopAnimations("Poses") end
        },
    })
    :onLeftClick(function() sounds:playSound("block.lever.click", player:getPos(), 0.25, 0.6, false) end)
    :onRightClick(function() sounds:playSound("block.lever.click", player:getPos(), 0.25, 0.5, false) end)
    :onScroll(function() sounds:playSound("block.lever.click", player:getPos(), 0.25, 2, false) end)

HeadNDisplay = actionsPage:newActionList()
    :title("Head & Display")
    :item("minecraft:redstone_lamp")
    :color(0, 0.15, 0)
    :hoverColor(0.25, 0.5, 0.25)
    :actionList({
        [1] = {
            title = {text = "Happy", color = "#AAAA00"},
            activeTitle = {text = "Happy (^◡^)", color = "#FFFF00"},
            onLeftClick = function() pings.playAnimation("model", "HeadNDisplay", "actionHappy") end,
            onRightClick = function() pings.stopAnimations("HeadNDisplay") end
        },
        [2] = {
            title = {text = "Angry", color = "#AA1A1A"},
            activeTitle = {text = "Angry (╯°□°）╯︵ ┻━┻", color = "#FF3F3F"},
            onLeftClick = function() pings.playAnimation("model", "HeadNDisplay", "actionAngry") end,
            onRightClick = function() pings.stopAnimations("HeadNDisplay") end
        },
        [3] = {
            title = {text = "Sad", color = "#4A4AAA"},
            activeTitle = {text = "Sad (T⌒T)", color = "#7F7FFF"},
            onLeftClick = function() pings.playAnimation("model", "HeadNDisplay", "actionSad") end,
            onRightClick = function() pings.stopAnimations("HeadNDisplay") end
        },
        [4] = {
            title = {text = "Fear", color = "#7A7AAA"},
            activeTitle = {text = "Fear (@_@;)", color = "#BFBFFF"},
            onLeftClick = function() pings.playAnimation("model", "HeadNDisplay", "actionFear") end,
            onRightClick = function() pings.stopAnimations("HeadNDisplay") end
        },
        [5] = {
            title = {text = "Kitty", color = "#AA5353"},
            activeTitle = {text = "Kitty (^w^)", color = "#FFA5A5"},
            onLeftClick = function() pings.playAnimation("model", "HeadNDisplay", "actionKitty") end,
            onRightClick = function() pings.stopAnimations("HeadNDisplay") end
        },
        [6] = {
            title = {text = "Sussy", color = "#444444"},
            activeTitle = {text = "Sussy (Ō_ō)", color = "#666666"},
            onLeftClick = function() pings.playAnimation("model", "HeadNDisplay", "actionSussy") end,
            onRightClick = function() pings.stopAnimations("HeadNDisplay") end
        },
        [7] = {
            title = {text = "Wink", color = "#444444"},
            activeTitle = {text = "Wink (0_<)", color = "#666666"},
            onLeftClick = function() pings.playAnimation("model", "HeadNDisplay", "actionWink") end,
            onRightClick = function() pings.stopAnimations("HeadNDisplay") end
        },
        [8] = {
            title = "AFKing",
            onLeftClick = function() pings.playAnimation("model", "HeadNDisplay", "actionAFK") end,
            onRightClick = function() pings.stopAnimations("HeadNDisplay") end
        }
    })
    :onScroll(function() sounds:playSound("block.lever.click", player:getPos(), 0.25, 2, false) end)
--#endregion



--#region appearancePage
appearancePage:newAction()
    :title("Go back")
    :item("minecraft:structure_void")
    :color(0.5, 0, 0)
    :hoverColor(0.75, 0, 0)
    :onLeftClick(function()
        action_wheel:setPage(mainPage)
        sounds:playSound("block.calcite.place", player:getPos())
    end)

appearancePage:newActionList()
    :title("Outfits")
    :item("minecraft:chainmail_chestplate")
    :color(0, 0.15, 0)
    :hoverColor(0.25, 0.5, 0.25)
    :actionList({
        [1] = {title = "Default", onSelect = function() pings.changeOutfit("textures.Outfits.DefaultOutfit") end},
        [2] = {title = "Formal Suit", onSelect = function() pings.changeOutfit("textures.Outfits.FormalSuit") end}
    })
--#endregion