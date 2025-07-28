if not game:IsLoaded() then
game.Loaded:Wait()
end

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "The Null Zone // " .. identifyexecutor(),
    SubTitle = "",
    TabWidth = 120,
    Size = UDim2.fromOffset(400, 300),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.H
})

local Tabs = {
    Main = Window:AddTab({ Title = "Null Zone Badges", Icon = "hammer" })
}

Tabs.Main:AddButton({
    Title = "Get Null Glove",
    Description = "",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Model.Position
      task.wait(0.5)
      fireclickdetector(workspace.Model.Handle.ClickDetector)
    end
})

Tabs.Main:AddButton({
    Title = "Get Pan Glove",
    Description = "For Pan Glove",
    Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace._ugcQuestObjectBobPlushie.Position -- Models cant have CFrames
task.wait(0.5)
fireclickdetector(workspace._ugcQuestObjectBobPlushie.ClickDetector)
    end
})

Window:SelectTab(1)
