local remotes = game:GetService("ReplicatedStorage"):WaitForChild("Remotes")
local recieveExp = remotes:WaitForChild("RecieveExp")
local recieveCoin = remotes:WaitForChild("RecieveCoin")

local function notify(title, text, duration)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = duration or 3
        })
    end)
end

notify("😍 PRETTY CASSY 😊", "PARA KAY CASSY LANG TO!😊", 5)

recieveExp:FireServer({
    Value = 3,
    Password = 229271937
})
notify("RecieveExp", "EXP EXP!!!", 3)

-- // GUI
local player = game:GetService("Players").LocalPlayer
local ScreenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 240, 0, 160)
Frame.Position = UDim2.new(0.3, 0, 0.3, 0)
Frame.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
Title.Text = "😍 PRETTY CASSY 😊" 
Title.TextColor3 = Color3.new(1, 1, 1)

local coinEnabled = false
local CoinBtn = Instance.new("TextButton", Frame)
CoinBtn.Size = UDim2.new(0.9, 0, 0, 40)
CoinBtn.Position = UDim2.new(0.05, 0, 0.35, 0)
CoinBtn.Text = "Auto Paldo"
CoinBtn.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
CoinBtn.TextColor3 = Color3.new(1, 1, 1)

CoinBtn.MouseButton1Click:Connect(function()
    coinEnabled = not coinEnabled
    if coinEnabled then
        CoinBtn.Text = "Pahinga"
        CoinBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
        notify("RecieveCoin", "Paldo Paldo!!", 3)
    else
        CoinBtn.Text = "Auto Paldo"
        CoinBtn.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
        notify("RecieveCoin", "Pahinga muna", 3)
    end
end)

task.spawn(function()
    while true do
        if coinEnabled then
            recieveCoin:FireServer({
                Password = 5486964568496,
                Value = 300,
                PassengerValues = workspace:WaitForChild("Jeepnies"):WaitForChild("EVladSend2"):WaitForChild("PassengerValues")
            })
        end
        task.wait(0.25)
    end
end)
