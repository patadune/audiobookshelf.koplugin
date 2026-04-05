local Dispatcher = require("dispatcher")
local AudiobookshelfBrowser = require("audiobookshelf/audiobookshelfbrowser")
local NetworkMgr = require("ui/network/manager")
local UIManager = require("ui/uimanager")
local WidgetContainer = require("ui/widget/container/widgetcontainer")
local _ = require("gettext")
local logger = require("logger")

local Audiobookshelf = WidgetContainer:extend{
    name = "audiobookshelf",
    is_doc_only = false,
}

function Audiobookshelf:onDispatcherRegisterActions()
    -- none atm
end

function Audiobookshelf:init()
    self:onDispatcherRegisterActions()
    self.ui.menu:registerToMainMenu(self)
end

function Audiobookshelf:addToMainMenu(menu_items)
    menu_items.audiobookshelf = {
        text = _("Audiobookshelf"),
        sorting_hint = "tools",
        callback = function()
            local connect_callback = function()
                UIManager:show(AudiobookshelfBrowser:new())
            end
            NetworkMgr:runWhenOnline(connect_callback)
        end
    }
end

return Audiobookshelf
