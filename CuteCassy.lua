-- // KAY CASSY LANG TO!
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
            return workspace:WaitForChild("Jeepnies"):WaitForChild(LocalPlayer.Name):WaitForChild("PassengerValues")
        end)
        task.wait(0.5)
    until success and result
    return result
end

pcall(function()
    StarterGui:SetCore("SendNotification", {
        Title = "😍 PRETTY CASSY 😊",
        Text = "para kay Cassy lang ito!!!",
        Duration = 8
        Icon = "rbxassetid://83109064641538"
    })
end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local Sound = Instance.new("Sound")
Sound.SoundId = "rbxassetid://7361257051"
Sound.Volume = 1
Sound.PlayOnRemove = true
Sound.Parent = game:GetService("SoundService")
Sound:Destroy()

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 250, 0, 240)
Frame.Position = UDim2.new(0.35, 0, 0.35, 0)
Frame.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Frame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(255, 0, 0)
UIStroke.Thickness = 2
UIStroke.Parent = Frame

local TitleBar = Instance.new("TextLabel")
TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.BackgroundTransparency = 1
TitleBar.Text = "😍 PRETTY CASSY 😊"
TitleBar.Font = Enum.Font.GothamBold
TitleBar.TextSize = 16
TitleBar.TextColor3 = Color3.fromRGB(255, 200, 200)
TitleBar.Parent = Frame

local TabFrame = Instance.new("Frame")
TabFrame.Size = UDim2.new(1, 0, 0, 30)
TabFrame.Position = UDim2.new(0, 0, 0, 30)
TabFrame.BackgroundTransparency = 1
TabFrame.Parent = Frame

local FarmTab = Instance.new("TextButton")
FarmTab.Size = UDim2.new(0.5, -1, 1, 0)
FarmTab.Position = UDim2.new(0, 0, 0, 0)
FarmTab.Text = "Farm"
FarmTab.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
FarmTab.TextColor3 = Color3.fromRGB(255, 255, 255)
FarmTab.Font = Enum.Font.GothamBold
FarmTab.TextSize = 14
FarmTab.Parent = TabFrame

local FlingTab = Instance.new("TextButton")
FlingTab.Size = UDim2.new(0.5, -1, 1, 0)
FlingTab.Position = UDim2.new(0.5, 1, 0, 0)
FlingTab.Text = "Fling"
FlingTab.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
FlingTab.TextColor3 = Color3.fromRGB(255, 255, 255)
FlingTab.Font = Enum.Font.GothamBold
FlingTab.TextSize = 14
FlingTab.Parent = TabFrame

local Sections = {}
for _, name in pairs({"Farm", "Fling"}) do
    local section = Instance.new("Frame")
    section.Size = UDim2.new(1, -20, 1, -70)
    section.Position = UDim2.new(0, 10, 0, 70)
    section.BackgroundTransparency = 1
    section.Visible = false
    section.Parent = Frame
    Sections[name] = section
end
Sections["Farm"].Visible = true

local CashToggle = Instance.new("TextButton")
CashToggle.Size = UDim2.new(1, 0, 0, 40)
CashToggle.Text = "Cash Farm: OFF"
CashToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
CashToggle.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
CashToggle.Font = Enum.Font.GothamBold
CashToggle.TextSize = 14
CashToggle.Visible = false
CashToggle.Parent = Sections["Farm"]

local CashTimerLabel = Instance.new("TextLabel")
CashTimerLabel.Size = UDim2.new(1, 0, 0, 25)
CashTimerLabel.Position = UDim2.new(0, 0, 0, 45)
CashTimerLabel.BackgroundTransparency = 1
CashTimerLabel.Text = "Timer: 00:00"
CashTimerLabel.Font = Enum.Font.Gotham
CashTimerLabel.TextSize = 14
CashTimerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CashTimerLabel.TextXAlignment = Enum.TextXAlignment.Left
CashTimerLabel.Visible = false
CashTimerLabel.Parent = Sections["Farm"]

local ExpToggle = Instance.new("TextButton")
ExpToggle.Size = UDim2.new(1, 0, 0, 40)
ExpToggle.Position = UDim2.new(0, 0, 0, 80)
ExpToggle.Text = "Exp Farm: OFF"
ExpToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
ExpToggle.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
ExpToggle.Font = Enum.Font.GothamBold
ExpToggle.TextSize = 14
ExpToggle.Parent = Sections["Farm"]

local ExpNote = Instance.new("TextLabel")
ExpNote.Size = UDim2.new(1, 0, 0, 20)
ExpNote.Position = UDim2.new(0, 0, 0, 125)
ExpNote.BackgroundTransparency = 1
ExpNote.Text = "Not for sale. Only for Cassy!!"
ExpNote.TextColor3 = Color3.fromRGB(180, 180, 180)
ExpNote.Font = Enum.Font.SourceSansItalic
ExpNote.TextSize = 14
ExpNote.Parent = Sections["Farm"]

local FlingTextBox = Instance.new("TextBox")
FlingTextBox.Size = UDim2.new(1, 0, 0, 40)
FlingTextBox.PlaceholderText = "Enter target name"
FlingTextBox.Text = ""
FlingTextBox.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
FlingTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
FlingTextBox.Font = Enum.Font.Gotham
FlingTextBox.TextSize = 14
FlingTextBox.Parent = Sections["Fling"]

local FlingButton = Instance.new("TextButton")
FlingButton.Size = UDim2.new(1, 0, 0, 40)
FlingButton.Position = UDim2.new(0, 0, 0, 50)
FlingButton.Text = "Start Fling"
FlingButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FlingButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
FlingButton.Font = Enum.Font.GothamBold
FlingButton.TextSize = 14
FlingButton.Parent = Sections["Fling"]

local StopFlingButton = Instance.new("TextButton")
StopFlingButton.Size = UDim2.new(1, 0, 0, 40)
StopFlingButton.Position = UDim2.new(0, 0, 0, 100)
StopFlingButton.Text = "Stop Fling"
StopFlingButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StopFlingButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
StopFlingButton.Font = Enum.Font.GothamBold
StopFlingButton.TextSize = 14
StopFlingButton.Parent = Sections["Fling"]

local StopFlingButton = Instance.new("TextLabel")
StopFlingButton.Size = UDim2.new(1, 0, 0, 20)
StopFlingButton.Position = UDim2.new(0, 0, 0, 140)
StopFlingButton.BackgroundTransparency = 1
StopFlingButton.Text = "Sorry late nailagay yung fling. Enjoy!"
StopFlingButton.TextColor3 = Color3.fromRGB(180, 180, 180)
StopFlingButton.Font = Enum.Font.SourceSansItalic
StopFlingButton.TextSize = 16
StopFlingButton.Parent = Sections["Fling"]

local function switchTab(tab)
    for name, section in pairs(Sections) do
        section.Visible = (name == tab)
    end
end
FarmTab.MouseButton1Click:Connect(function() switchTab("Farm") end)
FlingTab.MouseButton1Click:Connect(function() switchTab("Fling") end)

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
                local args = {{Password = 5486964568496, Value = 300, PassengerValues = PassengerValues}}
                pcall(function() RecieveCoin:FireServer(unpack(args)) end)
                if CashTime >= (14*60 + 10) then
                    CashFarming = false
                    CashToggle.Text = "Cash Farm: OFF"
                    CashToggle.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
                    task.wait(5)
                    LocalPlayer:Kick("Tapos na. Change account kana.")
                end
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
                local args = {{Value = 3, Password = 229271937}}
                pcall(function() RecieveExp:FireServer(unpack(args)) end)
                task.wait(0.25)
            end
        end)
    else
        ExpToggle.Text = "Exp Farm: OFF"
        ExpToggle.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
    end
end)

local function gplr(String)
    local Found = {}
    local strl = String:lower()
    if strl == "all" then
        for i,v in pairs(Players:GetPlayers()) do table.insert(Found,v) end
    elseif strl == "others" then
        for i,v in pairs(Players:GetPlayers()) do if v.Name ~= LocalPlayer.Name then table.insert(Found,v) end end
    elseif strl == "me" then
        for i,v in pairs(Players:GetPlayers()) do if v.Name == LocalPlayer.Name then table.insert(Found,v) end end
    else
        for i,v in pairs(Players:GetPlayers()) do if v.Name:lower():sub(1, #String) == String:lower() then table.insert(Found,v) end end
    end
    return Found 
end

local flingActive = false
FlingButton.MouseButton1Click:Connect(function()
    if flingActive then return end
    flingActive = true
    local Target = gplr(FlingTextBox.Text)
    if Target[1] then
        Target = Target[1]
        local Thrust = Instance.new('BodyThrust', LocalPlayer.Character.HumanoidRootPart)
        Thrust.Force = Vector3.new(9999,9999,9999)
        Thrust.Name = "YeetForce"
        task.spawn(function()
            repeat
                if not flingActive then break end
                if Target and Target.Character and Target.Character:FindFirstChild("HumanoidRootPart") then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = Target.Character.HumanoidRootPart.CFrame
                    Thrust.Location = Target.Character.HumanoidRootPart.Position
                end
                game:GetService("RunService").Heartbeat:wait()
            until not Target.Character or not Target.Character:FindFirstChild("Head") or not flingActive
            Thrust:Destroy()
        end)
    end
end)

StopFlingButton.MouseButton1Click:Connect(function()
    flingActive = false
    if LocalPlayer.Character then
        LocalPlayer.Character:BreakJoints()
    end
end)

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
    if LocalPlayer.Character then hookCharacter(LocalPlayer.Character) end
    LocalPlayer.CharacterAdded:Connect(hookCharacter)
end

task.spawn(watchJeep)

LocalPlayer.CharacterAdded:Connect(function()
    CashTime = 0
    CashTimerLabel.Text = "Timer: 00:00"
end)
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TitleBar = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local CashToggle = Instance.new("TextButton")
local ExpToggle = Instance.new("TextButton")
local CashTimerLabel = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui

local Sound = Instance.new("Sound")
Sound.SoundId = "rbxassetid://7361257051"
Sound.Volume = 1
Sound.PlayOnRemove = true
Sound.Parent = game:GetService("SoundService")
Sound:Destroy()

Frame.Size = UDim2.new(0, 220, 0, 180)
Frame.Position = UDim2.new(0.35, 0, 0.35, 0)
Frame.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Frame

UIStroke.Color = Color3.fromRGB(255, 0, 0)
UIStroke.Thickness = 2
UIStroke.Parent = Frame

TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.BackgroundTransparency = 1
TitleBar.Text = "😍 PRETTY CASSY 😊"
TitleBar.Font = Enum.Font.GothamBold
TitleBar.TextSize = 16
TitleBar.TextColor3 = Color3.fromRGB(255, 200, 200)
TitleBar.Parent = Frame

CashToggle.Size = UDim2.new(0, 200, 0, 40)
CashToggle.Position = UDim2.new(0, 10, 0, 40)
CashToggle.Text = "Cash Farm: OFF"
CashToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
CashToggle.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
CashToggle.Font = Enum.Font.GothamBold
CashToggle.TextSize = 14
CashToggle.Parent = Frame
CashToggle.Visible = false

CashTimerLabel.Size = UDim2.new(0, 200, 0, 25)
CashTimerLabel.Position = UDim2.new(0, 10, 0, 85)
CashTimerLabel.BackgroundTransparency = 1
CashTimerLabel.Text = "Timer: 00:00"
CashTimerLabel.Font = Enum.Font.Gotham
CashTimerLabel.TextSize = 14
CashTimerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CashTimerLabel.TextXAlignment = Enum.TextXAlignment.Left
CashTimerLabel.Parent = Frame
CashTimerLabel.Visible = false

ExpToggle.Size = UDim2.new(0, 200, 0, 40)
ExpToggle.Position = UDim2.new(0, 10, 0, 115)
ExpToggle.Text = "Exp Farm: OFF"
ExpToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
ExpToggle.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
ExpToggle.Font = Enum.Font.GothamBold
ExpToggle.TextSize = 14
ExpToggle.Parent = Frame

local ExpNote = Instance.new("TextLabel")
ExpNote.Size = UDim2.new(1, 0, 0, 15)
ExpNote.Position = UDim2.new(0, 0, 1, -20) -- stick it near bottom
ExpNote.BackgroundTransparency = 1
ExpNote.Text = "Not for sale. Only for Cassy!!"
ExpNote.TextColor3 = Color3.fromRGB(180, 180, 180)
ExpNote.TextScaled = false
ExpNote.Font = Enum.Font.SourceSansItalic
ExpNote.TextSize = 14
ExpNote.Parent = Frame

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

                if CashTime >= 850 then
                    CashFarming = false
                    CashToggle.Text = "Cash Farm: OFF"
                    CashToggle.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
                    CashTimerLabel.Visible = false

                    for i = 5,1,-1 do
                        CashTimerLabel.Visible = true
                        CashTimerLabel.Text = "Disconnecting in " .. i .. "s"
                        task.wait(1)
                    end
                    LocalPlayer:Kick("Tapos na, change account kana.")
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
                local args = {{
                    Value = 3,
                    Password = 229271937
                }}
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
