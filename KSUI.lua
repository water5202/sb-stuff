if not game:IsLoaded() then
game.Loaded:Wait()
end

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local AntiVoid = Instance.new("Part")
AntiVoid.Name = "AntiVoid"
AntiVoid.Parent = workspace
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

local AntiRagdoll = Tabs.Main:AddToggle("RagdollToggle", {
    Title = "Anti Ragdoll",
    Description = "",
    Default = false,
    Callback = function(state)
        IsRagdollTurnedOff = state
        if IsRagdollTurnedOff then
            task.spawn(function()
                while IsRagdollTurnedOff do
                    local char = game.Players.LocalPlayer.Character
                    if char then
                        local RagdollVar = char:FindFirstChild("Ragdolled")
                        if RagdollVar and RagdollVar.Value == true then
                            char.HumanoidRootPart.Anchored = true
                        else
                            char.HumanoidRootPart.Anchored = false
                        end
                    end
                    task.wait(0.01)
                end
            end)
        else
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.Anchored = false
            end
        end
    end
})

local AntiVoid = Tabs.Main:AddToggle("AntiVoidToggle", 
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
