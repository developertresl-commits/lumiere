local LumiereLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/developertresl-commits/lumiere/refs/heads/main/lumiere_lib.lua"))()

local Window = LumiereLibrary:Window({
    GameName = "Lumiere",
    Version = "v1.0"
})

LumiereLibrary:Tab({
    Name = "Home",
    Image = "rbxassetid://7733960981",
    Selected = true
})

LumiereLibrary:Tab({
    Name = "Settings",
    Image = "rbxassetid://7734053495",
    Selected = false
})
