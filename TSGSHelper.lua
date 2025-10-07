--Credits to:
--/TCESTeam_IAmFriendly on scriptblox for ProximityPrompt and ClickDetector Firer./
--/IY team for remove fog and force bright function./
--/byt3c0de_net on scriptblox for Fly GUI/
--Without those peoples, TSGSHelper will be not good as now.

--<<Helper for Desolation: Ascending Legends>>

--<Setting up-1>
--Delete IY_FE.iy file in your executor workspace folder if you have it, and don't execute IY until replacing.
--Download IY-Settings-For-TSGS.txt and rename it to IY_FE.iy and put on your workspace folder.
--This will provide you useful waypoints for D:AL.

--<Setting up-2>
--Execute this script if you got Shadow Gray Space, doing it on private server is recommanded as you will be easily caught that you are exploiting.
--Also execute IY.
--<How to use waypoints>
--You will have to clikk IY settings, and then click Edit/Goto Waypoints.
--There will be some waypoints, They are very useful for entering level 1 and retrying level 2.
--Clicking will take you to the waypoint.

--<Waypoints explanation>
--third corrupt will teleport you to 3rd malware/darkness cave puzzle activator.
--second corrupt will teleport you to 2nd malware/darkness cave puzzle activator.
--first corrupt will teleport you to 1st malware/darkness cave puzzle activator.
--lever will teleport you to lever that allows you to activate cave puzzle activvators.
--steps will teleport you to malwares/cave puzzle.
--oceanaltar will teleport you to altar that sends you to level 1 upon interaction.
--nullstarequip will teleport you to nullstar's stand.
--forest will teleport you to level 1, though this will probably just teleports you and not make things work if you didnt do previous steps.
--ascending zones abyss islands is VERY important, teleports you to level 2, even if you got sent to emptiness/death zone. you can redo levers and progress it.

--<Main turorial>
--Those are main part of how to get D:AL.
--Using ProximityPrompt and ClickDetector Firer and Fly GUI are heavily recommanded.
--Set ProximityPrompt and ClickDetector Firer's method to Instant, and auto on while doing malwares/cave puzzles.
--Click Use to fire CD's/PP's
--Set Fly GUI's speed option to around 15, Fly GUI's functions are easy to understand so i wont explain more.
--I will be refer ProximityPrompt and ClickDetector Firer as P/C firer.
--Do not attempt to modify Scan and ProximityPrompt radius, as you can see them but you cannot interact with them.
--When is say interact with something you can interact manually or with P/C firer.

--/level 0/
--IF YOU FORGOT: ACTIVATE INSTANT METHOD ON P/C FIRER.
--Use lever waypoint to go to lever and then inteaact with near ProximityPrompt.
--After activating lever, use first corrupt waypoint and nteaact with near ProximityPrompt.
--Do the same thing on second and third corrupt.
--You will see a gray message in chat if you've done all.
--Use steps waypoint and actiavte auto mode as i said before, and then move around very short distance to prompts to activate various puzzle ProximityPrompts.
--Do this until a new lighter gray chat message that says ocean has been modified or something appears
--If that message appears, use oceanaltar waypoint to teleport instantly to level 1 teleporter.
--Interact with altar's ProximityPrompt, and you will be sent to level 1.

--/level 1/
--Open Dex by using dex command on IY.
--use fly and search for dark cube with glitchy particles.
--If you cannot find it, you can always search it using Dex, all of D:AL puzzle stuffs are descendants of workspace.MapEventStuffs.GrayShadowSpaceStuff.
--You can also teleport to object with Dex by holding on target object -> click Teleport To.
--Activate/click the cube if you found it.
--Find dark angel, If you cannot find it you can serach "desolate" in dex and look for high number desolate /example: desolate600/.
--Teleport to angel using dex and interact with angel.
--You will be sent to level 2.

--/level 2/
--Coming Soon, see limit breaker documentation posted in ksv4 wiki for more info before i add it.

local function brightFunc()
local Lighting = game.Lighting
Lighting.FogEnd = 100000
	for i,v in pairs(Lighting:GetDescendants()) do
		if v:IsA("Atmosphere") then
			v:Destroy()
		end
	end
		Lighting.Brightness = 2
		Lighting.ClockTime = 14
		Lighting.FogEnd = 100000
		Lighting.GlobalShadows = false
		Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
	end
	game:GetService("RunService").RenderStepped:Connect(brightFunc)
--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
-- Services
local Players          = game:GetService("Players")
local RunService       = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- Player & Character
local LocalPlayer = Players.LocalPlayer
local character   = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

-- R15/R6 fallback for HumanoidRootPart
local function resolveHRP(char)
    return char:FindFirstChild("HumanoidRootPart")
        or char:FindFirstChild("UpperTorso")
        or char:FindFirstChild("Torso")
end

local hrp = resolveHRP(character)

-- Configuration (editable via GUI)
local SCAN_RADIUS    = 15
local PROX_RADIUS    = 15
local INSTANT_METHOD = false
local AUTO_FIRE      = false
local TOGGLE_KEY     = Enum.KeyCode.RightControl

-- Helper: find world position of any interactable
local function getInteractablePosition(obj)
    if obj:IsA("BasePart") then
        return obj.Position
    end
    local part = obj:FindFirstAncestorWhichIsA("BasePart")
    if part then
        return part.Position
    end
    local mdl = obj:FindFirstAncestorWhichIsA("Model")
    if mdl then
        if mdl.PrimaryPart then
            return mdl.PrimaryPart.Position
        end
        local bp = mdl:FindFirstChildWhichIsA("BasePart", true)
        if bp then
            return bp.Position
        end
    end
    local att = obj:FindFirstAncestorWhichIsA("Attachment")
    if att then
        return att.WorldCFrame.Position
    end
    return nil
end

-- Enforce ProximityPrompt activation distance
local function enforcePromptRange()
    for _, p in ipairs(workspace:GetDescendants()) do
        if p:IsA("ProximityPrompt") then
            p.MaxActivationDistance = PROX_RADIUS
        end
    end
end
workspace.DescendantAdded:Connect(function(d)
    if d:IsA("ProximityPrompt") then
        d.MaxActivationDistance = PROX_RADIUS
    end
end)
enforcePromptRange()

-- Fire helpers
local function fireProximity(prompt)
    if INSTANT_METHOD then
        pcall(fireproximityprompt, prompt)
    else
        pcall(function()
            prompt:InputHoldBegin()
            task.wait(0.1)
            prompt:InputHoldEnd()
        end)
    end
end

local function fireClick(cd)
    pcall(fireclickdetector, cd, cd.Parent)
end

-- GUI (one‑time build)
local gui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
gui.Name = "AutoFireGui"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size             = UDim2.new(0, 380, 0, 240)
frame.Position         = UDim2.new(0, 10, 0, 10)
frame.BackgroundColor3 = Color3.fromRGB(28,28,28)
frame.Active           = true
frame.Draggable        = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,8)

-- Title
local title = Instance.new("TextLabel", frame)
title.Size              = UDim2.new(1, 0, 0, 24)
title.BackgroundColor3  = Color3.fromRGB(40,40,40)
title.TextColor3        = Color3.new(1,1,1)
title.Font              = Enum.Font.GothamBold
title.TextSize          = 18
title.TextXAlignment    = Enum.TextXAlignment.Left
title.Text              = " Auto‑Fire Scanner"

-- Info
local info = Instance.new("TextLabel", frame)
info.Position           = UDim2.new(0, 5, 0, 30)
info.Size               = UDim2.new(1, -10, 0, 45)
info.BackgroundTransparency = 1
info.TextColor3         = Color3.new(1,1,1)
info.Font               = Enum.Font.Gotham
info.TextSize           = 14
info.TextWrapped        = true
info.Text               = "Nearest: none"

-- Labeled TextBox helper
local function newLabeledBox(y, labelText, default, onChange)
    local lbl = Instance.new("TextLabel", frame)
    lbl.Position        = UDim2.new(0.05, 0, 0, y)
    lbl.Size            = UDim2.new(0.4, -10, 0, 20)
    lbl.BackgroundTransparency = 1
    lbl.Text            = labelText
    lbl.TextColor3      = Color3.new(1,1,1)
    lbl.Font            = Enum.Font.Gotham
    lbl.TextSize        = 14
    lbl.TextXAlignment  = Enum.TextXAlignment.Left

    local box = Instance.new("TextBox", frame)
    box.Position        = UDim2.new(0.55, 0, 0, y)
    box.Size            = UDim2.new(0.4, 0, 0, 20)
    box.Text            = tostring(default)
    box.ClearTextOnFocus= false
    box.BackgroundColor3= Color3.fromRGB(50,50,50)
    box.TextColor3      = Color3.new(1,1,1)
    box.Font            = Enum.Font.Gotham
    box.TextSize        = 14
    Instance.new("UICorner", box).CornerRadius = UDim.new(0,6)

    box.FocusLost:Connect(function(enter)
        if enter then
            local v = tonumber(box.Text)
            if v and v > 0 then
                onChange(v)
            else
                box.Text = tostring(default)
            end
        end
    end)
    return box
end

local scanBox = newLabeledBox(80,  "Scan Radius",              SCAN_RADIUS, function(v) SCAN_RADIUS = v end)
local proxBox = newLabeledBox(105, "ProximityPrompt Radius", PROX_RADIUS, function(v)
    PROX_RADIUS = v
    enforcePromptRange()
end)

-- Button factory
local function newButton(text, posX, color)
    local b = Instance.new("TextButton", frame)
    b.Size             = UDim2.new(0.25, 0, 0, 35)
    b.Position         = UDim2.new(posX, 0, 1, -45)
    b.BackgroundColor3 = color
    b.TextColor3       = Color3.new(1,1,1)
    b.Font             = Enum.Font.GothamBold
    b.TextSize         = 16
    b.Text             = text
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,6)
    return b
end

local useBtn    = newButton("Use",          0.05, Color3.fromRGB(0,170,0))
local methodBtn = newButton("Method: Hold", 0.36, Color3.fromRGB(70,70,70))
local autoBtn   = newButton("Auto: Off",    0.67, Color3.fromRGB(70,70,70))

useBtn.MouseButton1Click:Connect(function()
    if currentTarget then
        if currentTarget:IsA("ProximityPrompt") then
            fireProximity(currentTarget)
        else
            fireClick(currentTarget)
        end
    end
end)

methodBtn.MouseButton1Click:Connect(function()
    INSTANT_METHOD = not INSTANT_METHOD
    methodBtn.Text = INSTANT_METHOD and "Method: Instant" or "Method: Hold"
    methodBtn.BackgroundColor3 = INSTANT_METHOD and Color3.fromRGB(0,170,0) or Color3.fromRGB(70,70,70)
end)

autoBtn.MouseButton1Click:Connect(function()
    AUTO_FIRE = not AUTO_FIRE
    autoBtn.Text = AUTO_FIRE and "Auto: On" or "Auto: Off"
    autoBtn.BackgroundColor3 = AUTO_FIRE and Color3.fromRGB(0,170,0) or Color3.fromRGB(70,70,70)
end)

-- Toggle GUI
UserInputService.InputBegan:Connect(function(input, gp)
    if not gp and input.KeyCode == TOGGLE_KEY then
        gui.Enabled = not gui.Enabled
    end
end)

-- Respawn handler
LocalPlayer.CharacterAdded:Connect(function(char)
    character = char
    hrp = resolveHRP(char)
    currentTarget = nil
end)

-- Main scan loop with HRP re‑resolution
task.spawn(function()
    while true do
        task.wait(0.1)

        -- Re-acquire HRP if missing (mid‑session death/rerig)
        if not hrp or not hrp.Parent then
            character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            hrp = resolveHRP(character)
            currentTarget = nil
        end

        if hrp and hrp.Parent then
            local nearest, kind, bestDist = nil, nil, SCAN_RADIUS
            for _, obj in ipairs(workspace:GetDescendants()) do
                if obj:IsA("ProximityPrompt") or obj:IsA("ClickDetector") then
                    local pos = getInteractablePosition(obj)
                    if pos then
                        local d = (pos - hrp.Position).Magnitude
                        if d <= SCAN_RADIUS and d <= bestDist then
                            nearest, kind, bestDist = obj, obj.ClassName, d
                        end
                    end
                end
            end

            if nearest then
                currentTarget = nearest
                info.Text = string.format(
                    "Nearest: %s on \"%s\"\n(%.1f studs)",
                    kind, nearest.Parent.Name, bestDist
                )
                if AUTO_FIRE then
                    if kind == "ProximityPrompt" then
                        fireProximity(nearest)
                    else
                        fireClick(nearest)
                    end
                end
            else
                currentTarget = nil
                info.Text = "Nearest: none"
            end
        end
    end
end)
--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
loadstring(game:HttpGet("https://byt3c0de.net/tools/flygui.lua", true))()
local a=Instance.new"ScreenGui"
a.ZIndexBehavior=1
a.ResetOnSpawn = false
local b=Instance.new"TextButton"
b.Text = "Print signs"
b.Size=UDim2.new(0,50,0,50)
b.BorderColor3=Color3.fromRGB(0,0,0)
b.Position=UDim2.new(0.0140735,0,0.286795,0)
b.BorderSizePixel=0
b.BackgroundColor3=Color3.fromRGB(255,255,255)
b.FontSize=5
b.TextSize=14
b.TextColor3=Color3.fromRGB(0,0,0)
b.Font=3
b.Parent=a
a.Parent=game.CoreGui
b.MouseButton1Click:Connect(function()
if workspace:FindFirstChildOfClass("Hint") then
workspace:FindFirstChildOfClass("Hint"):Destroy()
end
local t = {}
for i,v in pairs(workspace:GetDescendants()) do
if v.Name == "signchange" then
table.insert(t, v.Parent.Name.." "..v:FindFirstChildWhichIsA("TextLabel", true).Text)
end
end
local a = Instance.new("Hint", workspace)
a.Text = table.concat(t, ", ")
end)
