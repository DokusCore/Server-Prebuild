-- VORP = exports.vorp_inventory:vorp_inventoryApi()
--
-- data = {}
-- TriggerEvent("vorp_inventory:getData",function(call)
--     data = call
-- end)
--
-- local VorpCore = {}
--
-- TriggerEvent("getCore",function(core)
--     VorpCore = core
-- end)


--Locations = {
 --   vector3(2716.97265625, -1282.83203125, 60.34485244750976),
--}

-- RegisterServerEvent('talon_robbery:talk3')
-- AddEventHandler('talon_robbery:talk3', function()
--         local _source = source
--         local Character = VorpCore.getUser(_source).getUsedCharacter
--         TriggerClientEvent("vorp:TipBottom", _source, "Roger: I have a dangerous job for you. ", 5000)
-- 		Citizen.Wait(5000)
-- 		TriggerClientEvent("vorp:TipBottom", _source, "Roger: My father Cliff has gone missing up North at..", 5000)
-- 		Citizen.Wait(5000)
-- 		TriggerClientEvent("vorp:TipBottom", _source, "Roger: his cabin near Cairn Lake.", 5000)
-- 		Citizen.Wait(5000)
--         TriggerClientEvent("vorp:TipBottom", _source, "Roger: He went hunting for a Legendary Bear,", 5000)
--         Citizen.Wait(5000)
--         TriggerClientEvent("vorp:TipBottom", _source, "Roger: and was supposed to be home last week ", 5000)
--         Citizen.Wait(5000)
--         TriggerClientEvent("vorp:TipBottom", _source, "Roger: Can you find out what happend to him..please? ", 5000)
--         Citizen.Wait(5000)
--         TriggerClientEvent("vorp:TipBottom", _source, "Roger: I'll pay you 100$ for your trouble.. ", 5000)
--         Citizen.Wait(5000)
-- 		TriggerClientEvent('talon_robbery:info3', _source)
-- end)

-- RegisterServerEvent('talon_robbery:talk5')
-- AddEventHandler('talon_robbery:talk5', function()
--         local _source = source
--         local Character = VorpCore.getUser(_source).getUsedCharacter
--         TriggerClientEvent("vorp:TipBottom", _source, "Roger: So did you find him? ", 5000)
-- 		Citizen.Wait(5000)
-- 		TriggerClientEvent("vorp:TipBottom", _source, "YOU: Sadly, I found him deceased but his journal says...", 5000)
-- 		Citizen.Wait(5000)
-- 		TriggerClientEvent("vorp:TipBottom", _source, "YOU: He found the bear and it attacked him...", 5000)
-- 		Citizen.Wait(5000)
--         TriggerClientEvent("vorp:TipBottom", _source, "YOU: He wanted you to know he loved you,", 5000)
--         Citizen.Wait(5000)
--         TriggerClientEvent("vorp:TipBottom", _source, "Roger: -hanging his head- I'm glad you found him ", 5000)
--         Citizen.Wait(5000)
--         TriggerClientEvent("vorp:TipBottom", _source, "Roger: Did you kill that &$#!@#*& Bear? ", 5000)
--         Citizen.Wait(5000)
--         TriggerClientEvent("vorp:TipBottom", _source, "YOU: Yeah, He's dead alright! ", 5000)
--         Citizen.Wait(5000)
--         TriggerClientEvent("vorp:TipBottom", _source, "Roger: A deal's a deal, here's your money. ", 5000)
--         Citizen.Wait(5000)
--         TriggerClientEvent("vorp:TipBottom", _source, "Roger: oh, and you can keep the pelt too. ", 5000)
--         Citizen.Wait(5000)
-- 		TriggerClientEvent('talon_robbery:go5', _source)
--
-- end)

-- RegisterServerEvent('talon_robbery:pay3')
-- AddEventHandler('talon_robbery:pay3', function()
--         local _source = source
--         local Character = VorpCore.getUser(_source).getUsedCharacter
--         u_money = Character.money
--
--     if u_money <= 0 then
--         TriggerClientEvent("vorp:TipBottom", _source, "You have no money", 9000)
--         return
--     end
--
--     TriggerEvent("vorp:removeMoney", _source, 0, 0)
--     TriggerClientEvent("vorp:TipBottom", _source, "Roger: Now Go to the Cairn Lake Cabin and find Cliff!", 8000)
-- 	Citizen.Wait(8000)
--     TriggerClientEvent('talon_robbery:go3', _source)
-- end)

-- RegisterNetEvent("talon_robbery:startrobbery3")
-- AddEventHandler("talon_robbery:startrobbery3", function(robtime)
--     local _source = source
--     local Character = VorpCore.getUser(source).getUsedCharacter
--     local count = VORP.getItemCount(_source, "water")
--
--     if count >= 1 then
--         VORP.subItem(_source,"water", 1)
--         isRobbing = false
--         TriggerClientEvent('talon_placebait:startAnimation3', _source)
--
--
--         TriggerClientEvent("vorp:TipBottom", _source, "You have placed the bait...",6000)
--     else
--
--         TriggerClientEvent("vorp:TipBottom", _source, "You dont have any bait", 6000)
--
--
--     end
--
-- end)


-- RegisterServerEvent('talon_robbery:talk4')
-- AddEventHandler('talon_robbery:talk4', function()
--         local _source = source
--         local Character = VorpCore.getUser(_source).getUsedCharacter
--         TriggerClientEvent("vorp:TipBottom", _source, "Cliffs Journal: Day 1.... ", 5000)
-- 		Citizen.Wait(5000)
-- 		TriggerClientEvent("vorp:TipBottom", _source, "Didn't Find The Grizzly, but he Found ME...", 5000)
-- 		Citizen.Wait(5000)
-- 		TriggerClientEvent("vorp:TipBottom", _source, "Cliffs Journal: Day 2.....", 5000)
-- 		Citizen.Wait(5000)
--         TriggerClientEvent("vorp:TipBottom", _source, "It's HUNTING me, I have to get out of here,", 5000)
--         Citizen.Wait(5000)
--         TriggerClientEvent("vorp:TipBottom", _source, "Cliffs Journal: Day 5..... ", 5000)
--         Citizen.Wait(5000)
--         TriggerClientEvent("vorp:TipBottom", _source, "I've made it back alive.. but I'm not going to make it.. ", 5000)
--         Citizen.Wait(5000)
--         TriggerClientEvent("vorp:TipBottom", _source, "If your reading this tell Roger I love him.... ", 5000)
--         Citizen.Wait(5000)
--         TriggerClientEvent("vorp:TipBottom", _source, "Get my Revenge and find that Grizzly.... ", 5000)
--         Citizen.Wait(5000)
--         TriggerClientEvent("vorp:TipBottom", _source, "You'll find him near the Cabin in the Snow ", 5000)
--         Citizen.Wait(5000)
--         TriggerClientEvent("vorp:TipBottom", _source, "Place some bait in the area to draw him close ", 5000)
--         Citizen.Wait(5000)
		-- TriggerClientEvent('talon:ToggleNotification3', _source)
    --     Citizen.Wait(2000)
    --     TriggerClientEvent('talon_robbery:go4', _source)
-- end)









-- RegisterServerEvent('talon_robbery:loot3')
-- AddEventHandler('talon_robbery:loot3', function()
--     local _source = source
--     local Character = VorpCore.getUser(_source).getUsedCharacter
--     placedbait = placedbait
--
--     if placedbait == true then
--     end
--
-- end)

-- RegisterNetEvent("talon_robbery:payout3")
-- AddEventHandler("talon_robbery:payout3", function()
--     TriggerEvent('vorp:getCharacter', source, function(user)
--         local _source = source
--         local _user = user
--         local Character = VorpCore.getUser(_source).getUsedCharacter
--         ---randommoney = math.random(10,20)
--        -- ritem = math.random(2,2)
--         --local randomitempull = math.random(1, #Config.Items)
--         --local itemName = Config.Items[randomitempull]
--         VORP.addItem(_source, itemName, ritem)
--         Character.addCurrency(0, 100)
--          TriggerClientEvent("vorp:ShowAdvancedRightNotification", _source, "Roger paid you 100$ ", "mp_lobby_textures", "leaderboard_cash", "COLOR_PURE_WHITE", 3000)
--         ClearGpsFlags()
--     end)
-- end)


-- RegisterNetEvent("policenotify3")
-- AddEventHandler("policenotify3", function(players, coords, alert)
--     for each, playerId  in ipairs(GetPlayers()) do
--         local User = VorpCore.getUser(playerId).getUsedCharacter
--
--         TriggerEvent("Witness:ToggleNotification3", playerId, coords, alert)
--     end
-- end)
