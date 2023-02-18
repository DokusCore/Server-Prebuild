local entity
local Panning = false
local ShowPrompts = false
local PausePrompts = false
local Prompt_Panning = nil
Group = GetRandomIntInRange(0, 0xffffff)

local LuckyNumber = 10 -- When this number hits the player recieves a reward.
local rChance = { Min = 0, Max = 20 } -- Default 1 / 20 change to get a reward
local rReward = { Min = 1, Max = 3  } -- Default reward between 1 and 3 gold nuggets

local WaterTypes = {
  [1] = {["name"] = "Sea of Coronado", ["waterhash"] = -247856387, ["watertype"] = "lake"},
  [2] = {["name"] = "San Luis River", ["waterhash"] = -1504425495, ["watertype"] = "river"},
  [3] = {["name"] = "Lake Don Julio", ["waterhash"] = -1369817450, ["watertype"] = "lake"},
  [4] = {["name"] = "Flat Iron Lake", ["waterhash"] = -1356490953, ["watertype"] = "lake"},
  [5] = {["name"] = "Upper Montana River", ["waterhash"] = -1781130443, ["watertype"] = "river"},
  [6] = {["name"] = "Owanjila", ["waterhash"] = -1300497193, ["watertype"] = "river"},
  [7] = {["name"] = "HawkEye Creek", ["waterhash"] = -1276586360, ["watertype"] = "river"},
  [8] = {["name"] = "Little Creek River", ["waterhash"] = -1410384421, ["watertype"] = "river"},
  [9] = {["name"] = "Dakota River", ["waterhash"] = 370072007, ["watertype"] = "river"},
  [10] = {["name"] = "Beartooth Beck", ["waterhash"] = 650214731, ["watertype"] = "river"},
  [11] = {["name"] = "Lake Isabella", ["waterhash"] = 592454541, ["watertype"] = "lake"},
  [12] = {["name"] = "Cattail Pond", ["waterhash"] = -804804953, ["watertype"] = "lake"},
  [13] = {["name"] = "Deadboot Creek", ["waterhash"] = 1245451421, ["watertype"] = "river"},
  [14] = {["name"] = "Spider Gorge", ["waterhash"] = -218679770, ["watertype"] = "river"},
  [15] = {["name"] = "O'Creagh's Run", ["waterhash"] = -1817904483, ["watertype"] = "lake"},
  [16] = {["name"] = "Moonstone Pond", ["waterhash"] = -811730579, ["watertype"] = "lake"},
  [17] = {["name"] = "Roanoke Valley", ["waterhash"] = -1229593481, ["watertype"] = "river"},
  [18] = {["name"] = "Elysian Pool", ["waterhash"] = -105598602, ["watertype"] = "lake"},
  [19] = {["name"] = "Heartland Overflow", ["waterhash"] = 1755369577, ["watertype"] = "swamp"},
  [20] = {["name"] = "Lagras", ["waterhash"] = -557290573, ["watertype"] = "swamp"},
  [21] = {["name"] = "Lannahechee River", ["waterhash"] = -2040708515, ["watertype"] = "river"},
  [22] = {["name"] = "Dakota River", ["waterhash"] = 370072007, ["watertype"] = "river"},
  [23] = {["name"] = "Random1", ["waterhash"] = 231313522, ["watertype"] = "river"},
  [24] = {["name"] = "Random2", ["waterhash"] = 2005774838, ["watertype"] = "river"},
  [25] = {["name"] = "Random3", ["waterhash"] = -1287619521, ["watertype"] = "river"},
  [26] = {["name"] = "Random4", ["waterhash"] = -1308233316, ["watertype"] = "river"},
  [27] = {["name"] = "Random5", ["waterhash"] = -196675805, ["watertype"] = "river"},
}

CreateThread(function()
  while true do Wait(1000)
    if not Panning then
      Panning = true
      local PedID = PedID()
      local coords = GetCoords(PedID)
      local InWater = IsEntityInWater(PedID)
      local Water = Citizen.InvokeNative(0x5BA7A68A346A5A91, coords.x, coords.y, coords.z)
      local OnMount, InVeh = IsPedOnMount(PedID), IsPedInAnyVehicle(PedID, true)

      for k, v in pairs(WaterTypes) do
        if ((Water == WaterTypes[k]["waterhash"]) and (InWater)) then
          ShowPrompts = true
          ActPrompts()
          while (ShowPrompts) do Wait(1)
            if (not (PausePrompts)) then
              local pName = CreateVarString(10, 'LITERAL_STRING', 'Scavenging')
              PromptSetActiveGroupThisFrame(Group, pName)
              local Control = PromptHasHoldModeCompleted(Prompt_Panning)
              local InWater = IsEntityInWater(PedID)

              -- Reset when not in water
              if ((not (InWater)) or (InWater == 0)) then
                ResetPrompts()
                Panning = false
                ShowPrompts = false
                PausePrompts = false
              end

              if ((Control) and (not OnMount) and (not (InVeh))) then
                PausePrompts = true
                local Sync = TCTCC('DokusCore:Sync:Get:UserData')
                local Index = { 'User', 'Item', { Sync.SteamID, Sync.CharID, 'gold_pan' } }
                local Inv  = TSC('DokusCore:Core:DBGet:Inventory', Index)

                if (not (Inv.Exist)) then
                  NoteObjective('System', "You've no gold pan in your inventory!", 'Horn', 5000)
                end

                if (Inv.Exist) then
                  CrouchAnimAndAttach()
                  Wait(4000)
                  Cinema(1)
                  GoldShake()
                  Time = math.random(15, 30)
                  NoteObjective('Gold Panning', 'Searching for Gold...', 'Gold', ((Time * 1000) - 500))
                  ClearPedTasks(PedID) Wait(1000)
                  DeleteObject(entity)
                  DeleteEntity(entity)

                  local Chance = Random(rChance.Min, rChance.Max)
                  local Reward = Random(rReward.Min, rReward.Max)
                  if (Chance == LuckyNumber) then
                    local Index = { 'User', 'Item', { Sync.SteamID, Sync.CharID, 'gold_nugget' } }
                    local Inv  = TSC('DokusCore:Core:DBGet:Inventory', Index)
                    if (Inv.Exist) then
                      local Index = { 'User', 'AddItem', { Sync.SteamID, Sync.CharID, 'gold_nugget', Reward, Inv.Result[1].Amount } }
                      TriggerServerEvent('DokusCore:Core:DBSet:Inventory', Index)
                      NoteObjective('Gold Panning', "You've found "..TS(Reward).." gold nuggets!", 'check', 3000)
                      Panning = false
                      ShowPrompts = false
                      PausePrompts = false
                    else
                      local Index = { 'User', 'InsItem', { Sync.SteamID, Sync.CharID, 'Mineral', 'gold_nugget', Reward } }
                      TriggerServerEvent('DokusCore:Core:DBIns:Inventory', Index)
                      NoteObjective('Gold Panning', "You've found "..TS(Reward).." gold nuggets!", 'check', 3000)
                      Panning = false
                      ShowPrompts = false
                      PausePrompts = false
                    end
                  else
                    NoteObjective('Gold Panning', "You've found nothing", 'Horn', 2500)
                    Panning = false
                    ShowPrompts = false
                    PausePrompts = false
                  end
                end

                Cinema(0)
                PausePrompts = false
              end
            end
          end
        end
      end

      Panning = false
    end
  end
end)

function CrouchAnimAndAttach()
  local dict = "script_rc@cldn@ig@rsc2_ig1_questionshopkeeper"
  RequestAnimDict(dict)
  while not HasAnimDictLoaded(dict) do Wait(10) end
  local PedID = PedID()
  local coords = GetEntityCoords(PedID)
  TaskPlayAnim(PedID, dict, "inspectfloor_player", 1.0, 8.0, - 1, 1, 0, false, false, false)
  Wait(1000)
  local boneIndex = GetEntityBoneIndexByName(PedID, "SKEL_R_HAND")
  local modelHash = GetHashKey("P_CS_MININGPAN01X")
  LoadModel(modelHash)
  entity = CreateObject(modelHash, coords.x + 0.3, coords.y, coords.z, true, false, false)
  SetEntityVisible(entity, true)
  SetEntityAlpha(entity, 255, false)
  Citizen.InvokeNative(0x283978A15512B2FE, entity, true)
  SetModelAsNoLongerNeeded(modelHash)
  AttachEntityToEntity(entity, PedID, boneIndex, 0.2, 0.0, - 0.2, - 100.0, - 50.0, 0.0, false, false, false, true, 2, true)
end

function GoldShake()
  local dict = "script_re@gold_panner@gold_success"
  RequestAnimDict(dict)
  while not HasAnimDictLoaded(dict) do Wait(10) end
  TaskPlayAnim(PedID(), dict, "SEARCH02", 1.0, 8.0, - 1, 1, 0, false, false, false)
end


function LoadModel(model)
  local attempts = 0
  while attempts < 100 and not HasModelLoaded(model) do
    RequestModel(model) Wait(10)
    attempts = attempts + 1
  end return IsModelValid(model)
end

function ActPrompts()
  ResetPrompts()
  CreateThread(function()
    local str = 'Gold Panning'
    Prompt_Panning = PromptRegisterBegin()
    PromptSetControlAction(Prompt_Panning, _Keys.E)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(Prompt_Panning, str)
    PromptSetEnabled(Prompt_Panning, true)
    PromptSetVisible(Prompt_Panning, true)
    PromptSetHoldMode(Prompt_Panning, true)
    PromptSetGroup(Prompt_Panning, Group)
    PromptRegisterEnd(Prompt_Panning)
  end)
end

function ResetPrompts()
  Prompt_Panning = nil
  Group = GetRandomIntInRange(0, 0xffffff)
end
