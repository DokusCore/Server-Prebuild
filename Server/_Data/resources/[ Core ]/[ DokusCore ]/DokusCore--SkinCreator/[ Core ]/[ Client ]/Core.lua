--------------------------------------------------------------------------------
---------------------------------- DokusCore -----------------------------------
--------------------------------------------------------------------------------
IsMenuOpen = false
list = {}
list_f = {}
components_data = {}
overlay_ped = PlayerPedId()
cam = nil
c_zoom = 2.8
c_offset = -0.15
textureId = -1
overlay_opacity = 1.0
ped_sex = 1
torso = nil
legs = nil
headingss = 300.00
Welcomed = false
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Low = string.lower
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
BODY_TYPES = { 32611963, - 20262001, - 369348190, - 1241887289, 61606861 }
features = {
  0x84D6, 0x3303, 0x2FF9, 0x4AD1, 0xC04F, 0xB6CE, 0x2844, 0xED30, 0x6A0B, 0xABCF, 0x358D,
  0x8D0A, 0xEBAE, 0x1DF6, 0x3C0F, 0xC3B2, 0xE323, 0x8B2B, 0x1B6B, 0xEE44, 0xD266, 0xA54E, 0xDDFB, 0x6E7F, 0x3471, 0x03F5,
  0x34B1, 0xF156, 0x561E, 0xF065, 0xAA69, 0x7AC3, 0x410D, 0x1A00, 0x91C1, 0xC375, 0xBB4D, 0xB0B0, 0x5D16,
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
features_name = {
  "face_width", "eyebrow_height", "eyebrow_width", "eyebrow_depth", "ears_width",
  "ears_angle", "ears_height", "earlobe_size", "cheekbones_height", "cheekbones_width",
  "cheekbones_depth", "jaw_height", "jaw_width", "jaw_depth", "chin_height", "chin_width",
  "chin_depth", "eyelid_height", "eyelid_width", "eyes_depth", "eyes_angle", "eyes_distance",
  "eyes_height", "nose_width", "nose_size", "nose_height", "nose_angle", "nose_curvature",
  "nostrils_distance", "mouth_width", "mouth_depth", "mouth_y_pos", "mouth_x_pos",
  "upper_lip_height", "upper_lip_width", "upper_lip_depth", "lower_lip_height",
  "lower_lip_width", "lower_lip_depth",
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.SkinCreator) then
    RegisterCommand("skin", function(source, args, rawCommand)
      local source = source
      local PedID = PlayerPedId()
      local pCoords = GetEntityCoords(PedID)
      if (Low(args[1]) == 'menu') then TriggerEvent("DokusCore:SkinCreator:OpenMenu", PedID, pCoords) end
      if (Low(args[1]) == 'load') then
        local Data = TSC('DokusCore:Core:GetCoreUserData')
        local User = TSC('DokusCore:Core:DBGet:Characters', { 'User', 'Single', { Data.Steam, Data.CharID } }).Result[1]
        if (User.Skin == nil) then return Notify("You've no skin to load! Please create a skin first with /skin menu") end
        local Skin = json.decode(User.Skin)
        TriggerEvent("DokusCore:SkinCreator:SetSkin", Skin)
      end
    end)
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:SkinCreator:OpenMenu')
AddEventHandler('DokusCore:SkinCreator:OpenMenu', function(PedID, pCoords)
  if (_Modules.SkinCreator) then
    SetEntityCoords(PedID, pCoords[1], pCoords[2], (pCoords[3] - 1.0))
    SetEntityHeading(PedID, 230.0)
    FreezeEntityPosition(PedID, true)
    Notify('Switch gender first to prevent your character getting spaghetti arms!', 'TopLeft', 5000)
    Wait(5000)
    Notify('You can always reopen the skin menu via the character menu with TAB', 'TopLeft', 10000)
    ShowSkinCreator(true)
    IsMenuOpen = true
    camera(2.8, 0.2)
    SetPlayerInvincible(PlayerId(), true)
    Light(pCoords)
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.SkinCreator) then
    for i, v in pairs(cloth_hash_names) do
    if v.category_hashname == "BODIES_LOWER"
    or v.category_hashname == "BODIES_UPPER"
    or v.category_hashname == "heads"
    or v.category_hashname == "hair"
    or v.category_hashname == "teeth"
    or v.category_hashname == "eyes"
    or v.category_hashname == "beards_chin"
    or v.category_hashname == "beards_chops"
    or v.category_hashname == "beard" then
      if v.ped_type == "female" and v.is_multiplayer and v.hashname ~= "" then
        if list_f[v.category_hashname] == nil then
          list_f[v.category_hashname] = {}
        end
        table.insert(list_f[v.category_hashname], v.hash)
      elseif v.ped_type == "male" and v.is_multiplayer and v.hashname ~= "" then
        if list[v.category_hashname] == nil then
          list[v.category_hashname] = {}
        end

        table.insert(list[v.category_hashname], v.hash)
      end
    end
  end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:SkinCreator:SetSkin')
AddEventHandler('DokusCore:SkinCreator:SetSkin', function(_data, clothes)
  Citizen.CreateThread(function()
    local _clothes = clothes
    local _target = PlayerPedId()
    local test = false
    local data = _data
    if _target ~= nil then
      local model = "mp_male"
      if tonumber(data.sex) == 1 then
        model = "mp_male"
      elseif tonumber(data.sex) == 2 then
        model = "mp_female"
      end
      LoadModel(PlayerPedId(), model)
      _target = PlayerPedId()
      SetEntityAlpha(_target, 0)
    end
    components_data = data
    while test == false do
      FixIssues(_target, data)
      LoadBoody(_target, data)
      LoadHead(_target, data)
      LoadHair(_target, data)
      LoadEyes(_target, data)
      LoadBodySize(_target, data)
      LoadFeatures(_target, data)
      LoadOverlays(_target, data)
      Wait(2000)
      Citizen.InvokeNative(0x704C908E9C405136, _target)
      Citizen.InvokeNative(0xCC8CA3E88256E58F, _target, 0, 1, 1, 1, 0)
      test = HasBodyComponentsLoaded (_target, tonumber(data.hair) > 1, tonumber(data.beard) > 1)
      LoadHeight(_target, data)
    end
    SetEntityAlpha(_target, 255)
  end)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:SkinCreator:UpdateSkin')
AddEventHandler('DokusCore:SkinCreator:UpdateSkin', function(data)
  if ped_sex ~= tonumber(data.sex) and data.sex ~= nil then
    ped_sex = tonumber(data.sex)
    local model = "mp_male"
    local player = PlayerId()
    if ped_sex == 1 then
      model = "mp_male"
      sex = 1
    elseif ped_sex == 2 then
      model = "mp_female"
      sex = 2
    end
    LoadModel(PlayerPedId(), model)
    LoadHeight(PlayerPedId(), data)
    FixIssues(PlayerPedId(), data)
  end
  LoadBoody(PlayerPedId(), data, true)
  LoadHead(PlayerPedId(), data)
  LoadHair(PlayerPedId(), data)
  LoadEyes(PlayerPedId(), data)
  LoadBodySize(PlayerPedId(), data)
  LoadFeatures(PlayerPedId(), data, true)
  Citizen.CreateThread(function()
    LoadOverlays(PlayerPedId(), data)
  end)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------




















































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
