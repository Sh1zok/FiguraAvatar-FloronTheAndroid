local mainPage = action_wheel:newPage()
local actionsPage = action_wheel:newPage()
local appearancePage = action_wheel:newPage()
action_wheel:setPage(actionsPage)



--#region mainPage
mainPage:newAction()
    :title("Actions")
    :item("minecraft:axolotl_bucket")
    :hoverColor(0.25, 0.25, 0.25)
    :onLeftClick(function() action_wheel:setPage(actionsPage) end)

mainPage:newAction()
    :title("Appearance")
    :item("minecraft:leather_chestplate")
    :hoverColor(0.25, 0.25, 0.25)
    :onLeftClick(function() action_wheel:setPage(appearancePage) end)
--#endregion



--#region actionsPage
actionsPage:newAction()
    :title("Go back")
    :item("minecraft:structure_void")
    :color(0.5, 0, 0)
    :hoverColor(0.75, 0, 0)
    :onLeftClick(function() action_wheel:setPage(mainPage) end)
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
    :hoverColor(0.25, 0.25, 0.25)
    :actionList({
        [1] = {title = "Default", onLeftClick = function() pings.changeEyesType("default") end},
        [2] = {title = "Fear", onLeftClick = function() pings.changeEyesType("fear") end},
        [3] = {title = "Dots", onLeftClick = function() pings.changeEyesType("dots") end},
        [4] = {title = "Squeezed", onLeftClick = function() pings.changeEyesType("squeezed") end},
        [5] = {title = "Hurt", onLeftClick = function() pings.changeEyesType("hurt") end},
        [6] = {title = "Angry", onLeftClick = function() pings.changeEyesType("angry") end},
        [7] = {title = "Excited", onLeftClick = function() pings.changeEyesType("excited") end},
        [8] = {title = "Happy", onLeftClick = function() pings.changeEyesType("happy") end},
        [9] = {title = "Sad", onLeftClick = function() pings.changeEyesType("sad") end},
        [10] = {title = "Squinted", onLeftClick = function() pings.changeEyesType("squinted") end},
    })
--#endregion