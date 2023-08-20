-- RedEM = exports["redem_roleplay"]:RedEM()

MenuData = {}
MenuData.Opened = {}
MenuData.RegisteredTypes = {}

--==================================FUNCTIONS ==================================
MenuData.RegisteredTypes['default'] = {
    open  = function(namespace, name, data,setnui)
        SendNUIMessage({
            ak_menubase_action = 'openMenu',
            ak_menubase_namespace = namespace,
            ak_menubase_name = name,
            ak_menubase_data = data
        }) 
		if setnui then
			SetNuiFocus(setnui,setnui)
		end
	end,
    close  = function(namespace, name,setnui)
        SendNUIMessage({
            ak_menubase_action = 'closeMenu',
            ak_menubase_namespace = namespace,
            ak_menubase_name = name,
            ak_menubase_data = data
        }) 
		SetNuiFocus(false,false)
    end
}




function MenuData.Open(type, namespace, name, data, submit, cancel, change, close,setnui)
    local menu = {}

    menu.type      = type
    menu.namespace = namespace
    menu.name      = name
    menu.data      = data
    menu.submit    = submit
    menu.cancel    = cancel
    menu.change    = change
    menu.setnui    = setnui or false
    menu.close = function()
        MenuData.RegisteredTypes[type].close(namespace, name,false)

        for i=1, #MenuData.Opened, 1 do
            if MenuData.Opened[i] then
                if MenuData.Opened[i].type == type and MenuData.Opened[i].namespace == namespace and MenuData.Opened[i].name == name then
                    MenuData.Opened[i] = nil
                end
            end
        end

        if close then
            close(name)
        end

    end

    menu.update = function(query, newData)

        for i=1, #menu.data.elements, 1 do
            local match = true

            for k,v in pairs(query) do
                if menu.data.elements[i][k] ~= v then
                    match = false
                end
            end

            if match then
                for k,v in pairs(newData) do
                    menu.data.elements[i][k] = v
                end
            end
        end

    end

    menu.refresh = function() 
        MenuData.RegisteredTypes[type].open(namespace, name, menu.data,menu.setnui)
    end

    menu.setElement = function(i, key, val)
        menu.data.elements[i][key] = val
    end

    menu.setElements = function(newElements)
        menu.data.elements = newElements
    end

    menu.setTitle = function(val)
        menu.data.title = val
    end

    menu.removeElement = function(query)
        for i=1, #menu.data.elements, 1 do
            for k,v in pairs(query) do
                if menu.data.elements[i] then
                    if menu.data.elements[i][k] == v then
						menu.data.elements[i] = nil
                        break
                    end
                end

            end
        end
    end
	MenuData.Opened[#MenuData.Opened+1]= menu
    MenuData.RegisteredTypes[type].open(namespace, name, data,menu.setnui)
    PlaySoundFrontend("SELECT", "RDRO_Character_Creator_Sounds", true, 0)
    return menu
end

function MenuData.Close(type, namespace, name)
    for i=1, #MenuData.Opened, 1 do
        if MenuData.Opened[i] then
            if MenuData.Opened[i].type == type and MenuData.Opened[i].namespace == namespace and MenuData.Opened[i].name == name then
                MenuData.Opened[i].close()
                MenuData.Opened[i] = nil
            end
        end
    end
end

function MenuData.CloseAll()
    for i=1, #MenuData.Opened, 1 do
        if MenuData.Opened[i] then
            MenuData.Opened[i].close()
            MenuData.Opened[i] = nil
        end
    end
end

function MenuData.GetOpened (type, namespace, name)
    for i=1, #MenuData.Opened, 1 do
        if MenuData.Opened[i] then
            if MenuData.Opened[i].type == type and MenuData.Opened[i].namespace == namespace and MenuData.Opened[i].name == name then
                return MenuData.Opened[i]
            end
        end
    end
end

function MenuData.GetOpenedMenus()
    return MenuData.Opened
end

function MenuData.IsOpen (type, namespace, name)
    return MenuData.GetOpened(type, namespace, name) ~= nil
end

function MenuData.ReOpen(oldMenu)
    MenuData.Open(oldMenu.type, oldMenu.namespace, oldMenu.name, oldMenu.data, oldMenu.submit, oldMenu.cancel, oldMenu.change, oldMenu.close)
end


--==================================FUNCTIONS ==================================

--================================== CALLBACKS ==================================

local Timer, MenuType = 0, 'default'

function dataChecker(t1,t2,ignore_mt)
	local ty1 = type(t1)
	local ty2 = type(t2)
	if ty1 ~= ty2 then return false end
	-- non-table types can be directly compared
	if ty1 ~= 'table' and ty2 ~= 'table' then return t1 == t2 end
	-- as well as tables which have the metamethod __eq
	local mt = getmetatable(t1)
	if not ignore_mt and mt and mt.__eq then return t1 == t2 end
	for k1,v1 in pairs(t1) do
	local v2 = t2[k1]
	if v2 == nil or not dataChecker(v1,v2) then return false end
	end
	for k2,v2 in pairs(t2) do
	local v1 = t1[k2]
	if v1 == nil or not dataChecker(v1,v2) then return false end
	end
	return true
end

function checkdata(_data, menu)
	local data = _data
	data.selected = nil
	data._namespace = nil
	data._name = nil
	data.type = nil
	for k,l in pairs(menu)do
        l.selected = nil
        l._name = nil
        l._namespace = nil
        l.type = nil
        cbdata = dataChecker(data,l)
        if cbdata then
            return true
        end
    end
    return false
end

RegisterNUICallback('menu_submit', function(data,cb)
    PlaySoundFrontend("SELECT", "RDRO_Character_Creator_Sounds", true, 0)
    local menu = MenuData.GetOpened(MenuType, data._namespace, data._name)
    if menu and menu.submit ~= nil then
		local issue = checkdata(data.current, menu.data.elements)
		if issue then
			menu.submit(data, menu)
		else
			print("invalid request")
		end
    end
	cb({})
end)

RegisterNUICallback('playsound', function(data,cb) 
	if data.type == "text" then
		--SetNuiFocus(1, 1)
		--SetNuiFocusKeepInput(false)
	else 
		--SetNuiFocus(0, 0)
		--SetNuiFocusKeepInput(true)	
	end
    PlaySoundFrontend("NAV_LEFT", "PAUSE_MENU_SOUNDSET", true, 0)
	cb({})
end)

RegisterNUICallback('menu_cancel', function(data,cb)	
	--SetNuiFocus(0, 0)
	--SetNuiFocusKeepInput(true)	
    PlaySoundFrontend("SELECT", "RDRO_Character_Creator_Sounds", true, 0)
    local menu = MenuData.GetOpened(MenuType, data._namespace, data._name)

    if menu.cancel ~= nil then
        menu.cancel(data, menu)
    end
	cb({})
end)
RegisterNUICallback('menu_change', function(data,cb)
    local menu = MenuData.GetOpened(MenuType, data._namespace, data._name)
    for i=1, #data.elements, 1 do
        menu.setElement(i, 'value', data.elements[i].value)

        if data.elements[i].selected then
            menu.setElement(i, 'selected', true)
        else
            menu.setElement(i, 'selected', false)
        end
    end
    if menu.change ~= nil then
        menu.change(data, menu)
    end
	cb({})
end)
--================================== CALLBACKS ==================================


--==================================  CONTROL SECTION =========================================
Citizen.CreateThread(function()
    local PauseMenuState    = false
    local MenusToReOpen     = {}
    while true do
        Citizen.Wait(0)
        if #MenuData.Opened > 0 then

            if ( IsControlJustReleased(0, 0x43DBF61F)  or  IsDisabledControlJustReleased(0, 0x43DBF61F)) then
                SendNUIMessage({ak_menubase_action = 'controlPressed', ak_menubase_control = 'ENTER'})
            end

            if (IsControlJustReleased(0, 0x308588E6)  or  IsDisabledControlJustReleased(0, 0x308588E6)) then
                SendNUIMessage({ak_menubase_action  = 'controlPressed', ak_menubase_control = 'BACKSPACE'})
            end

            if (IsControlJustReleased(0, 0x911CB09E)  or  IsDisabledControlJustReleased(0, 0x911CB09E)) then
                SendNUIMessage({ak_menubase_action  = 'controlPressed', ak_menubase_control = 'TOP'})
            end

            if (IsControlJustReleased(0, 0x4403F97F)  or  IsDisabledControlJustReleased(0, 0x4403F97F)) then
                SendNUIMessage({ak_menubase_action  = 'controlPressed', ak_menubase_control = 'DOWN'})
            end

            if (IsControlJustReleased(0, 0xAD7FCC5B)  or  IsDisabledControlJustReleased(0, 0xAD7FCC5B)) then
                SendNUIMessage({ak_menubase_action  = 'controlPressed', ak_menubase_control = 'LEFT'})
            end

            if (IsControlJustReleased(0, 0x65F9EC5B)  or  IsDisabledControlJustReleased(0, 0x65F9EC5B)) then
                SendNUIMessage({ak_menubase_action  = 'controlPressed', ak_menubase_control = 'RIGHT'})
            end

            if IsPauseMenuActive() then
                if not PauseMenuState then
                    PauseMenuState = true
                    for k, v in pairs(MenuData.GetOpenedMenus()) do
                        table.insert(MenusToReOpen, v)
                    end
                    MenuData.CloseAll()
                end               
            end
        else
            if PauseMenuState and not IsPauseMenuActive() then
                PauseMenuState = false
                Citizen.Wait(1000)
                for k, v in pairs(MenusToReOpen) do
                    MenuData.ReOpen(v)
                end
                MenusToReOpen = { }
            end
        end
    end
end)


--==================================  CONTROL SECTION =========================================

--==================================  SHARE FUNCTIONS =========================================
AddEventHandler('redemrp_menu_base:getData', function(cb)
    cb(MenuData)
end)
--==================================  SHARE FUNCTIONS =========================================
