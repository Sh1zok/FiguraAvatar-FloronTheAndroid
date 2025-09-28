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
--#endregion