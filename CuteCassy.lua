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

notify("😍 PRETTY CASSY 😊", "Para kay Cassy lang to!!!", 5)

local player = game:GetService("Players").LocalPlayer
local ScreenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 240, 0, 160)
Frame.Position = UDim2.new(0.3, 0, 0.3, 0)
Frame.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local coinEnabled = false
local CoinBtn = Instance.new("TextButton", Frame)
CoinBtn.Size = UDim2.new(0.9, 0, 0, 40)
CoinBtn.Position = UDim2.new(0.05, 0, 0.15, 0)
CoinBtn.Text = "PINDOT PARA CASH"
CoinBtn.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
CoinBtn.TextColor3 = Color3.new(1, 1, 1)

CoinBtn.MouseButton1Click:Connect(function()
    coinEnabled = not coinEnabled
    if coinEnabled then
        CoinBtn.Text = "AUTO PALDO"
        CoinBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
        notify("CASHFARM", "PALDO NANAMAN!", 3)
    else
        CoinBtn.Text = "PAHINGA"
        CoinBtn.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
        notify("CASHFARM", "PAHINGA", 3)
    end
end)

local expEnabled = false
local ExpBtn = Instance.new("TextButton", Frame)
ExpBtn.Size = UDim2.new(0.9, 0, 0, 40)
ExpBtn.Position = UDim2.new(0.05, 0, 0.55, 0)
ExpBtn.Text = "PINDOT PARA EXP"
ExpBtn.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
ExpBtn.TextColor3 = Color3.new(1, 1, 1)

ExpBtn.MouseButton1Click:Connect(function()
    expEnabled = not expEnabled
    if expEnabled then
        ExpBtn.Text = "EXP FARM"
        ExpBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
        notify("Exp FARM", "EXP EXP!!!", 3)
    else
        ExpBtn.Text = "STOP EXP"
        ExpBtn.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
        notify("EXP FARM", "NO MORE EXP", 3)
    end
end)

task.spawn(function()
    while true do
        if coinEnabled then
            local args = {
                {
                    Password = 5486964568496,
                    Value = 300,
                    PassengerValues = workspace:WaitForChild("Jeepnies"):WaitForChild("EVladSend2"):WaitForChild("PassengerValues")
                }
            }
            recieveCoin:FireServer(unpack(args))
        end
        task.wait(0.25)
    end
end)

task.spawn(function()
    while true do
        if expEnabled then
            recieveExp:FireServer({
                Value = 3,
                Password = 229271937
            })
        end
        task.wait(0.25)
    end
end)
