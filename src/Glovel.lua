-- glovel script
local CoreGui = game:GetService("StarterGui")
local BadgeService = game:GetService("BadgeService")
local Player = game:GetService("Players").LocalPlayer
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window = Library:NewWindow("Auto Glovel")
local Tab = Window:NewSection("Main")

Tab:CreateButton("Get Glovel", function()
if BadgeService:UserHasBadgeAsync(Player.UserId, 128402905805563) then
return CoreGui:SetCore("SendNotification", {Title = "Water's Badge Collector"; Text = "You already have Glovel!"; Duration = 3;})
end

CoreGui:SetCore("SendNotification", {
	Title = "Water's Badge Collector";
	Text = "Getting Glovel...";
	Duration = 3;
})

task.wait(1)

CoreGui:SetCore("SendNotification", {
	Title = "Water's Badge Collector";
	Text = "Getting Quest...";
	Duration = 3;
})

local folder = game:GetService("ReplicatedStorage")._NETWORK

for _, child in ipairs(folder:GetChildren()) do
    if (string.find(child.Name, "{") or string.find(child.Name, "}")) and child:IsA("RemoteEvent") then
        local args = {"_questChainHitmansHandkerchief"}
        child:FireServer(unpack(args))
    end
end

task.wait(1)
CoreGui:SetCore("SendNotification", {
	Title = "Water's Badge Collector";
	Text = "Successfully got Quest";
	Duration = 3;
})


if Player.Character and Player.Character:FindFirstChild("Humanoid") then
Player.Character:WaitForChild("Humanoid").Health = 0
task.wait(5)
fireclickdetector(workspace.Lobby.Extended.ClickDetector)
task.wait(0.5)
firetouchinterest(Player.Character:WaitForChild("HumanoidRootPart"), workspace.Lobby.Teleport1, 0)
firetouchinterest(Player.Character:WaitForChild("HumanoidRootPart"), workspace.Lobby.Teleport1, 1)
task.wait(0.5)
Player.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(220.601868, 26.9119072, 190.311356, 0.767154157, -9.10410947e-09, -0.641462803, 6.34510968e-08, 1, 6.16912814e-08, 0.641462803, -8.80282371e-08, 0.767154157)
task.wait(0.5)
if Player:WaitForChild("Backpack"):FindFirstChild("Extended") then
Player:WaitForChild("Backpack"):WaitForChild("Extended").Parent = Player.Character
end
task.wait(0.5)
fireproximityprompt(workspace.Arena.CannonIsland.GlovelHoleInTheWall.ProximityPrompt)
task.wait(5)
Player.Character:WaitForChild("HumanoidRootPart").CFrame = workspace.Arena.CannonIsland.TreasureSpots._treasureSpot9.CFrame
task.wait(1)
if Player:WaitForChild("Backpack"):FindFirstChild("Glovel") then
Player:WaitForChild("Backpack"):WaitForChild("Glovel").Parent = Player.Character
end
task.wait(0.5)

for i = 1, 20 do
local args = {{index = 2, cf = CFrame.new(216.99005126953125, -16.716064453125, -8.428260803222656, 0.8947604894638062, 4.813454879126766e-08, 0.44654637575149536, -1.0780863313186728e-08, 1, -8.619095126505272e-08, -0.44654637575149536, 7.23061006624448e-08, 0.8947604894638062)}}
game:GetService("ReplicatedStorage"):WaitForChild("DigEvent"):FireServer(unpack(args))
task.wait(0.00001)
end
task.wait(3)
fireproximityprompt(workspace:WaitForChild("TreasureChestFolder"):WaitForChild("TreasureChest"):WaitForChild("TreasureChest"):FindFirstChild("ProximityPrompt"))
task.wait(0.5)
task.wait(1)
Player.Character:WaitForChild("Humanoid").Health = 0
task.wait(5)
Player.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-976.141602, 320.624481, -21.2355232)
task.wait(0.5)
fireproximityprompt(workspace.Lobby.HunterHatch.Part.ProximityPrompt)
task.wait(0.5)
CoreGui:SetCore("SendNotification", {Title = "Water's Badge Collector"; Text = "Processed finished have fun!"; Duration = 5;})
else
return CoreGui:SetCore("SendNotification", {Title = "Water's Badge Collector"; Text = "You Must be Alive!"; Duration = 3;})
end
end)
