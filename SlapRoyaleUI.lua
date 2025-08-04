local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
Fluent:Notify({Title = "Interface", Content = "Script is beta!", SubContent = "", Duration = 5})
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

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
    Title = "Slap Royale // " .. identifyexecutor(),
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

task.spawn(function()
    while true do
    local playersinnumb = #game:GetService("Players"):GetChildren()
        PlayerText:SetTitle(playersinnumb .. "/30")
        task.wait(0.001)
    end
end)

local AntiTerrain = Tabs.main:AddToggle("ATT", 
{
    Title = "Anti Lava + Acid", 
    Description = "Prevents you from dying via Acid or Lava",
    Default = false,
    Callback = function(state)
	if state then
NoLava.Transparency = 0.5
NoLava.CanCollide = true
NoAcid.Transparency = 0.5
NoAcid.CanCollide = true
	else
NoLava.Transparency = 1
NoLava.CanCollide = false
NoAcid.Transparency = 1
NoAcid.CanCollide = false
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

local currentSpeed = 0

task.spawn(function()
	while true do
		local deltaTime = RunService.Heartbeat:Wait()

		if currentSpeed > 0 then
			local chr = game.Players.LocalPlayer.Character
			local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")

			if chr and hum and hum.MoveDirection.Magnitude > 0 then
				local moveVector = hum.MoveDirection.Unit * currentSpeed * 5 * deltaTime
				chr:TranslateBy(moveVector)
			end
		end
	end
end)

local TPWALKSLIDER = Tabs.main:AddSlider("TPWALKSLIDER", {
	Title = "Speed",
	Description = "Bypass",
	Default = 2,
	Min = 0,
	Max = 10,
	Rounding = 1,
	Callback = function(Value)
		currentSpeed = Value
	end
})

Tab:AddButton({
    Title = "ESP",
    Description = "Click a couple of times to fix issues",
    Callback = function()
task.spawn(function()
for _, item in pairs(workspace.Items:GetChildren()) do
local nce = Instance.new("Highlight")
local ncb = Instance.new("BillboardGui")
local ncl = Instance.new("TextLabel")


local esp = nce:Clone()
local billboard = ncb:Clone()
local label = ncl:Clone()


if not item:FindFirstChild("ItemESP") then
        esp.Name = "ItemESP"
        esp.FillColor = Color3.new(46, 139, 87)
        esp.FillTransparency = 0.5
        esp.OutlineColor = Color3.new(1, 1, 1)
        esp.OutlineTransparency = 0
        esp.Adornee = item
        esp.Parent = item
end

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

