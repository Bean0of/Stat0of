--[[

MADE BY BEANOOF

Feel free to use this your game

--]]

local RS = game:GetService("RunService")

local RepStorage = game:GetService("ReplicatedStorage")
local GetPing = RepStorage:WaitForChild("GetPing")

local module = {}

function module:FPSInit(label,pre,post)
	local pre = pre or ""
	local post = post or ""
	
	local counter = 0
	local lastUpdate = tick()
	
	RS.RenderStepped:Connect(function()
		if tick() < lastUpdate+1 then
			counter = counter + 1
		else
			label.Text = pre..tostring(counter+1)..post
			counter = 0
			lastUpdate = tick()
		end
	end)
end

function module:PingInit(label,pre,post)
	local pre = pre or ""
	local post = post or ""
	
	spawn(function()
		while wait(1) do
			local ping = tostring(GetPing:InvokeServer(tick()))
			label.Text = pre..ping..post
		end
	end)
end

function module:PFPSInit(label,pre,post)
	local pre = pre or ""
	local post = post or ""
	
	spawn(function()
		while wait(1) do
			local PFPS = workspace:GetRealPhysicsFPS()
			label.Text = pre..PFPS..post
		end
	end)
end

return module