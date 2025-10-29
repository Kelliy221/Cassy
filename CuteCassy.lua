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

local CashToggle = Instance.new("TextButton")
CashToggle.Size = UDim2.new(1, 0, 0, 40)
CashToggle.Position = UDim2.new(0, 0, 0, 0)
CashToggle.Text = "Cash Farm: OFF"
CashToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
CashToggle.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
CashToggle.Font = Enum.Font.GothamBold
CashToggle.TextSize = 14
CashToggle.Parent = FarmFrame
CashToggle.Visible = true

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

local Malolos = Instance.new("TextButton")
Malolos.Size = UDim2.new(0.48, 0, 0, 40)
Malolos.Position = UDim2.new(0, 0, 0, 75)
Malolos.Text = "Malolos Terminal"
Malolos.TextColor3 = Color3.fromRGB(255, 255, 255)
Malolos.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
Malolos.Font = Enum.Font.GothamBold
Malolos.TextSize = 14
Malolos.Parent = FarmFrame

local Guiginto = Instance.new("TextButton")
Guiginto.Size = UDim2.new(0.48, 0, 0, 40)
Guiginto.Position = UDim2.new(0.52, 0, 0, 75)
Guiginto.Text = "Guiginto Terminal"
Guiginto.TextColor3 = Color3.fromRGB(255, 255, 255)
Guiginto.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
Guiginto.Font = Enum.Font.GothamBold
Guiginto.TextSize = 14
Guiginto.Parent = FarmFrame

Malolos.MouseButton1Click:Connect(function()
    local Players = game:GetService("Players")
local player = Players.LocalPlayer
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

Guiginto.MouseButton1Click:Connect(function()
    local Players = game:GetService("Players")
local player = Players.LocalPlayer
local targetPosition = Vector3.new(1023, 13, 3185)

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
ExpNote.Text = "Not for sale. Only for Cassy!!"
ExpNote.TextColor3 = Color3.fromRGB(180, 180, 180)
ExpNote.Font = Enum.Font.SourceSansItalic
ExpNote.TextSize = 14
ExpNote.Parent = FarmFrame

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

local AutobuyFrame = Instance.new("Frame")
AutobuyFrame.Size = UDim2.new(1, -20, 1, -70)
AutobuyFrame.Position = UDim2.new(0, 10, 0, 65)
AutobuyFrame.BackgroundTransparency = 1
AutobuyFrame.Visible = false
AutobuyFrame.Parent = Tabs

local AddExp = Instance.new("TextButton")
AddExp.Size = UDim2.new(1, 0, 0, 40)
AddExp.Text = "Add Exp (Visual)"
AddExp.TextColor3 = Color3.fromRGB(255, 255, 255)
AddExp.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
AddExp.Font = Enum.Font.GothamBold
AddExp.TextSize = 14
AddExp.Parent = AutobuyFrame

local Sarao = Instance.new("TextButton")
Sarao.Size = UDim2.new(1, 0, 0, 40)
Sarao.Position = UDim2.new(0, 0, 0, 45)
Sarao.Text = "Buy V2 Parts"
Sarao.TextColor3 = Color3.fromRGB(255, 255, 255)
Sarao.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
Sarao.Font = Enum.Font.GothamBold
Sarao.TextSize = 14
Sarao.Parent = AutobuyFrame

local LongJeep = Instance.new("TextButton")
LongJeep.Size = UDim2.new(1, 0, 0, 40)
LongJeep.Position = UDim2.new(0, 0, 0, 90)
LongJeep.Text = "Buy V3 Parts"
LongJeep.TextColor3 = Color3.fromRGB(255, 255, 255)
LongJeep.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
LongJeep.Font = Enum.Font.GothamBold
LongJeep.TextSize = 14
LongJeep.Parent = AutobuyFrame

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

local CashFarming = false
local runThread
local stopRequested = false
local CashTime = 0

local function setUIState(enabled)
    CashToggle.Text = "Cash Farm: " .. (enabled and "ON" or "OFF")
    CashTimerLabel.Visible = enabled
end

CashToggle.MouseButton1Click:Connect(function()
    CashFarming = not CashFarming
    if CashFarming then
        stopRequested = false
        setUIState(true)
        if not runThread or coroutine.status(runThread) == "dead" then
            runThread = coroutine.create(function()
                local ReplicatedStorage_local = ReplicatedStorage
                local Workspace_local = Workspace
                local Players_local = Players
                local LocalPlayer = player
                local RecieveCoin = (ReplicatedStorage_local:FindFirstChild("Remotes") and ReplicatedStorage_local.Remotes:FindFirstChild("RecieveCoin")) or ReplicatedStorage_local:FindFirstChild("RecieveCoin")
                local currentPassword = 339098808
                local passwordFound = false
                local remoteName = "PassengerChatted"
                local Remote = (ReplicatedStorage_local:FindFirstChild("Remotes") and ReplicatedStorage_local.Remotes:FindFirstChild(remoteName)) or ReplicatedStorage_local:FindFirstChild(remoteName)
                
                if not RecieveCoin or not Remote then
                end

                local function getPassengerValues()
                    local jeepnies = Workspace_local:FindFirstChild("Jeepnies")
                    if jeepnies then
                        local playerFolder = jeepnies:FindFirstChild(LocalPlayer.Name) or jeepnies:FindFirstChild(tostring(LocalPlayer.UserId))
                        if playerFolder then
                            local passengerValues = playerFolder:FindFirstChild("PassengerValues")
                            if passengerValues then
                                return passengerValues
                            end
                        end
                    end
                    return nil
                end

                local function findPasswordInObjects()
                    local possibleLocations = {LocalPlayer.PlayerGui, LocalPlayer.PlayerScripts, Workspace_local, ReplicatedStorage_local}
                    for _, location in pairs(possibleLocations) do
                        if not location then continue end
                        for _, obj in pairs(location:GetDescendants()) do
                            if obj:IsA("IntValue") or obj:IsA("NumberValue") or obj:IsA("StringValue") then
                                local value = obj.Value
                                if type(value) == "number" and value > 1000 then
                                    return value
                                end
                            end
                        end
                    end
                    return nil
                end
                
                local hookedRemotes = {}
                local function hookRemoteEvent(remote)
                    if not remote or not remote.Name then return end
                    if hookedRemotes[remote] then return end
                    hookedRemotes[remote] = true
                    if remote.Name ~= "RecieveCoin" and remote:IsA("RemoteEvent") then
                        remote.OnClientEvent:Connect(function(...)
                            local args = {...}
                            for _, arg in ipairs(args) do
                                if type(arg) == "number" and arg > 1000 then
                                    currentPassword = arg
                                    passwordFound = true
                                end
                            end
                        end)
                    end
                end
                
                pcall(function()
                    if ReplicatedStorage_local:FindFirstChild("Remotes") then
                        for _, obj in pairs(ReplicatedStorage_local.Remotes:GetChildren()) do
                            if obj:IsA("RemoteEvent") then
                                hookRemoteEvent(obj)
                            elseif obj:IsA("RemoteFunction") then
                                hookRemoteFunction(obj)
                            end
                        end
                    end
                end)
                
                local mt, oldNamecall
                local namecallAttached = false
                pcall(function()
                    mt = getrawmetatable(game)
                    if mt then
                        oldNamecall = mt.__namecall
                        setreadonly(mt, false)
                        mt.__namecall = function(self, ...)
                            local method = getnamecallmethod()
                            if tostring(self) == remoteName and method == "FireServer" then
                                local args = {...}
                                while CashFarming do
                                    local success, err = pcall(function()
                                        if Remote and Remote.FireServer then
                                            Remote:FireServer(table.unpack(args))
                                        end
                                    end)
                                    if not success then break end
                                    task.wait(0.25)
                                end
                            end
                            return oldNamecall(self, ...)
                        end
                        setreadonly(mt, true)
                        namecallAttached = true
                    end
                end)
                
                while CashFarming and not stopRequested do
                    local passengerValues = getPassengerValues()
                    if not passwordFound then
                        local foundPassword = findPasswordInObjects()
                        if foundPassword then
                            currentPassword = foundPassword
                            passwordFound = true
                        end
                    end

                    if not passwordFound then
                        local testPasswords = {os.time(), LocalPlayer.UserId, currentPassword + 1}
                        for _, testPass in ipairs(testPasswords) do
                            if stopRequested or (not CashFarming) then break end
                            if passengerValues then
                                local ok = pcall(function()
                                    if RecieveCoin and RecieveCoin.FireServer then
                                        RecieveCoin:FireServer({
                                            Value = 300,
                                            PassengerValues = passengerValues,
                                            Main = true,
                                            Password = testPass
                                        })
                                    end
                                end)
                                if ok then
                                    currentPassword = testPass
                                    passwordFound = true
                                    break
                                end
                            end
                            task.wait(0.0001)
                        end
                    end

                    if stopRequested or (not CashFarming) then break end

                    if passengerValues then
                        pcall(function()
                            if RecieveCoin and RecieveCoin.FireServer then
                                RecieveCoin:FireServer({
                                    Value = 300,
                                    PassengerValues = passengerValues,
                                    Main = true,
                                    Password = currentPassword
                                })
                            end
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
        setUIState(false)
    end
end)

task.spawn(function()
    local lastTime = tick()
    while true do
        if CashFarming and not stopRequested then
            local now = tick()
            CashTime += (now - lastTime)
            CashTimerLabel.Text = "Timer: " .. formatTime(CashTime)
            lastTime = now
        else
            lastTime = tick()
        end
        task.wait(0.1)
    end
end)

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
    local Target = gplr(1)
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
    lp.Character:BreakJoints()
end)

AddExp.MouseButton1Click:Connect(function()
    local exp = player:WaitForChild("leaderstats"):WaitForChild("Exp")
    exp.Value = 20000
    StarterGui:SetCore("SendNotification", {Title = "EXP 20K VISUAL", Text = "Visual EXP added!", Duration = 5})
end)

Sarao.MouseButton1Click:Connect(function()
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local gui = player:WaitForChild("PlayerGui"):WaitForChild("Screen"):WaitForChild("Frames")

    local function click(btn)
        if btn and (btn:IsA("TextButton") or btn:IsA("ImageButton")) then
            firesignal(btn.MouseButton1Down)
            firesignal(btn.MouseButton1Click)
            firesignal(btn.MouseButton1Up)
        end
    end

    local function delayClick(btn, t)
        task.wait(t)
        click(btn)
    end

    click(gui.Shop.Frame.ScrollingFrame.List["Sarao Custombuilt Model 2"])
    task.wait(0.75)
    click(gui.Shop.Frame.Desc.Customize)
    task.wait(0.75)
    click(gui.Customize.Frame.ButtonsList.List.Parts)
    task.wait(0.65)
    
    local path = gui

    local buttons = {
        path.Customize.Frame.Elements.Parts.Engines["4JK1"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.Engines["4JJ1"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.Transmissions["5-Speed Manual"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.Transmissions["6-Speed Manual"], path.Customize.Frame.Desc.Buy, path.Customize.Frame.Desc.Equip,
        path.Customize.Frame.Elements.Parts.Radiators["R - 02"], path.Customize.Frame.Desc.Buy, path.Customize.Frame.Desc.Equip,
        path.Customize.Frame.Elements.Parts.Brakes["B - 02"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.Brakes["B - 03"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.Brakes["B - 04"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.Brakes["B - 05"], path.Customize.Frame.Desc.Buy, path.Customize.Frame.Desc.Equip,
        path.Customize.Frame.Elements.Parts.Tires["T - 02"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.Tires["T - 03"], path.Customize.Frame.Desc.Buy, path.Customize.Frame.Desc.Equip,
        path.Customize.Frame.Elements.Parts.Tires["T - 04"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.Tires["T - 05"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.Batteries["BA - 02"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.Batteries["BA - 03"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.Batteries["BA - 04"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.Batteries["BA - 05"], path.Customize.Frame.Desc.Buy, path.Customize.Frame.Desc.Equip,
        path.Customize.Frame.Elements.Parts.EngineOils["EO - 02"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.EngineOils["EO - 03"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.EngineOils["EO - 04"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.EngineOils["EO - 05"], path.Customize.Frame.Desc.Buy, path.Customize.Frame.Desc.Equip,
        path.Customize.Frame.Elements.Parts.Coolants["C - 02"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.Coolants["C - 03"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.Coolants["C - 04"], path.Customize.Frame.Desc.Buy, path.Customize.Frame.Desc.Equip,
        path.Customize.Frame.Elements.Parts.TransmissionOils["TO - 02"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.TransmissionOils["TO - 03"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.TransmissionOils["TO - 04"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.TransmissionOils["TO - 05"], path.Customize.Frame.Desc.Buy, path.Customize.Frame.Desc.Equip,
        path.Customize.Frame.Elements.Parts.BrakeFluids["BF - 02"], path.Customize.Frame.Desc.Buy, path.Customize.Frame.Desc.Equip,
        path.Customize.Frame.Elements.Parts.Differentials["D - 01"], path.Customize.Frame.Desc.Buy, path.Customize.Frame.Desc.Equip,
        path.Customize.Frame.Elements.Parts.Clutches["CL - 02"], path.Customize.Frame.Desc.Buy, path.Customize.Frame.Desc.Equip
    }

    for _, button in ipairs(buttons) do
        delayClick(button, 0.75)
    end
end)

LongJeep.MouseButton1Click:Connect(function()
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local gui = player:WaitForChild("PlayerGui"):WaitForChild("Screen"):WaitForChild("Frames")

    local function click(btn)
        if btn and (btn:IsA("TextButton") or btn:IsA("ImageButton")) then
            firesignal(btn.MouseButton1Down)
            firesignal(btn.MouseButton1Click)
            firesignal(btn.MouseButton1Up)
        end
    end

    local function delayClick(btn, t)
        task.wait(t)
        click(btn)
    end

    click(gui.Shop.Frame.ScrollingFrame.List["DF Devera Long Model"])
    task.wait(0.75)
    click(gui.Shop.Frame.Desc.Customize)
    task.wait(0.75)
    click(gui.Customize.Frame.ButtonsList.List.Parts)
    task.wait(0.75)
    
    local path = gui

    local buttons = {
        path.Customize.Frame.Elements.Parts.Engines["4JK1"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.Engines["4JJ1"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.Transmissions["5-Speed Manual"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.Transmissions["6-Speed Manual"], path.Customize.Frame.Desc.Buy, path.Customize.Frame.Desc.Equip,
        path.Customize.Frame.Elements.Parts.Radiators["R - 02"], path.Customize.Frame.Desc.Buy, path.Customize.Frame.Desc.Equip,
        path.Customize.Frame.Elements.Parts.Brakes["B - 02"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.Brakes["B - 03"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.Brakes["B - 04"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.Brakes["B - 05"], path.Customize.Frame.Desc.Buy, path.Customize.Frame.Desc.Equip,
        path.Customize.Frame.Elements.Parts.Tires["T - 02"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.Tires["T - 03"], path.Customize.Frame.Desc.Buy, path.Customize.Frame.Desc.Equip,
        path.Customize.Frame.Elements.Parts.Tires["T - 04"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.Tires["T - 05"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.Batteries["BA - 02"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.Batteries["BA - 03"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.Batteries["BA - 04"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.Batteries["BA - 05"], path.Customize.Frame.Desc.Buy, path.Customize.Frame.Desc.Equip,
        path.Customize.Frame.Elements.Parts.EngineOils["EO - 02"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.EngineOils["EO - 03"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.EngineOils["EO - 04"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.EngineOils["EO - 05"], path.Customize.Frame.Desc.Buy, path.Customize.Frame.Desc.Equip,
        path.Customize.Frame.Elements.Parts.Coolants["C - 02"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.Coolants["C - 03"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.Coolants["C - 04"], path.Customize.Frame.Desc.Buy, path.Customize.Frame.Desc.Equip,
        path.Customize.Frame.Elements.Parts.TransmissionOils["TO - 02"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.TransmissionOils["TO - 03"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.TransmissionOils["TO - 04"], path.Customize.Frame.Desc.Buy,
        path.Customize.Frame.Elements.Parts.TransmissionOils["TO - 05"], path.Customize.Frame.Desc.Buy, path.Customize.Frame.Desc.Equip,
        path.Customize.Frame.Elements.Parts.BrakeFluids["BF - 02"], path.Customize.Frame.Desc.Buy, path.Customize.Frame.Desc.Equip,
        path.Customize.Frame.Elements.Parts.Differentials["D - 01"], path.Customize.Frame.Desc.Buy, path.Customize.Frame.Desc.Equip,
        path.Customize.Frame.Elements.Parts.Clutches["CL - 02"], path.Customize.Frame.Desc.Buy, path.Customize.Frame.Desc.Equip
    }

    for _, button in ipairs(buttons) do
        delayClick(button, 0.75)
    end
end)

LocalPlayer.CharacterAdded:Connect(function()
    CashTime = 0
    CashTimerLabel.Text = "Timer: 00:00"

end)
