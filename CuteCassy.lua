local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer
local lp = player
local DeductExpRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("DeductExp")
local remote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("RecieveCoin")

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://7361257051"
sound.Volume = 3
sound.Parent = player:WaitForChild("PlayerGui")
sound:Play()
sound.Ended:Connect(function()
    sound:Destroy()
end)

pcall(function()
    StarterGui:SetCore("SendNotification", {
        Title = "Kenn",
        Text = "SANA MASAYA KA.",
        Duration = 30,
        Icon = "rbxassetid://78556163169177"
    })
end)

local function formatTime(sec)
    local minutes = math.floor(sec / 60)
    local secs = sec % 60
    return string.format("%02d:%02d", minutes, secs)
end

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
TitleBar.Text = "CUTESY CASSEY"
TitleBar.Font = Enum.Font.GothamBold
TitleBar.TextSize = 16
TitleBar.TextColor3 = Color3.fromRGB(255, 200, 200)
TitleBar.Parent = Tabs

local FarmTabButton = Instance.new("TextButton")
FarmTabButton.Size = UDim2.new(0, 75, 0, 25)
FarmTabButton.Position = UDim2.new(0, 5, 0, 35)
FarmTabButton.Text = "Farm"
FarmTabButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
FarmTabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FarmTabButton.Font = Enum.Font.GothamBold
FarmTabButton.TextSize = 14
FarmTabButton.Parent = Tabs

local FlingTabButton = Instance.new("TextButton")
FlingTabButton.Size = UDim2.new(0, 75, 0, 25)
FlingTabButton.Position = UDim2.new(0, 85, 0, 35)
FlingTabButton.Text = "Fling"
FlingTabButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
FlingTabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FlingTabButton.Font = Enum.Font.GothamBold
FlingTabButton.TextSize = 14
FlingTabButton.Parent = Tabs

local AutobuyTab = Instance.new("TextButton", Tabs)
AutobuyTab.Size = UDim2.new(0, 70, 0, 25)
AutobuyTab.Position = UDim2.new(0, 165, 0, 35)
AutobuyTab.Text = "Autobuy"
AutobuyTab.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
AutobuyTab.TextColor3 = Color3.fromRGB(255, 255, 255)
AutobuyTab.Font = Enum.Font.GothamBold
AutobuyTab.TextSize = 12

local FarmFrame = Instance.new("Frame")
FarmFrame.Size = UDim2.new(1, -20, 1, -70)
FarmFrame.Position = UDim2.new(0, 10, 0, 65)
FarmFrame.BackgroundTransparency = 1
FarmFrame.Parent = Tabs

local FlingFrame = Instance.new("Frame")
FlingFrame.Size = UDim2.new(1, -20, 1, -70)
FlingFrame.Position = UDim2.new(0, 10, 0, 65)
FlingFrame.BackgroundTransparency = 1
FlingFrame.Visible = false
FlingFrame.Parent = Tabs

local AutobuyFrame = Instance.new("Frame")
AutobuyFrame.Size = UDim2.new(1, -20, 1, -70)
AutobuyFrame.Position = UDim2.new(0, 10, 0, 65)
AutobuyFrame.BackgroundTransparency = 1
AutobuyFrame.Visible = false
AutobuyFrame.Parent = Tabs

FarmTabButton.MouseButton1Click:Connect(function()
    FarmFrame.Visible = true
    FlingFrame.Visible = false
    AutobuyFrame.Visible = false
end)

FlingTabButton.MouseButton1Click:Connect(function()
    FarmFrame.Visible = false
    FlingFrame.Visible = true
    AutobuyFrame.Visible = false
end)

AutobuyTab.MouseButton1Click:Connect(function()
    FarmFrame.Visible = false
    FlingFrame.Visible = false
    AutobuyFrame.Visible = true
end)

local CashToggle = Instance.new("TextButton")
CashToggle.Size = UDim2.new(1, 0, 0, 40)
CashToggle.Position = UDim2.new(0, 0, 0, 0)
CashToggle.Text = "Cash Farm: OFF"
CashToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
CashToggle.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
CashToggle.Font = Enum.Font.GothamBold
CashToggle.TextSize = 14
CashToggle.Parent = FarmFrame

local Spawn = Instance.new("TextButton")
Spawn.Size = UDim2.new(1, 0, 0, 40)
Spawn.Position = UDim2.new(0, 0, 0, 45)
Spawn.Text = "Spawn Jeep"
Spawn.TextColor3 = Color3.fromRGB(255, 255, 255)
Spawn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
Spawn.Font = Enum.Font.GothamBold
Spawn.TextSize = 12
Spawn.Parent = FarmFrame

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

local Bulakan = Instance.new("TextButton")
Bulakan.Size = UDim2.new(1, 0, 0, 40)
Bulakan.Position = UDim2.new(0, 0, 0, 75)
Bulakan.Text = "Bulakan Terminal"
Bulakan.TextColor3 = Color3.fromRGB(255, 255, 255)
Bulakan.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
Bulakan.Font = Enum.Font.GothamBold
Bulakan.TextSize = 12
Bulakan.Parent = FarmFrame

Spawn.MouseButton1Click:Connect(function()
    local args = {
    [1] = {
        ["UnitName"] = "Unit 4";
        ["JeepneyName"] = "Sarao Custombuilt Model 2";
        ["OperatorNpc"] = workspace:WaitForChild("Map", 9e9):WaitForChild("Misc", 9e9):WaitForChild("Operators", 9e9):WaitForChild("Mang Juan", 9e9);
    };
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("SpawnOperatorNPCJeepney", 9e9):FireServer(unpack(args))
end)

Bulakan.MouseButton1Click:Connect(function()
    local targetPosition = Vector3.new(-132, 13, -3013)
    local success = false
    local jeepFolder = Workspace:FindFirstChild("Jeepnies")
    if jeepFolder then
        local playerJeep = jeepFolder:FindFirstChild(player.Name)
        if playerJeep then
            local seat = playerJeep:FindFirstChild("DriveSeat")
            if seat and seat:IsA("BasePart") then
                local model = seat:FindFirstAncestorOfClass("Model")
                if model then
                    if not model.PrimaryPart then
                        model.PrimaryPart = seat
                    end
                    model:SetPrimaryPartCFrame(CFrame.new(targetPosition))
                    success = true
                end
            end
        end
    end
    if not success then
        warn("Sakay muna Jeep")
    end
end)

local DropPoint = Instance.new("TextButton")
DropPoint.Size = UDim2.new(1, 0, 0, 40)
DropPoint.Position = UDim2.new(0, 0, 0, 72)
DropPoint.Text = "DropPoint"
DropPoint.TextColor3 = Color3.fromRGB(255, 255, 255)
DropPoint.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
DropPoint.Font = Enum.Font.GothamBold
DropPoint.TextSize = 14
DropPoint.Parent = AutobuyFrame

DropPoint.MouseButton1Click:Connect(function()
    local targetPosition = Vector3.new(-1270, 14, -3029)
    local success = false
    local jeepFolder = Workspace:FindFirstChild("Jeepnies")
    if jeepFolder then
        local playerJeep = jeepFolder:FindFirstChild(player.Name)
        if playerJeep then
            local seat = playerJeep:FindFirstChild("DriveSeat")
            if seat and seat:IsA("BasePart") then
                local model = seat:FindFirstAncestorOfClass("Model")
                if model then
                    if not model.PrimaryPart then
                        model.PrimaryPart = seat
                    end
                    model:SetPrimaryPartCFrame(CFrame.new(targetPosition))
                    success = true
                end
            end
        end
    end
    if not success then
        warn("Sakay muna Jeep")
    end
end)

local ExpNote = Instance.new("TextLabel")
ExpNote.Size = UDim2.new(1, 0, 0, 15)
ExpNote.Position = UDim2.new(0, 0, 1, -15)
ExpNote.BackgroundTransparency = 1
ExpNote.Text = "Not for sale. Kay Cassy lang ito!!!"
ExpNote.TextColor3 = Color3.fromRGB(180, 180, 180)
ExpNote.Font = Enum.Font.SourceSansItalic
ExpNote.TextSize = 14
ExpNote.Parent = FarmFrame

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

local AddExp = Instance.new("TextButton")
AddExp.Size = UDim2.new(1, 0, 0, 40)
AddExp.Text = "Tap for EXP"
AddExp.TextColor3 = Color3.fromRGB(255, 255, 255)
AddExp.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
AddExp.Font = Enum.Font.GothamBold
AddExp.TextSize = 14
AddExp.Parent = AutobuyFrame

local Deduct = Instance.new("TextBox")
Deduct.Size = UDim2.new(1, 0, 0, 30)
Deduct.Position = UDim2.new(0, 0, 0, 45)
Deduct.PlaceholderText = "Enter Exp Amount to Deduct."
Deduct.Text = ""
Deduct.Font = Enum.Font.Gotham
Deduct.TextSize = 14
Deduct.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
Deduct.TextColor3 = Color3.fromRGB(255, 255, 255)
Deduct.ClearTextOnFocus = true
Deduct.Parent = AutobuyFrame

Deduct.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local value = tonumber(Deduct.Text)
        if value and value > 0 then
            local args = {{
                Value = value,
                Password = 244202921
            }}
            DeductExpRemote:FireServer(unpack(args))
            Deduct.Text = ""
        end
    end
end)

local Flinging = false
local YeetForce
local autoCoinEnabled = false
local capturedArgs = nil

local RS = game:GetService("ReplicatedStorage")
local WS = game:GetService("Workspace")
local PLR = game.Players.LocalPlayer
local Remotes = RS:WaitForChild("Remotes")
local RecieveCoin = Remotes:WaitForChild("RecieveCoin")
local PassengerChatted = Remotes:WaitForChild("PassengerChatted")
local codeModule = PLR.PlayerScripts:WaitForChild("Code")

do
    local mt = getrawmetatable(game)
    local old = mt.__namecall
    setreadonly(mt, false)
    mt.__namecall = function(self, ...)
        if getnamecallmethod() == "FireServer" and tostring(self) == "PassengerChatted" then
            capturedArgs = {...}
        end
        return old(self, ...)
    end
    setreadonly(mt, true)
end

local function getPassword()
    local ok, res = pcall(require, codeModule)
    if ok and res then
        return res.code or res.password or res.Password
    end
end

local function getPV()
    local jeep = WS:FindFirstChild("Jeepnies")
    if not jeep then return end
    local owned = jeep:FindFirstChild(PLR.Name) or jeep:FindFirstChild(tostring(PLR.UserId))
    if owned then return owned:FindFirstChild("PassengerValues") end
end

function startAll()
    task.spawn(function()
        while autoCoinEnabled do
            if capturedArgs then
                pcall(function()
                    PassengerChatted:FireServer(table.unpack(capturedArgs))
                end)
            end
            task.wait(0.52)
        end
    end)

    task.spawn(function()
        while autoCoinEnabled do
            local password = getPassword()
            local pv = getPV()
            if pv and password then
                pcall(function()
                    RecieveCoin:FireServer({
                        Value = 300,
                        PassengerValues = pv,
                        Main = true,
                        Password = password,
                    })
                end)
            end
            task.wait(0)
        end
    end)
end

ToggleButton.MouseButton1Click:Connect(function()
    autoCoinEnabled = not autoCoinEnabled
    ToggleButton.Text = autoCoinEnabled and "Auto Coin: ON" or "Auto Coin: OFF"
    if autoCoinEnabled then
        startAll()
    end
end)

local jeepFolder = Workspace:FindFirstChild("Jeepnies")
if not jeepFolder then return end

local playerJeep = jeepFolder:FindFirstChild(player.Name)
if not playerJeep then return end

local seat = playerJeep:FindFirstChild("DriveSeat")
if not seat or not seat:IsA("BasePart") then return end

local model = seat:FindFirstAncestorOfClass("Model")
if not model then return end

if not model.PrimaryPart then
    model.PrimaryPart = seat
end

local originalPosition = model.PrimaryPart.CFrame

local function flingPlayer(target)
    local character = target.Character
    if not character then return end
    local root = character:FindFirstChild("HumanoidRootPart")
    if not root then return end
    
    local thrust = Instance.new("BodyThrust")
    thrust.Force = Vector3.new(9999, 9999, 9999)
    thrust.Location = model.PrimaryPart.Position
    thrust.Parent = model.PrimaryPart

    local start = tick()
    while tick() - start < 2 do
        local c = target.Character
        if c and c:FindFirstChild("HumanoidRootPart") then
            local r = c.HumanoidRootPart
            model:SetPrimaryPartCFrame(CFrame.new(r.Position))
            thrust.Location = r.Position
        else
            break
        end
        RunService.Heartbeat:Wait()
    end

    thrust:Destroy()
end

FlingButton.MouseButton1Click:Connect(function()
    local name = TargetBox.Text
    if name == "" then return end

    local target = Players:FindFirstChild(name)
    if target then
        flingPlayer(target)
        model:SetPrimaryPartCFrame(originalPosition)
    end
end)

StopFlingButton.MouseButton1Click:Connect(function()
    Flinging = false
    if YeetForce then YeetForce:Destroy() end
    lp.Character:BreakJoints()
end)

AddExp.MouseButton1Click:Connect(function()
    local mt = getrawmetatable(game)
    local old = mt.__namecall
    setreadonly(mt, false)
    mt.__namecall = function(remote, ...)
        local args = {...}
        local method = getnamecallmethod()
        if method == "FireServer" or method == "InvokeServer" then
            if remote.Name == "UnloadPassenger" then
                for i = 1, 1000 do
                    old(remote, ...)
                end
            end
        end
        return old(remote, ...)
    end
    setreadonly(mt, true)
end)
