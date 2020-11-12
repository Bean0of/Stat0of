--[[

MADE BY BEANOOF

Feel free to use this your game

--]]

local RepStorage = game:GetService("ReplicatedStorage")

script.Parent:WaitForChild("StatsModule").Parent = RepStorage

-- PING START --

function addPingVal(plr)
	local pingVal = Instance.new("IntValue",plr)
	pingVal.Name = "Ping"
end

game.Players.PlayerAdded:Connect(addPingVal)

function RetPing(plr,pre)
	plr:WaitForChild("Ping").Value = pre
	return true
end

local PingRemote = Instance.new("RemoteFunction",RepStorage)
PingRemote.Name = "GetPing"

PingRemote.OnServerInvoke = RetPing

-- PING END --