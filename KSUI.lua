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
        if IsRagdollTurnedOff and localplayer.Character:FindFirstChild("entered") then
	task.wait(0.5)
            task.spawn(function()
                while IsRagdollTurnedOff do
		  if game.Players.LocalPlayer.Character.Ragdoll.Value == true then
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
    Default = false
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
