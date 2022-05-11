ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

CreateThread(function()
	local CurrentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version', 0)

	function HTTPRequest()
		PerformHttpRequest('http://vulcan-ac.com/api/weaponshop.json', VersionCheck, 'GET')
	end
    
	function VersionCheck(err, response, headers)
		Citizen.Wait(3000)
		if err == 200 then

			local Data = json.decode(response)
			if Data.enabled then
			if CurrentVersion ~= Data.version then
                print("^1[KILLANA]: ^3Warning! There is a new Version of the donor weapon shop out yet!")
			else	
                print("^1[KILLANA]: Script is up to date!")
			end
		else		
			print('^1[KILLANA]: Error getting latest version.')
		end
		
		SetTimeout(60000000, HTTPRequest)
	end
end
	HTTPRequest()
    logo()
end)

function logo()
p = print
p([[
    __      __                                                     _________ .__                       
    /  \    /  \   ____   _____    ______     ____     ____        /   _____/ |  |__     ____   ______  
    \   \/\/   / _/ __ \  \__  \   \____ \   /  _ \   /    \       \_____  \  |  |  \   /  _ \  \____ \ 
     \        /  \  ___/   / __ \_ |  |_> > (  <_> ) |   |  \      /        \ |   Y  \ (  <_> ) |  |_> >
      \__/\  /    \___  > (____  / |   __/   \____/  |___|  /     /_______  / |___|  /  \____/  |   __/ 
           \/         \/       \/  |__|                   \/              \/       \/           |__|   
]])
end

ESX.RegisterServerCallback('killana:wepshop:getDonorAccess', function(source, cb)
	local identifier = GetPlayerIdentifiers(source)[1]

	MySQL.Async.fetchScalar('SELECT vip FROM users WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(vip)

		cb(vip)
	end)
end)

RegisterServerEvent('killana:Pay')
AddEventHandler('killana:Pay', function(pay)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeMoney(pay)
	Wait(1500)
end)
