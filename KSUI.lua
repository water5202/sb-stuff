if not game:IsLoaded() then
game.Loaded:Wait()
end

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local AntiVoid = Instance.new("Part")
AntiVoid.Name = "AntiVoid"
AntiVoid.Parent = workspace
AntiVoid.Anchored = true
AntiVoid.Size = Vector3.new(1997, 2, 1995)
AntiVoid.CFrame = CFrame.new(331.141785, -14.7781677, -77.4250183, 1, 0, 0, 0, 1, 0, 0, 0, 1)
AntiVoid.Transparency = 1
AntiVoid.CanCollide = false

local bypass;
    bypass = hookmetamethod(game, "__namecall", function(method, ...) 
        if getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.Ban then
            return
        elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.AdminGUI then
            return
        elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.WalkSpeedChanged then
            return
        end
        return bypass(method, ...)
    end)

local Window = Fluent:CreateWindow({
    Title = "Killstreak Only // " .. identifyexecutor(),
    SubTitle = "",
    TabWidth = 120,
    Size = UDim2.fromOffset(400, 300),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.H
})

local Tabs = {
    Main = Window:AddTab({ Title = "Combat", Icon = "hammer" })
}

Tabs.Main:AddParagraph({
    Title = "Warning!!",
    Content = "Doing this a huge risk to your account.\nIf you get banned it is not my fault and is yours."
})

local IsRagdollTurnedOff = false

local AntiRagdollToggle = Tabs.Main:AddToggle("AntiRagdollToggle", {
    Title = "Toggle AntiRagdoll",
    Description = "",
    Default = false,
    Callback = function(state)
	IsRagdollTurnedOff = state
        if IsRagdollTurnedOff and game.Players.LocalPlayer.Character:FindFirstChild("entered") then
	task.wait(0.5)
            task.spawn(function()
                while IsRagdollTurnedOff do
		  if game.Players.LocalPlayer.Character.Ragdolled.Value == true then
			game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Anchored = true
			else
			game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Anchored = false
		    end
		  task.wait(0.5)
                end
            end)
        end
    end
})

local AntiVoidToggle = Tabs.Main:AddToggle("AntiVoidToggle", 
{
    Title = "Toggle AntiVoid", 
    Description = "",
    Default = false,
    Callback = function(state)
	if state then
        AntiVoid.Transparency = 0.5
        AntiVoid.CanCollide = true
	else
        AntiVoid.Transparency = 1
        AntiVoid.CanCollide = false
        end
    end 
})

local SlapAura = false

local SlapAuraToggle = Tabs.Main:AddToggle("SlapAuraToggle", {
    Title = "Toggle SlapAura",
    Description = "",
    Default = false,
    Callback = function(state)
	SlapAura = state
        if SlapAura and game.Players.LocalPlayer.Character:FindFirstChild("entered") then
	task.wait(0.5)
            task.spawn(function()
                while SlapAura do
local Players = game:GetService("Players")
local args = {}
    for _,Player in pairs(Players:GetPlayers()) do
		local PART = Player:WaitForChild("HumanoidRootPart")
        table.insert(args, PART)
    end
                game:GetService("ReplicatedStorage"):WaitForChild("KSHit"):FireServer(unpack(args))
		  task.wait(0.5)
                end
            end)
        end
    end
})

Window:SelectTab(1)
