RegisterServerEvent('borp_fightclub:AddSomeMoney')
AddEventHandler('borp_fightclub:AddSomeMoney', function()
    local _source = source
    print('pay')
    --[[local price = Config.Price
    local xp = Config.Xp
    local Character = VorpCore.getUser(_source).getUsedCharacter
    Character.addCurrency(0, price)
    Character.addXp(xp)]]
end)