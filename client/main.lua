local Keys = {
    ["ESC"] = 322,
    ["F1"] = 288,
    ["F2"] = 289,
    ["F3"] = 170,
    ["F5"] = 166,
    ["F6"] = 167,
    ["F7"] = 168,
    ["F8"] = 169,
    ["F9"] = 56,
    ["F10"] = 57,
    ["~"] = 243,
    ["1"] = 157,
    ["2"] = 158,
    ["3"] = 160,
    ["4"] = 164,
    ["5"] = 165,
    ["6"] = 159,
    ["7"] = 161,
    ["8"] = 162,
    ["9"] = 163,
    ["-"] = 84,
    ["="] = 83,
    ["BACKSPACE"] = 177,
    ["TAB"] = 37,
    ["Q"] = 44,
    ["W"] = 32,
    ["E"] = 38,
    ["R"] = 45,
    ["T"] = 245,
    ["Y"] = 246,
    ["U"] = 303,
    ["P"] = 199,
    ["["] = 39,
    ["]"] = 40,
    ["ENTER"] = 18,
    ["CAPS"] = 137,
    ["A"] = 34,
    ["S"] = 8,
    ["D"] = 9,
    ["F"] = 23,
    ["G"] = 47,
    ["H"] = 74,
    ["K"] = 311,
    ["L"] = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"] = 20,
    ["X"] = 73,
    ["C"] = 26,
    ["V"] = 0,
    ["B"] = 29,
    ["N"] = 249,
    ["M"] = 244,
    [","] = 82,
    ["."] = 81,
    ["LEFTCTRL"] = 36,
    ["LEFTALT"] = 19,
    ["SPACE"] = 22,
    ["RIGHTCTRL"] = 70,
    ["HOME"] = 213,
    ["PAGEUP"] = 10,
    ["PAGEDOWN"] = 11,
    ["DELETE"] = 178,
    ["LEFT"] = 174,
    ["RIGHT"] = 175,
    ["TOP"] = 27,
    ["DOWN"] = 173,
    ["NENTER"] = 201,
    ["N4"] = 108,
    ["N5"] = 60,
    ["N6"] = 107,
    ["N+"] = 96,
    ["N-"] = 97,
    ["N7"] = 117,
    ["N8"] = 61,
    ["N9"] = 118
}


local vehMods ={
    [0] = "modSpoilers",
    [1] = "modFrontBumper",
    [2] = "modRearBumper",
    [3] = "modSideSkirt",
    [4] = "modExhaust",
    [5] = "modFrame",
    [6] = "modGrille",
    [7] = "modHood",
    [8] = "modFender",
    [9] = "modRightFender",
    [10] = "modRoof",
    [11] = "modEngine",
    [12] = "modBrakes",
    [13] = "modTransmission",
    [14] ="modHorns",
    [15] = "modSuspension",
    [16] = "modArmor",
    [17] = "",
    [18] = "modTurbo",
    [19] = "",
    [20] ="modSmokeEnabled",
    [21] = "",
    [22] = "modXenon",
    [23] = "modFrontWheels",
    [24] = "modBackWheels",
    [25] = "modPlateHolder",
    [26] = "modVanityPlate",
    [27] = "modTrimA",
    [28] = "modOrnaments",
    [29] = "modDashboard",
    [30] = "modDial",
    [31] = "modDoorSpeaker",
    [32] = "modSeats",
    [33] = "modSteeringWheel",
    [34] = "modShifterLeavers",
    [35] = "modAPlate",
    [36] = "modSpeakers",
    [37] = "modTrunk",
    [38] = "modHydrolic",
    [39] = "modEngineBlock",
    [40] = "modAirFilter",
    [41] = "modStruts",
    [42] = "modArchCover",
    [43] = "modAerials",
    [44] = "modTrimB",
    [45] = "modTank",
    [46] = "modWindows",
    [48] = "modLivery"
}
ESX = nil
local menuOpened = false
local _menuPool = NativeUI.CreatePool()
local LSCMenu = nil
local veh = nil
local previewCar = nil
local cam = nil
local gameplaycam = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

function createBasicStuff()
    LSCMenu = NativeUI.CreateMenu("Los Santos Customs", "CATEGORIES")
    -- todo add image
    _menuPool:Add(LSCMenu)
end

local function f(n) return (n + 0.00001) end

function createMenu()
    -- get vehicle specs
    local chassis, interior, bumper, fbumper, rbumper = false, false, false,
                                                        false, false
    -- todo overwork this shit
    for i = 0, 48 do
        if GetNumVehicleMods(veh, i) ~= nil and GetNumVehicleMods(veh, i) > 0 then
            if i == 1 then
                bumper = true
                fbumper = true
            elseif i == 2 then
                bumper = true
                rbumper = true
            elseif (i >= 42 and i <= 46) or i == 5 then -- If any chassis mod exist then add chassis menu
                chassis = true
            elseif i >= 27 and i <= 37 then -- If any interior mod exist then add interior menu
                interior = true
            end
        end
    end

    -- armor X
    if Config.allow.Armor then
        createSelectSubMenu(LSCMenu, Config.prices.Armor, "Armor", "")
    end
    -- breaks X
    createSelectSubMenu(LSCMenu, Config.prices.Brakes, "Brakes", "")
    -- bumpers 
    if bumper then createBumberSubMenu(LSCMenu, fbumper, rbumper) end
    -- Chassis 
    if chassis then createCassisSubMenu(LSCMenu) end
    -- Engine
    createEngineSubMenu(LSCMenu)
    -- Exhaust
    createModSubMenu(LSCMenu, "Exhaust", Config.prices.Exhaust, "Customized sports exhausts.")
    -- Grille
    createModSubMenu(LSCMenu, "Grille", Config.prices.Grille,"Improved engine cooling.")
    -- Hood
    createModSubMenu(LSCMenu, "Hood", Config.prices.Hood,"Enhance car engine cooling.")
    -- Fender
    createModSubMenu(LSCMenu, "Fender", Config.prices.Fender, "")
    -- Horn
    --createSelectSubMenu(LSCMenu, Config.prices.Horn, "Horn", "Custom air horns.")
    -- Hydraulics
    createModSubMenu(LSCMenu, "Hydraulics", Config.prices.Hydraulics, "Woop Woop")
    -- Interior
    if (interior) then createInteriorSubMenu(LSCMenu) end
    -- Lights
    createLightSubMenu(LSCMenu)
    -- Livery TODO ADD it
    -- Plates
    createPlateSubMenu(LSCMenu)
    -- Respray
    createResprayMenu(LSCMenu)
    -- Roof
    createModSubMenu(LSCMenu, "Roof", Config.prices.Roof,
                     "Lower your center of gravity with lightweight roof panels.")
    -- Tailgats  todo
    -- Skirts side pannel
    createModSubMenu(LSCMenu, "Skirts", Config.prices.Skirts, "Enhance your vehicle's look with custom side skirts.")
    -- Spoiler
    createModSubMenu(LSCMenu, "Spoiler", Config.prices.Spoiler, "Increase downforce.")
    -- Suspension
    createSelectSubMenu(LSCMenu, Config.prices.Suspension, "Suspension", "Upgrade to a sports oriented suspension setup.")
    -- Transmissions
    createSelectSubMenu(LSCMenu, Config.prices.Transmission, "Transmissions", "Improved acceleration with close ratio transmission.")
    -- Trunk
    createModSubMenu(LSCMenu, "Trunk", Config.prices.Trunk, "")
    -- Turbo
    createSelectSubMenu(LSCMenu, Config.prices.Turbo, "Turbo", "Reduced lag turbocharger.")
    -- Wheels
    createWheelsMenu(LSCMenu)
    -- Windows
    createSelectSubMenu(LSCMenu, Config.prices.Window, "Windows", "A selection of tinted windows.")
    _menuPool:RefreshIndex()
    moveCamAndOpenDoor()
end

-- create menu entry from config template
function createSelectSubMenu(mainmenu, pair, name, desc)
    -- fill submenu
    -- print(name)
    -- print(pair)
    local submenu = _menuPool:AddSubMenu(mainmenu, name, desc)
    for n, mod in pairs(pair.Data) do
        local newitem = NativeUI.CreateItem(mod.name)
        newitem:RightLabel(mod.price .. " $")
        submenu.SubMenu:AddItem(newitem)
    end

    submenu.SubMenu.OnIndexChange = function(menu, newindex)
        -- preview item
        -- newitem:SetLeftBadge(BadgeStyle.None)
        -- SetVehicleWindowTint(veh, button.tint)
        print("check")
        local props = {}
        props[pair.modIndex] = index
        ESX.Game.SetVehicleProperties(previewCar, props)
    end

    submenu.SubMenu.OnItemSelect = function(menu, item, index)
        -- send menu & index to server
        TriggerServerEvent("custom_bennys:buyMod", pair, index)
    end

    submenu.SubMenu.OnMenuChanged = function(menu, newmenu, forward) -- move to submenu selection
        -- todo get props from vehicle and reset the current
            print("Submenu changed" .. newmenu.Subtitle:Text())
            rerollVehicle()
        end
    -- add on item select
end

-- create menu entry from config template color
function createSelectSubMenuColor(mainmenu, pair, name, desc)
    -- fill submenu
    --   print(name)
    --   print(pair.Price)
    local submenu = _menuPool:AddSubMenu(mainmenu, name, desc)
    for n, mod in pairs(pair.Colors) do
        local newitem = NativeUI.CreateItem(mod.name)
        newitem:RightLabel(pair.Price .. " $")
        submenu.SubMenu:AddItem(newitem)

    end

    submenu.SubMenu.OnIndexChange = function(menu, newindex)
        rerollVehicle()
        --  TriggerServerEvent("custom_bennys:buyMod", pair, index)
    end

    -- submenu.SubMenu.OnItemSelect = function(menu, item, index)
    --     -- send menu & index to server
    --     TriggerServerEvent("custom_bennys:buyMod", pair, index)

    -- end
end

-- create menu entry from car template
function createModSubMenu(mainmenu, name, conf, desc)
    local counter = GetNumVehicleMods(veh, conf.modIndex) -1
    print(veh .. " Mod: " .. conf.modIndex .. " Count: " .. counter)
    if counter == -1 then return end
    local submenu = _menuPool:AddSubMenu(mainmenu, name, desc)
    local price = conf.startprice
    -- todo add stock stuff
    local newitem = NativeUI.CreateItem("Stock", "")
    newitem:RightLabel(0 .. " $")
    submenu.SubMenu:AddItem(newitem)
    for i = 0, counter do
        local lbl = GetModTextLabel(veh, conf.modIndex, i)
        -- no mod descripion
        if lbl ~= nil then
            --print(i .. " " .. lbl)
            local mname = tostring(GetLabelText(lbl))
            if mname == "NULL" then mname = name .. " " .. i + 1 end
            -- new item
            local newitem = NativeUI.CreateItem(mname, "")
            newitem:RightLabel(price .. " $")
            submenu.SubMenu:AddItem(newitem)
            price = price + conf.increaseby
        end
    end

    submenu.SubMenu.OnIndexChange = function(menu, newindex)
        local props = {}
        print("Add Stuff " .. conf.modIndex .. " " .. newindex -1)
        props[vehMods[conf.modIndex]] = newindex -1
        print(props[conf.modIndex])
        --SetVehicleMod(previewCar, conf.modIndex, newindex -1, false)
       ESX.Game.SetVehicleProperties(previewCar, props)
        -- preview item
        -- newitem:SetLeftBadge(BadgeStyle.None)
       -- menu.Items[index]:SetLeftBadge(BadgeStyle.None)
    end

    -- submenu.SubMenu.OnItemSelect = function(menu, item, index)
    --     -- send menu & index to server
    --     TriggerServerEvent("custom_bennys:buyMod", conf, index)

    -- end
end


function createBumberSubMenu(mainmenu, fbumper, rbumper)
    local submenu = _menuPool:AddSubMenu(mainmenu, "Bumpers")

    if fbumper then
        createModSubMenu(submenu.SubMenu, "Front Bumper", Config.prices.FrontBumpers, "")
    end

    if rbumper then
        createModSubMenu(submenu.SubMenu, "Rear Bumper", Config.prices.RearBumpers, "")
    end
    -- todo condition for accessories
    -- local subMenuS = _menuPool:AddSubMenu(submenu.SubMenu, "Bumper accessories")
    -- add on klick

    submenu.SubMenu.OnItemSelect = function(menu, item, index)
        if item.Text:Text() == "Front Bumper" then -- todo move one menu lower
            MoveVehCam('front', -0.6, 1.5, 0.4)
        elseif item.Text:Text() == "Rear Bumper" then
            MoveVehCam('back', -0.6, 1.5, 0.4)
        end
        -- todo on back
    end

end

function createCassisSubMenu(mainmenu)
    local submenu = _menuPool:AddSubMenu(mainmenu, "Chassis")
    createModSubMenu(submenu.SubMenu, "Arch cover", Config.prices.Chassis.ArchCover, "")
    createModSubMenu(submenu.SubMenu, "Aerials", Config.prices.Chassis.Aerials,"")
    createModSubMenu(submenu.SubMenu, "Roof Scoops", Config.prices.Chassis.Aerials, "") --  trim mod id
    createModSubMenu(submenu.SubMenu, "Tank", Config.prices.Chassis.Tank, "")

end
function createEngineSubMenu(mainmenu)
    local submenu = _menuPool:AddSubMenu(mainmenu, "Engine")

    createModSubMenu(submenu.SubMenu, "Engine Block", Config.prices.Engine.EngineBlock, "Custom engine block casings.")
    -- createModSubMenu(submenu, "Cam Cover", conf, "Optional cam covers.")
    createModSubMenu(submenu.SubMenu, "Air Filters", Config.prices.Engine.Airfilter, "") -- todo add desc
    createModSubMenu(submenu.SubMenu, "Strut Brace", Config.prices.Engine.Struts, "A selection of support struts.")
    createSelectSubMenu(submenu.SubMenu, Config.prices.Engine.EngineTune, "Engine Tunes", "Increases horsepower.")
end

function createInteriorSubMenu(mainmenu)
    local submenu = _menuPool:AddSubMenu(mainmenu, "Interior",
                                         "Products for maximum style and comfort.")
    submenu.SubMenu.OnItemSelect = function(menu, item, index)
        SetFollowVehicleCamViewMode(4) -- first person
    end

    createModSubMenu(submenu.SubMenu, "Trim Design", Config.prices.Interior.Trim, "A selection of interior designs.")
    -- _menuPool:AddSubMenu(submenu.SubMenu, "Trim Design", "") --todo fix this
    -- _menuPool:AddSubMenu(submenu.SubMenu, "Trim Color", "")
    createModSubMenu(submenu.SubMenu, "Ornaments", Config.prices.Interior.Ornaments, "Add decorative items to your dash.")
    createModSubMenu(submenu.SubMenu, "Dashboard",Config.prices.Interior.Dashboard,"Custom control panel designs.")
    createModSubMenu(submenu.SubMenu, "Dials", Config.prices.Interior.Dial, "Customize the look of your dials.")
    createModSubMenu(submenu.SubMenu, "Doors", Config.prices.Interior.Doors, "Install door upgrades.")
    createModSubMenu(submenu.SubMenu, "Seats", Config.prices.Interior.Seats,"Options where style meets comfort.")
    createModSubMenu(submenu.SubMenu, "Steering Wheels", Config.prices.Interior.SteeringWheels, "Customize the link between you and your vehicle.")
    createModSubMenu(submenu.SubMenu, "Column Shifter leavers", Config.prices.Interior.ShiftLeavers, "") -- todo
    createModSubMenu(submenu.SubMenu, "Plaques", Config.prices.Interior.Plaques,"")
    createModSubMenu(submenu.SubMenu, "Speakers",Config.prices.Interior.Speakers, "")
    -- _menuPool:AddSubMenu(submenu.SubMenu, "Light Color", "")
    createModSubMenu(submenu.SubMenu, "Roll Cage", Config.prices.Interior.RollCage, "")
end

function createLightSubMenu(mainmenu)
    local submenu = _menuPool:AddSubMenu(mainmenu, "Lights","Improved night time visibility.")
    createSelectSubMenu(submenu.SubMenu, Config.prices.Lights.Headlights,"Headlights", "")
    createSelectSubMenu(submenu.SubMenu, Config.prices.Lights.Neonlayout, "Neon layout", "") -- todo check if neon places and then add menu
    createSelectSubMenu(submenu.SubMenu, Config.prices.Lights.Neoncolor,"Neon Color", "")

    

    submenu.SubMenu.OnItemSelect = function(menu, item, index)
        elseif item.Text:Text() == "Neon layout" or item.Text:Text() == "Neon Color" then --todo move to submenu
            -- SetVehicleNeonLightEnabled(previewCar, 0, false)
            -- SetVehicleNeonLightEnabled(previewCar, 1, false)
            -- SetVehicleNeonLightEnabled(previewCar, 2, false)
            -- SetVehicleNeonLightEnabled(previewCar, 3, false)
            MoveVehCam('front', -0.6, 1.3, 0.6)
        elseif item.Text:Text() == "Headlights" then
            PointCamAtBone(" headlight_r",-1.4,0,0.3)
            MoveVehCam('front', -0.6, 1.3, 0.6)
    end
end

function createPlateSubMenu(mainmenu)
    local submenu = _menuPool:AddSubMenu(mainmenu, "Plates", "Decorative identification.")
    createSelectSubMenu(submenu.SubMenu, Config.prices.Plates.PlatesVariants,"License", "")
    createModSubMenu(submenu.SubMenu, "Plate holder",Config.prices.Plates.PlateHolder, "")
    createModSubMenu(submenu.SubMenu, "Vanity plates",Config.prices.Plates.VanityPlates, "")
end

function createResprayMenu(mainmenu)
    local submenu = _menuPool:AddSubMenu(mainmenu, "Respray","Transforms vehicle appearance.")
    local subPrim = _menuPool:AddSubMenu(submenu.SubMenu, "Primary color", "")
    createSelectSubMenuColor(subPrim.SubMenu, Config.prices.Respray.Chrome, "Chrome", "")
    createSelectSubMenuColor(subPrim.SubMenu, Config.prices.Respray.Classic, "Classic", "")
    createSelectSubMenuColor(subPrim.SubMenu, Config.prices.Respray.Matt,"Matt", "")
    createSelectSubMenuColor(subPrim.SubMenu, Config.prices.Respray.Metallic,"Metallic", "")
    createSelectSubMenuColor(subPrim.SubMenu, Config.prices.Respray.Metal,"Metals", "")
    -- createSelectSubMenuColor(subPrim.SubMenu, Config.prices.Respray.Pearl, "Pearl", "") todo implement this

    local subSec = _menuPool:AddSubMenu(submenu.SubMenu, "Secondary color", "")
    createSelectSubMenuColor(subSec.SubMenu, Config.prices.Respray.Chrome, "Chrome", "")
    createSelectSubMenuColor(subSec.SubMenu, Config.prices.Respray.Classic,"Classic", "")
    createSelectSubMenuColor(subSec.SubMenu, Config.prices.Respray.Matt, "Matt","")
    createSelectSubMenuColor(subSec.SubMenu, Config.prices.Respray.Metallic,"Metallic", "")
    createSelectSubMenuColor(subSec.SubMenu, Config.prices.Respray.Metal,"Metals", "")
    -- createSelectSubMenuColor(subPrim.SubMenu, Config.prices.Respray.Pearl, "Pearl", "") todo implement this
    -- local subEq = _menuPool:AddSubMenu(submenu.SubMenu, "Equipment color", "")   -- todo

end

function createWheelsMenu(mainmenu)
    local submenu = _menuPool:AddSubMenu(mainmenu, "Wheels", "Transforms vehicle appearance.")
    -- todo for bike
    local subType = _menuPool:AddSubMenu(submenu.SubMenu, "Wheel Type", "")
    createSelectSubMenu(subType.SubMenu, Config.prices.Wheels.Sportwheels, "Sport", "")
    createSelectSubMenu(subType.SubMenu, Config.prices.Wheels.Muscle, "Muscle", "")
    createSelectSubMenu(subType.SubMenu, Config.prices.Wheels.Lowrider, "Lowrider", "")
    createSelectSubMenu(subType.SubMenu, Config.prices.Wheels.Suv, "Suv", "")
    createSelectSubMenu(subType.SubMenu, Config.prices.Wheels.Offroad, "Offroad", "")
    createSelectSubMenu(subType.SubMenu, Config.prices.Wheels.Tuner, "Tuner", "")
    createSelectSubMenu(subType.SubMenu, Config.prices.Wheels.Highend, "Highend", "")
    createSelectSubMenuColor(subType.SubMenu, Config.prices.Wheels.Color,  "Wheel Color", "")
    -- local subTieres = _menuPool:AddSubMenu(submenu.SubMenu, "Tieres", "")
    -- todo
    -- _menuPool:AddSubMenu(subTieres.SubMenu, "Tire Design", "")
    -- _menuPool:AddSubMenu(subTieres.SubMenu, "Tire Enhancements", "") todo add this in furture
    createSelectSubMenu(subType.SubMenu, Config.prices.Tire.Smoke, "Tire Smoke", "Custom burnout smoke.")
end

function moveCamAndOpenDoor()
    LSCMenu.OnItemSelect = function(menu, item, index)
        -- todo update alls cams this is layer one
        print(item.Text:Text())
        if item.Text:Text() == "Engine" then
            SetVehicleDoorOpen(previewCar, 4, 0, false)
            MoveVehCam('front-top', -0.5, 1.3, 1.0)
        elseif item.Text:Text() == "Trunk" then
            SetVehicleDoorOpen(previewCar, 5, 0, false)
            MoveVehCam('back', -0.5, 1.3, 1.0)
        elseif item.Text:Text() == "Hood" then
            MoveVehCam('middle', -0.5, 1.3, 1.0)
        elseif item.Text:Text() == "Vanity plates" then
            MoveVehCam('back', -0.6, 1.5, 0.4)
        elseif item.Text:Text() == "Spoiler" then
            MoveVehCam('back-top', -0.6, 1.5, 0.4)
        elseif item.Text:Text() == "Skirts" then
            MoveVehCam('left', -0.6, 1.5, 0.4)
        elseif item.Text:Text() == "Fenders" then
            MoveVehCam('left', -1.8, -1.3, 0.7)
        elseif item.Text:Text() == "Exhaust" then
            MoveVehCam('back', -0.6, 1.5, 0.4)
        elseif item.Text:Text() == "Exhaust" then
            MoveVehCam('back', -0.6, 1.5, 0.4)
        elseif item.Text:Text() == "Wheels" then
            PointCamAtBone(" wheel_lr",-1.4,0,0.3)
        end
        
        
    end

end

function closeAllDoor()
    SetVehicleDoorOpen(veh, 0, false)
    SetVehicleDoorOpen(veh, 1, false)
    SetVehicleDoorOpen(veh, 2, false)
    SetVehicleDoorOpen(veh, 3, false)

    -- motorhaube & kofferraum
    SetVehicleDoorOpen(vehicle, 4, false)
    SetVehicleDoorOpen(vehicle, 5, false)
    --- doorIndex:
    -- 0 = Front Left Door
    -- 1 = Front Right Door
    -- 2 = Back Left Door
    -- 3 = Back Right Door
    -- 4 = Hood
    -- 5 = Trunk
    -- 6 = Back
    -- 7 = Back2
end

function MoveVehCam(pos, x, y, z)
    local vx, vy, vz = table.unpack(GetEntityCoords(previewCar))
    local d = GetModelDimensions(GetEntityModel(previewCar))
    local length, width, height = d.y * -2, d.x * -2, d.z * -2
    local ox, oy, oz
    if pos == 'front' then
        ox, oy, oz = table.unpack(GetOffsetFromEntityInWorldCoords(previewCar, f(x),(length / 2) +f(y), f(z)))
    elseif pos == "front-top" then
        ox, oy, oz = table.unpack(GetOffsetFromEntityInWorldCoords(previewCar, f(x), (length / 2) +f(y), (height) +f(z)))
    elseif pos == "back" then
        ox, oy, oz = table.unpack(GetOffsetFromEntityInWorldCoords(previewCar, f(x), f(y) - (length), f(z)))
    elseif pos == "back-top" then
        ox, oy, oz = table.unpack(GetOffsetFromEntityInWorldCoords(previewCar, f(x), f(y) -(length), (height / 2) +f(z)))
    elseif pos == "left" then
        ox, oy, oz = table.unpack(GetOffsetFromEntityInWorldCoords(previewCar,-(width / 2) +f(x),f(y), f(z)))
    elseif pos == "right" then
        ox, oy, oz = table.unpack(GetOffsetFromEntityInWorldCoords(previewCar,(width / 2) + f(x), f(y), f(z)))
    elseif pos == "middle" then
        ox, oy, oz = table.unpack(GetOffsetFromEntityInWorldCoords(previewCar, f(x), f(y),  (height / 2) + f(z)))
    end
    -- creat new cam
    local vec = GetCamCoord(cam)
    local cam2 = CreateCam("DEFAULT_SCRIPTED_CAMERA", true, 2)
    SetCamCoord(cam2, vec.x, vec.y, vec.z)
    PointCamAtCoord(cam2,GetOffsetFromEntityInWorldCoords(previewCar, 0, 0, f(0)))
    SetCamActive(cam2, true)

    PointCamAtCoord(cam,GetOffsetFromEntityInWorldCoords(previewCar, 0, 0, f(0)))
    SetCamCoord(cam, ox, oy, oz)
    
    SetCamActiveWithInterp(cam, cam2, 1500, true, true)
    --DestroyCam(cam2, true)
end

function setDefaultCam()
    local d = GetModelDimensions(GetEntityModel(previewCar))
    local length, width, height = d.y * -2, d.x * -2, d.z * -2
    local ox, oy, oz
    ox, oy, oz = table.unpack(GetOffsetFromEntityInWorldCoords(previewCar, f(-0.5),(length / 2) +f(1.3), f(1.0)))

    SetCamCoord(cam, ox, oy, oz)
    PointCamAtCoord(cam,GetOffsetFromEntityInWorldCoords(previewCar, 0, 0, f(0)))
    RenderScriptCams( 1, 1, 1000, 0, 0)
end

local function PointCamAtBone(bone,ox,oy,oz)
	SetCamActive(cam, true)
	local b = GetEntityBoneIndexByName(previewCar, bone)
	local bx,by,bz = table.unpack(GetWorldPositionOfEntityBone(previewCar, b))
	local ox2,oy2,oz2 = table.unpack(GetOffsetFromEntityGivenWorldCoords(previewCar, bx, by, bz))
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(previewCar, ox2 + f(ox), oy2 + f(oy), oz2 +f(oz)))
    
    -- sec cam
    local cam2 = CreateCam("DEFAULT_SCRIPTED_CAMERA", true, 2)
    SetCamCoord(cam2, vec.x, vec.y, vec.z)
    PointCamAtCoord(cam2,GetOffsetFromEntityInWorldCoords(previewCar, 0, 0, f(0)))
    SetCamActive(cam2, true)

    -- move to fist cam
    PointCamAtCoord(cam,GetOffsetFromEntityInWorldCoords(veh, 0, oy2, oz2))
    SetCamCoord(cam, x, y, z)
    SetCamActiveWithInterp(cam, cam2, 1500, true, true)
end

function rerollVehicle()
    local probs = ESX.Game.GetVehicleProperties(veh)
    -- set props
    ESX.Game.SetVehicleProperties(preview, veh)
end

function UnfakeVeh()
    local vehicle = veh -- TODO: edit this
    SetVehicleModKit(vehicle, 0)
    SetVehicleWheelType(vehicle, myveh.wheeltype)
    for i, m in pairs(myveh.mods) do
        if i == 22 or i == 18 then
            ToggleVehicleMod(veh, i, m.mod)
        elseif i == 23 or i == 24 then
            SetVehicleMod(veh, i, m.mod, m.variation)
        else
            SetVehicleMod(veh, i, m.mod)
        end
    end
    SetVehicleColours(veh, myveh.color[1], myveh.color[2])
    SetVehicleExtraColours(veh, myveh.extracolor[1], myveh.extracolor[2])
    SetVehicleNeonLightsColour(veh, myveh.neoncolor[1], myveh.neoncolor[2], myveh.neoncolor[3])
    SetVehicleNumberPlateTextIndex(veh, myveh.plateindex)
    SetVehicleWindowTint(veh, myveh.windowtint)
end

-- EVENTS

RegisterNetEvent('custom_bennys:installMod')
AddEventHandler('custom_bennys:installMod', function()
    
    local props = ESX.Game.GetVehicleProperties(previewCar)
    ESX.Game.SetVehicleProperties(veh, props);
    myCar = ESX.Game.GetVehicleProperties(veh)
    -- TODO: check if vehicle has a owner
    -- set it to the vehicle in the save
    TriggerServerEvent('custom_bennys:refreshOwnedVehicle', myCar)
end)

RegisterNetEvent('custom_bennys:cancelInstallMod')
AddEventHandler('custom_bennys:cancelInstallMod', function()
    --local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    --ESX.Game.SetVehicleProperties(vehicle, myCar)
end)

-- todo add on player death

-- END custom selection ------------------------------------------------

function openUpgradeMenu()

    veh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
    local coords = GetEntityCoords(veh)
    local heading = GetEntityHeading(veh)
    local vehicleProps = ESX.Game.GetVehicleProperties(veh)
    -- local valid = checkUpgrades(vehicleProps.model)
    ESX.UI.Menu.CloseAll()

    menuOpened = true
    SetVehicleModKit(veh, 0)

    -- local counter = GetNumVehicleMods(veh, 13)
    -- print(veh .. " Mod: " .. 13 .. " Count: " .. counter)

    -- set car invisible
    SetEntityVisible(veh, false, 0)
    SetEntityCollision(veh, false, false)
    -- ESX.Game.DeleteVehicle(veh)
    previewCar = CreateVehicle(vehicleProps.model, coords.x, coords.y, coords.z, heading, true, false)
    ESX.Game.SetVehicleProperties(previewCar, vehicleProps)
    SetVehicleOnGroundProperly(previewCar)
    TaskWarpPedIntoVehicle(GetPlayerPed(-1), previewCar, -1)
    FreezeEntityPosition(previewCar, true)
    SetVehicleDoorsLocked(previewCar, 4) -- lock the doors
    SetVehRadioStation(previewCar, "OFF")
    SetVehicleModKit(previewCar, 0)
    -- disable player exit
    cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true, 2)
    gameplaycam = GetRenderingCam()
    Citizen.Wait(200)
    setDefaultCam()
    createMenu()
    -- SetupInsideCam()

    _menuPool:MouseControlsEnabled(false)
    LSCMenu.OnMenuClosed = function()
        menuOpened = false
        SetEntityVisible(previewCar, false, 0)
        SetEntityCollision(previewCar, false, false)
        ESX.Game.DeleteVehicle(previewCar)

        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        SetEntityVisible(veh, true, 0)
        SetEntityCollision(veh, true, true)
        SetVehicleOnGroundProperly(veh)
        SetEntityVisible(GetPlayerPed(-1), true, 0)
       

        -- 
        SetCamCoord(cam, GetGameplayCamCoords())
        SetCamRot(cam, GetGameplayCamRot(2), 2)
        RenderScriptCams(1, 1, 0, 0, 0)
        RenderScriptCams(0, 1, 1000, 0, 0)
        SetCamActive(gameplaycam, true)
        EnableGameplayCam(true)
        SetCamActive(cam, false)

        FreezeEntityPosition(veh, false)
        SetVehicleDoorsLocked(veh, 0)
        -- spawn new car & apply settings

        -- renew the menu
        _menuPool = NativeUI.CreatePool()
        createBasicStuff()
        DestroyCam(cam, true)
        veh = nil
        cam = nil
        gameplaycam = nil
    end

    -- if valid then

    --     FreezeEntityPosition(veh, true)

    --     local elements = valid
    --     menuOpened = true

    --     ESX.UI.Menu.CloseAll()

    --     ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'benny', {
    --         title = "Benny's Motorworks",
    --         align = 'top-left',
    --         elements = elements
    --     }, function(data, menu)
    --         if data.current.value then
    --             if valid then
    --                 ESX.TriggerServerCallback('esx_bennys:checkVehicle',
    --                                           function(paid)
    --                     if paid then
    --                         menu.close()
    --                         menuOpened = false
    --                         ESX.Game.SpawnVehicle(data.current.value, {
    --                             x = -214.5190,
    --                             y = -1297.1348,
    --                             z = 31.2959
    --                         }, heading, function(callback_vehicle)
    --                             TriggerServerEvent('esx_bennys:removeVehicle',
    --                                                vehicleProps.plate)
    --                             ESX.Game.DeleteVehicle(veh)
    --                             SetVehRadioStation(callback_vehicle, "OFF")
    --                             TaskWarpPedIntoVehicle(GetPlayerPed(-1),
    --                                                    callback_vehicle, -1)
    --                             SetVehicleEngineOn(callback_vehicle, true, true,
    --                                                0)
    --                             local register =
    --                                 ESX.Game.GetVehicleProperties(
    --                                     callback_vehicle)
    --                             TriggerServerEvent(
    --                                 'esx_vehicleshop:setVehicleOwned', register)
    --                         end)
    --                     else
    --                         ESX.ShowNotification(_U("not_owned"))
    --                     end
    --                 end, vehicleProps.plate, data.current.price)
    --             end
    --         end
    --     end, function(data, menu)
    --         menu.close()
    --         menuOpened = false
    --         FreezeEntityPosition(veh, false)
    --     end)
    -- else
    --     ESX.ShowNotification(_U('not_upgradable'))
    -- end
end

-- Blips
Citizen.CreateThread(function()

    for k, v in pairs(Config.Zones) do
        local blip = AddBlipForCoord(v.Pos.x, v.Pos.y, v.Pos.z)
        SetBlipSprite(blip, 72)
        SetBlipScale(blip, 0.8)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.Name)
        EndTextCommandSetBlipName(blip)
    end
end)
-- In Bennys

Citizen.CreateThread(function()
    while true do
        Wait(10)
        local ped = GetPlayerPed(-1)
        local veh = GetVehiclePedIsIn(ped, false)
        if IsPedInAnyVehicle(ped, false) then
            local coords = GetEntityCoords(GetPlayerPed(-1))
            for k, v in pairs(Config.Zones) do
                if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z,
                                            true) < v.Size.x and
                    IsControlJustReleased(0, Keys['E']) then -- todo and menu is not open
                    menuOpened = true
                    openUpgradeMenu()
                    LSCMenu:Visible(true)

                    Wait(500)
                elseif GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y,
                                                v.Pos.z, true) < v.Size.x and
                    not menuOpened then
                    SetTextComponentFormat("STRING")
                    AddTextComponentString(v.Hint)
                    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
                end
            end
        end
    end
end)

-- In Bennys
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if (menuOpened) then
            _menuPool:ProcessMenus()
            DisableControlAction(0, 75, true) -- Disable exit vehicle
            DisableControlAction(27, 75, true) -- Disable exit vehicle
        end
    end
end)

createBasicStuff()

