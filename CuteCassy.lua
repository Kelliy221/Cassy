local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://7361257051"
sound.Volume = 3
sound.Parent = player:WaitForChild("PlayerGui")
sound:Play()
sound.Ended:Connect(function()
    sound:Destroy()
end)

local StarterGui = game:GetService("StarterGui")
pcall(function()
    StarterGui:SetCore("SendNotification", {
        Title = "😍 PRETTY CASSY 😊",
        Text = "para kay Cassy lang ito!!!",
        Duration = 8,
        Icon = "rbxassetid://91336594704910"
    })
end)

local function formatTime(sec)
    local minutes = math.floor(sec / 60)
    local secs = math.floor(sec % 60)
    return string.format("%02d:%02d", minutes, secs)
end

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local Tabs = Instance.new("Frame")
Tabs.Size = UDim2.new(0, 240, 0, 200)
Tabs.Position = UDim2.new(0.35, 0, 0.35, 0)
Tabs.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
Tabs.Active, Tabs.Draggable = true, true
Tabs.Parent = ScreenGui

Instance.new("UICorner", Tabs).CornerRadius = UDim.new(0, 10)
Instance.new("UIStroke", Tabs).Color = Color3.fromRGB(255, 0, 0)

local TitleBar = Instance.new("TextLabel", Tabs)
TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.BackgroundTransparency = 1
TitleBar.Text = "😍 PRETTY CASSY 😊"
TitleBar.Font = Enum.Font.GothamBold
TitleBar.TextSize = 16
TitleBar.TextColor3 = Color3.fromRGB(255, 200, 200)

local FarmTabButton = Instance.new("TextButton", Tabs)
FarmTabButton.Size = UDim2.new(0, 100, 0, 25)
FarmTabButton.Position = UDim2.new(0, 10, 0, 35)
FarmTabButton.Text = "Farm"
FarmTabButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
FarmTabButton.TextColor3 = Color3.new(1, 1, 1)
FarmTabButton.Font = Enum.Font.GothamBold
FarmTabButton.TextSize = 14

local FlingTabButton = Instance.new("TextButton", Tabs)
FlingTabButton.Size = UDim2.new(0, 100, 0, 25)
FlingTabButton.Position = UDim2.new(0, 120, 0, 35)
FlingTabButton.Text = "Fling"
FlingTabButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
FlingTabButton.TextColor3 = Color3.new(1, 1, 1)
FlingTabButton.Font = Enum.Font.GothamBold
FlingTabButton.TextSize = 14

local FarmFrame = Instance.new("Frame", Tabs)
FarmFrame.Size = UDim2.new(1, -20, 1, -70)
FarmFrame.Position = UDim2.new(0, 10, 0, 65)
FarmFrame.BackgroundTransparency = 1

local FlingFrame = Instance.new("Frame", Tabs)
FlingFrame.Size = FarmFrame.Size
FlingFrame.Position = FarmFrame.Position
FlingFrame.BackgroundTransparency = 1
FlingFrame.Visible = false

FarmTabButton.MouseButton1Click:Connect(function()
    FarmFrame.Visible = true
    FlingFrame.Visible = false
end)
FlingTabButton.MouseButton1Click:Connect(function()
    FarmFrame.Visible = false
    FlingFrame.Visible = true
end)

local CashToggle = Instance.new("TextButton", FarmFrame)
CashToggle.Size = UDim2.new(1, 0, 0, 40)
CashToggle.Text = "Cash Farm: OFF"
CashToggle.TextColor3 = Color3.new(1, 1, 1)
CashToggle.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
CashToggle.Font = Enum.Font.GothamBold
CashToggle.TextSize = 14

local CashTimerLabel = Instance.new("TextLabel", FarmFrame)
CashTimerLabel.Size = UDim2.new(1, 0, 0, 25)
CashTimerLabel.Position = UDim2.new(0, 0, 0, 45)
CashTimerLabel.BackgroundTransparency = 1
CashTimerLabel.Text = "Timer: 00:00"
CashTimerLabel.Font = Enum.Font.Gotham
CashTimerLabel.TextSize = 14
CashTimerLabel.TextColor3 = Color3.new(1, 1, 1)
CashTimerLabel.Visible = false

local Malolos = Instance.new("TextButton", FarmFrame)
Malolos.Size = UDim2.new(0.48, 0, 0, 40)
Malolos.Position = UDim2.new(0, 0, 0, 75)
Malolos.Text = "Malolos Terminal"
Malolos.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
Malolos.TextColor3 = Color3.new(1, 1, 1)
Malolos.Font = Enum.Font.GothamBold
Malolos.TextSize = 14

local Guiginto = Malolos:Clone()
Guiginto.Text = "Guiginto Terminal"
Guiginto.Position = UDim2.new(0.52, 0, 0, 75)
Guiginto.Parent = FarmFrame

local function teleportJeep(pos)
    local jeepFolder = Workspace:FindFirstChild("Jeepnies")
    if jeepFolder then
        local playerJeep = jeepFolder:FindFirstChild(player.Name)
        if playerJeep and playerJeep:FindFirstChild("DriveSeat") then
            local seat = playerJeep.DriveSeat
            local model = seat:FindFirstAncestorOfClass("Model")
            if model then
                if not model.PrimaryPart then model.PrimaryPart = seat end
                model:SetPrimaryPartCFrame(CFrame.new(pos))
            end
        else
            warn("Sakay muna Jeep")
        end
    end
end

Malolos.MouseButton1Click:Connect(function() teleportJeep(Vector3.new(-1258, 13, -3023)) end)
Guiginto.MouseButton1Click:Connect(function() teleportJeep(Vector3.new(1023, 13, 3185)) end)

local CashFarming, stopRequested = false, false
local runThread
local CashTime = 0

local function setUIState(enabled)
    CashToggle.Text = "Cash Farm: " .. (enabled and "ON" or "OFF")
    CashTimerLabel.Visible = enabled
end

local function getPassengerValues()
    local jeepnies = Workspace:FindFirstChild("Jeepnies")
    if jeepnies then
        local playerFolder = jeepnies:FindFirstChild(player.Name) or jeepnies:FindFirstChild(tostring(player.UserId))
        if playerFolder then
            return playerFolder:FindFirstChild("PassengerValues")
        end
    end
    return nil
end

CashToggle.MouseButton1Click:Connect(function()
    CashFarming = not CashFarming
    setUIState(CashFarming)

    if CashFarming then
        stopRequested = false
        if not runThread or coroutine.status(runThread) == "dead" then
            runThread = coroutine.create(function()
                local RecieveCoin = ReplicatedStorage:FindFirstChild("RecieveCoin") or
                    (ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("RecieveCoin"))
                local currentPassword = 339098808

                while CashFarming and not stopRequested do
                    local passengerValues = getPassengerValues()
                    if passengerValues and RecieveCoin and RecieveCoin.FireServer then
                        pcall(function()
                            RecieveCoin:FireServer({
                                Value = 300,
                                PassengerValues = passengerValues,
                                Main = true,
                                Password = currentPassword
                            })
                        end)
                    end
                    task.wait(0.0001)
                end
                setUIState(false)
            end)
            coroutine.resume(runThread)
        end
    else
        stopRequested = true
    end
end)

task.spawn(function()
    while true do
        if CashFarming and not stopRequested then
            CashTime += 1
            CashTimerLabel.Text = "Timer: " .. formatTime(CashTime)
        else
            CashTime = 0
        end
        task.wait(1)
    end
end)

local lp = Players.LocalPlayer
local Flinging = false
local YeetForce

local TargetBox = Instance.new("TextBox", FlingFrame)
TargetBox.Size = UDim2.new(1, 0, 0, 30)
TargetBox.PlaceholderText = "Enter target name"
TargetBox.Text = ""
TargetBox.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
TargetBox.TextColor3 = Color3.new(1, 1, 1)
TargetBox.Font = Enum.Font.Gotham
TargetBox.TextSize = 14

local FlingButton = Instance.new("TextButton", FlingFrame)
FlingButton.Size = UDim2.new(1, 0, 0, 40)
FlingButton.Position = UDim2.new(0, 0, 0, 40)
FlingButton.Text = "Start Fling"
FlingButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
FlingButton.TextColor3 = Color3.new(1, 1, 1)
FlingButton.Font = Enum.Font.GothamBold
FlingButton.TextSize = 14

local StopFlingButton = FlingButton:Clone()
StopFlingButton.Text = "Stop Fling"
StopFlingButton.Position = UDim2.new(0, 0, 0, 85)
StopFlingButton.Parent = FlingFrame

local function gplr(name)
    local found = {}
    for _, v in ipairs(Players:GetPlayers()) do
        if v.Name:lower():sub(1, #name) == name:lower() then
            table.insert(found, v)
        end
    end
    return found
end

FlingButton.MouseButton1Click:Connect(function()
    if Flinging then return end
    local targetName = TargetBox.Text
    local Target = gplr(targetName)[1]
    if Target and Target.Character and Target.Character:FindFirstChild("HumanoidRootPart") then
        Flinging = true
        local tgt = Target
        YeetForce = Instance.new('BodyThrust', lp.Character.HumanoidRootPart)
        YeetForce.Force = Vector3.new(9999,9999,9999)
        task.spawn(function()
            while Flinging and tgt.Character and tgt.Character:FindFirstChild("HumanoidRootPart") do
                lp.Character.HumanoidRootPart.CFrame = tgt.Character.HumanoidRootPart.CFrame
                YeetForce.Location = tgt.Character.HumanoidRootPart.Position
                game:GetService("RunService").Heartbeat:Wait()
            end
        end)
    end
end)

StopFlingButton.MouseButton1Click:Connect(function()
    Flinging = false
    if YeetForce then YeetForce:Destroy() end
    lp.Character:BreakJoints()
end)
