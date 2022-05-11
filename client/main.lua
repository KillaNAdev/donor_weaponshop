ESX = nil
    
    CreateThread(function()
        while ESX == nil do
            TriggerEvent('esx:getSharedObject', function(obj)ESX = obj end)
            Citizen.Wait(1500)
        end
    end)
    


local prevVehicle = nil
local menu = MenuV:CreateMenu(' ', 'Main Menu', 'topcenter', 30, 144, 255, 'size-150', 'ezgif', 'menuv', 'default')
local menu1 = MenuV:CreateMenu(' ', 'Weapon Shop', 'topcenter', 30, 144, 255,'size-150', 'ezgif')
local menu2 = MenuV:CreateMenu(' ', 'Attachment Shop', 'topcenter', 30, 144, 255,'size-150', 'ezgif')

local menu_button2 = menu:AddButton({ icon = '🔫', label = 'Weapon Shop', value = menu1 })
local menu_button3 = menu:AddButton({ icon = '⚙️', label = 'Attachment Shop', value = menu2 })


menu1:On('open', function(item)
    menu1:ClearItems() 
    local elements = {
        [1] = {
            icon = '🔫',
            label = 'Sniper Rifle',
            value = "1",
            description = '~g~$100'
        },
        [2] = {
            icon = '🔫',
            label = 'SMG',
            value = "2",
            description = '~g~$100'
        },
        [3] = {
            icon = '⚡',
            label = 'Assault Rifle',
            value = "3",
            description = '~g~$500'
        },

        [4] = {
            icon = '⚡',
            label = 'Scar',
            value = "4",
            description = '~g~$500'
        },

    } 
    for k,v in ipairs(elements) do
        menu1:AddButton({icon = v.icon,label = v.label,value = v,description = v.description,select = function(btn)
            local selection = btn.Value
            WeaponList(selection.value)
        end})
    end
end)

function WeaponList(value)
    local ped = PlayerPedId()
    if value == '1' then
        if not HasPedGotWeapon(PlayerPedId(), "WEAPON_SNIPERRIFLE", false) then 
        GiveWeaponToPed(PlayerPedId(), "WEAPON_SNIPERRIFLE", 100, false, false)
        TriggerServerEvent('killana:Pay', 100)
        else 
            exports.bulletin:SendAdvanced({
                message = 'You all ready have this weapon.',
                title = 'ERROR',
                subject = 'Donator Weapon Shop',
                icon = 'CHAR_BLOCKED',
            })
    end 
    elseif value == '2' then
 local ped = PlayerPedId()
        if not HasPedGotWeapon(PlayerPedId(), "WEAPON_SMG", false) then 
        GiveWeaponToPed(PlayerPedId(), "WEAPON_SMG", 100, false, false)
        TriggerServerEvent('killana:Pay', 100)
        else 
            exports.bulletin:SendAdvanced({
                message = 'You all ready have this weapon.',
                title = 'ERROR',
                subject = 'Donator Weapon Shop',
                icon = 'CHAR_BLOCKED',
            })
    end 
    elseif value == '3' then
--WEAPON_ASSAULTRIFLE
local ped = PlayerPedId()
        if not HasPedGotWeapon(PlayerPedId(), "WEAPON_ASSAULTRIFLE", false) then 
        GiveWeaponToPed(PlayerPedId(), "WEAPON_ASSAULTRIFLE", 500, false, false)
        TriggerServerEvent('killana:Pay', 500)
        else 
            exports.bulletin:SendAdvanced({
                message = 'You all ready have this weapon.',
                title = 'ERROR',
                subject = 'Donator Weapon Shop',
                icon = 'CHAR_BLOCKED',
            })
            
        end
    elseif value == '4' then

       if not HasPedGotWeapon(PlayerPedId(), "weapon_specialcarbine", false) then 
        GiveWeaponToPed(PlayerPedId(), "weapon_specialcarbine", 500, false, false)
        TriggerServerEvent('killana:Pay', 500)
        else 
            exports.bulletin:SendAdvanced({
                message = 'You all ready have this weapon.',
                title = 'ERROR',
                subject = 'Donator Weapon Shop',
                icon = 'CHAR_BLOCKED',
            })
            
        end
    end
end

menu2:On('open', function(item)
    menu2:ClearItems() 
    local elements = {
        [1] = {
            icon = '🪂',
            label = 'Parachute',
            value = "1",
            description = '~g~$500'
        },
        
      
        [2] = {
            icon = '⚡',
            label = 'Snowball',
            value = "2",
            description = '~g~$500'
        },
    } 
    for k,v in ipairs(elements) do
        menu2:AddButton({icon = v.icon,label = v.label,value = v,description = v.description,select = function(btn)
            local selection = btn.Value
            ToolsList(selection.value)
        end})
    end
end)
function ToolsList(value)
    local ped = PlayerPedId()
    if value == '1' then
        if not HasPedGotWeapon(PlayerPedId(), "GADGET_PARACHUTE", false) then 
        GiveWeaponToPed(PlayerPedId(), "GADGET_PARACHUTE", 100, false, false)
        TriggerServerEvent('killana:Pay', 100)
        else 
            exports.bulletin:SendAdvanced({
                message = 'You all ready have this weapon.',
                title = 'ERROR',
                subject = 'Donator Weapon Shop',
                icon = 'CHAR_BLOCKED',
            })
    end 
 
  
    elseif value == '2' then
--weapon_snowball
local ped = PlayerPedId()
        if not HasPedGotWeapon(PlayerPedId(), "weapon_snowball", false) then 
        GiveWeaponToPed(PlayerPedId(), "weapon_snowball", 500, false, false)
        TriggerServerEvent('killana:Pay', 500)
        else 
            exports.bulletin:SendAdvanced({
                message = 'You all ready have this weapon.',
                title = 'ERROR',
                subject = 'Donator Weapon Shop',
                icon = 'CHAR_BLOCKED',
            })
        end
    end
    
end

-- ESX.TriggerServerCallback('killana:wepshop:getDonorAccess', function(isVIP)
--    

    RegisterCommand('donoweapons', function(source)
        ESX.TriggerServerCallback('killana:wepshop:getDonorAccess', function(isVIP)
   if isVIP then 
print("[Weapon Shop]: You can open this menu!")
MenuV:OpenMenu(menu)
else 
        exports.bulletin:SendAdvanced({
        message = 'You are not a donator, please visit the discord for more information',
        title = 'ERROR',
        subject = 'Donator Weapon Shop',
        icon = 'CHAR_BLOCKED',
    })
end
end, GetPlayerServerId(PlayerId()), '1')
    end)