function round(x) return x + 0.5 - (x + 0.5) % 1 end

local RepStorage = game:GetService("ReplicatedStorage")

script.Parent:WaitForChild("StatsModule").Parent = RepStorage

-- PING START --

function addPingVal(plr)
	local pingVal = Instance.new("IntValue",plr)
	pingVal.Name = "Ping"
end

game.Players.PlayerAdded:Connect(addPingVal)

function RetPing(plr,clientTick)
	local ping = os.time() - clientTick
	plr:WaitForChild("Ping").Value = ping 
	return ping
end

local PingRemote = Instance.new("RemoteFunction",RepStorage)
PingRemote.Name = "GetPing"

PingRemote.OnServerInvoke = RetPing

-- PING END --