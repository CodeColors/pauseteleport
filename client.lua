local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

-- Global vars

local IsActivated = false
local CShortcut = false
local ESX = nil

-- Init

if Config.ComboShortcut ~= nil then
  CShortcut = true
end

if Config.UseESX then
  Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) 
            ESX = obj 
        end)

        Citizen.Wait(0)
    end
  end)
end
  
-- Useful functions

function ShowNotification(message)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(message)
	DrawNotification(0,1)
end

function KeyboardInput(textEntry, inputText, maxLength)
    AddTextEntry("FMMC_KEY_TIP1", textEntry)
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", inputText, "", "", "", maxLength)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        return result
    else
        Citizen.Wait(500)
        return nil
    end
end

-- Mecanism

-- Key toggle system

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)
    if CShortcut then
      if IsControlJustPressed(1, Keys[Config.ComboShortcut]) and IsControlJustPressed(1, Keys[Config.Shortcut]) then
        if not IsActivated then
          if Config.UsePassword then
            local password = KeyboardInput(locale("need_pass"), "", 30)
            if password == Config.Password then
              if Config.UseESX then
                ESX.TriggerServerCallback('pauseteleport:getRank', function(authorized)
                  if authorized then
                    IsActivated = not IsActivated
                    if IsActivated then
                      ShowNotification(locale("activated"))
                    else
                      ShowNotification(locale("deactivated"))
                    end
                  end
                end)
              end
            end
          end
        else
          IsActivated = not IsActivated
        end
      end
    else
      if IsControlJustPressed(1, Keys[Config.Shortcut]) then
        if not IsActivated then
          if Config.UsePassword then
            local password = KeyboardInput(locale("need_pass"), "", 30)
            if password == Config.Password then
              if Config.UseESX then
                ESX.TriggerServerCallback('pauseteleport:getRank', function(authorized)
                  if authorized then
                    IsActivated = not IsActivated
                    if IsActivated then
                      ShowNotification(locale("activated"))
                    else
                      ShowNotification(locale("deactivated"))
                    end
                  end
                end)
              end
            end
          end
        else
          IsActivated = not IsActivated
        end
      end
    end
  end
end)

-- Teleport detector and teleporter

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(200)
    if IsActivated then
      
    end
  end
end)



local blip = GetWaypointBlipEnumId()
            if blip ~= nil then
              local coords = GetBlipCoords(blip)
            end
