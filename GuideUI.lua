if not game:IsLoaded() then
game.Loaded:Wait()
end

local AntiVoid = Instance.new("Part")
AntiVoid.Name = ""
AntiVoid.Parent = workspace
AntiVoid.Size = Vector3.new(665, 2, 478)
AntiVoid.CFrame = CFrame.new(590.613281, 97.6590576, -275.837341, 1, 0, 0, 0, 1, 0, 0, 0, 1)
AntiVoid.Transparency = 1
AntiVoid.CanCollide = false
AntiVoid.Anchored = true

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Where Guide Resides // " .. identifyexecutor(),
    SubTitle = "",
    TabWidth = 120,
    Size = UDim2.fromOffset(400, 300),
    Acrylic = false,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.H
})

local Tabs = {
    Main = Window:AddTab({ Title = "Guide Badges", Icon = "hammer" })
}

Tabs.Main:AddButton({
    Title = "Teleport to the end",
    Description = "",
    Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3259.35181, -74.5, 821.916199, 0.00376401632, -5.12010487e-08, 0.999992907, 2.30775996e-10, 1, 5.12005442e-08, -0.999992907, 3.80546705e-11, 0.00376401632)
    end
})

Tabs.Main:AddButton({
    Title = "Pull Shack Lever",
    Description = "You will die unless you teleport",
    Callback = function()
fireclickdetector(workspace.ShackLever.ClickDetector)
    end
})

Tabs.Main:AddButton({
    Title = "Get Heart + Healing",
    Description = "",
    Callback = function()
if game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame ~= CFrame(3259.35181, -74.5, 821.916199, 0.00376401632, -5.12010487e-08, 0.999992907, 2.30775996e-10, 1, 5.12005442e-08, -0.999992907, 3.80546705e-11, 0.00376401632) then
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace:FindFirstChild("Big Heart"), 0)
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace:FindFirstChild("the cube of life"), 0)
task.wait(0.005)
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace:FindFirstChild("Big Heart"), 1)
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace:FindFirstChild("the cube of life"), 1)
       end
    end
})

local AntiVoidToggle = Tab:AddToggle("AntiVoidToggle", {
    Title = "AntiVoid", 
    Description = "Toggles A Platform Above Guide",
    Default = false,
    Callback = function(state)
	if state then
        game.Players.LocalPlayer.Character.CFrame = game.Players.LocalPlayer.Character.CFrame * CFrame.new(0, 90, 0)
	    AntiVoid.CanCollide = true
        AntiVoid.Transparency = 0.5
	else
	    AntiVoid.CanCollide = false
        AntiVoid.Transparency = 1
        end
    end 
})

local slapping = false

local slappinger = Tabs.Main:AddToggle("TheSlappingToggle", {
    Title = "Auto Slap Tracks",
    Description = "",
    Default = false,
    Callback = function(state)
        slapping = state
        if slapping then
            task.spawn(function()
                while slapping do
game.Players.LocalPlayer.Character:FindFirstChild("Lantern"):Activate()
local args = {"Hit", workspace:FindFirstChild("TrackGloveMissile")}
game:GetService("Players").LocalPlayer.Character:WaitForChild("Lantern"):WaitForChild("Network"):FireServer(unpack(args))
              task.wait(0.01)
                end
            end)
        end
    end
})

local slapping1 = false

local slappinger1 = Tabs.Main:AddToggle("TheSlapping2Toggle", {
    Title = "Auto Slap Golems",
    Description = "",
    Default = false,
    Callback = function(state)
        slapping = state
        if slapping1 then
            task.spawn(function()
                while slapping1 do
game.Players.LocalPlayer.Character:FindFirstChild("Lantern"):Activate()
local args = {"Hit", workspace:FindFirstChild("golem")}
game:GetService("Players").LocalPlayer.Character:WaitForChild("Lantern"):WaitForChild("Network"):FireServer(unpack(args))
              task.wait(0.01)
                end
            end)
        end
    end
})

local slapping3 = false

local slappinger3 = Tabs.Main:AddToggle("TheSlapping3Toggle", {
    Title = "Auto Slap Guide",
    Description = "",
    Default = false,
    Callback = function(state)
        slapping3 = state
        if slapping3 then
            task.spawn(function()
                while slapping3 do
game.Players.LocalPlayer.Character:FindFirstChild("Lantern"):Activate()
local args = {"Hit", workspace:FindFirstChild("GuideNPC")}
game:GetService("Players").LocalPlayer.Character:WaitForChild("Lantern"):WaitForChild("Network"):FireServer(unpack(args))
              task.wait(0.01)
                end
            end)
        end
    end
})

Window:SelectTab(1)
