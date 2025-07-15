local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Window = Fluent:CreateWindow({
    Title = "Fluent " .. Fluent.Version,
    SubTitle = "by dawid",
    TabWidth = 160,
    Size = UDim2.fromOffset(400, 300),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.H
})

local Tabs = {
    Main = Window:AddTab({ Title = "Plunger Badge", Icon = "hammer" })
}

Tab:AddButton({
    Title = "Get Plunger Badge",
    Description = "placeholder :3",
    Callback = function()
        fireclickdetector(workspace["plunger glove"].ClickDetector)
    end
})

Window:SelectTab(1)
