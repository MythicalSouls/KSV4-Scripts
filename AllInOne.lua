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

local UIGrid = Instance.new("UIGridLayout")
UIGrid.CellPadding = UDim2.new(0.04, 0, 0.04, 0)
UIGrid.CellSize = UDim2.new(0.2, 0, 0.2, 0)
UIGrid.Parent = ScrollingFrame

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

local tbox = Instance.new("TextBox")
tbox.Name = "tbox"
tbox.Visible = false
tbox.Size = UDim2.new(0, 60, 0, 60)
tbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
tbox.Position = UDim2.new(0, 0, -1e-07, 0)
tbox.BorderSizePixel = 0
tbox.BackgroundColor3 = Color3.fromRGB(76, 76, 76)
tbox.FontSize = Enum.FontSize.Size14
tbox.TextSize = 14
tbox.TextColor3 = Color3.fromRGB(255, 255, 255)
tbox.TextWrapped = true
tbox.PlaceholderColor3 = Color3.fromRGB(117, 117, 117)
tbox.TextWrap = true
tbox.Font = Enum.Font.Sarpanch
tbox.TextScaled = true
tbox.Parent = ScrollingFrame

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
function newTextBox(name: string, settingsTable: {}, noTextFallback: any)
	local box = tbox:Clone()
	box.PlaceholderText = name
	box.Parent = ScrollingFrame
	box.Visible = true
	box.Name = name
	box:GetPropertyChangedSignal("Text"):Connect(function()
		local textChangeUpdate = function()
			if settingsTable["Variable"] then
				if settingsTable["Variable"]["Current"] and settingsTable["Variable"]["New"] then
					settingsTable["Variable"]["Current"] = settingsTable["Variable"]["New"]
				end
				if settingsTable["Variable"]["Current"] and not settingsTable["Variable"]["New"] then
					if typeof(settingsTable["Variable"]["Current"]) == "number" then
						if typeof(tonumber(box.Text)) ~= nil then
							settingsTable["Variable"]["Current"] = tonumber(box.Text)
						elseif typeof(tonumber(box.Text)) == nil then
							settingsTable["Variable"]["Current"] = tonumber(noTextFallback)
						end	
					elseif typeof(settingsTable["Variable"]["Current"]) == "string" then
						settingsTable["Variable"]["Current"] = tostring(noTextFallback)
					end
				end
			end
			if settingsTable["Value"] then
				if settingsTable["Value"]["Current"] and settingsTable["Value"]["New"] then
					settingsTable["Value"]["Current"].Value = settingsTable["Value"]["New"]
				end
				if settingsTable["Value"]["Current"] and not settingsTable["Value"]["New"] then
					if typeof(settingsTable["Value"]["Current"].Value) == "number" then
						if typeof(tonumber(box.Text)) ~= nil then
							settingsTable["Value"]["Current"].Value = tonumber(box.Text)
						elseif typeof(tonumber(box.Text)) == nil then
							settingsTable["Value"]["Current"].Value = tonumber(noTextFallback)
						end			
					elseif typeof(settingsTable["Value"]["Current"].Value) == "string" then
						settingsTable["Value"]["Current"].Value = tostring(noTextFallback)
					end
				end
			end
		end
		textChangeUpdate()
	end)
end	
	
local plr = game.Players.LocalPlayer
local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
local potionfarminprogress = false

ScanRadius = 100
local Nv = Instance.new("NumberValue")
Nv.Value = ScanRadius

newTextBox("Fragile Bot Scan Radius", {["Variable"] = {["Current"] = ScanRadius}, ["Value"] = {["Current"] = Nv}}, 100)

local FragileBotFunc

newButton("Fragile Bot", function()
	if FragileBotFunc == nil then
		local Players = game:GetService("Players")
		local Player = Players.LocalPlayer

		local function Character(): Model
			return Player.Character or Player.CharacterAdded:Wait()
		end

		local function Humanoid(): Humanoid
			return Character():FindFirstChildOfClass("Humanoid")
		end

		local function LocalRoot(): BasePart
			return Character():FindFirstChild("HumanoidRootPart") or Character().PrimaryPart
		end

		local function GetNearNPCs(DetectionPart: BasePart)
			local NPCs = {}
			for i,v in pairs(workspace:GetPartBoundsInRadius(LocalRoot().Position, DetectionPart.Size.Y, OverlapParams.new())) do
				if v.Parent:IsA("Model") then
					if v.Parent:FindFirstChild("Mind") then
						if v.Parent:FindFirstChildOfClass("Humanoid") then
							if v.Parent:FindFirstChildOfClass("Humanoid").Health > 0 then
								table.insert(NPCs, v)	
							end
						end
					end
				end
			end
			return NPCs
		end

		local function NearestRoot(DetectionPart): BasePart
			local closestPart = nil
			local minDistance = math.huge
			for _, part in ipairs(GetNearNPCs(DetectionPart)) do
				if part:IsA("BasePart") then
					if part.Name == "HumanoidRootPart" then
						local distance = (LocalRoot().Position - part.Position).Magnitude
						if distance < minDistance then
							minDistance = distance
							closestPart = part
						end
					end
				end
			end
			return closestPart
		end

		local function GetFrontRaycast(part, distance)
			local RP = RaycastParams.new()
			RP.FilterType = Enum.RaycastFilterType.Include
			RP.FilterDescendantsInstances = {part}
			local RayResult = workspace:Raycast(LocalRoot().Position, LocalRoot().CFrame.LookVector * distance, RP)
			if RayResult then
				return RayResult
			end
			return nil
		end

		local FBC = coroutine.create(function()
			local Sphere = Instance.new("Part")
			Sphere.Shape = Enum.PartType.Ball
			Sphere.CanCollide = false
			Sphere.CanQuery = false
			Sphere.Transparency = 0.7
			Sphere.Size = Vector3.new(Nv.Value, Nv.Value, Nv.Value)
			Sphere.CFrame = LocalRoot().CFrame
			Sphere.Parent = LocalRoot()
			Sphere:AddTag("FragileBotInstance")
			local M = Instance.new("Motor6D")
			M.Parent = Sphere
			M.Part1 = Sphere
			M.Part0 = LocalRoot()
			M:AddTag("FragileBotInstance")

			Nv:GetPropertyChangedSignal("Value"):Connect(function()
				Sphere.Size = Vector3.new(Nv.Value, Nv.Value, Nv.Value)
			end)

			local faceAtAttachment = Instance.new("Attachment", LocalRoot())
			faceAtAttachment:AddTag("FragileBotInstance")
			local alignment = Instance.new("AlignOrientation", faceAtAttachment)
			alignment.Attachment0 = faceAtAttachment
			alignment.Responsiveness = 200
			alignment.MaxTorque = 179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368
			alignment:AddTag("FragileBotInstance")
			local tempAttachment
			tempAttachment = Instance.new("Attachment", workspace.Terrain)
			tempAttachment:AddTag("FragileBotInstance")
			alignment.Attachment1 = tempAttachment

			while Humanoid().Health > 0 do
				task.wait()
				local NearestRootPart = NearestRoot(Sphere)
				if not NearestRootPart then
					continue
				end
				tempAttachment.CFrame = CFrame.new(LocalRoot().Position, Vector3.new(NearestRootPart.Position.X, LocalRoot().Position.Y, NearestRootPart.Position.Z))
				local Evec3 = LocalRoot().CFrame:ToObjectSpace(NearestRootPart.CFrame)
				local E2vec3 = Evec3 * Evec3.Position
				local vec3 = LocalRoot().CFrame:ToWorldSpace(Evec3).Position
				print(vec3)
				print(typeof(vec3))
				Humanoid():MoveTo(vec3)
				
				--- NearestRootPart.CFrame:ToObjectSpace(LocalRoot().CFrame).Position
			end
		end)
		FragileBotFunc = task.spawn(FBC)
	elseif FragileBotFunc ~= nil then
		task.cancel(FragileBotFunc)
		FragileBotFunc = nil
		for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
			if v:HasTag("FragileBotInstance") then
				v:Destroy()
			end
		end
	end
end)

newButton("Luminance Farm Gui", function() 
	local player = game.Players.LocalPlayer
	local gui = Instance.new("ScreenGui")
	local frame = Instance.new("Frame")
	local titleLabel = Instance.new("TextLabel")
	local startButton = Instance.new("TextButton")
	local playerDropdown = Instance.new("TextButton")
	local playerListFrame = Instance.new("Frame")
	local scrollingFrame = Instance.new("ScrollingFrame")
	local uiListLayout = Instance.new("UIListLayout")

	gui.Name = "ksv4guilumi"
	gui:AddTag("KSV4")
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
	titleLabel.Text = "ksv4 luminance farm gui by lagrange"
	titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	titleLabel.TextSize = 14

	startButton.Name = "StartButton"
	startButton.Parent = frame
	startButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	startButton.BorderSizePixel = 0
	startButton.Position = UDim2.new(0.1, 0, 0.2, 0)
	startButton.Size = UDim2.new(0.8, 0, 0, 50)
	startButton.Font = Enum.Font.SourceSansBold
	startButton.Text = "Start auto luminance"
	startButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	startButton.TextSize = 18

	playerDropdown.Name = "PlayerDropdown"
	playerDropdown.Parent = frame
	playerDropdown.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	playerDropdown.BorderSizePixel = 0
	playerDropdown.Position = UDim2.new(0.1, 0, 0.4, 0)
	playerDropdown.Size = UDim2.new(0.8, 0, 0, 50)
	playerDropdown.Font = Enum.Font.SourceSansBold
	playerDropdown.Text = "Select Variants"
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
		playerDropdown.Text = "Selected ignores: None"
		playerListFrame.Visible = false
	end)
	local tPhases = {"Luminance", "ElectroDarkness", "Melancholia", "NovaInterstellar", "", "Frostelar", "Cosmical Aurora", "", "", "", "Lunar Illusion", "", "", "", "", "", "Star Seeker"}
	for i,v in pairs(tPhases) do
		if v == "" then continue end
		local selectEnemiesButton = Instance.new("TextButton")
		selectEnemiesButton.Size = UDim2.new(1, 0, 0, 30)
		selectEnemiesButton.Text = "select "..v
		selectEnemiesButton.Parent = scrollingFrame
		selectEnemiesButton.MouseButton1Click:Connect(function()
			table.insert(selectedPlayers, v)
			playerDropdown.Text = "Selected ignores: " .. table.concat(selectedPlayers, ", ") .. " Variant(s)"
			playerListFrame.Visible = false
		end)
	end


	playerDropdown.MouseButton1Click:Connect(function()
		playerListFrame.Visible = not playerListFrame.Visible
		--updatePlayerList()
	end)
	local function auto()
		if not _G.LuminanceFarmConnection then
			local success, response
			game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Health = 0
			_G.LuminanceFarmConnection = game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
				while not success do
					success, response = pcall(function()
						task.wait(1)
						game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):MoveTo(workspace.SwordStands["SwordStant [ Luminance ]"].Model.Position)
						task.wait(1.55)
						fireproximityprompt(workspace.SwordStands["SwordStant [ Luminance ]"].Giver.ProximityPrompt)
						task.wait(1)
						game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool").Parent = game.Players.LocalPlayer.Character
						repeat task.wait() until game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").RandomPhases.result.Value ~= 0
						if table.find(selectedPlayers, tPhases[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").RandomPhases.result.Value]) then
							task.wait(0.9)
							game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Health = 0
						end
					end)
					task.wait(.01)
				end
				success, response = nil, nil
			end)
		elseif _G.LuminanceFarmConnection then
			_G.LuminanceFarmConnection:Disconnect()
			_G.LuminanceFarmConnection = nil
		end
	end
	local mode = false
	startButton.MouseButton1Click:Connect(function()
		if mode == false then
			mode = true
			startButton.Text = "Stop auto luminance"
			auto()
		else
			mode = false
			startButton.Text = "Start auto luminance"
			auto()
		end
	end)
end)

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
	gui:AddTag("KSV4")
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
newButton("Potions Farm Toggle", function() 
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

local guishided = false

newButton("Toggle Guis", function()
	for i,v in pairs(game.CoreGui:GetChildren()) do
		if v:HasTag("KSV4") then
			if v:IsA("ScreenGui") then
				v.Enabled = guishided
				guishided = not guishided
			end
		end
	end
end)

newButton("Instance ESP gui", function()
	local player = game.Players.LocalPlayer
	local gui = Instance.new("ScreenGui")
	local frame = Instance.new("Frame")
	local titleLabel = Instance.new("TextLabel")
	local startButton = Instance.new("TextButton")
	local resetButton = Instance.new("TextButton")
	local playerDropdown = Instance.new("TextBox")

	gui.Name = "ksv4guiinstesp"
	gui:AddTag("KSV4")
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
	titleLabel.Text = "ksv4 instance esp gui by lagrange"
	titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	titleLabel.TextSize = 14

	startButton.Name = "StartButton"
	startButton.Parent = frame
	startButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	startButton.BorderSizePixel = 0
	startButton.Position = UDim2.new(0.1, 0, 0.2, 0)
	startButton.Size = UDim2.new(0.8, 0, 0, 50)
	startButton.Font = Enum.Font.SourceSansBold
	startButton.Text = "Start esp"
	startButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	startButton.TextSize = 18

	playerDropdown.Name = "PlayerDropdown"
	playerDropdown.Parent = frame
	playerDropdown.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	playerDropdown.BorderSizePixel = 0
	playerDropdown.Position = UDim2.new(0.1, 0, 0.4, 0)
	playerDropdown.Size = UDim2.new(0.8, 0, 0, 50)
	playerDropdown.Font = Enum.Font.SourceSansBold
	playerDropdown.Text = "Enter path of Model, BasePart"
	playerDropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
	playerDropdown.TextSize = 18

	resetButton.Name = "ResetButton"
	resetButton.Parent = frame
	resetButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	resetButton.BorderSizePixel = 0
	resetButton.Position = UDim2.new(0.1, 0, 0.5, 0)
	resetButton.Size = UDim2.new(0.8, 0, 0, 50)
	resetButton.Font = Enum.Font.SourceSansBold
	resetButton.Text = "Clear esp targets"
	resetButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	resetButton.TextSize = 18

	local espinstances = {}

	resetButton.MouseButton1Click:Connect(function()
		for i,v in pairs(espinstances) do
			for ii,vv in pairs(v:GetDescendants()) do
				if vv:IsA("BoxHandleAdornment") then
					vv:Destroy()
				end
			end
		end
		espinstances = {}
	end)

	local function getInstanceFromPath(fullPath: string): Instance?
		local pathComponents = string.split(fullPath, ".")
		local currentInstance = game

		for i, componentName in ipairs(pathComponents) do
			if i == 1 and (componentName == "game" or componentName == "workspace") then
				if componentName == "workspace" then
					currentInstance = workspace
				end
			else
				if currentInstance then
					currentInstance = currentInstance:FindFirstChild(componentName)
				else
					return nil
				end
			end
		end
		return currentInstance
	end
	playerDropdown.FocusLost:Connect(function(enterp, inp)
		local success, result = pcall(function()
			local foundInst = getInstanceFromPath(playerDropdown.Text)
			if foundInst then
				table.insert(espinstances, foundInst)
			end
		end)
		if not success then
			warn(result)
		end
	end)
	local ESP_Enabled = false
	local function auto()
		if ESP_Enabled == false then
			for i,v in pairs(espinstances) do
				if v:IsA("BasePart") then
					local a = Instance.new("BoxHandleAdornment")
					a.Parent = v
					a.Adornee = v
					a.AlwaysOnTop = true
					a.ZIndex = 0
					a.Size = v.Size
					a.Transparency = 0.4
					a.Color = BrickColor.new("Lime green")
				end
				if v:IsA("Model") then
					for _, vv in pairs(v:GetDescendants()) do
						if vv:IsA("BasePart") then	
							local a = Instance.new("BoxHandleAdornment")
							a.Parent = vv
							a.Adornee = vv
							a.AlwaysOnTop = true
							a.ZIndex = 0
							a.Size = vv.Size
							a.Transparency = 0.4
							a.Color = BrickColor.new("Lime green")
						end
					end
				end
				ESP_Enabled = true
			end
		else
			for i,v in pairs(espinstances) do
				for ii,vv in pairs(v:GetDescendants()) do
					if vv:IsA("BoxHandleAdornment") then
						vv:Destroy()
					end
				end
			end
			ESP_Enabled = false
		end
	end
	local mode = false
	startButton.MouseButton1Click:Connect(function()
		if mode == false then
			mode = true
			startButton.Text = "Stop esp"
			auto()
		else
			mode = false
			startButton.Text = "Start esp"
			auto()
		end
	end)
end)

newButton("Freecam Toggle", function() 
	if not _G.FreecamConnection then
		_G.PreviousWS = plr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed
		plr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 0
		local cam = workspace.CurrentCamera
		local UIS = game:GetService("UserInputService")
		local RS = game:GetService("RunService")
		local onMobile = not UIS.KeyboardEnabled
		local keysDown = {}
		local rotating = false

		if not game:IsLoaded() then game.Loaded:Wait() end

		cam.CameraType = Enum.CameraType.Scriptable

		local speed = 100
		local sens = .3

		speed /= 10
		if onMobile then sens*=2 end

		local function renderStepped()
			if rotating then
				local delta = UIS:GetMouseDelta()
				local cf = cam.CFrame
				local yAngle = cf:ToEulerAngles(Enum.RotationOrder.YZX)
				local newAmount = math.deg(yAngle)+delta.Y
				if newAmount > 65 or newAmount < -65 then
					if not (yAngle<0 and delta.Y<0) and not (yAngle>0 and delta.Y>0) then
						delta = Vector2.new(delta.X,0)
					end 
				end
				cf *= CFrame.Angles(-math.rad(delta.Y),0,0)
				cf = CFrame.Angles(0,-math.rad(delta.X),0) * (cf - cf.Position) + cf.Position
				cf = CFrame.lookAt(cf.Position, cf.Position + cf.LookVector)
				if delta ~= Vector2.new(0,0) then cam.CFrame = cam.CFrame:Lerp(cf,sens) end
				UIS.MouseBehavior = Enum.MouseBehavior.LockCurrentPosition
			else
				UIS.MouseBehavior = Enum.MouseBehavior.Default
			end

			if keysDown["Enum.KeyCode.W"] then
				cam.CFrame *= CFrame.new(Vector3.new(0,0,-speed))
			end
			if keysDown["Enum.KeyCode.A"] then
				cam.CFrame *= CFrame.new(Vector3.new(-speed,0,0))
			end
			if keysDown["Enum.KeyCode.S"] then
				cam.CFrame *= CFrame.new(Vector3.new(0,0,speed))
			end
			if keysDown["Enum.KeyCode.D"] then
				cam.CFrame *= CFrame.new(Vector3.new(speed,0,0))
			end
		end

		_G.FreecamConnection = RS.RenderStepped:Connect(renderStepped)

		local validKeys = {"Enum.KeyCode.W","Enum.KeyCode.A","Enum.KeyCode.S","Enum.KeyCode.D"}

		UIS.InputBegan:Connect(function(Input)
			for i, key in pairs(validKeys) do
				if key == tostring(Input.KeyCode) then
					keysDown[key] = true
				end
			end
			if Input.UserInputType == Enum.UserInputType.MouseButton2 or (Input.UserInputType == Enum.UserInputType.Touch and UIS:GetMouseLocation().X>(cam.ViewportSize.X/2)) then
				rotating = true
			end
			if Input.UserInputType == Enum.UserInputType.Touch then
				if Input.Position.X < cam.ViewportSize.X/2 then
					touchPos = Input.Position
				end
			end
		end)

		UIS.InputEnded:Connect(function(Input)
			for key, v in pairs(keysDown) do
				if key == tostring(Input.KeyCode) then
					keysDown[key] = false
				end
			end
			if Input.UserInputType == Enum.UserInputType.MouseButton2 or (Input.UserInputType == Enum.UserInputType.Touch and UIS:GetMouseLocation().X>(cam.ViewportSize.X/2)) then
				rotating = false
			end
			if Input.UserInputType == Enum.UserInputType.Touch and touchPos then
				if Input.Position.X < cam.ViewportSize.X/2 then
					touchPos = nil
					keysDown["Enum.KeyCode.W"] = false
					keysDown["Enum.KeyCode.A"] = false
					keysDown["Enum.KeyCode.S"] = false
					keysDown["Enum.KeyCode.D"] = false
				end
			end
		end)

		UIS.TouchMoved:Connect(function(input)
			if touchPos then
				if input.Position.X < cam.ViewportSize.X/2 then
					if input.Position.Y < touchPos.Y then
						keysDown["Enum.KeyCode.W"] = true
						keysDown["Enum.KeyCode.S"] = false
					else
						keysDown["Enum.KeyCode.W"] = false
						keysDown["Enum.KeyCode.S"] = true
					end
					if input.Position.X < (touchPos.X-15) then
						keysDown["Enum.KeyCode.A"] = true
						keysDown["Enum.KeyCode.D"] = false
					elseif input.Position.X > (touchPos.X+15) then
						keysDown["Enum.KeyCode.A"] = false
						keysDown["Enum.KeyCode.D"] = true
					else
						keysDown["Enum.KeyCode.A"] = false
						keysDown["Enum.KeyCode.D"] = false
					end
				end
			end
		end)
	elseif _G.FreecamConnection then
		_G.FreecamConnection:Disconnect()
		_G.FreecamConnection = nil
		plr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = _G.PreviousWS
		workspace.CurrentCamera.CFrame = plr.Character:FindFirstChild("Head").CFrame
		workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
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
