local p: Player = game.Players.LocalPlayer
repeat task.wait() until p.Character ~= nil
p:RequestStreamAroundAsync(p.Character:FindFirstChild("HumanoidRootPart").Position)
sethiddenproperty(workspace, "StreamingMinRadius", 1000000) 
