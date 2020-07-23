if Config.UseESX then
  local ESX = nil

  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

  ESX.RegisterServerCallback('pauseteleport:getRank', function(source, cb)
      local xPlayer = ESX.GetPlayerFromId(source)

      IsAuthorized = false

      if xPlayer ~= nil then
        local group = xPlayer.getGroup()
        for k,v in pairs(Config.AuthorizedRoles) do
          if v == group then
            IsAuthorized = true
          end
        end
      end

      return IsAuthorized
  end)
end
