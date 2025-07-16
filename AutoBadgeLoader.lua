local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Players = game:GetService("Players")
local localplayer = Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local VirtualInput = game:GetService("VirtualUser")
local HRP
local idledConnection
local Brickconnection = nil
local RunService = game:GetService("RunService")
local ArenaPart = workspace.Lobby.Teleport1

if game.Workspace:FindFirstChild("AutoFarmPart") then 
    game.Workspace.AutoFarmPart:Destroy() 
end

local Platform = Instance.new("Part")
Platform.Name = "AutoFarmPart"
Platform.Parent = workspace
Platform.CFrame = CFrame.new(-108000.6895, -122.158432, -2900.86475, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Platform.Size = Vector3.new(84, 5, 82)
Platform.Transparency = 0.5
Platform.Anchored = true

Fluent:Notify({
        Title = "Interface",
        Content = "Platform Loaded!",
        SubContent = "",
        Duration = 3
})

local Window = Fluent:CreateWindow({
    Title = "Auto Badges // " .. identifyexecutor(),
    SubTitle = "",
    TabWidth = 120,
    Size = UDim2.fromOffset(400, 300),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.H
})

local Tabs = {
    AutoFish = Window:AddTab({ Title = "AutoFish", Icon = "hammer" }),
    AutoBrickMaster = Window:AddTab({ Title = "AutoBrickMaster", Icon = "hammer" }),
    SlapFarm = Window:AddTab({ Title = "Slap Farm", Icon = "hammer" }),
    Badges = Window:AddTab({ Title = "Badges", Icon = "box" }),
    Info = Window:AddTab({ Title = "Info", Icon = "info" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local PlayerText = Tabs.Info:AddParagraph({
        Title = "0/16",
        Content = "Players"
})

task.spawn(function()
    while true do
    local playersinnumb = #Players:GetChildren()
        PlayerText:SetTitle(playersinnumb .. "/16")
        task.wait(0.001)
    end
end)

local CODETEXT = Tabs.Info:AddParagraph({
        Title = "",
        Content = "Elude keypad code"
})

task.spawn(function()
while true do
CODETEXT:SetTitle("Keypad Code // "..tostring((#game.Players:GetPlayers()) * 25 + 1100 - 7))
task.wait(0.001)
    end
end)

local KeypadText = Tabs.Info:AddParagraph({
        Title = "Keypad Spawned // No",
        Content = "Elude Keypad"
})

task.spawn(function()
while true do
if game.Workspace:FindFirstChild("Keypad") then
KeypadText:SetTitle("Keypad Spawn // Yes")
else
KeypadText:SetTitle("Keypad Spawn // No")
end
task.wait(0.001)
    end
end)

local SiphonText = Tabs.Info:AddParagraph({
        Title = "Siphon Orb // No",
        Content = "Checks for Siphon orb"
})

task.spawn(function()
while true do
if game.Workspace:FindFirstChild("SiphonOrb") then
SiphonText:SetTitle("Siphon Orb // Yes")
			else
SiphonText:SetTitle("Siphon Orb // No")
end
task.wait(0.001)
    end
end)

local TimeBar = Tabs.Info:AddParagraph({
    Title = "",
    Content = "Time taken"
})

local startTime = tick()

task.spawn(function()
    while true do
        local elapsedTime = math.floor(tick() - startTime)

        local hours = math.floor(elapsedTime / 3600)
        local minutes = math.floor((elapsedTime % 3600) / 60)
        local seconds = elapsedTime % 60

        local timeString = string.format("%02d:%02d:%02d", hours, minutes, seconds)

        TimeBar:SetTitle(timeString)

        task.wait(1)
    end
end)

Tabs.Badges:AddButton({
    Title = "Get Plunger",
    Description = "Gets Plunger automatically",
    Callback = function()
local teleportFunc = queueonteleport or queue_on_teleport
    if teleportFunc then
        teleportFunc([[
if not game:IsLoaded() then
    game.Loaded:Wait()
end
fireclickdetector(workspace["plunger glove"].ClickDetector)
]])
end
fireclickdetector(workspace.BountyHunterRoom.PlungerMain.ClickDetector)
task.wait(0.5)
fireclickdetector(workspace.plungers.ToiletPlunger.ClickDetector)
    end
})

Tabs.Badges:AddButton({
    Title = "Get Boxing Glove",
    Description = "Gets Boxing Glove automatically",
    Callback = function()
local teleportFunc = queueonteleport or queue_on_teleport
    if teleportFunc then
        teleportFunc([[
if not game:IsLoaded() then
    game.Loaded:Wait()
end
					
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4183.43701, 3518.25, 194.199707, -1, 0, 0, 0, 1, 0, 0, 0, -1)
task.wait(3)
fireclickdetector(workspace.BoxingGloves.ClickDetector)
task.wait(1)
game:GetService("TeleportService"):Teleport(6403373529)
]])
end
game:GetService("TeleportService"):Teleport(7234087065)
    end
})

Tabs.AutoFish:AddButton({
    Title = "Equip ZZZZZZZ",
    Description = "",
    Callback = function()
         fireclickdetector(workspace.Lobby.ZZZZZZZ.ClickDetector) 
    end
})

Tabs.Badges:AddButton({
    Title = "All 3 Misc Badges",
    Description = "Duck Orange and Knife",
    Callback = function()
         fireclickdetector(workspace.Lobby.Scene.knofe.ClickDetector)
	 fireclickdetector(workspace.Arena.island5.Orange.ClickDetector)
	 fireclickdetector(workspace.Lobby.Scene.knofe.ClickDetector)
    end
})

Tabs.SlapFarm:AddButton({
    Title = "Equip Dual",
    Description = "",
    Callback = function()
fireclickdetector(workspace.Lobby.Dual.ClickDetector)
    end
})

Tabs.SlapFarm:AddButton({
    Title = "Teleport to SafeSpot",
    Description = "This as your Main alt account",
    Callback = function()
HRP = localplayer.Character.HumanoidRootPart
firetouchinterest(HRP,  ArenaPart, 0)
task.wait(0.1)
firetouchinterest(HRP, ArenaPart, 1)
task.wait(0.5)
localplayer.Character.HumanoidRootPart.CFrame = CFrame.new(-108000.688, -116.882454, -2901.13306, 1, 0.000118658187, -2.09227746e-05, -1.09000396e-12, 0.173649266, 0.984807551, 0.000120488701, -0.984807551, 0.173649266)
task.wait(0.2)
localplayer.Character.HumanoidRootPart.Anchored = true
    end
})

Tabs.SlapFarm:AddButton({
    Title = "Anchor yourself",
    Description = "This as your alt account",
    Callback = function()
HRP = localplayer.Character.HumanoidRootPart
firetouchinterest(HRP,  ArenaPart, 0)
task.wait(0.1)
firetouchinterest(HRP, ArenaPart, 1)
task.wait(0.5)
localplayer.Character.HumanoidRootPart.CFrame = CFrame.new(-108000.6895, -119.158432, -2900.86475, 1, 0, 0, 0, 1, 0, 0, 0, 1)
task.wait(1)
localplayer.Character.HumanoidRootPart.Anchored = true
    end
})

Tabs.Badges:AddButton({
    Title = "Elude Maze Teleport",
    Description = "Goto Elude Maze",
    Callback = function()
local teleportFunc = queueonteleport or queue_on_teleport
    if teleportFunc then
        teleportFunc([[
loadstring(game:HttpGet("https://raw.githubusercontent.com/water5202/Slap-Battles-Auto-Badges/refs/heads/main/EludeMazeUI"))()
]])
end
game:GetService("TeleportService"):Teleport(11828384869)
    end
})

Tabs.AutoBrickMaster:AddButton({
    Title = "Equip Brick",
    Description = "",
    Callback = function()
         fireclickdetector(workspace.Lobby.Brick.ClickDetector)
    end
})

local BrickAutoToggle = Tabs.AutoBrickMaster:AddToggle("SexyBrickToggle", 
{
    Title = "Auto Brick", 
    Description = "Fires the Brick Remote",
    Default = false,
    Callback = function(state)
	if state then
Brickconnection = RunService.Heartbeat:Connect(function()
    game:GetService("ReplicatedStorage").lbrick:FireServer()
    task.wait(0.7)
end)         
	else
if Brickconnection then
Brickconnection:Disconnect()
Brickconnection = nil
end
        end
    end 
})

Tabs.AutoFish:AddButton({
        Title = "Goto SafeSpot",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Confirm Teleport?",
                Content = "",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
HRP = localplayer.Character.HumanoidRootPart
                            firetouchinterest(HRP,  ArenaPart, 0)
                            task.wait(0.1)
                            firetouchinterest(HRP, ArenaPart, 1)
			    task.wait(0.3)
                            localplayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-108000.6895, -119.158432, -2900.86475, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                                task.wait(0.2)
                            if game.Players.LocalPlayer.leaderstats.Glove.Value == "ZZZZZZZ" then
                                game:GetService("ReplicatedStorage"):WaitForChild("ZZZZZZZSleep"):FireServer()
                            end
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                        end
                    }
                }
            })
        end
})

Tabs.Badges:AddButton({
    Title = "Get Frostbite",
    Description = "Gets Frostbite automatically",
    Callback = function()
local teleportFunc = queueonteleport or queue_on_teleport
    if teleportFunc then
        teleportFunc([[
            if not game:IsLoaded() then
                game.Loaded:Wait()
            end
            repeat wait() until game.Players.LocalPlayer
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-554, 177, 56)
wait(0.7)
for i,v in ipairs(game:GetService("Workspace"):GetDescendants()) do
            if v.ClassName == "ProximityPrompt" then
                fireproximityprompt(v)
            end
        end
]])
end
game:GetService("TeleportService"):Teleport(17290438723)
    end
})

Tabs.AutoBrickMaster:AddButton({
        Title = "Goto SafeSpot",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Confirm Teleport?",
                Content = "",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
HRP = localplayer.Character.HumanoidRootPart            
                            firetouchinterest(HRP,  ArenaPart, 0)
                            task.wait(0.1)
                            firetouchinterest(HRP, ArenaPart, 1)
			    task.wait(0.3)
                            localplayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-108000.6895, -119.158432, -2900.86475, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                        end
                    }
                }
            })
        end
})

Tabs.Settings:AddButton({
        Title = "Reset",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Confirm Reset?",
                Content = "",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
			BrickAutoToggle:SetValue(false)
                            game.Players.LocalPlayer.Character.Humanoid.Health = 0
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                        end
                    }
                }
            })
        end
})

Tabs.Settings:AddButton({
        Title = "Kick",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Confirm Kick?",
                Content = "",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            localplayer:Kick("Kicked // " .. localplayer)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                        end
                    }
                }
            })
        end
})

Tabs.Settings:AddButton({
    Title = "Anchor yourself",
    Description = "Anchors your HumanoidRootPart",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = not game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored
    end
})

local AntiAfk = Tabs.Settings:AddToggle("SexyAntiAfkToggle", {
    Title = "Anti Afk", 
    Description = "Disables being kicked",
    Default = false,
    Callback = function(state)
        if state then
            if not idledConnection then
                idledConnection = Players.LocalPlayer.Idled:Connect(function()
                    VirtualInput:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                    task.wait(0.1)
                    VirtualInput:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                end)
            end
        else
            if idledConnection then
                idledConnection:Disconnect()
                idledConnection = nil
            end
        end
    end
})

Tabs.Settings:AddButton({
    Title = "Unload UI",
    Description = "Unloads UI",
    Callback = function()
       		BrickAutoToggle:SetValue(false)
		AntiAfk:SetValue(false)
                game.Workspace:WaitForChild("AutoFarmPart"):Destroy()
                Fluent:Destroy()
    end
})

Window:SelectTab(1)
