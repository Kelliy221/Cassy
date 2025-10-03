local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer

local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local RecieveCoin = Remotes:WaitForChild("RecieveCoin")
local RecieveExp = Remotes:WaitForChild("RecieveExp")

local function formatTime(sec)
    local minutes = math.floor(sec / 60)
    local secs = math.floor(sec % 60)
    return string.format("%02d:%02d", minutes, secs)
end

local function getPassengerValues()
    local success, result
    repeat
        success, result = pcall(function()
            return workspace:WaitForChild("Jeepnies")
                :WaitForChild(LocalPlayer.Name)
                :WaitForChild("PassengerValues")
        end)
        task.wait(0.5)
    until success and result
    return result
end

pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "😍 PRETTY CASSY 😊",
        Text = "para kay Cassy lang ito!!!",
        Duration = 8,
        Icon = "rbxassetid://91336594704910"
    })
end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local Tabs = Instance.new("Frame")
Tabs.Size = UDim2.new(0, 240, 0, 200)
Tabs.Position = UDim2.new(0.35, 0, 0.35, 0)
Tabs.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
Tabs.Active = true
Tabs.Draggable = true
Tabs.Parent = ScreenGui

local UICorner = Instance.new("UICorner", Tabs)
UICorner.CornerRadius = UDim.new(0, 10)

local UIStroke = Instance.new("UIStroke", Tabs)
UIStroke.Color = Color3.fromRGB(255, 0, 0)
UIStroke.Thickness = 2

local TitleBar = Instance.new("TextLabel")
TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.BackgroundTransparency = 1
TitleBar.Text = "😍 PRETTY CASSY 😊"
TitleBar.Font = Enum.Font.GothamBold
TitleBar.TextSize = 16
TitleBar.TextColor3 = Color3.fromRGB(255, 200, 200)
TitleBar.Parent = Tabs

-- Tab buttons
local FarmTabButton = Instance.new("TextButton")
FarmTabButton.Size = UDim2.new(0, 100, 0, 25)
FarmTabButton.Position = UDim2.new(0, 10, 0, 35)
FarmTabButton.Text = "Farm"
FarmTabButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
FarmTabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FarmTabButton.Font = Enum.Font.GothamBold
FarmTabButton.TextSize = 14
FarmTabButton.Parent = Tabs

local FlingTabButton = Instance.new("TextButton")
FlingTabButton.Size = UDim2.new(0, 100, 0, 25)
FlingTabButton.Position = UDim2.new(0, 120, 0, 35)
FlingTabButton.Text = "Fling"
FlingTabButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
FlingTabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FlingTabButton.Font = Enum.Font.GothamBold
FlingTabButton.TextSize = 14
FlingTabButton.Parent = Tabs

-- Farm Section
local FarmFrame = Instance.new("Frame")
FarmFrame.Size = UDim2.new(1, -20, 1, -70)
FarmFrame.Position = UDim2.new(0, 10, 0, 65)
FarmFrame.BackgroundTransparency = 1
FarmFrame.Parent = Tabs

local CashToggle = Instance.new("TextButton")
CashToggle.Size = UDim2.new(1, 0, 0, 40)
CashToggle.Position = UDim2.new(0, 0, 0, 0)
CashToggle.Text = "Cash Farm: OFF"
CashToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
CashToggle.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
CashToggle.Font = Enum.Font.GothamBold
CashToggle.TextSize = 14
CashToggle.Parent = FarmFrame
CashToggle.Visible = false

local CashTimerLabel = Instance.new("TextLabel")
CashTimerLabel.Size = UDim2.new(1, 0, 0, 25)
CashTimerLabel.Position = UDim2.new(0, 0, 0, 45)
CashTimerLabel.BackgroundTransparency = 1
CashTimerLabel.Text = "Timer: 00:00"
CashTimerLabel.Font = Enum.Font.Gotham
CashTimerLabel.TextSize = 14
CashTimerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CashTimerLabel.TextXAlignment = Enum.TextXAlignment.Left
CashTimerLabel.Parent = FarmFrame
CashTimerLabel.Visible = false

local ExpToggle = Instance.new("TextButton")
ExpToggle.Size = UDim2.new(1, 0, 0, 40)
ExpToggle.Position = UDim2.new(0, 0, 0, 75)
ExpToggle.Text = "Exp Farm: OFF"
ExpToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
ExpToggle.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
ExpToggle.Font = Enum.Font.GothamBold
ExpToggle.TextSize = 14
ExpToggle.Parent = FarmFrame

local ExpNote = Instance.new("TextLabel")
ExpNote.Size = UDim2.new(1, 0, 0, 15)
ExpNote.Position = UDim2.new(0, 0, 1, -15)
ExpNote.BackgroundTransparency = 1
ExpNote.Text = "Not for sale. Only for Cassy!!"
ExpNote.TextColor3 = Color3.fromRGB(180, 180, 180)
ExpNote.Font = Enum.Font.SourceSansItalic
ExpNote.TextSize = 14
ExpNote.Parent = FarmFrame

-- Fling Section
local FlingFrame = Instance.new("Frame")
FlingFrame.Size = UDim2.new(1, -20, 1, -70)
FlingFrame.Position = UDim2.new(0, 10, 0, 65)
FlingFrame.BackgroundTransparency = 1
FlingFrame.Parent = Tabs
FlingFrame.Visible = false

local TargetBox = Instance.new("TextBox")
TargetBox.Size = UDim2.new(1, 0, 0, 30)
TargetBox.Position = UDim2.new(0, 0, 0, 0)
TargetBox.PlaceholderText = "Enter target name"
TargetBox.Text = ""
TargetBox.Font = Enum.Font.Gotham
TargetBox.TextSize = 14
TargetBox.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
TargetBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetBox.Parent = FlingFrame

local FlingButton = Instance.new("TextButton")
FlingButton.Size = UDim2.new(1, 0, 0, 40)
FlingButton.Position = UDim2.new(0, 0, 0, 40)
FlingButton.Text = "Start Fling"
FlingButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FlingButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
FlingButton.Font = Enum.Font.GothamBold
FlingButton.TextSize = 14
FlingButton.Parent = FlingFrame

local StopFlingButton = Instance.new("TextButton")
StopFlingButton.Size = UDim2.new(1, 0, 0, 40)
StopFlingButton.Position = UDim2.new(0, 0, 0, 85)
StopFlingButton.Text = "Stop Fling"
StopFlingButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StopFlingButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
StopFlingButton.Font = Enum.Font.GothamBold
StopFlingButton.TextSize = 14
StopFlingButton.Parent = FlingFrame

-- Tab switching
FarmTabButton.MouseButton1Click:Connect(function()
    FarmFrame.Visible = true
    FlingFrame.Visible = false
end)

FlingTabButton.MouseButton1Click:Connect(function()
    FarmFrame.Visible = false
    FlingFrame.Visible = true
end)

-- Farming Logic
local CashFarming = false
local ExpFarming = false
local CashTime = 0
local fireDelay = 0.25

CashToggle.MouseButton1Click:Connect(function()
    CashFarming = not CashFarming
    if CashFarming then
        CashToggle.Text = "Cash Farm: ON"
        CashToggle.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        CashTimerLabel.Visible = true
        task.spawn(function()
            local PassengerValues = getPassengerValues()
            while CashFarming and PassengerValues.Parent do
                CashTime += fireDelay
                CashTimerLabel.Text = "Timer: " .. formatTime(CashTime)
                if CashTime >= (14*60+10) then
                    CashFarming = false
                    CashToggle.Text = "Cash Farm: OFF"
                    CashToggle.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
                    CashTimerLabel.Visible = false
                    task.wait(5)
                    LocalPlayer:Kick("Cash Farm ended (14:10 reached)")
                    break
                end
                local args = {{
                    Password = 5486964568496,
                    Value = 300,
                    PassengerValues = PassengerValues
                }}
                pcall(function()
                    RecieveCoin:FireServer(unpack(args))
                end)
                task.wait(fireDelay)
            end
        end)
    else
        CashToggle.Text = "Cash Farm: OFF"
        CashToggle.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
        CashTimerLabel.Visible = false
    end
end)

ExpToggle.MouseButton1Click:Connect(function()
    ExpFarming = not ExpFarming
    if ExpFarming then
        ExpToggle.Text = "Exp Farm: ON"
        ExpToggle.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        task.spawn(function()
            while ExpFarming do
                local args = {{ Value = 3, Password = 229271937 }}
                pcall(function()
                    RecieveExp:FireServer(unpack(args))
                end)
                task.wait(0.25)
            end
        end)
    else
        ExpToggle.Text = "Exp Farm: OFF"
        ExpToggle.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
    end
end)

-- Jeep detect
local function watchJeep()
    local function hookCharacter(char)
        local humanoid = char:WaitForChild("Humanoid", 5)
        if humanoid then
            humanoid.Seated:Connect(function(active, seat)
                if active and seat and seat:IsDescendantOf(workspace:WaitForChild("Jeepnies")) then
                    CashToggle.Visible = true
                else
                    CashToggle.Visible = false
                    CashTimerLabel.Visible = false
                    CashFarming = false
                    CashToggle.Text = "Cash Farm: OFF"
                    CashToggle.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
                end
            end)
        end
    end
    if LocalPlayer.Character then
        hookCharacter(LocalPlayer.Character)
    end
    LocalPlayer.CharacterAdded:Connect(hookCharacter)
end
task.spawn(watchJeep)

LocalPlayer.CharacterAdded:Connect(function()
    CashTime = 0
    CashTimerLabel.Text = "Timer: 00:00"
end)

-- Fling Logic
local lp = Players.LocalPlayer
local Flinging = false
local YeetForce

local function gplr(String)
    local Found = {}
    local strl = String:lower()
    if strl == "all" then
        for i,v in pairs(Players:GetPlayers()) do
            table.insert(Found,v)
        end
    elseif strl == "others" then
        for i,v in pairs(Players:GetPlayers()) do
            if v.Name ~= lp.Name then
                table.insert(Found,v)
            end
        end
    elseif strl == "me" then
        table.insert(Found, lp)
    else
        for i,v in pairs(Players:GetPlayers()) do
            if v.Name:lower():sub(1, #String) == strl then
                table.insert(Found,v)
            end
        end
    end
    return Found
end

FlingButton.MouseButton1Click:Connect(function()
    if Flinging then return end
    local Target = gplr(TargetBox.Text)
    if Target[1] and Target[1].Character and Target[1].Character:FindFirstChild("HumanoidRootPart") then
        Flinging = true
        local tgt = Target[1]
        YeetForce = Instance.new('BodyThrust', lp.Character.HumanoidRootPart)
        YeetForce.Force = Vector3.new(9999,9999,9999)
        YeetForce.Name = "YeetForce"
        task.spawn(function()
            while Flinging and tgt and tgt.Character and tgt.Character:FindFirstChild("HumanoidRootPart") do
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
    lp.Character:BreakJoints() -- reset character
end)
