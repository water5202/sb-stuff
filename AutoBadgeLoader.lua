local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Players = game:GetService("Players")
local localplayer = Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local VirtualInput = game:GetService("VirtualUser")
local HRP
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
Platform.Size = Vector3.new(84, 1, 82)
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



Tabs.AutoFish:AddButton({
        Title = "Equip ZZZ Glove",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Confirm Equip?",
                Content = "",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            fireclickdetector(workspace.Lobby.ZZZZZZZ.ClickDetector)
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

Tabs.AutoBrickMaster:AddButton({
        Title = "Equip Brick Glove",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Confirm Equip?",
                Content = "",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            fireclickdetector(workspace.Lobby.Brick.ClickDetector)
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
        Title = "Unload UI",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
			BrickAutoToggle:SetValue(false)
                            game.Workspace:WaitForChild("AutoFarmPart"):Destroy()
                            Fluent:Destroy()
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
        Title = "Anchor Toggle",
        Description = "Anchors your HumanoidRootPart",
        Callback = function()
            Window:Dialog({
                Title = "Confirm?",
                Content = "",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = not game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored
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

local Toggle = Tab:AddToggle("MyToggle", 
{
    Title = "Toggle", 
    Description = "Toggle description",
    Default = false
    Callback = function(state)
	if state then
Players.LocalPlayer.Idled:Connect(function()
    VirtualInput:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    task.wait(0.1)
    VirtualInput:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)
else
        end
    end 
})

Window:SelectTab(1)
