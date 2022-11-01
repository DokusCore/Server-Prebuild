--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
RegisterNUICallback('SetGender', function(Data) MyGender = Data.Gender end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('Rotation', function(Data)
  if (Data.Key == "left")  then Rotation(5) end
  if (Data.Key == "right") then Rotation(-5) end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('HeadType', function(Data)
  if (CamPos ~= 'Face') then CustomCamera(CamInUse, 'Face', MyGender) end
  local ID = tonumber(Data.id)
  if (Up(MyGender) == 'MP_MALE') then
    for k,v in pairs(MaleHeads) do
      if (v.Type == 'heads') then
        if (k == ID) then
          Citizen.InvokeNative(0xD3A7B003ED343FD9, NPCs[1], tonumber(v.Hash), true, true, true) -- FACE
          CharData.Skin.Head = tonumber(v.Hash)
        end
      end
    end
  end

  if (Up(MyGender) == 'MP_FEMALE') then
    for k,v in pairs(FemaleHeads) do
      if (v.Type == 'heads') then
        if (k == ID) then
          Citizen.InvokeNative(0xD3A7B003ED343FD9, NPCs[2], tonumber(v.Hash), true, true, true) -- FACE
          CharData.Skin.Head = tonumber(v.Hash)
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('TomPele', function(Data)
  if (CamPos ~= 'Body') then CustomCamera(CamInUse, 'Body', MyGender) end
  local ID = tonumber(Data.id)
  if (Up(MyGender) == 'MP_MALE') then
    for k,v in pairs(MaleTorsos) do
      if (v.Type == 'BODIES_UPPER') then
        if (k == ID) then
          Citizen.InvokeNative(0xD3A7B003ED343FD9, NPCs[1], tonumber(v.Hash), true, true, true)
          CharData.Skin.Torso = tonumber(v.Hash)
        end
      end
    end
  end

  if (Up(MyGender) == 'MP_FEMALE') then
    for k,v in pairs(FemaleTorsos) do
      if (v.Type == 'BODIES_UPPER') then
        if (k == ID) then
          Citizen.InvokeNative(0xD3A7B003ED343FD9, NPCs[2], tonumber(v.Hash), true, true, true)
          CharData.Skin.Torso = tonumber(v.Hash)
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('Legs', function(Data)
  if (CamPos ~= 'Legs') then CustomCamera(CamInUse, 'Legs', MyGender) end
  local ID = tonumber(Data.id)
  if (Up(MyGender) == 'MP_MALE') then
    for k,v in pairs(MaleLegs) do
      if (v.Type == 'BODIES_LOWER') then
        if (k == ID) then
          Citizen.InvokeNative(0xD3A7B003ED343FD9, NPCs[1], tonumber(v.Hash), true, true, true)
          CharData.Skin.Legs = tonumber(v.Hash)
        end
      end
    end
  end

  if (Up(MyGender) == 'MP_FEMALE') then
    for k,v in pairs(FemaleLegs) do
      if (v.Type == 'BODIES_LOWER') then
        if (k == ID) then
          Citizen.InvokeNative(0xD3A7B003ED343FD9, NPCs[2], tonumber(v.Hash), true, true, true)
          CharData.Skin.Legs = tonumber(v.Hash)
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('Olhos', function(Data)
  if (CamPos ~= 'Eyes') then CustomCamera(CamInUse, 'Eyes', MyGender) end
  local ID = tonumber(Data.id)
  if (Up(MyGender) == 'MP_MALE') then
    for k,v in pairs(MaleEyes) do
      if (v.Type == 'eyes') then
        if (k == ID) then
          Citizen.InvokeNative(0xD3A7B003ED343FD9, NPCs[1], tonumber(v.Hash), true, true, true)
          CharData.Skin.Eyes = tonumber(v.Hash)
        end
      end
    end
  end

  if (Up(MyGender) == 'MP_FEMALE') then
    for k,v in pairs(FemaleEyes) do
      if (v.Type == 'eyes') then
        if (k == ID) then
          Citizen.InvokeNative(0xD3A7B003ED343FD9, NPCs[2], tonumber(v.Hash), true, true, true)
          CharData.Skin.Eyes = tonumber(v.Hash)
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('Porte', function(Data)
  if (CamPos ~= 'Body') then CustomCamera(CamInUse, 'Body', MyGender) end
  local Offset = 0
  if ((CamPos == nil) or (CamPos ~= 'Body')) then SwitchCustomCam('Body') end
  if (Up(MyGender) == 'MP_MALE') then Offset = 132 else Offset = 114 end
  local Index = (Offset + Data.id)
  if (Up(MyGender) == 'MP_MALE') then
    Citizen.InvokeNative(0xA5BAE410B03E7371, NPCs[1], Index, false, true)
    Citizen.InvokeNative(0xCC8CA3E88256E58F, NPCs[1], 0, 1, 1, 1, 0)
    CharData.Skin.Size = tonumber(Index)
  else
    Citizen.InvokeNative(0xA5BAE410B03E7371, NPCs[2], Index, false, true)
    Citizen.InvokeNative(0xCC8CA3E88256E58F, NPCs[2], 0, 1, 1, 1, 0)
    CharData.Skin.Size = tonumber(Index)
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('Gordura', function(Data)
  if (CamPos ~= 'Body') then CustomCamera(CamInUse, 'Body', MyGender) end
  local Gen = nil
  if (Up(MyGender) == 'MP_MALE') then Gen = 1 else Gen = 2 end
  local ID = tonumber(Data.id)
  Citizen.InvokeNative(0x1902C4CFCC5BE57C, NPCs[Gen], tonumber(_Skins.Looks.Waists[ID]))
  Citizen.InvokeNative(0xCC8CA3E88256E58F, NPCs[Gen], 0, 1, 1, 1, false)
  CharData.Skin.Waists = tonumber(_Skins.Looks.Waists[ID])
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local Ani_Teeth = false
RegisterNUICallback('Dentes', function(Data)
  if (CamPos ~= 'Teeth') then CustomCamera(CamInUse, 'Teeth', MyGender) end
  local Gen = nil
  if (Up(MyGender) == 'MP_MALE') then Gen = 1 else Gen = 2 end
  local ID = tonumber(Data.id)

  if (not (Ani_Teeth)) then
    Ani_Teeth = true
    RequestAnimDict("FACE_HUMAN@GEN_MALE@BASE")
    while not HasAnimDictLoaded("FACE_HUMAN@GEN_MALE@BASE") do Wait(100) end
    if (Up(MyGender) == 'MP_MALE') then TaskPlayAnim(NPCs[Gen], "FACE_HUMAN@GEN_MALE@BASE", "Face_Dentistry_Loop", 1090519040, -4, -1, 17, 0, 0, 0, 0, 0, 0) end
  end

  if (Up(MyGender) == 'MP_MALE') then
    for k,v in pairs(MaleTeeth) do
      if (v.Type == 'teeth') then
        if (k == ID) then
          Citizen.InvokeNative(0xD3A7B003ED343FD9, NPCs[1], tonumber(v.Hash), true, true, true)
          CharData.Skin.Teeth = tonumber(v.Hash)
        end
      end
    end
  end

  if (Up(MyGender) == 'MP_FEMALE') then
    for k,v in pairs(FemaleTeeth) do
      if (v.Type == 'teeth') then
        if (k == ID) then
          Citizen.InvokeNative(0xD3A7B003ED343FD9, NPCs[2], tonumber(v.Hash), true, true, true)
          CharData.Skin.Teeth = tonumber(v.Hash)
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('Cabelos', function(Data)
  if (CamPos ~= 'Face') then CustomCamera(CamInUse, 'Face', MyGender) end
  local ID = tonumber(Data.id)

  if (Up(MyGender) == 'MP_MALE') then
    for k,v in pairs(MaleHairs) do
      if (v.Type == 'hair') then
        if (k == ID) then
          Citizen.InvokeNative(0xD3A7B003ED343FD9, NPCs[1], tonumber(v.Hash), true, true, true)
          CharData.Skin.Hair = tonumber(v.Hash)
        end
      end
    end
  end

  if (Up(MyGender) == 'MP_FEMALE') then
    for k,v in pairs(FemaleHairs) do
      if (v.Type == 'hair') then
        if (k == ID) then
          Citizen.InvokeNative(0xD3A7B003ED343FD9, NPCs[2], tonumber(v.Hash), true, true, true)
          CharData.Skin.Hair = tonumber(v.Hash)
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('FaceFeatured', function(Data)
  if (CamPos ~= 'Face') then CustomCamera(CamInUse, 'Face', MyGender) end
  local Gen = nil
  if (Up(MyGender) == 'MP_MALE') then Gen = 1 else Gen = 2 end
  local ID = tonumber(Data.id)
  local Index = tonumber(Data.facefeature)
  Citizen.InvokeNative(0x5653AB26C82938CF, NPCs[Gen], Index, ID)
  Citizen.InvokeNative(0xCC8CA3E88256E58F, NPCs[Gen], false, true, true, true, false)

  local Entry = false
  for k,v in pairs(CharData.Face) do
    if (v.Hash == Index) then Entry = true end
  end

  if (Entry) then
    local X = TabiDelKey(CharData.Face, Index)
    table.remove(CharData.Face, X)
    Tabi(CharData.Face, { Hash = Index, Value = ID })
  else
    Tabi(CharData.Face, { Hash = Index, Value = ID })
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('Beardstache', function(Data)
  if (CamPos ~= 'Face') then CustomCamera(CamInUse, 'Face', MyGender) end
  -- local ID = tonumber(Data.id)
  -- if (Up(MyGender) == 'MP_MALE') then
  --   for k,v in pairs(MaleBeardStache) do
  --     if (v.Type == 'Mustache') then
  --       if (k == ID) then
  --         print(v.Hash)
  --         Citizen.InvokeNative(0xD3A7B003ED343FD9, NPCs[1], tonumber(v.Hash), true, true, true)
  --       end
  --     end
  --   end
  -- end
  SendNUIMessage({ Action = 'HideUI' })
  Notify('Beards and Mustaches are currently in 1 tab called beards. We will separate them in the future! For now you can use the beards tab only!', 'TopRight', 10000)
  Wait(10000) SendNUIMessage({ Action = 'ShowUI' })
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('Mustache', function(Data)
  if (CamPos ~= 'Face') then CustomCamera(CamInUse, 'Face', MyGender) end
  local ID = tonumber(Data.id)
  -- if (Up(MyGender) == 'MP_MALE') then
  --   for k,v in pairs(MaleMustache) do
  --     if (v.Type == 'Mustache') then
  --       if (k == ID) then
  --         print(v.Hash)
  --         Citizen.InvokeNative(0xD3A7B003ED343FD9, NPCs[1], tonumber(v.Hash), true, true, true)
  --       end
  --     end
  --   end
  -- end
  SendNUIMessage({ Action = 'HideUI' })
  Notify('Beards and Mustaches are currently in 1 tab called beards. We will separate them in the future! For now you can use the beards tab only!', 'TopRight', 10000)
  Wait(10000) SendNUIMessage({ Action = 'ShowUI' })
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('Beard', function(Data)
  if (CamPos ~= 'Face') then CustomCamera(CamInUse, 'Face', MyGender) end
  local ID = tonumber(Data.id)
  if (Up(MyGender) == 'MP_MALE') then
    for k,v in pairs(MaleBeards) do
      if (v.Type == 'beard') then
        if (k == ID) then
          Citizen.InvokeNative(0xD3A7B003ED343FD9, NPCs[1], tonumber(v.Hash), true, true, true)
          CharData.Skin.Beard = tonumber(v.Hash)
        end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('PedSize', function(Data)
  if (CamPos ~= 'Body') then CustomCamera(CamInUse, 'Body', MyGender) end
  local Gen = nil
  if (Up(MyGender) == 'MP_MALE') then Gen = 1 else Gen = 2 end
  local ID = tonumber(Data.id)
  local isPositive = (ID > 185)
  local Var = (math.abs(185 - ID) * 0.005333)
  if (not (isPositive)) then Var = -(Var) end
  SetPedScale(NPCs[Gen], 1.0 + Var)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('Idade', function(Data) CharData.Age = tonumber(Data.change) end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('NomePlayer', function(Data) CharData.Name = tostring(Data.change) end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('Nationality', function(Data) CharData.Nationality = tostring(Data.change) end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNUICallback('CloseCreator', function()
  print("I guess my gender is", MyGender)
  local Sync = TCTCC('DokusCore:Sync:Get:UserData')
  if (CharData.Name == nil) then Error('Name') return end
  if (CharData.Age  == nil) then Error('Age') return end
  if (CharData.Nationality == nil) then Error('Nationality') return end
  if (CharData.Skin.Torso == nil) then Error('Torso') return end
  if (CharData.Skin.Legs  == nil) then Error('Legs') return end
  if (CharData.Skin.Head  == nil) then Error('Head') return end
  if (CharData.Skin.Eyes  == nil) then Error('Eyes') return end
  if (CharData.Skin.Hair  == nil) then Error('Hair') return end
  local Skin = Encoded({ Skin = Encoded(CharData.Skin), Face = Encoded(CharData.Face) })
  local Clothing = nil
  SendNUIMessage({ Action = 'Hide' })
  SetNuiFocus(false, false)
  UIFadeOut(5000) Wait(5000)

  if (Low(MyGender) == 'mp_female') then Clothing = Encoded(_Skins.DefaultCloth.Female) end
  if (Low(MyGender) == 'mp_male')   then Clothing = Encoded(_Skins.DefaultCloth.Male)   end

  TriggerServerEvent('DokusCore:Core:DBIns:Characters', { 'User', {
      SteamID, Sync.CharID, _Moderation.User, CharData.Name,
      Low(MyGender), CharData.Nationality, CharData.Age, _StartWealth.Money,
      _StartWealth.Gold, 0, 0, 'unemployed', 0,
      '{"x":-167.89999389648438,"y":629.0999755859375,"z":114.0}', Skin, Clothing
    }
  }) Wait(3000)


  TriggerEvent('DokusCore:Sync:Set:UserData', { 'Skin', { Skin } })
  TriggerEvent('DokusCore:Sync:Set:UserData', { 'Gender', { Low(MyGender) } })
  SetCameraActive('StartCam', false) SetCameraActive('EndCam', false)
  SetCameraActive('MaleCam', false) SetCameraActive('FemaleCam', false)
  TriggerEvent('DokusCore:Spawner:User:New')
  ResetScriptForNextUse()
  ResetAllCameras()
  -- DestroyAllCameras()
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------



























































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
