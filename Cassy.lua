local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("AutoCash", "Ocean")

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
TimerLabel = Autofarm:NewLabel("00:00")    until success and result
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
                remote:FireServer(unpack(args))
            end)
            task.wait(fireDelay)
        end
    end)()
end

-- // Timer Function
local function startTimer()
    coroutine.wrap(function()
        while autoFarmEnabled do
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
        startTimer()
    end
end)

-- // Timer Label
TimerLabel = Autofarm:NewLabel("00:00")local AutoFarmTab = Window:Tab({Title = "Auto Farm", Icon = "play"})

-- // Services
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("RecieveCoin")

-- // Variables
local autoFarmEnabled = false
local fireDelay = 0.25 -- faster
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
                Password = 13323233,
                Value = 300,
                PassengerValues = PassengerValues
            }}
            pcall(function()
                remote:FireServer(unpack(args))
            end)
            task.wait(fireDelay)
        end
    end)()
end

-- // Timer Function
local function startTimer()
    coroutine.wrap(function()
        while autoFarmEnabled do
            task.wait(1)
            seconds += 1
            if TimerLabel then
                TimerLabel:SetText(formatTime(seconds))
            end
        end
    end)()
end

-- // Toggle
AutoFarmTab:Toggle({
    Title = "Start Auto Farm",
    Callback = function(value)
        autoFarmEnabled = value
        if value then
            seconds = 0
            if TimerLabel then
                TimerLabel:SetText("00:00")
            end
            runAutoFarm()
            startTimer()
        end
    end,
    Enabled = false
})

-- // Timer Label
TimerLabel = AutoFarmTab:Label({
    Title = "00:00"
})
