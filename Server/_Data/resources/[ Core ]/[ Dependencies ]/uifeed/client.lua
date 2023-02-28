local currentResourceName = GetCurrentResourceName()

RegisterNetEvent(currentResourceName .. ":showAdvancedNotification")
RegisterNetEvent(currentResourceName .. ":showLocationNotification")
RegisterNetEvent(currentResourceName .. ":showTooltip")
RegisterNetEvent(currentResourceName .. ":showSimpleRightText")
RegisterNetEvent(currentResourceName .. ":showObjective")
RegisterNetEvent(currentResourceName .. ":showTopNotification")
RegisterNetEvent(currentResourceName .. ":showAdvancedRightNotification")
RegisterNetEvent(currentResourceName .. ":showBasicTopNotification")
RegisterNetEvent(currentResourceName .. ":showSimpleCenterText")

AddEventHandler(currentResourceName .. ":showAdvancedNotification", function(title, subTitle, dict, icon, duration)
	exports[currentResourceName]:showAdvancedNotification(title, subtitle, dict, icon, duration)
end)

AddEventHandler(currentResourceName .. ":showLocationNotification", function(text, location, duration)
	exports[currentResourceName]:showLocationNotification(text, location, duration)
end)

AddEventHandler(currentResourceName .. ":showTooltip", function(text, duration)
	exports[currentResourceName]:showTooltip(text, duration)
end)

AddEventHandler(currentResourceName .. ":showSimpleRightText", function(text, duration)
	exports[currentResourceName]:showSimpleRightText(text, duration)
end)

AddEventHandler(currentResourceName .. ":showObjective", function(text, duration)
	exports[currentResourceName]:showObjective(text, duration)
end)

AddEventHandler(currentResourceName .. ":showTopNotification", function(title, subtext, duration)
	exports[currentResourceName]:showTopNotification(title, subtext, duration)
end)

AddEventHandler(currentResourceName .. ":showAdvancedRightNotification", function(text, dict, icon, text_color, duration)
	exports[currentResourceName]:showAdvancedRightNotification(text, dict, icon, text_color, duration)
end)

AddEventHandler(currentResourceName .. ":showBasicTopNotification", function(text, duration)
	exports[currentResourceName]:showBasicTopNotification(text, duration)
end)

AddEventHandler(currentResourceName .. ":showSimpleCenterText", function(text, duration)
	exports[currentResourceName]:showSimpleCenterText(text, duration)
end)
