local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Stckhlm Hub " .. Fluent.Version,
    SubTitle = "by admin",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "rbxassetid://10723405649" }),
    Antis = Window:AddTab({ Title = "Anti Void", Icon = "rbxassetid://10734951684" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
    AGB = Window:AddTab({ Title = "Auto Gloves + Badges", icon = "rbxassetid://10709818996" })
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "Notification",
        Content = "This is a notification",
        SubContent = "SubContent", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
    })



local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local Remote = ReplicatedStorage:WaitForChild("b")

local Toggle = Tabs.Main:AddToggle("MyToggle", {
    Title = "Slap aura",
    Default = false
})

local Slider = Tabs.Main:AddSlider("Slider", {
    Title = "Attack Radius",
    Description = "Choose the attack radius for Slap Aura",
    Default = 15,  -- Начальный радиус
    Min = 0,  -- Минимум
    Max = 40,  -- Максимум
    Rounding = 1,  -- Округление до 1
    Callback = function(Value)
        TARGET_RADIUS = Value  -- Обновление цели радиуса на основе значения слайдера
    end
})

local ATTACK_COOLDOWN = 1 -- секунда между ударами по одному игроку
local lastHitTimes = {}
local TARGET_RADIUS = 15  -- Начальный радиус по умолчанию
local currentRadius = TARGET_RADIUS  -- Текущий радиус, который будет плавно изменяться

-- Функция плавного изменения радиуса с интерполяцией
local function updateRadiusSmoothly()
    while true do
        if currentRadius ~= TARGET_RADIUS then
            -- Плавно изменяем текущий радиус к целевому
            currentRadius = currentRadius + (TARGET_RADIUS - currentRadius) * 0.1
        end
        task.wait(0.1)  -- Плавное обновление каждую 0.1 секунду
    end
end

-- Запуск плавного изменения радиуса в отдельном потоке
task.spawn(updateRadiusSmoothly)

Toggle:OnChanged(function(value)
    local function startAuraAttack()
        while value do
            task.wait(0.2) -- проверка 5 раз в секунду
            local myChar = LocalPlayer.Character
            local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
            if not myHRP then continue end

            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local torso = player.Character:FindFirstChild("Torso")
                    if torso then
                        local distance = (torso.Position - myHRP.Position).Magnitude
                        if distance <= currentRadius then  -- используем плавно изменяющийся радиус
                            local lastHit = lastHitTimes[player] or 0
                            if tick() - lastHit >= ATTACK_COOLDOWN then
                                -- Удар
                                Remote:FireServer(torso)
                                lastHitTimes[player] = tick()
                            end
                        end
                    end
                end
            end
        end
    end

    if value then
        startAuraAttack() -- начинаем автоудар, если включено
    end
end)

Options.MyToggle:SetValue(false) -- Устанавливаем начальное значение Toggle в false




    Tabs.Main:AddButton({
        Title = "Button",
        Description = "Very important button",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })


    
    local Slider = Tabs.Main:AddSlider("Slider", {
        Title = "Slider",
        Description = "This is a slider",
        Default = 2,
        Min = 0,
        Max = 5,
        Rounding = 1,
        Callback = function(Value)
    
        end
    })

    Slider:OnChanged(function(Value)
        print("Slider changed:", Value)
    end)

    Slider:SetValue(3)



    local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
        Title = "Dropdown",
        Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
        Multi = false,
        Default = 1,
    })

    Dropdown:SetValue("four")

    Dropdown:OnChanged(function(Value)
        print("Dropdown changed:", Value)
    end)


    
    local MultiDropdown = Tabs.Main:AddDropdown("MultiDropdown", {
        Title = "Dropdown",
        Description = "You can select multiple values.",
        Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
        Multi = true,
        Default = {"seven", "twelve"},
    })

    MultiDropdown:SetValue({
        three = true,
        five = true,
        seven = false
    })

    MultiDropdown:OnChanged(function(Value)
        local Values = {}
        for Value, State in next, Value do
            table.insert(Values, Value)
        end
        print("Mutlidropdown changed:", table.concat(Values, ", "))
    end)



    local Colorpicker = Tabs.Main:AddColorpicker("Colorpicker", {
        Title = "Colorpicker",
        Default = Color3.fromRGB(96, 205, 255)
    })

    Colorpicker:OnChanged(function()
        print("Colorpicker changed:", Colorpicker.Value)
    end)
    
    Colorpicker:SetValueRGB(Color3.fromRGB(0, 255, 140))



    local TColorpicker = Tabs.Main:AddColorpicker("TransparencyColorpicker", {
        Title = "Colorpicker",
        Description = "but you can change the transparency.",
        Transparency = 0,
        Default = Color3.fromRGB(96, 205, 255)
    })

    TColorpicker:OnChanged(function()
        print(
            "TColorpicker changed:", TColorpicker.Value,
            "Transparency:", TColorpicker.Transparency
        )
    end)



    local Keybind = Tabs.Main:AddKeybind("Keybind", {
        Title = "KeyBind",
        Mode = "Toggle", -- Always, Toggle, Hold
        Default = "LeftControl", -- String as the name of the keybind (MB1, MB2 for mouse buttons)

        -- Occurs when the keybind is clicked, Value is `true`/`false`
        Callback = function(Value)
            print("Keybind clicked!", Value)
        end,

        -- Occurs when the keybind itself is changed, `New` is a KeyCode Enum OR a UserInputType Enum
        ChangedCallback = function(New)
            print("Keybind changed!", New)
        end
    })


    
    
    local Toggle = Tabs.Antis:AddToggle("MyToggle", {
        Title = "Anti void V2",
        Description = "Platform under you..",
        Default = false,
        Callback = function(Value)
            -- Если тумблер выключен, удаляем платформу (если она существует)
            if not Value and platform then
                platform:Destroy() -- Удаляем платформу
                platform = nil -- Очищаем переменную
                return
            end
    
            -- Инициализация платформы, если она ещё не создана
            if not platform then
                local Players = game:GetService("Players")
                local RunService = game:GetService("RunService")
    
                local player = Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                local hrp = character:WaitForChild("HumanoidRootPart")
    
                -- Создание платформы
                platform = Instance.new("Part")
                platform.Name = "FollowPlatform"
                platform.Size = Vector3.new(10, 1, 10)
                platform.Anchored = true
                platform.CanCollide = true
                platform.Material = Enum.Material.SmoothPlastic
                platform.Color = Color3.new(1, 1, 1) -- Белый
                platform.Transparency = 0.5 -- Полупрозрачная
                platform.Parent = workspace
    
                -- Следует за игроком, но всегда на высоте 8.92285156
                RunService.Heartbeat:Connect(function()
                    if not hrp then return end
                    local followPosition = hrp.Position - Vector3.new(0, 5.5, 0) -- следуем ниже
                    platform.Position = Vector3.new(followPosition.X, -8.92285156, followPosition.Z) -- фиксируем Y-координату
                end)
            end
        end
    })
    

    Tabs.AGB:AddButton({ 
        Title = "Get Hybrid Glove (INSTA)",
        Description = "When you click the button you automatically getting Hybrid Glove",
        Callback = function()
    
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local GRRRRR = ReplicatedStorage:WaitForChild("GRRRRR")
    
            GRRRRR:FireServer("EnterRage")  
    
            local duration = 60
            local interval = 1
    
            for i = 1, duration, interval do
                GRRRRR:FireServer("StillInRage") 
                wait(interval)
            end
    
            GRRRRR:FireServer("ExitRage")  
    
        end
    })
    







    -- OnClick is only fired when you press the keybind and the mode is Toggle
    -- Otherwise, you will have to use Keybind:GetState()
    Keybind:OnClick(function()
        print("Keybind clicked:", Keybind:GetState())
    end)

    Keybind:OnChanged(function()
        print("Keybind changed:", Keybind.Value)
    end)

    task.spawn(function()
        while true do
            wait(1)

            -- example for checking if a keybind is being pressed
            local state = Keybind:GetState()
            if state then
                print("Keybind is being held down")
            end

            if Fluent.Unloaded then break end
        end
    end)

    Keybind:SetValue("MB2", "Toggle") -- Sets keybind to MB2, mode to Hold


    local Input = Tabs.Main:AddInput("Input", {
        Title = "Input",
        Default = "Default",
        Placeholder = "Placeholder",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
            print("Input changed:", Value)
        end
    })

    Input:OnChanged(function()
        print("Input updated:", Input.Value)
    end)
end


-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "Fluent",
    Content = "The script has been loaded.",
    Duration = 8
})

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
