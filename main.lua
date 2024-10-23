-- Gui to Lua
-- Version: 3.2

-- Instances:

local co = Instance.new("ScreenGui")
local main = Instance.new("Frame")
local title = Instance.new("TextLabel")
local yes = Instance.new("TextLabel")
local btn = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local ee = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")

-- Properties:

co.Name = "co"
co.Parent = game:GetService("CoreGui")
co.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

main.Name = "main"
main.Parent = co
main.BackgroundColor3 = Color3.fromRGB(46, 46, 48)
main.BorderColor3 = Color3.fromRGB(27, 42, 53)
main.BorderSizePixel = 0
main.Position = UDim2.new(0.30842793, 0, 0.304961115, 0)
main.Size = UDim2.new(0, 401, 0, 229)

title.Name = "title"
title.Parent = main
title.BackgroundColor3 = Color3.fromRGB(206, 206, 206)
title.BackgroundTransparency = 1.030
title.BorderColor3 = Color3.fromRGB(27, 42, 53)
title.Position = UDim2.new(0.194999993, 0, 0.0199999996, 0)
title.Size = UDim2.new(0, 252, 0, 31)
title.Font = Enum.Font.SourceSansBold
title.Text = "wait"
title.TextColor3 = Color3.fromRGB(248, 248, 248)
title.TextSize = 22.000
title.TextWrapped = true

yes.Name = "yes"
yes.Parent = main
yes.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
yes.BackgroundTransparency = 1.000
yes.BorderColor3 = Color3.fromRGB(27, 42, 53)
yes.BorderSizePixel = 0
yes.Position = UDim2.new(0.0792421997, 0, 0.175324947, 0)
yes.Size = UDim2.new(0, 336, 0, 133)
yes.Font = Enum.Font.SourceSans
yes.Text = "wait"
yes.TextColor3 = Color3.fromRGB(248, 248, 248)
yes.TextScaled = false
yes.TextSize = 26.000
yes.TextTransparency = 0.570
yes.TextWrapped = true

btn.Name = "btn"
btn.Parent = main
btn.BackgroundColor3 = Color3.fromRGB(223, 223, 223)
btn.BorderColor3 = Color3.fromRGB(27, 42, 53)
btn.Position = UDim2.new(0.0470851995, 0, 0.783673525, 0)
btn.Size = UDim2.new(0, 360, 0, 35)
btn.Font = Enum.Font.SourceSans
btn.Text = "wait"
btn.TextColor3 = Color3.fromRGB(46, 46, 48)
btn.TextSize = 25.000
btn.TextWrapped = true

UICorner.Parent = btn

ee.Name = "ee"
ee.Parent = main
ee.BackgroundColor3 = Color3.fromRGB(206, 206, 206)
ee.BorderColor3 = Color3.fromRGB(206, 206, 206)
ee.Position = UDim2.new(0.0617858432, 0, 0.178741589, 0)
ee.Size = UDim2.new(0, 360, 0, 0)

UICorner_2.Parent = main

-- Scripts:

local function WGCZKS_fake_script() -- co.main.lua 
	local script = Instance.new('LocalScript', co)

	local tween = game:GetService("TweenService")
	local players = game:GetService("Players")
	local runService = game:GetService("RunService")
	local userInput = game:GetService("UserInputService")
	
	local main = script.Parent.main
	local btn = main.btn
	local tit = main.title
	local text = main.yes
	
	local player = players.LocalPlayer
	local miningState = 0
	local guiVisible = true
	
	local NotificationBindable = Instance.new("BindableFunction")
	game.StarterGui:SetCore("SendNotification", {
		Title = "✨ Babft candy autofarm",
		Text = "Press HOME to hide/show the UI",
		Duration = 10,
		Callback = NotificationBindable;
	})

    local NotificationBindable1 = Instance.new("BindableFunction")
	game.StarterGui:SetCore("SendNotification", {
		Title = ":3",
		Text = "Script made by AndreyTheDev! ✨",
		Duration = 5,
		Callback = NotificationBindable1;
	})

	function teleportToHouse(house)
		local door = house:FindFirstChild("Door")
		if door then
			local doorInnerTorch = door:FindFirstChild("DoorInnerTouch")
			if doorInnerTorch and doorInnerTorch:IsA("BasePart") then  
				local character = player.Character or player.CharacterAdded:Wait()
				local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
				humanoidRootPart.CFrame = doorInnerTorch.CFrame  
				house.Name = "TrickOrVisitedHouse" 
			else
				warn("DoorInnerTouch is not a valid part or doesn't exist!")
			end
		else
			warn("Door not found!")
		end
	end

	function findAndTeleport()
		local houses = workspace:FindFirstChild("Houses")
		if houses then
			for _, house in ipairs(houses:GetChildren()) do
				if house.Name == "TrickOrTreatHouse" then
					teleportToHouse(house)
					task.wait(2) 
				end
			end
		else
			player.character:WaitForChild("Humanoid").walkspeed = 16
		end
	end
	
	function mininggg()
		while miningState == 1 do
			findAndTeleport()
			task.wait(2) 
		end
	end
	
	function mining()
		if miningState == 0 then
			miningState = 1
			btn.Text = "Stop"
			mininggg()
		else
			miningState = 0
			btn.Text = "Start"
		end
	end
	
	userInput.InputBegan:Connect(function(input)
		if input.KeyCode == Enum.KeyCode.Home then
			guiVisible = not guiVisible
			main.Visible = guiVisible
		end
	end)

-- <!-- Smooth Drag --!> --
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local tween = tween:Create(main, tweenInfo, {Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)})
		tween:Play()
	end
	
	main.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = main.Position
			
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	main.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)
	
	runService.Heartbeat:Connect(function()
		if dragging then
			update(dragInput)
		end
	end)
	
	task.wait(2)
    print("✨ BABFT CANDY AUTOFARM BY ANDREYTHEDEV [v0.1.2]")
	tit.Text = "babft candy autofarm [v0.1.2]"
	text.Text = "🎉 Script loaded! Now you can press start to start mining candys !!! "
	btn.Text = "Start"
	
	btn.MouseButton1Click:Connect(function()
		mining()
	end)
end
coroutine.wrap(WGCZKS_fake_script)()
