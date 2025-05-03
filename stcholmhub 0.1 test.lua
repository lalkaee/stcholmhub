local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Rain-Design/Unnamed/main/Library.lua'))()
Library.Theme = "Dark"
local Flags = Library.Flags

local Window = Library:Window({
   Text = "stckholm hub"
})

local Tab = Window:Tab({
    Text = "Teleports"
 })

 local Tab2 = Window:Tab({
    Text = "Autofarm"
 })

 local Section = Tab:Section({
    Text = "Buttons"
 })

 local Section2 = Tab2:Section({
    Text = "Farms"
 })

 Section:Button({
    Text = "Teleport Brazil",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Lobby.brazil.portal.CFrame
        warn("Killed All")
    end
 })

 Section:Button({
    Text = "Teleport to cannon island",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(265.664215, 33.6846275, 197.380371, 0.637434483, -2.39488092e-08, 0.770504534, -3.25740004e-08, 1, 5.80302881e-08, -0.770504534, -6.20889224e-08, 0.637434483)
        warn("Killed All")
    end
 })

 Section2:Button({
    Text = "Slapple farm (GO AREA)",
    Callback = function()
        workspace.Arena.island5.Slapples:GetChildren()[7].Glove.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        wait(0.1)
        workspace.Arena.island5.Slapples:GetChildren()[3].Glove.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        wait(0.1)
        workspace.Arena.island5.Slapples:GetChildren()[4].Glove.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        wait(0.1)
        workspace.Arena.island5.Slapples:GetChildren()[9].Glove.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        wait(0.1)
        workspace.Arena.island5.Slapples:GetChildren()[8].Glove.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        wait(0.1)
        workspace.Arena.island5.Slapples:GetChildren()[5].Glove.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        wait(0.1)
        workspace.Arena.island5.Slapples:GetChildren()[2].Glove.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    end
 })
