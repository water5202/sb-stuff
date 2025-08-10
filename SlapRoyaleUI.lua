local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/water5202/Iridium/refs/heads/main/SRCUSTOMUIGUI2LUA"))()
game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("HUD").Enabled = false
Fluent:Notify({Title = "Interface", Content = "Custom UI Loaded!", SubContent = "", Duration = 5})
Fluent:Notify({Title = "Interface", Content = "{Players} is Players ingame Not Alive!", SubContent = "", Duration = 5})
Fluent:Notify({Title = "Interface", Content = "Script is beta!", SubContent = "", Duration = 5})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local AntiVoid = Instance.new("Part")
AntiVoid.Name = ""
AntiVoid.Parent = workspace
AntiVoid.Size = Vector3.new(100000, 1, 100000)
AntiVoid.CFrame = CFrame.new(-240.64537, -70, 405.806458, 1, 0, 0, 0, 1, 0, 0, 0, 1)
AntiVoid.Anchored = true
AntiVoid.Transparency = 1
AntiVoid.CanCollide = false

local NoLava = Instance.new("Part")
NoLava.Name = ""
NoLava.Parent = workspace
NoLava.Size = Vector3.new(84, 1, 117)
NoLava.CFrame = CFrame.new(-240.64537, -27.9478741, 405.806458, 1, 0, 0, 0, 1, 0, 0, 0, 1)
NoLava.Anchored = true
NoLava.Transparency = 1
NoLava.CanCollide = false

local NoAcid = Instance.new("Part")
NoAcid.Name = ""
NoAcid.Parent = workspace
NoAcid.Size = Vector3.new(154, 1, 135)
NoAcid.CFrame = CFrame.new(-71.5164566, 10, -735.791626, 1, 0, 0, 0, 1, 0, 0, 0, 1)
NoAcid.Anchored = true
NoAcid.Transparency = 1
NoAcid.CanCollide = false

local Window = Fluent:CreateWindow({
    Title = "H20 // " .. identifyexecutor(),
    SubTitle = "",
    TabWidth = 120,
    Size = UDim2.fromOffset(400, 300),
    Acrylic = false,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.H
})

local Tabs = {
    main = Window:AddTab({ Title = "Slap Royale", Icon = "swords" }),
    settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
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

Tabs.main:AddParagraph({
    Title = "Important",
    Content = "Exploiting is risky alone, \nthe moderation team is strict. \nDon't get caught Cheating!"
})

Tabs.main:AddParagraph({
    Title = "Changelog //",
    Content = "[+] Added Cannon Teleport  \n[+] Added Custom UI \n[=] Item Vacumn coming soon"
})

task.spawn(function()
    while true do
    local playersinnumb = #game:GetService("Players"):GetChildren()
        PlayerText:SetTitle(playersinnumb .. "/30")
        task.wait(0.001)
    end
end)

local AntiTerrain = Tabs.main:AddToggle("ATT", 
{
    Title = "Anti Lava + Acid + Void", 
    Description = "Prevents you from dying via Acid or Lava or Void",
    Default = false,
    Callback = function(state)
	if state then
NoLava.Transparency = 0.5
NoLava.CanCollide = true
NoAcid.Transparency = 0.5
NoAcid.CanCollide = true
AntiVoid.Transparency = 0.5
AntiVoid.CanCollide = true
	else
NoLava.Transparency = 1
NoLava.CanCollide = false
NoAcid.Transparency = 1
NoAcid.CanCollide = false
AntiVoid.Transparency = 1
AntiVoid.CanCollide = false
        end
    end 
})

local Slapping = false

local Slappering = Tabs.main:AddToggle("SlapAura", {
    Title = "Slap Aura", 
    Description = "Blatant",
    Default = false,
    Callback = function(state)
        Slapping = state
        if Slapping then
	    Fluent:Notify({Title = "Interface", Content = "Slap Aura Toggled On!", SubContent = "", Duration = 3})
            task.spawn(function()
                while Slapping do
                    for _,PLAYER in pairs(game.Players:GetChildren()) do
		      if PLAYER ~= game.Players.LocalPlayer and PLAYER.Character and PLAYER.Character:FindFirstChild("Head") then -- crucial checks
                        local args = {PLAYER.Character:WaitForChild("Head")} -- basic understanding is game looks for part to hit within hitbox ( we can expand this probably but idk where )
                        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Slap"):FireServer(unpack(args))
			task.wait(0.0001)
                     end
                   end
                end
            end)
	else
            Fluent:Notify({Title = "Interface", Content = "Slap Aura Toggled Off!", SubContent = "", Duration = 3})
        end
    end
})

local HasBeenToggled = false

local SlapAuraKeybind = Tabs.main:AddKeybind("SlapauraKeybind", {
    Title = "Slap Aura Toggle",
    Description = "Closet Cheating :D",
    Mode = "Toggle",
    Default = "V",

    Callback = function(Value)
        if not HasBeenToggled then
	 HasBeenToggled = true
	  Slappering:SetValue(true)
	   else
	   HasBeenToggled = false
	   Slappering:SetValue(false)
	end
    end,

    ChangedCallback = function(New)
        Fluent:Notify({Title = "Interface", Content = "Changed Keybind", SubContent = "", Duration = 5})
    end
})

local CannonTP = Tabs.main:AddDropdown("CannonTP", {
   Title = "Cannon TP",
   Description = "Bypass TP Kick",
   Values = {"School", "Graveyard", "Market"},
   Multi = false,
   Default = nil,
})

CannonTP:OnChanged(function(Value)
    if Value == "School" then
        fireclickdetector(workspace.Map.SuspensionSchool:WaitForChild("Cannon").ClickDetector)
    elseif Value == "Graveyard Place" then
        fireclickdetector(workspace.Map.HallowHills:WaitForChild("Cannon").ClickDetector)
    elseif Value == "Market" then
        fireclickdetector(workspace.Map.MiniMarket:WaitForChild("Cannon").ClickDetector)
    end
end)


local tpwalking = false

local TPWALKSLIDER = Tabs.main:AddSlider("TPWALKSLIDER", {
    Title = "Speed",
    Description = "Bypass",
    Default = 0,
    Min = 0,
    Max = 10,
    Rounding = 1,
    Callback = function(Value)
        local chr = game.Players.LocalPlayer.Character
        local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
        tpwalking = false
        wait()
        tpwalking = true
        task.spawn(function()
            while tpwalking and chr and hum and hum.Parent do
                local delta = RunService.Heartbeat:Wait()
                if hum.MoveDirection.Magnitude > 0 then
                    local speed = Value
                    chr:TranslateBy(hum.MoveDirection * speed * delta * 5)
                end
            end
        end)
    end
})

Tabs.main:AddButton({
    Title = "Item ESP",
    Description = "",
    Callback = function()
task.spawn(function()
for _, item in pairs(workspace.Items:GetChildren()) do
local billboard = Instance.new("BillboardGui")
local label = Instance.new("TextLabel")

if not item:FindFirstChild("ItemBillboard") then
        billboard.Name = "ItemBillboard"
        billboard.Size = UDim2.new(0, 30, 0, 20)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true
        billboard.Parent = item
end

if not item:WaitForChild("ItemBillboard"):FindFirstChild("ItemLabel") then
        label.Name = "ItemLabel"
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Text = item.Name
        label.Font = Enum.Font.RobotoMono
        label.TextColor3 = Color3.new(255, 255, 255)
	    label.TextStrokeColor3 = Color3.new(0, 0, 0)
	    label.TextStrokeTransparency = 0.5
        label.TextScaled = true
        label.Parent = billboard
end
end
end)
    end
})

Tabs.main:AddButton({
    Title = "Hitbox Expander",
    Description = "Literally undetectable",
    Callback = function()
        for _, player in pairs(game.Players:GetChildren()) do
        if player ~= game.Players.LocalPlayer then
        local character = player.Character
        local hrp = character:WaitForChild("HumanoidRootPart")
        hrp.Size = Vector3.new(10, 10, 10)
        hrp.Transparency = 0.5
		hrp.CanCollide = false
    end
end
    end
})

local runHighlight = false

local EspToggle = Tabs.main:AddToggle("ESPVAL", {
    Title = "Player ESP",
    Description = "Shows all Players",
    Default = false,
    Callback = function(state)
        runHighlight = state
        if runHighlight then
            task.spawn(function()
                while runHighlight do
                    for _, plr in pairs(Players:GetPlayers()) do
                        if plr ~= Players.LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                            local char = plr.Character
                            if not char:FindFirstChild("ESPHighlight") then
                                local highlight = Instance.new("Highlight")
                                highlight.Name = "ESPHighlight"
                                highlight.FillTransparency = 0.5
                                highlight.OutlineTransparency = 1
                                highlight.OutlineColor = Color3.new(255, 255, 255)
				highlight.FillColor = Color3.new(0.874509, 0.588235, 0.588235)
                                highlight.Parent = char
                            end
                            if not char:FindFirstChild("PlayerBillboard") then
                                local billboard = Instance.new("BillboardGui")
                                billboard.Name = "PlayerBillboard"
                                billboard.Size = UDim2.new(0, 60, 0, 30)
                                billboard.StudsOffset = Vector3.new(0, 3.5, 0)
                                billboard.AlwaysOnTop = true
                                billboard.Adornee = char:FindFirstChild("HumanoidRootPart")
                                billboard.Parent = char

                                local label = Instance.new("TextLabel")
                                label.Name = "PlayerLabel"
                                label.Size = UDim2.new(1, 0, 1, 0)
                                label.BackgroundTransparency = 1
                                label.Text = plr.Name
                                label.Font = Enum.Font.RobotoMono
                                label.TextColor3 = Color3.new(1, 1, 1)
                                label.TextStrokeColor3 = Color3.new(0, 0, 0)
                                label.TextStrokeTransparency = 0.5
                                label.TextScaled = true
                                label.Parent = billboard
                            end
                        end
                    end
                    task.wait(0.7)
                end
            end)
        else
            for _, plr in pairs(Players:GetPlayers()) do
                if plr ~= Players.LocalPlayer and plr.Character then
                    local char = plr.Character
                    local highlight = char:FindFirstChild("ESPHighlight")
                    if highlight then highlight:Destroy() end

                    local billboard = char:FindFirstChild("PlayerBillboard")
                    if billboard then billboard:Destroy() end
                end
            end
        end
    end
})

Tabs.main:AddButton({
    Title = "Jump off bus",
    Description = "Very Blatant",
    Callback = function()
        game:GetService("ReplicatedStorage").Events.BusJumping:FireServer()
    end
})

Tabs.main:AddButton({
    Title = "Suicide",
    Description = "Don't use in lobby else kick",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
    end
})

Tabs.settings:AddButton({
    Title = "Unload UI",
    Description = "Unloads the UI",
    Callback = function()
        Fluent:Destroy()
    end
})

Tabs.settings:AddButton({
    Title = "IY",
    Description = "Infinie Yield",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end
})

Window:SelectTab(1)

