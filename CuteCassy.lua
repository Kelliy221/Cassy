local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("HAPPY BIRTHDAY CASSY!!", "Ocean")

-- // Tabs & Sections
local AutoFarmTab = Window:NewTab("AutoFarm")
local ExpFarmTab = Window:NewTab("ExpFarm")
local Autofarm = AutoFarmTab:NewSection("AutoFarm")
local ExpFarm = ExpFarmTab:NewSection("ExpFarm")

-- // Services
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- // Remotes
local coinRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("RecieveCoin")
local expRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("RecieveExp")

-- // Variables
local autoFarmEnabled = false
local autoExpEnabled = false
local fireDelay = 0.21
local seconds = 0
local TimerLabel

-- // Format Time
local function formatTime(sec)
    local minutes = math.floor(sec / 60)
    local secs = sec % 60
    return string.format("%02d:%02d", minutes, secs)
end

-- // Safe Get PassengerValues
local function getPassengerValues()
    local success, result
    repeat
        success, result = pcall(function()
            return workspace:WaitForChild("Jeepnies")
                :WaitForChild(player.Name)
                :WaitForChild("PassengerValues")
        end)
        task.wait(0.5)
    until success and result
    return result
end

local PassengerValues = getPassengerValues()

-- // AutoFarm Function
local function runAutoFarm()
    coroutine.wrap(function()
        while autoFarmEnabled do
            local args = {{
                Password = 4723847423023,
                Value = 300,
                PassengerValues = PassengerValues
            }}
            pcall(function()
                coinRemote:FireServer(unpack(args))
            end)
            task.wait(fireDelay)
        end
    end)()
end

-- // Autofarm Function Exp
local function runAutoFarmExp()
    coroutine.wrap(function()
        while autoExpEnabled do
            local args = {{
                Value = 3,
                Password = 229271937,
            }}
            pcall(function()
                expRemote:FireServer(unpack(args))
            end)
            task.wait(fireDelay)
        end
    end)()
end

-- // Timer Function
local function startTimer(mode)
    coroutine.wrap(function()
        while (mode == "cash" and autoFarmEnabled) or (mode == "exp" and autoExpEnabled) do
            task.wait(1)
            seconds += 1
            if TimerLabel then
                TimerLabel:UpdateLabel(formatTime(seconds))
            end
        end
    end)()
end

-- // Toggle Button
Autofarm:NewToggle("Start AutoFarm", "Farming Cash", function(state)
    autoFarmEnabled = state
    if state then
        seconds = 0
        if TimerLabel then
            TimerLabel:UpdateLabel("00:00")
        end
        runAutoFarm()
        startTimer("cash")
    end
end)

ExpFarm:NewToggle("Start ExpFarm", "Farming Exp", function(state)
    autoExpEnabled = state
    if state then
        seconds = 0
        if TimerLabel then
            TimerLabel:UpdateLabel("00:00")
        end
        runAutoFarmExp()
        startTimer("exp")
    end
end)

-- // Timer Label
TimerLabel = Autofarm:NewLabel("00:00")

-- // Make GUI draggable
local function makeDraggable(gui)
    local dragging, dragInput, dragStart, startPos

    local function update(input)
        local delta = input.Position - dragStart
        gui.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end

    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    gui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

-- // Apply draggable to the KavoUI main window
makeDraggable(game.CoreGui:WaitForChild("KavoUI").MainFrame)
