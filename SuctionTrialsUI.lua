local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Window = Fluent:CreateWindow({
    Title = "Suction Trials // " .. identifyexecutor(),
    SubTitle = "",
    TabWidth = 160,
    Size = UDim2.fromOffset(400, 300),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.H
})

local Tabs = {
    Main = Window:AddTab({ Title = "Plunger Badge", Icon = "hammer" })
}

Tabs.Main:AddButton({
    Title = "Get Plunger Badge",
    Description = "placeholder :3",
    Callback = function()
        if game.Workspace:FindFirstChild("plunger glove") then
        fireclickdetector(workspace["plunger glove"].ClickDetector)
            end
    end
})

Window:SelectTab(1)
