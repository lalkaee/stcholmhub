local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Rain-Design/Unnamed/main/Library.lua'))()
Library.Theme = "Dark"
local Flags = Library.Flags

local Window = Library:Window({
   Text = "stckholm hub"
})

local Tab = Window:Tab({
   Text = "Teleport"
})

local Tab2 = Window:Tab({
   Text = "Visual"
})

local Tab3 = Window:Tab({
   Text = "Visual2"
})

local Tab4 = Window:Tab({
   Text = "Visua3"
})

local Section = Tab:Section({
   Text = "Teleports location"
})

local Section2 = Tab2:Section({
   Text = "Buttons2"
})

local Section3 = Tab3:Section({
   Text = "Buttons2"
})
local Section4 = Tab4:Section({
   Text = "Buttons2"
})

Section:Button({
   Text = "Teleport to brazil",
   Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Lobby.brazil.portal.CFrame
       warn("Killed All")
   end
})

Section2:Button({
   Text = "Kick",
   Callback = function()
       warn("Kick.")
   end
})

Section2:Keybind({
   Text = "Press",
   Default = Enum.KeyCode.Z,
   Callback = function()
       warn("Pressed.")
   end
})

Section2:Input({
   Text = "Lil Input",
   Callback = function(txt)
       warn(txt)
   end
})

Section:Button({
   Text = "null",
   Callback = function()
       warn("Teleported")
   end
})

local drop = Section:Dropdown({
   Text = "null",
   List = {"Idk", "Test"},
   Callback = function(v)
       warn(v)
   end
})

Section:Slider({
   Text = "nullS",
   Default = 25,
   Minimum = 0,
   Maximum = 200
})

Section:Toggle({
   Text = "nullF",
   Callback = function(bool)
       warn(bool)
   end
})

Section:Button({
   Text = "Refresh Dropdown",
   Callback = function()
       drop:Remove("Test")
       wait(2)
       drop:Add("123")
   end
})

Tab:Select()