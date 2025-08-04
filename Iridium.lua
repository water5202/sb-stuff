if not game:IsLoaded() then
	game.Loaded:Wait()
end

if game.PlaceId == 14422118326 then
	return loadstring(game:HttpGet("https://raw.githubusercontent.com/water5202/Iridium/refs/heads/main/NullZoneUI.lua"))()
end

if game.PlaceId == 11828384869 then
	return loadstring(game:HttpGet("https://raw.githubusercontent.com/water5202/Iridium/refs/heads/main/EludeMazeUI.lua"))()
end

if game.PlaceId == 9431156611 then
	return loadstring(game:HttpGet("https://raw.githubusercontent.com/water5202/Iridium/refs/heads/main/SlapRoyaleUI.lua"))()
end

if game.PlaceId == 18550498098 then
	return loadstring(game:HttpGet("https://raw.githubusercontent.com/water5202/Iridium/refs/heads/main/GuideUI.lua"))()
end

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Players = game:GetService("Players")
local BRICKLABEL
local UIS = game:GetService("UserInputService")
local VirtualInput = game:GetService("VirtualUser")
local HRP
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local localplayer = Players.LocalPlayer
local GeneralHit = ReplicatedStorage:WaitForChild("GeneralHit") -- Dual's Double hit Event
local Ping
local time
local TARGETSLAPPLAYER = nil
local idledConnection
local Brickconnection = nil
local RunService = game:GetService("RunService")
local ArenaPart = workspace.Lobby.Teleport1
local GOTOPLAYER = nil
local brickvar
local GS
local Duplicate = ReplicatedStorage:WaitForChild("Duplicate") -- Replica's Duplicate Event

local F = workspace.Lobby:WaitForChild("GloveStands")

for _, obj in ipairs(F:GetChildren()) do
    if string.find(obj.Name:lower(), "Unknown") then
        obj:Destroy()
    end
end

-- 1
function SpawnReplica()
Duplicate:FireServer()
end
-- 2
function AutoBrick()
BRICKLABEL = game:GetService("Players").LocalPlayer.PlayerGui.BRICKCOUNT.ImageLabel.TextLabel
game:GetService("ReplicatedStorage").lbrick:FireServer()
brickvar = tonumber(BRICKLABEL.Text) or 0
brickvar = brickvar + 1
BRICKLABEL.Text = tostring(brickvar)
end
--
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

Fluent:Notify({Title = "Interface", Content = "Bypassed AntiCheat!", SubContent = "via hookmetamethod", Duration = 5})

if game.Workspace:FindFirstChild("SafeSpotPart") then 
    game.Workspace.SafeSpotPart:Destroy() 
end

local Platform = Instance.new("Part")
Platform.Name = "SafeSpotPart"
Platform.Parent = workspace
Platform.CFrame = CFrame.new(-108000.6895, -122.158432, -2900.86475, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Platform.Size = Vector3.new(84, 5, 82)
Platform.Transparency = 0.5
Platform.Anchored = true

local Window = Fluent:CreateWindow({
    Title = "Iridium // " .. identifyexecutor(),
    SubTitle = "",
    TabWidth = 120,
    Size = UDim2.fromOffset(400, 300),
    Acrylic = false,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.H
})

local Tabs = {
    AutoFarming = Window:AddTab({ Title = "Auto Farming", Icon = "hammer" }),
    SlapFarm = Window:AddTab({ Title = "Slap Farming", Icon = "hammer" }),
    Badges = Window:AddTab({ Title = "Badges", Icon = "box" }),
    Info = Window:AddTab({ Title = "Info", Icon = "info" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local SlapsText = Tabs.Info:AddParagraph({
        Title = "Slaps // ?",
        Content = "Shows Slaps"
})

task.spawn(function()
while true do
SlapsText:SetTitle("Slaps // " .. game.Players.LocalPlayer.leaderstats.Slaps.Value)
task.wait(0.001)
    end
end)

local PlayerText = Tabs.Info:AddParagraph({
        Title = "0/16",
        Content = "Players"
})

task.spawn(function()
    while true do
    local playersinnumb = #Players:GetChildren()
        PlayerText:SetTitle(playersinnumb .. "/16")
        task.wait(0.001)
    end
end)

local PingText = Tabs.Info:AddParagraph({
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

local CODETEXT = Tabs.Info:AddParagraph({
        Title = "",
        Content = "Elude keypad code"
})

task.spawn(function()
while true do
CODETEXT:SetTitle("Keypad Code // "..tostring((#game.Players:GetPlayers()) * 25 + 1100 - 7))
task.wait(0.001)
    end
end)

local KeypadText = Tabs.Info:AddParagraph({
        Title = "Keypad Spawned // No",
        Content = "Elude Keypad"
})

task.spawn(function()
while true do
if game.Workspace:FindFirstChild("Keypad") then
KeypadText:SetTitle("Keypad Spawn // Yes")
else
KeypadText:SetTitle("Keypad Spawn // No")
end
task.wait(0.001)
    end
end)

local SiphonText = Tabs.Info:AddParagraph({
        Title = "Siphon Orb // No",
        Content = "Checks for Siphon orb"
})

task.spawn(function()
while true do
if game.Workspace:FindFirstChild("SiphonOrb") then
SiphonText:SetTitle("Siphon Orb // Yes")
			else
SiphonText:SetTitle("Siphon Orb // No")
end
task.wait(0.001)
    end
end)

local ToolBoxText = Tabs.Info:AddParagraph({
        Title = "Toolbox // No",
        Content = "Checks for Toolbox"
})

task.spawn(function()
while true do
if game.Workspace:FindFirstChild("Toolbox") then
ToolBoxText:SetTitle("Toolbox // Yes")
			else
ToolBoxText:SetTitle("Toolbox // No")
end
task.wait(0.001)
    end
end)

local JetOrbBox = Tabs.Info:AddParagraph({
        Title = "JetOrb // No",
        Content = "Checks for JetOrb"
})

task.spawn(function()
while true do
if game.Workspace:FindFirstChild("JetOrb") then
JetOrbBox:SetTitle("JetOrb // Yes")
			else
JetOrbBox:SetTitle("JetOrb // No")
end
task.wait(0.001)
    end
end)

local PhaseOrbBox = Tabs.Info:AddParagraph({
        Title = "PhaseOrb // No",
        Content = "Checks for PhaseOrb"
})

task.spawn(function()
while true do
if game.Workspace:FindFirstChild("PhaseOrb") then
PhaseOrbBox:SetTitle("PhaseOrb // Yes")
			else
PhaseOrbBox:SetTitle("PhaseOrb // No")
end
task.wait(0.001)
    end
end)

local TimeBar = Tabs.Info:AddParagraph({
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

Tabs.Badges:AddButton({
    Title = "Get Plunger",
    Description = "Gets Plunger automatically",
    Callback = function()
local teleportFunc = queueonteleport or queue_on_teleport
    if teleportFunc then
        teleportFunc([[
if not game:IsLoaded() then
    game.Loaded:Wait()
end
fireclickdetector(workspace["plunger glove"].ClickDetector)
]])
end
fireclickdetector(workspace.BountyHunterRoom.PlungerMain.ClickDetector)
task.wait(0.5)
fireclickdetector(workspace.plungers.ToiletPlunger.ClickDetector)
    end
})

Tabs.Badges:AddButton({
    Title = "Get Iceskate",
    Description = "so free lmao",
    Callback = function()
         game:GetService("ReplicatedStorage").IceSkate:FireServer("Freeze")
    end
})

Tabs.Badges:AddButton({
    Title = "Get Lamp",
    Description = "so free lmao",
    Callback = function()
	local startTime = tick()
         while tick() - startTime < 3 do
	   game:GetService("ReplicatedStorage").nightmare:FireServer("LightBroken")
        task.wait()
      end
    end
})

Tabs.Badges:AddButton({
    Title = "Get Boxing Glove",
    Description = "Gets Boxing Glove automatically",
    Callback = function()
local teleportFunc = queueonteleport or queue_on_teleport
    if teleportFunc then
        teleportFunc([[
if not game:IsLoaded() then
    game.Loaded:Wait()
end
					
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4183.43701, 3518.25, 194.199707, -1, 0, 0, 0, 1, 0, 0, 0, -1)
task.wait(3)
fireclickdetector(workspace.BoxingGloves.ClickDetector)
task.wait(1)
game:GetService("TeleportService"):Teleport(6403373529)
]])
end
game:GetService("TeleportService"):Teleport(7234087065)
    end
})

Tabs.Badges:AddButton({
    Title = "Get Plank",
    Description = "",
    Callback = function()
localplayer.Character.Humanoid.Health = 0
if game.Players.LocalPlayer.leaderstats.Slaps.Value < 1499 then
Fluent:Notify({Title = "Interface", Content = "Not Enough Slaps", SubContent = "", Duration = 5})
end
task.wait(5)
fireclickdetector(workspace.Lobby.Fort.ClickDetector)
task.wait(1)
HRP = localplayer.Character.HumanoidRootPart
firetouchinterest(HRP, ArenaPart, 0)
task.wait(0.5)
firetouchinterest(HRP, ArenaPart, 1)
HRP.CFrame = CFrame.new(-15.8425188, 71.5247803, -0.351269305)
task.wait(0.1)
HRP.Anchored = true
task.wait(0.1)
game:GetService("ReplicatedStorage"):WaitForChild("Fortlol"):FireServer()
task.wait(0.1)
HRP.Anchored = false
HRP.CFrame = CFrame.new(-16.0255108, 82.0030289, -10.3625078)
task.wait(6.5)
game:GetService("ReplicatedStorage"):WaitForChild("Fortlol"):FireServer()
task.wait(1)
HRP.CFrame = CFrame.new(-16.3017368, 93.5031891, -20.5325336)
task.wait(0.5)
localplayer.Character.Humanoid.Health = 0
    end
})

Tabs.Badges:AddButton({
    Title = "All 3 Misc Badges",
    Description = "Duck Orange and Knife",
    Callback = function()
         fireclickdetector(workspace.Lobby.Scene.knofe.ClickDetector)
	 fireclickdetector(workspace.Arena.island5.Orange.ClickDetector)
	 fireclickdetector(workspace.Lobby.Scene.knofe.ClickDetector)
    end
})

Tabs.Badges:AddButton({
    Title = "Get [REDACTED]",
    Description = "Must Have 5000 Slaps",
    Callback = function()
if localplayer.Character:FindFirstChild("entered") and game:GetService("Players").LocalPlayer.leaderstats.Slaps.Value >= 5000 then
	firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.PocketDimension.Doors["9"], 0)
	task.wait(0.1)
	firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.PocketDimension.Doors["9"], 1)
			else
	Fluent:Notify({Title = "Interface", Content = "Not Enough Slaps", SubContent = "", Duration = 5})
			end
    end
})

Tabs.Badges:AddButton({
    Title = "Get Siphon",
    Description = "Must be spawned in",
    Callback = function()
if workspace:FindFirstChild("SiphonOrb") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace:WaitForChild("SiphonOrb").CFrame
firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace:FindFirstChild("SiphonOrb"), 0)
task.wait(0.1)
firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace:FindFirstChild("SiphonOrb"), 1)
else
Fluent:Notify({Title = "Interface", Content = "Could not find workspace.SiphonOrb", SubContent = "", Duration = 3})
	end
    end
})

Tabs.Badges:AddButton({
    Title = "Get Glovel",
    Description = "Make sure you have Hitman Quest",
    Callback = function()
if not workspace.Arena.CannonIsland.TreasureSpots:FindFIrstChild("_treasureSpot1") then
Fluent:Notify({Title = "Interface", Content = "You don't have {Hunt for the Hunter}", SubContent = "", Duration = 3})
end
localplayer.Character.Humanoid.Health = 0
task.wait(5)
fireclickdetector(workspace.Lobby.Extended.ClickDetector)
task.wait(1)
HRP = localplayer.Character.HumanoidRootPart
firetouchinterest(HRP, ArenaPart, 0)
task.wait(0.5)
firetouchinterest(HRP, ArenaPart, 1)
task.wait(0.5)
HRP.CFrame = CFrame.new(220.62793, 26.9119072, 189.395142)
task.wait(0.5)
fireproximityprompt(workspace.Arena.CannonIsland.GlovelHoleInTheWall.ProximityPrompt)
task.wait(5)
HRP.CFrame = workspace.Arena.CannonIsland.TreasureSpots._treasureSpot1.CFrame
-- loop
local startTime = tick()
         while tick() - startTime < 3 do
	   local args = {{index = 2, cf = CFrame.new(80.14021301269531, -6.172861576080322, -47.72377014160156, 1, 3.632716172319306e-08, 0.000003070895445489441, -3.632721146118456e-08, 1, 1.6263223656665104e-08, -0.000003070895445489441, -1.6263333790789147e-08, 1)}}
           game:GetService("ReplicatedStorage"):WaitForChild("DigEvent"):FireServer(unpack(args))
        task.wait()
end
--
fireproximityprompt(workspace.TreasureChestFolder:FindFirstChild("TreasureChest").TreasureChest.ProximityPrompt)
task.wait(0.5)
localplayer.Character.Humanoid.Health = 0
    end
})

Tabs.SlapFarm:AddButton({
    Title = "Equip Dual",
    Description = "",
    Callback = function()
fireclickdetector(workspace.Lobby.Dual.ClickDetector)
    end
})

Tabs.SlapFarm:AddButton({
    Title = "Teleport to SafeSpot",
    Description = "",
    Callback = function()
HRP = localplayer.Character.HumanoidRootPart
firetouchinterest(HRP,  ArenaPart, 0)
task.wait(0.1)
firetouchinterest(HRP, ArenaPart, 1)
task.wait(0.5)
localplayer.Character.HumanoidRootPart.CFrame = CFrame.new(-108000.6895, -119.158432, -2900.86475, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    end
})

local teleporting = false

local GOTOPLAYERTELEPORTER = Tabs.SlapFarm:AddToggle("SexyCoolSlapTeleportToggle", {
    Title = "Teleport to Player", 
    Description = "For Alt Account",
    Default = false,
    Callback = function(state)
        teleporting = state
        if teleporting then
            task.spawn(function()
                while teleporting do
                    if GOTOPLAYER and GOTOPLAYER.Character and GOTOPLAYER.Character:FindFirstChild("HumanoidRootPart") then
                        if localplayer.Character and localplayer.Character:FindFirstChild("HumanoidRootPart") then
                            localplayer.Character.HumanoidRootPart.CFrame = GOTOPLAYER.Character.HumanoidRootPart.CFrame
                        end
                    end
                    task.wait(0.001)
                end
            end)
        end
    end
})

local ChangeGOTOPLAYER = Tabs.SlapFarm:AddInput("SexyInputBox", {
    Title = "",
    Description = "TP",
    Default = nil,
    Placeholder = "//",
    Numeric = false, 
    Finished = false,
    Callback = function(input)
        GOTOPLAYER = game.Players:FindFirstChild(input)
    end
})

local SlapAuraRunning = false

local AutoSlapToggle = Tabs.SlapFarm:AddToggle("SexySlapAura", {
    Title = "Slap Aura",
    Description = "Slaps the player to farm on",
    Default = false,
    Callback = function(state)
        SlapAuraRunning = state
        if SlapAuraRunning then
            task.spawn(function()
                while SlapAuraRunning do
                    if TARGETSLAPPLAYER and TARGETSLAPPLAYER.Character and TARGETSLAPPLAYER.Character:FindFirstChild("HumanoidRootPart") then
                        game:GetService("ReplicatedStorage"):WaitForChild("GeneralHit"):FireServer(TARGETSLAPPLAYER.Character.HumanoidRootPart)
                    end
                    task.wait(0.84)
                end
            end)
        end
    end
})

local ChangeTARGETSLAPPLAYER = Tabs.SlapFarm:AddInput("SexyInputBox2", {
    Title = "",
    Description = "Slap Aura",
    Default = nil,
    Placeholder = "//",
    Numeric = false, 
    Finished = false,
    Callback = function(input)
        TARGETSLAPPLAYER = game.Players:FindFirstChild(input)
    end
})

Tabs.Badges:AddButton({
    Title = "Elude Maze Teleport",
    Description = "Goto Elude Maze",
    Callback = function()
local teleportFunc = queueonteleport or queue_on_teleport
    if teleportFunc then
        teleportFunc([[
loadstring(game:HttpGet("https://raw.githubusercontent.com/water5202/Iridium/refs/heads/main/KSUI.lua"))()
]])
end
game:GetService("TeleportService"):Teleport(11828384869)
    end
})

Tabs.AutoFarming:AddButton({
    Title = "Equip ZZZZZZZ",
    Description = "",
    Callback = function()
         fireclickdetector(workspace.Lobby.ZZZZZZZ.ClickDetector) 
    end
})

Tabs.Badges:AddButton({
    Title = "Get Frostbite",
    Description = "Gets Frostbite automatically",
    Callback = function()
local teleportFunc = queueonteleport or queue_on_teleport
    if teleportFunc then
        teleportFunc([[
            if not game:IsLoaded() then
                game.Loaded:Wait()
            end
            repeat wait() until game.Players.LocalPlayer
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-554, 177, 56)
wait(0.7)
for i,v in ipairs(game:GetService("Workspace"):GetDescendants()) do
            if v.ClassName == "ProximityPrompt" then
                fireproximityprompt(v)
            end
        end
]])
end
game:GetService("TeleportService"):Teleport(17290438723)
    end
})

Tabs.AutoFarming:AddButton({
    Title = "Equip Brick",
    Description = "",
    Callback = function()
         fireclickdetector(workspace.Lobby.Brick.ClickDetector)
    end
})

local brickfarming = false

local brickfarmer = Tabs.AutoFarming:AddToggle("TheCoolestBrickToggle", {
    Title = "Auto BrickMaster",
    Description = "",
    Default = false,
    Callback = function(state)
        brickfarming = state
        if brickfarming and localplayer.Character:FindFirstChild("entered") then
            task.spawn(function()
                while brickfarming do
AutoBrick()
task.wait(1.3)
                end
            end)
        end
    end
})

Tabs.AutoFarming:AddButton({
    Title = "Equip Replica",
    Description = "",
    Callback = function()
         fireclickdetector(workspace.Lobby.Replica.ClickDetector) 
    end
})

local bobfarming = false

local bobfarmtoggle = Tabs.AutoFarming:AddToggle("SexySpawnReplica", {
    Title = "Auto Replica",
    Description = "Don't press E",
    Default = false,
    Callback = function(state)
        bobfarming = state
        if bobfarming and localplayer.Character:FindFirstChild("entered") then
	task.wait(0.5)
            task.spawn(function()
                while bobfarming do
		SpawnReplica()
		task.wait(5.5)
                end
            end)
        end
    end
})

local toolboxfarming = false

local toolboxtoggle = Tabs.AutoFarming:AddToggle("SexyGetToolBox", {
    Title = "Auto Toolbox" ,
    Description = "",
    Default = false,
    Callback = function(state)
       toolboxfarming = state
        if toolboxfarming and localplayer.Character:FindFirstChild("entered") then
	task.wait(0.5)
            task.spawn(function()
                while toolboxfarming do
		if game.Workspace:FindFirstChild("Toolbox") then
			fireclickdetector(game.Workspace:FindFirstChild("Toolbox").ClickDetector)
                end
		task.wait(5.5)
                end
            end)
        end
    end
})

Tabs.AutoFarming:AddButton({
    Title = "Goto Safespot",
    Description = "",
    Callback = function()
       HRP = localplayer.Character.HumanoidRootPart
                            firetouchinterest(HRP,  ArenaPart, 0)
                            task.wait(0.1)
                            firetouchinterest(HRP, ArenaPart, 1)
			    task.wait(0.3)
                 localplayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-108000.6895, -119.158432, -2900.86475, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    end
})

Tabs.Settings:AddButton({
        Title = "Reset",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Confirm Reset?",
                Content = "",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.Players.LocalPlayer.Character.Humanoid.Health = 0
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                        end
                    }
                }
            })
        end
})

Tabs.Settings:AddButton({
        Title = "Kick",
        Description = "",
        Callback = function()
            Window:Dialog({
                Title = "Confirm Kick?",
                Content = "",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.Players.LocalPlayer:Kick("Kicked // " .. localplayer.Name .. "!")
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                        end
                    }
                }
            })
        end
})

Tabs.SlapFarm:AddButton({
    Title = "Anchor yourself",
    Description = "Anchors your HumanoidRootPart",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = not game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored
    end
})

local slapplefarming = false

local slapplefarmtoggle = Tabs.AutoFarming:AddToggle("SexySlappleTouch", {
    Title = "Auto Slapples",
    Description = "Lags a little?",
    Default = false,
    Callback = function(state)
        slapplefarming = state
        if slapplefarming and localplayer.Character:FindFirstChild("entered") then
	task.wait(0.5)
            task.spawn(function()
                while slapplefarming do
HRP = game.Players.LocalPlayer.Character.HumanoidRootPart
for _,Slapples in pairs(workspace.Arena.island5.Slapples:GetChildren()) do
firetouchinterest(HRP, Slapples.Glove, 0)
task.wait(0.5)
firetouchinterest(HRP, Slapples.Glove, 1)
end
		task.wait(1)
                end
            end)
        end
    end
})

local platefarming = false

local platefarmer = Tabs.AutoFarming:AddToggle("TheCoolestPlateToggle", {
    Title = "Auto Plate",
    Description = "Tycoon Glove",
    Default = false,
    Callback = function(state)
        platefarming = state
        if platefarming and localplayer.Character:FindFirstChild("entered") then
	task.wait(0.5)
            task.spawn(function()
                while platefarming do
HRP = game.Players.LocalPlayer.Character.HumanoidRootPart
HRP.CFrame = workspace.Arena.Plate.CFrame
task.wait(0.001)
                end
            end)
        end
    end
})

Tabs.AutoFarming:AddButton({
    Title = "AntiAfk",
    Description = "Prevents Kick",
    Callback = function()
local conn = Players.LocalPlayer.Idled:Connect(function()
end)
conn:Disconnect()	
    end
})

Tabs.Settings:AddButton({
    Title = "Infinite Yield",
    Description = "Loads Infinite Yield",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/edgeiy/infiniteyield/master/source"))()
    end
})

Tabs.Settings:AddButton({
    Title = "Console Logger",
    Description = "Loads My Console Logger",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/water5202/Water-s-Custom-Console/refs/heads/main/Loader.lua"))()
    end
})

Tabs.Settings:AddButton({
    Title = "FLY GUI V3",
    Description = "Loads the Classic Mobile fly",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/refs/heads/main/FlyGuiV3.txt"))()
    end
})

Tabs.AutoFarming:AddButton({
    Title = "Anchor yourself",
    Description = "Anchors your HumanoidRootPart",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = not game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored
    end
})

Tabs.Settings:AddButton({
    Title = "Unload UI",
    Description = "Unloads UI",
    Callback = function()
                game.Workspace:WaitForChild("SafeSpotPart"):Destroy()
                Fluent:Destroy()
    end
})

Window:SelectTab(1)










