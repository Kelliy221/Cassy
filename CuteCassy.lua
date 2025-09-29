local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer

local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local RecieveCoin = Remotes:WaitForChild("RecieveCoin")
local RecieveExp = Remotes:WaitForChild("RecieveExp")

pcall(function()
    StarterGui:SetCore("SendNotification", {
        Title = "😍 PRETTY CASSY 😊",
        Text = "Script Loaded Successfully ❤️",
        Duration = 5
    })
end)

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TitleBar = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local CashToggle = Instance.new("TextButton")
local ExpToggle = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui

Frame.Size = UDim2.new(0, 220, 0, 150)
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

ExpToggle.Size = UDim2.new(0, 200, 0, 40)
ExpToggle.Position = UDim2.new(0, 10, 0, 90)
ExpToggle.Text = "Exp Farm: OFF"
ExpToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
ExpToggle.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
ExpToggle.Font = Enum.Font.GothamBold
ExpToggle.TextSize = 14
ExpToggle.Parent = Frame

local CashFarming = false
local ExpFarming = false

CashToggle.MouseButton1Click:Connect(function()
	CashFarming = not CashFarming
	if CashFarming then
		CashToggle.Text = "Cash Farm: ON"
		CashToggle.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
		task.spawn(function()
			while CashFarming do
				local args = {
					{
						Password = 5486964568496,
						Value = 300,
						PassengerValues = workspace:WaitForChild("Jeepnies"):WaitForChild("envy18sha"):WaitForChild("PassengerValues")
					}
				}
				RecieveCoin:FireServer(unpack(args))
				task.wait(0.25)
			end
		end)
	else
		CashToggle.Text = "Cash Farm: OFF"
		CashToggle.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
	end
end)

ExpToggle.MouseButton1Click:Connect(function()
	ExpFarming = not ExpFarming
	if ExpFarming then
		ExpToggle.Text = "Exp Farm: ON"
		ExpToggle.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
		task.spawn(function()
			while ExpFarming do
				local args = {
					{
						Value = 3,
						Password = 229271937
					}
				}
				RecieveExp:FireServer(unpack(args))
				task.wait(0.25)
			end
		end)
	else
		ExpToggle.Text = "Exp Farm: OFF"
		ExpToggle.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
	end
end)    coinEnabled = not coinEnabled
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
