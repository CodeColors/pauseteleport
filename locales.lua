Locales = {}
Locales.Selected = ""

Locales['english'] = {
  ['activated'] = "Waypoint teleport: ~g~activated",
  ['deactivated'] = "Waypoint teleport: ~r~deactivated",
  ['need_pass'] = "Please enter the password"
}

function locale(str)
  if Locales[Locales.Selected] == nil then Locales.Selected = "english" end -- Locale protection (anti nil value). Do not touch if you don't know what are you doing
  return Locales[Locales.Selected][str]
end


