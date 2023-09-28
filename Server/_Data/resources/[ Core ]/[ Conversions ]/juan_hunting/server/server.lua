data = {}
RegisterServerEvent("hunting:add")
AddEventHandler("hunting:add", function(item)
	TriggerEvent("redemrp_inventory:getData",function(call)
		local _item = item
		local _source = source
		local randomitem =  math.random(1,3)
		data = call
		data.addItem(_source, _item, randomitem)
	end)
end)

RegisterServerEvent("hunting:xp")
AddEventHandler("hunting:xp", function(item)
	TriggerEvent('redemrp:getPlayerFromId', source, function(user)
		user.addXP(item)
	end)
end)

RegisterServerEvent("hunting:money")
AddEventHandler("hunting:money", function(item)
	TriggerEvent('redemrp:getPlayerFromId', source, function(user)
		user.addMoney(item)
	end)
end)
