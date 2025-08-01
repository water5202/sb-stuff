local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local bypass;
    bypass = hookmetamethod(game, "__namecall", function(method, ...) 
        if getnamecallmethod() == "FireServer" and method == game:GetService("ReplicatedStorage").Ban then -- kicks for WS sadly
            return
        end
        return bypass(method, ...)
end) 

Fluent:Notify({Title = "Interface", Content = "Bypassed AntiCheat!", SubContent = "via hookmetamethod", Duration = 5})
Fluent:Notify({Title = "Interface", Content = "Script is beta!", SubContent = "", Duration = 5})

local Window = Fluent:CreateWindow({
    Title = "Slap Royale // " .. identifyexecutor(),
    SubTitle = "",
    TabWidth = 120,
    Size = UDim2.fromOffset(400, 300),
    Acrylic = false,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.H
})

local Tabs = {
    main = Window:AddTab({ Title = "Slap Royale", Icon = "swords" })
}

local Ping

local PingText = Tabs.main:AddParagraph({
        Title = "Ping // ?",
        Content = "Shows your current Ping"
})

task.spawn(function()
    while true do
Ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
PingText:SetTitle("Ping // " .. Ping)
	task.wait(1)
    end
end)

local time

local TimeBar = Tabs.main:AddParagraph({
    Title = "",
    Content = "Local Time"
})

task.spawn(function()
while true do
time = os.date("%H:%M:%S")
TimeBar:SetTitle(time)
task.wait(0.1)
end			
end)

local PlayerText = Tabs.main:AddParagraph({
        Title = "0/30",
        Content = "Players"
})

task.spawn(function()
    while true do
    local playersinnumb = #game:GetService("Players"):GetChildren()
        PlayerText:SetTitle(playersinnumb .. "/30")
        task.wait(0.001)
    end
end)

local Slapping = false

local Slappering = Tabs.main:AddToggle("SlapAura", {
    Title = "Slap Aura", 
    Description = "Blatant",
    Default = false,
    Callback = function(state)
        Slapping = state
        if Slapping then
            task.spawn(function()
                while Slapping do
                    for _,PLAYER in pairs(game:GetService("Players"):GetChildren()) do
                        local args = {PLAYER.Character:WaitForChild("Head")} -- basic understanding is game looks for part to hit within hitbox ( we can expand this probably but idk where )
                        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Slap"):FireServer(unpack(args))    
                    end
                    task.wait(0.001)
                end
            end)
        end
    end
})

for _, item in pairs(workspace.Items:GetChildren()) do
    if not item:FindFirstChild("ItemESP") then
        local esp = Instance.new("Highlight")
        esp.Name = "ItemESP"
        esp.FillColor = Color3.new(0.407843, 0.596078, 0.894117)
        esp.FillTransparency = 0
        esp.OutlineColor = Color3.new(1, 1, 1)
        esp.OutlineTransparency = 0
        esp.Adornee = item
        esp.Parent = item
    end

    if not item:FindFirstChild("ItemBillboard") then
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "ItemBillboard"
        billboard.Size = UDim2.new(0, 50, 0, 30)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true
        billboard.Parent = item

        local label = Instance.new("TextLabel")
        label.Name = "ItemLabel"
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Text = item.Name
        label.Font = Enum.Font.RobotoMono
        label.TextColor3 = Color3.new(0.372549, 0.552941, 0.733333)
        label.TextScaled = true
        label.Parent = billboard
    end
end
-- progress
Tabs.main:AddButton({
    Title = "Jump off bus",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Events.BusJumping:FireServer()
    end
})

Tabs.main:AddButton({
    Title = "Suicide",
    Description = "",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
    end
})

Window:SelectTab(1)

