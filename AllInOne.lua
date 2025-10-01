local Ksv4allinonegui = Instance.new("ScreenGui")
Ksv4allinonegui.Name = "Ksv4allinonegui"
Ksv4allinonegui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0.3978873, 0, 0.4677778, 0)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.Position = UDim2.new(0.0516432, 0, 0.2144444, 0)
Frame.BorderSizePixel = 0
Frame.BackgroundColor3 = Color3.fromRGB(124, 124, 124)
Frame.Parent = Ksv4allinonegui

local UICorner = Instance.new("UICorner")
UICorner.Parent = Frame

local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 4
UIStroke.Parent = Frame

local TextLabel = Instance.new("TextLabel")
TextLabel.Size = UDim2.new(1, 0, 0.1187648, 0)
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BackgroundTransparency = 1
TextLabel.BorderSizePixel = 0
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.FontSize = Enum.FontSize.Size14
TextLabel.TextSize = 14
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.Text = "Ksv4 all in one gui"
TextLabel.TextWrapped = true
TextLabel.TextWrap = true
TextLabel.Font = Enum.Font.Sarpanch
TextLabel.TextScaled = true
TextLabel.Parent = Frame

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Size = UDim2.new(1, 0, 0.8812352, 0)
ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.Position = UDim2.new(0, 0, 0.1187648, 0)
ScrollingFrame.Active = true
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.XY
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.Parent = Frame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Wraps = true
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.Parent = ScrollingFrame

local buttonfunction = Instance.new("TextButton")
buttonfunction.Name = "buttonfunction"
buttonfunction.Visible = false
buttonfunction.Size = UDim2.new(0, 60, 0, 60)
buttonfunction.BorderColor3 = Color3.fromRGB(0, 0, 0)
buttonfunction.Position = UDim2.new(0, 0, -1e-07, 0)
buttonfunction.BorderSizePixel = 0
buttonfunction.BackgroundColor3 = Color3.fromRGB(76, 76, 76)
buttonfunction.FontSize = Enum.FontSize.Size14
buttonfunction.TextSize = 14
buttonfunction.TextColor3 = Color3.fromRGB(255, 255, 255)
buttonfunction.TextWrapped = true
buttonfunction.TextWrap = true
buttonfunction.Font = Enum.Font.Sarpanch
buttonfunction.TextScaled = true
buttonfunction.Parent = ScrollingFrame

local UIStroke1 = Instance.new("UIStroke")
UIStroke1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke1.Thickness = 2
UIStroke1.Parent = buttonfunction

local UICorner1 = Instance.new("UICorner")
UICorner1.Parent = buttonfunction

Ksv4allinonegui.Parent = game:GetService("CoreGui")
function newButton(name: string, functions: thread)
	local button = buttonfunction:Clone()
	button.Text = name
	button.Parent = ScrollingFrame
	button.Visible = true
	button.Name = name
	button.MouseButton1Click:Connect(function()
		functions()
	end)
end
local plr = game.Players.LocalPlayer
local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
local potionfarminprogress = false

newButton("Dummy Farm Gui", function() 
		local player = game.Players.LocalPlayer
		local gui = Instance.new("ScreenGui")
		local frame = Instance.new("Frame")
		local titleLabel = Instance.new("TextLabel")
		local startButton = Instance.new("TextButton")
		local playerDropdown = Instance.new("TextButton")
		local playerListFrame = Instance.new("Frame")
		local scrollingFrame = Instance.new("ScrollingFrame")
		local uiListLayout = Instance.new("UIListLayout")
		local distanceTextBox = Instance.new("TextBox")
		local distanceLabel = Instance.new("TextLabel")
		local distanceFrame = Instance.new("Frame")

		gui.Name = "ksv4guiv1"
		gui.Parent = game.CoreGui

		frame.Name = "MainFrame"
		frame.Parent = gui
		frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		frame.BorderSizePixel = 0
		frame.Position = UDim2.new(0.3, 0, 0.3, 0)
		frame.Size = UDim2.new(0, 250, 0, 500)
		frame.Active = true
		frame.Draggable = true

		titleLabel.Name = "TitleLabel"
		titleLabel.Parent = frame
		titleLabel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		titleLabel.BorderSizePixel = 0
		titleLabel.Size = UDim2.new(1, 0, 0, 50)
		titleLabel.Font = Enum.Font.SourceSansBold
		titleLabel.Text = "ksv4 dummy farm gui by lagrange"
		titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		titleLabel.TextSize = 14

		startButton.Name = "StartButton"
		startButton.Parent = frame
		startButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		startButton.BorderSizePixel = 0
		startButton.Position = UDim2.new(0.1, 0, 0.2, 0)
		startButton.Size = UDim2.new(0.8, 0, 0, 50)
		startButton.Font = Enum.Font.SourceSansBold
		startButton.Text = "Start bringing"
		startButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		startButton.TextSize = 18

		playerDropdown.Name = "PlayerDropdown"
		playerDropdown.Parent = frame
		playerDropdown.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		playerDropdown.BorderSizePixel = 0
		playerDropdown.Position = UDim2.new(0.1, 0, 0.4, 0)
		playerDropdown.Size = UDim2.new(0.8, 0, 0, 50)
		playerDropdown.Font = Enum.Font.SourceSansBold
		playerDropdown.Text = "Select NPCs"
		playerDropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
		playerDropdown.TextSize = 18

		playerListFrame.Name = "PlayerListFrame"
		playerListFrame.Parent = frame
		playerListFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		playerListFrame.BorderSizePixel = 0
		playerListFrame.Position = UDim2.new(0.1, 0, 0.6, 0)
		playerListFrame.Size = UDim2.new(0.8, 0, 0.3, 0)
		playerListFrame.Visible = false

		scrollingFrame.Parent = playerListFrame
		scrollingFrame.Size = UDim2.new(1, 0, 1, 0)
		scrollingFrame.CanvasSize = UDim2.new(0, 0, 5, 0)
		scrollingFrame.ScrollBarThickness = 10

		uiListLayout.Parent = scrollingFrame
		uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder

		distanceFrame.Name = "DistanceFrame"
		distanceFrame.Parent = frame
		distanceFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		distanceFrame.BorderSizePixel = 0
		distanceFrame.Position = UDim2.new(0.1, 0, 0.5, 0)
		distanceFrame.Size = UDim2.new(0.8, 0, 0, 50)

		distanceLabel.Name = "DistanceLabel"
		distanceLabel.Parent = distanceFrame
		distanceLabel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		distanceLabel.BorderSizePixel = 0
		distanceLabel.Size = UDim2.new(0.5, 0, 1, 0)
		distanceLabel.Font = Enum.Font.SourceSansBold
		distanceLabel.Text = "Put Distance of Loopbring:"
		distanceLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		distanceLabel.TextSize = 14
		distanceLabel.TextXAlignment = Enum.TextXAlignment.Left

		distanceTextBox.Name = "DistanceTextBox"
		distanceTextBox.Parent = distanceFrame
		distanceTextBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		distanceTextBox.BorderSizePixel = 0
		distanceTextBox.Position = UDim2.new(0.5, 0, 0, 0)
		distanceTextBox.Size = UDim2.new(0.5, 0, 1, 0)
		distanceTextBox.Font = Enum.Font.SourceSansBold
		distanceTextBox.PlaceholderText = "Distance in studs"
		distanceTextBox.Text = "5"
		distanceTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
		distanceTextBox.TextSize = 14
		distanceTextBox.TextXAlignment = Enum.TextXAlignment.Center

		-- Functions to manage player selection
		local selectedPlayers = {}
		local function updatePlayerList()
			for _, v in pairs(scrollingFrame:GetChildren()) do
				if v:IsA("TextButton") then
					v:Destroy()
				end
			end
		end


		local sselectEnemiesButton = Instance.new("TextButton")
		sselectEnemiesButton.Size = UDim2.new(1, 0, 0, 30)
		sselectEnemiesButton.Text = "deselect all"
		sselectEnemiesButton.Parent = scrollingFrame
		sselectEnemiesButton.MouseButton1Click:Connect(function()
			selectedPlayers = {}
			playerDropdown.Text = "Selected: None"
			playerListFrame.Visible = false
		end)
		for i,v in pairs(workspace.NPC:GetChildren()) do
			local selectEnemiesButton = Instance.new("TextButton")
			selectEnemiesButton.Size = UDim2.new(1, 0, 0, 30)
			selectEnemiesButton.Text = "select "..v.Name
			selectEnemiesButton.Parent = scrollingFrame
			selectEnemiesButton.MouseButton1Click:Connect(function()
				table.insert(selectedPlayers, v.Name)
				playerDropdown.Text = "Selected: " .. table.concat(selectedPlayers, ", ") .. " NPC(s)"
				playerListFrame.Visible = false
			end)
		end


		playerDropdown.MouseButton1Click:Connect(function()
			playerListFrame.Visible = not playerListFrame.Visible
			--updatePlayerList()
		end)

		-- Functions to handle bringing players
		local bringing = false

		local function getLookVector()
			return player.Character and player.Character.PrimaryPart.CFrame.lookVector or Vector3.new(0, 0, -1)
		end
		local function getSpecific(className:string, target:Instance)
			local t = {}
			for i,v in pairs(target:GetChildren()) do
				if v:IsA(className) then
					table.insert(t, v)
				end
			end
			return t
		end
		local function getNpcs(name:string)
			local t = {}
			for i,v in pairs(getSpecific("Model", workspace.NPC[name])) do
				if v.PrimaryPart ~= nil then
					table.insert(t, v)
				end
			end
			return t
		end
		local function bringPlayers()
			if not player.Character then return end

			local distance = tonumber(distanceTextBox.Text) or 5 -- Default distance is 5 studs
			local pos = player.Character.PrimaryPart.Position + getLookVector() * distance
			for i,v in pairs(selectedPlayers) do
				for _, npc in pairs(getNpcs(v)) do


					local humanoid = npc:FindFirstChildOfClass("Humanoid")

					if humanoid and humanoid.Health > 0 then
						npc:SetPrimaryPartCFrame(CFrame.new(pos))
					end
				end
			end
		end

		startButton.MouseButton1Click:Connect(function()
			if not bringing then
				bringing = true
				startButton.Text = "Stop bringing"
				while bringing do
					bringPlayers()
					wait(0.1) -- Adjust the delay as needed
				end
			else
				bringing = false
				startButton.Text = "Start bringing"
			end
		end)

		-- Update distance functionality
		distanceTextBox:GetPropertyChangedSignal("Text"):Connect(function()
			local newDistance = tonumber(distanceTextBox.Text)
			if newDistance and newDistance >= 0 then
				-- Update distance variable if valid input
				distance = newDistance
			end
		end)
end)
newButton("Luminance Farm Toggle", function() 
	if not _G.LuminanceFarmConnection then
		_G.LuminanceFarmConnection = plr.CharacterAdded:Connect(function(char)
			task.wait(1.3)
			plr.Character:FindFirstChildOfClass("Humanoid"):MoveTo(workspace.SwordStands["SwordStant [ Luminance ]"].Model.Position)
			task.wait(2)
			fireproximityprompt(workspace.SwordStands["SwordStant [ Luminance ]"].Giver.ProximityPrompt)
			task.wait(1)
			plr.Backpack:FindFirstChildOfClass("Tool").Parent = plr.Character
			task.wait(1.2)
			plr.Character:FindFirstChildOfClass("Humanoid").Health = 0
		end)
	elseif _G.LuminanceFarmConnection then
		_G.LuminanceFarmConnection:Disconnect()
	end
end)
newButton("Potions Farm", function() 
	if not _G.PotionFarmConnection then
		_G.PotionFarmConnection = workspace.DescendantAdded:Connect(function(des)
			if des:IsA("ProximityPrompt") then
				if des.ActionText:find("Open") then
					if not potionfarminprogress then
						if des:FindFirstAncestorWhichIsA("BasePart").Position then
							potionfarminprogress = true
							local targetPosition = des:FindFirstAncestorWhichIsA("BasePart").Position
							hrp.CFrame = CFrame.new(targetPosition + Vector3.new(0, (plr.Character:GetExtentsSize().Y / 2) + 10, 0))
							task.wait(0.5)
							fireproximityprompt(des)
							potionfarminprogress = false
						else
							if des:FindFirstAncestor("Spawn") then
								potionfarminprogress = true
								local targetPosition = des:FindFirstAncestor("Spawn").Position
								hrp.CFrame = CFrame.new(targetPosition + Vector3.new(0, (plr.Character:GetExtentsSize().Y / 2) + 10, 0))
								task.wait(0.5)
								fireproximityprompt(des)
								potionfarminprogress = false
							end
						end
					end
				end
				if des.ActionText:find("Potion") then
					if not potionfarminprogress then
						if des:FindFirstAncestorWhichIsA("BasePart") then
							potionfarminprogress = true
							local targetPosition = des:FindFirstAncestorWhichIsA("BasePart").Position
							hrp.CFrame = CFrame.new(targetPosition + Vector3.new(0, (plr.Character:GetExtentsSize().Y / 2) + 10, 0))
							task.wait(0.5)
							fireproximityprompt(des)
							potionfarminprogress = false
						else
							if des:FindFirstAncestor("Spawn") then
								potionfarminprogress = true
								local targetPosition = des:FindFirstAncestor("Spawn").Position
								hrp.CFrame = CFrame.new(targetPosition + Vector3.new(0, (plr.Character:GetExtentsSize().Y / 2) + 10, 0))
								task.wait(0.5)
								fireproximityprompt(des)
								potionfarminprogress = false
							end
						end
					end
				end
			end
		end)
	elseif _G.PotionFarmConnection then
		_G.PotionFarmConnection:Disconnect()
	end
end)
local UIS = game:GetService('UserInputService')
local frame = Frame
local dragToggle = nil
local dragSpeed = 0.25
local dragStart = nil
local startPos = nil

local function updateInput(input)
	local delta = input.Position - dragStart
	local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
		startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
end

frame.InputBegan:Connect(function(input)
	if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
		dragToggle = true
		dragStart = input.Position
		startPos = frame.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragToggle = false
			end
		end)
	end
end)

UIS.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		if dragToggle then
			updateInput(input)
		end
	end
end)
