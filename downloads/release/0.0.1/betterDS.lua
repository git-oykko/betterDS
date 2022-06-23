-- Created by OykkoIsBack
-- betterDS
local data = {}
local ds = game:GetService("DataStoreService"):GetDataStore("")

function data.setData(plr, newValues)
	local tries = 0
	plr = tostring(plr)
	plr = game.Players[plr]
	repeat
		tries += 1
		
		sucess = pcall(function()
			ds:SetAsync(plr.UserId, newValues)
		end)
		if not sucess then
			warn("Retrying")
			task.wait(6.5)
		end
	until tries == 5 or sucess
	
	if not sucess then
		game.Players[plr]:Kick("Roblox's data servers are unavailiable")
		warn("Unable to load data for"..plr)
	end
end

function data.getData(plr)
	local tries = 0
	plr = tostring(plr)
	plr = game.Players[plr]
	repeat
		tries += 1
		
		sucess = pcall(function()
			info = ds:GetAsync(plr.UserId)
		end)
		if not sucess then
			warn("Retrying")
			task.wait(6.5)
		end
	until tries == 5 or sucess
	
	if not sucess then
		game.Players[plr]:Kick("Roblox's data servers are unavailiable")
		warn("Unable to load data for "..plr)
	end
	
	return info
end

return data
