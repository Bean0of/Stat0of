local roundUp = math.ceil

local RepStorage = game:GetService("ReplicatedStorage")

script.Parent:WaitForChild("StatsModule").Parent = RepStorage

-- PING START --

local PingRemote = Instance.new("RemoteFunction",RepStorage)
PingRemote.Name = "GetPing"

function RetPing(plr,clientTick) return roundUp((tick() - clientTick) * 1000) end
PingRemote.OnServerInvoke = RetPing

-- PING END --