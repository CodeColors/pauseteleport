Config = {}

Config.Shortcut = "F11"
Config.ComboShortcut = "" -- Leave blank for non-combo shortcut

--
--  USAGE PROTECTION
--

Config.UseSteamHex = false
Config.Whitelisted = {}

Config.UsePassword = true
Config.Password = ""

Config.UseEssentialMode = false
Config.AuthorizedRoles = {}

--
-- LOCALES
--

Locales = {}
Locales.Selected = "english" -- Available locale: french, english


Locales.english = {
    "activate" = "Sucefully activated teleport mode"
}






-- Locale protection (anti nil value). Do not touch if you don't know what are you doing
if Locales[Locales.Selected] == nil then Locales.Selected = "english" end