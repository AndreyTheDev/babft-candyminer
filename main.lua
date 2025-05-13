-- Instances:

local co = Instance.new("ScreenGui")
local main = Instance.new("Frame")
local title = Instance.new("TextLabel")
local yes = Instance.new("TextLabel")
local btn = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local ee = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local closeBtn = Instance.new("TextButton") 

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
main.Selectable = true

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

closeBtn.Name = "closeBtn"
closeBtn.Parent = main
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255) 
closeBtn.BackgroundTransparency = 1
closeBtn.Position = UDim2.new(0.899999917, 0, 0, 2)
closeBtn.Size = UDim2.new(0, 35, 0, 35)
closeBtn.Font = Enum.Font.SourceSans
closeBtn.Text = "×" 
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255) 
closeBtn.TextSize = 20.000
closeBtn.TextWrapped = true
closeBtn.TextScaled = true


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
	local closeBtn = main.closeBtn
	
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
		Duration = 15,
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
                    task.wait(0.2) 
                elseif house.Name == "TrickOrVisitedHouse" then
                    task.wait(10)
                    
                    if house:IsDescendantOf(workspace) then
                        teleportToHouse(house)
                    end
                    return 
                end
            end
        else
            player.Character:WaitForChild("Humanoid").WalkSpeed = 16
        end
    end

	
	function mininggg()
        local NotificationBindableStart = Instance.new("BindableFunction")
		game.StarterGui:SetCore("SendNotification", {
			Title = "✨ Babft candy autofarm",
			Text = "Mining started! 💎",
			Duration = 3,
			Callback = NotificationBindableStart;
		})
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
            local NotificationBindableStop = Instance.new("BindableFunction")
			game.StarterGui:SetCore("SendNotification", {
				Title = "✨ Babft candy autofarm",
				Text = "Mining stopped! 🛑",
				Duration = 3,
				Callback = NotificationBindableStop;
			})
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
        local tween = game:GetService("TweenService"):Create(main, tweenInfo, {
            Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        })
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

    game:GetService("RunService").Heartbeat:Connect(function()
        if dragging and dragInput then
            update(dragInput)
        end
    end)

	closeBtn.MouseButton1Click:Connect(function()
		local NotificationBindable2 = Instance.new("BindableFunction")
		
		NotificationBindable2.OnInvoke = function(option)
			if option == "Yes" then
				game.StarterGui:SetCore("SendNotification", {
					Title = "✨ Babft candy autofarm",
					Text = "Closing...",
					Duration = 3,
					Callback = NotificationBindable2;
				})
                task.wait(0.3)
                main.Visible = false
                miningState = 1
                mining()
                task.wait(2)
                game.StarterGui:SetCore("SendNotification", {
					Title = "✨ Babft candy autofarm",
					Text = "Closed",
					Duration = 3,
					Callback = NotificationBindable2;
				})
                task.wait(0.2)
				co:Destroy() 
			elseif option == "No" then
				game.StarterGui:SetCore("SendNotification", {
					Title = "✨ Babft candy autofarm",
					Text = "ok",
					Duration = 3,
					Callback = NotificationBindable2;
				})
			end
		end
		
		game.StarterGui:SetCore("SendNotification", {
			Title = "✨ Babft candy autofarm",
			Text = "Are you sure?",
			Duration = 10,
			Callback = NotificationBindable2,
			Button1 = "Yes",
			Button2 = "No"
		})
	end)
	
	task.wait(2)
    print("✨ BABFT CANDY AUTOFARM BY ANDREYTHEDEV [v0.1.4]")
	tit.Text = "skbidi babft candy autofarm [v0.1.4]"
	text.Text = "🎉 Script loaded! Now you can press start to start mining candys !!! "
	btn.Text = "Start"
	
	btn.MouseButton1Click:Connect(mining)
end
coroutine.wrap(WGCZKS_fake_script)()
