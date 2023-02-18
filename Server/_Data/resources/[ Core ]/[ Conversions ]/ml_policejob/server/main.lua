RegisterServerEvent('ml_policejob:cuffplayer')
AddEventHandler('ml_policejob:cuffplayer', function(target)
  TriggerClientEvent('ml_policejob:cuff', target)
end)

RegisterServerEvent('ml_policejob:uncuffplayer')
AddEventHandler('ml_policejob:uncuffplayer', function(target)
  TriggerClientEvent('ml_policejob:uncuff', target)
end)

RegisterServerEvent('ml_policejob:lassoplayer')
AddEventHandler('ml_policejob:lassoplayer', function(target)
	TriggerClientEvent('ml_policejob:hogtie', target)
end)
