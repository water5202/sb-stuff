local TextChatService = game:GetService("TextChatService")
local AntiVoid = Instance.new("Part")
AntiVoid.Parent = workspace
AntiVoid.Name = "HF9GkAo"
AntiVoid.Transparency = 1
AntiVoid.CFrame = CFrame.new(-14.4505253, -50.17285061, -2.79294515, 0.176757276, 5.15035872e-08, 0.984254479, 1.00011178e-07, 1, -7.02880101e-08, -0.984254479, 1.1086037e-07, 0.176757276)
AntiVoid.Size = Vector3.new(99999999, 1, 9999999999)
AntiVoid.Anchored = true

local function qXvP(pG)
    local a1 = Instance.new("ScreenGui")
    a1.ResetOnSpawn = false
    a1.Parent = pG

    local b2 = Instance.new("Frame")
    b2.Size = UDim2.new(1, 0, 0, 200)
    b2.Position = UDim2.new(0, 0, 1, -200)
    b2.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
    b2.BackgroundTransparency = 0.4
    b2.BorderSizePixel = 0
    b2.Parent = a1

    local c3 = {}

    local function d4()
        local e5 = Instance.new("Frame")
        e5.Size = UDim2.new(0, 30, 0, 30)
        e5.Position = UDim2.new(math.random(), 0, 0.5, 0)
        e5.AnchorPoint = Vector2.new(0.5, 0.5)
        e5.BackgroundColor3 = Color3.fromRGB(150, 200, 255)
        e5.BackgroundTransparency = 0.2
        e5.BorderSizePixel = 0
        e5.Parent = b2
        table.insert(c3, e5)
    end

    spawn(function()
        while true do
            d4()
            wait(0.1 + math.random() * 0.2)
        end
    end)

    spawn(function()
        while true do
            for i = #c3, 1, -1 do
                local f6 = c3[i]
                f6.Position = f6.Position + UDim2.new(0, 0, -0.008, 0)
                f6.BackgroundTransparency = f6.BackgroundTransparency + 0.008
                f6.Size = f6.Size + UDim2.new(0, 0.5, 0, 0.5)
                if f6.BackgroundTransparency >= 1 then
                    f6:Destroy()
                    table.remove(c3, i)
                end
            end
            wait(0.03)
        end
    end)
end

qXvP(game.Players.LocalPlayer:WaitForChild("PlayerGui"))

local a1X2Z = Instance.new("ScreenGui")
a1X2Z.Name = "UBox_"..tostring(math.random(1000,9999))
a1X2Z.Parent = game.CoreGui

local b9Y7Q = Instance.new("Frame")
b9Y7Q.Parent = a1X2Z
b9Y7Q.Size = UDim2.new(0, 220, 0, 150)
b9Y7Q.Position = UDim2.new(1, -230, 0.5, -70)
b9Y7Q.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
b9Y7Q.BorderColor3 = Color3.fromRGB(255, 255, 255)
b9Y7Q.BorderSizePixel = 2

local function c8V6M(x7P0S, o3H2K)
    local d4R9L = Instance.new("TextLabel")
    d4R9L.Parent = b9Y7Q
    d4R9L.Size = UDim2.new(1, -10, 0, 20)
    d4R9L.Position = UDim2.new(0, 5, 0, 5 + (o3H2K * 20))
    d4R9L.BackgroundTransparency = 1
    d4R9L.TextColor3 = Color3.fromRGB(255, 255, 255)
    d4R9L.TextXAlignment = Enum.TextXAlignment.Left
    d4R9L.Font = Enum.Font.Arcade
    d4R9L.TextSize = 14
    d4R9L.Text = x7P0S
end

c8V6M("* Keybinds ", 0)
c8V6M("[V] - Bone Swing", 1)
c8V6M("[F] - Bone Zone", 2)
c8V6M("[G] - Toggle Music", 3)
c8V6M("[R/T] - TimeSwap/Teleport", 4)
c8V6M("[M1] - Gaster Blaster", 5)
c8V6M("[L] - Reanimate", 6)

spawn(function()
    while true do
for _, child in ipairs(game.Players.LocalPlayer:WaitForChild("PlayerGui"):GetChildren()) do 
if child.Name == "Component" then 
    child:Destroy() 
end 
end
task.wait()
    end
end)

function LabelLoad()
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

local label = Instance.new("TextLabel")
label.Name = "BomblordLabel"
label.Parent = gui
label.Size = UDim2.new(0, 200, 0, 50)
label.AnchorPoint = Vector2.new(1, 1)
label.Position = UDim2.new(1, -60, 1, -60)
label.Text = "bomblord"
label.Font = Enum.Font.Arcade
label.TextSize = 50
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.BackgroundTransparency = 1

local runService = game:GetService("RunService")
local time = 0

runService.RenderStepped:Connect(function(dt)
	time += dt
	local angle = math.sin(time * 2) * 10
	local floatY = math.sin(time * 2) * 5
	label.Rotation = angle
	label.Position = UDim2.new(1, -60, 1, -60 + floatY)
end)
end

LabelLoad()

function UndertaleTextbox(message, typingSpeed, holdTime)
    typingSpeed = typingSpeed or 0.03
    holdTime = holdTime or 2
    
    local player = game.Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")
    
    local screenGui = Instance.new("ScreenGui")
    screenGui.ResetOnSpawn = false
    screenGui.Parent = playerGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.6, 0, 0.25, 0)
    frame.Position = UDim2.new(0.2, 0, 0.7, 0)
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    frame.BorderSizePixel = 12
    frame.BorderColor3 = Color3.fromRGB(255, 255, 255)
    frame.Parent = screenGui

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, -30, 1, -30)
    textLabel.Position = UDim2.new(0, 30, 0, 15)
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.Font = Enum.Font.Arcade
    textLabel.TextSize = 50
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.TextYAlignment = Enum.TextYAlignment.Top
    textLabel.TextWrapped = true
    textLabel.Text = ""
    textLabel.Parent = frame

    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://5416666166"
    sound.Volume = 0.4
    sound.Parent = screenGui
    
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://5416666166"
    sound.Volume = 0.4
    sound.Parent = screenGui

    local UserInputService = game:GetService("UserInputService")
    local skip = false
    local connection
    connection = UserInputService.InputBegan:Connect(function(input, gp)
        if not gp and (input.KeyCode == Enum.KeyCode.Z or input.KeyCode == Enum.KeyCode.Return) then
            skip = true
        end
    end)

    for i = 1, #message do
        if skip then
            textLabel.Text = message
            break
        end
        textLabel.Text = string.sub(message, 1, i)
        if message:sub(i, i) ~= " " then
            sound:Play()
        end
        task.wait(typingSpeed)
    end

    local start = tick()
    while tick() - start < holdTime do
        if skip then break end
        task.wait()
    end

    connection:Disconnect()
    screenGui:Destroy()
end

UndertaleTextbox("* Loading Please Wait", 0.01, 0.5)

if game:GetService("SoundService"):FindFirstChild("ForceWoosh") then
game:GetService("SoundService"):WaitForChild("ForceWoosh").Volume = 2
end

local SoundZone2 = Instance.new("Sound")
SoundZone2.Name = "TimeSwap"
SoundZone2.SoundId = "rbxassetid://5124453445"
SoundZone2.Volume = 1
SoundZone2.Looped = false
SoundZone2.Parent = workspace

local sound2 = Instance.new("Sound")
sound2.Name = ""
sound2.SoundId = "rbxassetid://345052019"
sound2.Volume = 0.4
sound2.Parent = workspace

local SoundZone = Instance.new("Sound")
SoundZone.Name = "SoundZone"
SoundZone.SoundId = "rbxassetid://9070607596"
SoundZone.Volume = 1
SoundZone.Looped = false
SoundZone.Parent = workspace

local ForceWoosh = Instance.new("Sound")
ForceWoosh.Name = "ForceWoosh1"
ForceWoosh.SoundId = "rbxassetid://858508159"
ForceWoosh.Volume = 2
ForceWoosh.Parent = workspace

local hook;
hook = hookmetamethod(game, "__namecall", function(method, ...)
if getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.GRAB then
    return
elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.WalkSpeedChanged then
    return
elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.Ban then
    return
end
    return hook(method, ...)
end)

game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Dave"):FireServer("init")
task.wait(0.5)
if game.PlaceId ~= 11520107397 then
local folder = game:GetService("ReplicatedStorage"):WaitForChild("_NETWORK")
for _, child in ipairs(folder:GetChildren()) do
    if (string.find(child.Name, "{") or string.find(child.Name, "}")) and child:IsA("RemoteEvent") then
        child:FireServer("Detonator")
    end
end
else
end
--
local Anim1 = game:GetService("ReplicatedStorage").TheForceAnim:Clone()
local Anim = game.Players.LocalPlayer.Character.Animate:Clone()
local Anim3 = game:GetService("ReplicatedStorage").Assets.Sun.SunDown:Clone()
game.Players.LocalPlayer.Character.Humanoid.Health = 0
task.wait(6)
game.Players.LocalPlayer.Character.Animate:Destroy()
task.wait(0.5)
Anim.Parent = game.Players.LocalPlayer.Character
-- ^setup
-- scripts
local HL = Instance.new("Highlight")
HL.Parent = game.Players.LocalPlayer.Character

task.spawn(function()
    local hue = 0
    while HL.Parent do
        hue = (hue + 0.005) % 1
        local color = Color3.fromHSV(hue, 1, 1) 
        HL.FillColor = color
        HL.OutlineColor = color
        task.wait(0.03)
    end
end)

if game.PlaceId ~= 11520107397 then
local cooldown1 = false

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
if input.UserInputType == Enum.UserInputType.MouseButton1 and not gameProcessedEvent and not cooldown1 then

cooldown1 = true
local Load = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim1)
for _,PLR in pairs(game.Players:GetChildren()) do
if PLR.Character and PLR ~= game.Players.LocalPlayer and PLR.Character:FindFirstChild("HumanoidRootPart") then
game:GetService("ReplicatedStorage"):WaitForChild("DetonatorHit"):FireServer(PLR.Character:WaitForChild("HumanoidRootPart"))
game:GetService("ReplicatedStorage"):WaitForChild("Fart"):FireServer()
sound2:Play()
end
end
Load:Play()
task.delay(0.9, function()
cooldown1 = false
end)
end
end)
else

local cooldown1 = false

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
if input.UserInputType == Enum.UserInputType.MouseButton1 and not gameProcessedEvent and not cooldown1 then

cooldown1 = true
local Load = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim1)
for _,PLR in pairs(game.Players:GetChildren()) do
if PLR.Character and PLR ~= game.Players.LocalPlayer and PLR.Character:FindFirstChild("HumanoidRootPart") then
game:GetService("ReplicatedStorage"):WaitForChild("KSHit"):FireServer(PLR.Character:WaitForChild("HumanoidRootPart"))
sound2:Play()
end
end
Load:Play()
task.delay(0.9, function()
cooldown1 = false
end)
end
end)
end

local cooldown = false

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
	if input.KeyCode == Enum.KeyCode.V and not gameProcessedEvent then
		if not cooldown then

			cooldown = true
			local Load = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim3)
			Load:Play()
            SoundZone:Play()
			task.wait(0.65)
			game:GetService("ReplicatedStorage"):WaitForChild("RetroAbility"):FireServer("Ban Hammer")
			task.delay(7, function()
				cooldown = false
			end)
		end
	end
end)

local cooldown4 = false

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
	if input.KeyCode == Enum.KeyCode.F and not gameProcessedEvent then
		if not cooldown4 then
			cooldown4 = true
            game:GetService("ReplicatedStorage"):WaitForChild("AdminAbility"):FireServer("Anvil")
            SoundZone:Play()
			task.wait(0.65)
			task.delay(8, function()
				cooldown4 = false
			end)
		end
	end
end)

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
if input.KeyCode == Enum.KeyCode.T and not gameProcessedEvent then
local mouse = game.Players.LocalPlayer:GetMouse()
local pos = mouse.Hit+Vector3.new(0,2.5,0)
pos = CFrame.new(pos.X,pos.Y,pos.Z)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end
end)

local cooldown3 = false

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
    if input.KeyCode == Enum.KeyCode.R and not gameProcessedEvent and not cooldown3 then

        cooldown3 = true
        local player = game.Players.LocalPlayer
        local char = player.Character or player.CharacterAdded:Wait()
        local humanoid = char:WaitForChild("Humanoid")
        if humanoid.Health <= 0 then return end
        local hrp = char:WaitForChild("HumanoidRootPart")

        local startTime = tick()
        local tpDuration = 2
        local tpInterval = 0.3

        task.spawn(function()
            while tick() - startTime < tpDuration do
                local offsetX = math.random(-20, 20)
                local offsetZ = math.random(-20, 20)
                local newcf = hrp.CFrame + Vector3.new(offsetX, 0, offsetZ)

                hrp.CFrame = newcf
                SoundZone2:Play()

                task.wait(tpInterval)
            end
        end)
            task.delay(10, function()
            cooldown3 = false
            end)
    end
end)

local IsLobby = false

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
if input.KeyCode == Enum.KeyCode.RightBracket and not gameProcessedEvent then
if IsLobby then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-0.125245094, -5.17285204, 4.58330011, 0.99998641, 7.98563704e-09, 0.00520901475, -7.48767714e-09, 1, -9.56154125e-08, -0.00520901475, 9.55751105e-08, 0.99998641)
IsLobby = false
else
IsLobby = true
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-988.767273, 327.042114, -2.2001543, -0.0105004609, 1.5619003e-08, -0.999944866, 7.78406459e-08, 1, 1.48024561e-08, 0.999944866, -7.7680923e-08, -0.0105004609)
end
end
end)

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
if input.KeyCode == Enum.KeyCode.L and not gameProcessedEvent then
game.Players.LocalPlayer.Character.Animate:Destroy()
    Anim.Parent = game.Players.LocalPlayer.Character
    local HL = Instance.new("Highlight")
    HL.Parent = game.Players.LocalPlayer.Character

    task.spawn(function()
        local hue = 0
        while HL.Parent do
            hue = (hue + 0.005) % 1
            local color = Color3.fromHSV(hue, 1, 1) 
            HL.FillColor = color
            HL.OutlineColor = color
            task.wait(0.03)
        end
    end)
end
end)

spawn(function()
while true do
game.Players.LocalPlayer.leaderstats.Glove.Value = "bomblord"
task.wait()
end
end)

spawn(function()
while true do
if workspace:FindFirstChild("debrisPart") then
workspace:WaitForChild("debrisPart"):Destroy()
end
if workspace:FindFirstChild("Anvil") then
workspace:WaitForChild("Anvil"):Destroy()
end
task.wait()
end
end)

workspace.DEATHBARRIER:Destroy()
workspace.DEATHBARRIER2:Destroy()

writefile("maintheme.mp3", game:HttpGet("https://raw.githubusercontent.com/water5202/sb-stuff/main/src/CustomSongAsset.mp3"))

local sound = Instance.new("Sound")
sound.Name = "J9F0gAk"
sound.SoundId = getcustomasset("maintheme.mp3")
sound.Parent = workspace
sound.Volume = 0.5
sound.Looped = true
task.wait(0.5)

writefile("maintheme2.mp3", game:HttpGet("https://raw.githubusercontent.com/water5202/sb-stuff/main/src/PreMain.mp3"))

local sound2 = Instance.new("Sound")
sound2.Name = "J9F0gAk2"
sound2.SoundId = getcustomasset("maintheme2.mp3")
sound2.Parent = workspace
sound2.Volume = 0.5
sound2.Looped = true
task.wait(0.5)

local IsOn = true
local Time = 0

game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-0.125245094, -5.17285204, 4.58330011, 0.99998641, 7.98563704e-09, 0.00520901475, -7.48767714e-09, 1, -9.56154125e-08, -0.00520901475, 9.55751105e-08, 0.99998641)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
sound2:Play()
TextChatService.TextChannels.RBXGeneral:SendAsync("haha nice one")
UndertaleTextbox("* haha nice one", 0.02, 2)
TextChatService.TextChannels.RBXGeneral:SendAsync("banning me for ******* inappropriate messages")
UndertaleTextbox("* banning me for fucking inappropriate messages", 0.03, 2)
TextChatService.TextChannels.RBXGeneral:SendAsync("I'll make this game a living ******* hell")
UndertaleTextbox("* I'll make this game a living fucking hell", 0.03, 2)
TextChatService.TextChannels.RBXGeneral:SendAsync("You little ******* are dead")
UndertaleTextbox("* You little fuckers are dead", 0.03, 2)
TextChatService.TextChannels.RBXGeneral:SendAsync("...")
UndertaleTextbox("* ...", 0.03, 5)
TextChatService.TextChannels.RBXGeneral:SendAsync("I'll end every single one of you *****")
UndertaleTextbox("* I'll end every single one of you fucks", 0.07, 3)
TextChatService.TextChannels.RBXGeneral:SendAsync("I'll rip your ******* hands off, tl;dr *** ****")
UndertaleTextbox("* I'll rip your fucking hands off, tl;dr *** ****", 0.03, 2)
sound2:Pause()
sound:Play()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 20

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
if input.KeyCode == Enum.KeyCode.G and not gameProcessedEvent then
if IsOn then
Time = sound.TimePosition
sound:Pause()
IsOn = false
else
IsOn = true
sound.TimePosition = Time
sound:Play()
end
end
end)

local AV = workspace:WaitForChild("HF9GkAo")

local targetCFrame = CFrame.new(
    -0.125245094, -5.17285204, 4.58330011,
    0.99998641, 7.98563704e-09, 0.00520901475,
    -7.48767714e-09, 1, -9.56154125e-08,
    -0.00520901475, 9.55751105e-08, 0.99998641
)

function onTouch(otherPart)
    local character = otherPart.Parent
    local player = game.Players:GetPlayerFromCharacter(character)
    if player then
Time = sound.TimePosition
sound:Pause()
        if character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = targetCFrame
        end
        SoundZone2:Play()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
UndertaleTextbox("* BOMBLORD gives you the urge to... \n* DESTROY", 0.05, 1.5)
task.delay(0.3 , function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 20
end)
        sound.TimePosition = Time
        SoundZone2:Play()
        sound:Play()
    end
end

AV.Touched:Connect(onTouch)
