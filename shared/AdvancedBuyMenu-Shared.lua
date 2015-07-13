class 'BuyMenu'
class 'BuyMenuEntry'

function BuyMenuEntry:__init( model_id, price, entry_type, template, decal)
    self.model_id = model_id
    self.price = price	--	Change price to 0 to make everything free.	Default: price
    self.entry_type = entry_type
	self.template = template
	self.decal = decal
end

function BuyMenuEntry:GetPrice()
    return self.price
end

function BuyMenuEntry:GetModelId()
    return self.model_id
end

function BuyMenuEntry:GetTemplate()
    return self.template
end

function BuyMenuEntry:GetDecal()
    return self.decal
end

function BuyMenuEntry:GetListboxItem()
    return self.listbox_item
end

function BuyMenuEntry:SetListboxItem( item )
    self.listbox_item = item
end

class 'VehicleBuyMenuEntry' (BuyMenuEntry)

function VehicleBuyMenuEntry:__init( model_id, price, template, decal, name, rank )
    BuyMenuEntry.__init( self, model_id, price, 1, template, decal)
    self.name = name
	self.rank = rank
end

function VehicleBuyMenuEntry:GetName()
	local modelName = Vehicle.GetNameByModelId( self.model_id )
	local DisplayName = modelName
	if self.name ~= nil and self.name ~= "" then
		DisplayName = modelName .. " - " .. self.name
	end
	if self.template ~= nil and self.template ~= "" then
		DisplayName = DisplayName .. " [" .. self.template .. "]"
	end
	if self.decal ~= nil and self.decal ~= "" then
		DisplayName = DisplayName .. " (" .. self.decal .. ")"
	end
    return DisplayName
end

function VehicleBuyMenuEntry:GetRank()
    return self.rank
end

class 'WeaponBuyMenuEntry' (BuyMenuEntry)

function WeaponBuyMenuEntry:__init( model_id, price, slot, name, rank )
    BuyMenuEntry.__init( self, model_id, price, 2 )
    self.slot = slot
    self.name = name
	self.rank = rank
end

function WeaponBuyMenuEntry:GetSlot()
    return self.slot
end

function WeaponBuyMenuEntry:GetName()
    return self.name
end

function WeaponBuyMenuEntry:GetRank()
    return self.rank
end

class 'ModelBuyMenuEntry' (BuyMenuEntry)

function ModelBuyMenuEntry:__init( model_id, price, name, rank )
    BuyMenuEntry.__init( self, model_id, price, 2 )
    self.name = name
	self.rank = rank
end

function ModelBuyMenuEntry:GetName()
    return self.name
end

function ModelBuyMenuEntry:GetRank()
    return self.rank
end

class 'AppearanceBuyMenuEntry' (BuyMenuEntry)

function AppearanceBuyMenuEntry:__init( model_id, price, itemtype, name, rank )
    BuyMenuEntry.__init( self, model_id, price, itemtype, 2 )
    self.name = name
    self.itemtype = itemtype
	self.rank = rank
end

function AppearanceBuyMenuEntry:GetName()
    return self.name
end

function AppearanceBuyMenuEntry:GetType()
    return self.itemtype
end

function AppearanceBuyMenuEntry:GetRank()
    return self.rank
end

function BuyMenu:CreateItems()
    self.types = {
        ["Vehicle"] = 1,
        ["Weapon"] = 2,
        ["Model"] = 3,
		["Appearance"] = 4
    }

    self.id_types = {}

    for k, v in pairs(self.types) do
        self.id_types[v] = k
    end
    self.items = {
        [self.types.Vehicle] = {
            { "Bike", "Car", "Sportcar", "Jeep", "Pickup", "Bus", "Truck", "Heavy", "Tractor", "Heli", "Plane", "Boat", "DLC" },
			["Bike"] = {
			--	Example:			ModelID, Price, Template, Decal, Name, Required Rank(must be a number)
			--	If you only want a rank or name on an item, you must have nil in the previous fields.
			--	End fields can be left blank, but fields between fields must have atleast nil,
			--	Otherwise you will find it displays wrong.
--				VehicleBuyMenuEntry( 9, 0, "TemplateName", "DecalName", "CustomName", 3 ),
--				VehicleBuyMenuEntry( 9, 0, nil, nil, nil, 1 ),
				--	The above is an example.
				VehicleBuyMenuEntry( 9, 7000 ),
				-- ^ Tuk-Tuk Rickshaw
				VehicleBuyMenuEntry( 22, 200 ),
				-- ^ Tuk-Tuk Laa
				VehicleBuyMenuEntry( 47, 180 ),
				-- ^ Schulz Virginia
				VehicleBuyMenuEntry( 83, 250 ),
				-- ^ Mosca 125 Performance
				VehicleBuyMenuEntry( 32, 250 ),
				-- ^ Mosca 2000
				VehicleBuyMenuEntry( 90, 360 ),
				-- ^ Makota MZ250
				VehicleBuyMenuEntry( 61, 400 ),
				-- ^ Makota MZ 260X
				VehicleBuyMenuEntry( 89, 450 ),
				-- ^ Hamaya Y250S
				VehicleBuyMenuEntry( 43, 600 ),
				-- ^ Hamaya GSY650
				VehicleBuyMenuEntry( 74, 750 ),
				-- ^ Hamaya 1300 Elite Cruiser
				VehicleBuyMenuEntry( 21, 600 ),
				-- ^ Hamaya Cougar 600
				VehicleBuyMenuEntry( 36, 250, "Sport", nil, "" ),
				-- ^ Shimuzu Tracline 
				VehicleBuyMenuEntry( 36, 250, "Gimp", nil, "" ),
				-- ^ Shimuzu Tracline RollCage
				VehicleBuyMenuEntry( 36, 250, "Civil", nil, "" ),
				-- ^ Shimuzu Tracline Racks
				VehicleBuyMenuEntry( 11, 250, "Police", nil, "" ),
				-- ^ Shimuzu Tracline Windshield
			},

			["Car"] = {
				VehicleBuyMenuEntry( 44, 750, "Softtop", nil, "" ),
				-- ^ Hamaya Oldman Softtop
				VehicleBuyMenuEntry( 44, 750, "Cab", nil, "" ),
				-- ^ Hamaya Oldman Opentop
				VehicleBuyMenuEntry( 44, 750, "Hardtop", nil, "" ),
				-- ^ Hamaya Oldman Hardtop
				VehicleBuyMenuEntry( 29, 600, nil, nil, "" ),
				-- ^ Sakura Aquila City
				VehicleBuyMenuEntry( 15, 600, nil, nil, "" ),
				-- ^ Sakura Aquila Space
				VehicleBuyMenuEntry( 70, 600, nil, nil, "" ),
				-- ^ Sakura Aquila Forte (Taxi)
				VehicleBuyMenuEntry( 55, 800, nil, nil, "" ),
				-- ^ Sakura Aquila Metro ST
				VehicleBuyMenuEntry( 13, 600, nil, nil, "" ),
				-- ^ Stinger Dunebug 84
				VehicleBuyMenuEntry( 54, 750, nil, nil, "" ),
				-- ^ Boyd Fireflame 544
				VehicleBuyMenuEntry( 8, 1000, nil, nil, "" ),
				-- ^ Columbi Excelsior (Limo)
				VehicleBuyMenuEntry( 8, 1000, "Hijack_Rear", nil, "" ),
				-- ^ Columbi Excelsior Rear Stuntjump (Limo)
			},

			["Sportcar"] = {
				VehicleBuyMenuEntry( 78, 1100, "Hardtop", nil, "" ),
				-- ^ Civadier 999 Hardtop
				VehicleBuyMenuEntry( 78, 1100, "Cab", nil, "" ),
				-- ^ Civadier 999 Opentop
				VehicleBuyMenuEntry( 2, 1000, nil, nil, "" ),
				-- ^ Mancini Cavallo 1001
				VehicleBuyMenuEntry( 91, 1000, "Hardtop", nil, "" ),
				-- ^ Titus ZJ Hardtop
				VehicleBuyMenuEntry( 91, 1000, "Softtop", nil, "" ),
				-- ^ Titus ZJ Softtop
				VehicleBuyMenuEntry( 91, 1000, "Cab", nil, "" ),
				-- ^ Titus ZJ Opentop
				VehicleBuyMenuEntry( 35, 1500, nil, nil, "" ),
				-- ^ Garret Traver-Z
				VehicleBuyMenuEntry( 35, 1500, "FullyUpgraded", nil, "" ),
				-- ^ Garret Traver-Z Armed
			},

			["Jeep"] = {
				VehicleBuyMenuEntry( 48, 900, "Buggy", nil, "" ),
				-- ^ Maddox FVA 45
				VehicleBuyMenuEntry( 48, 900, "BuggyMG", nil, "" ),
				-- ^ Maddox FVA 45 Mounted Gun
				VehicleBuyMenuEntry( 48, 900, "Buggy", "Reapers", "" ),
				-- ^ Maddox FVA 45
				VehicleBuyMenuEntry( 48, 900, "BuggyMG", "Reapers", "" ),
				-- ^ Maddox FVA 45 Mounted Gun
				VehicleBuyMenuEntry( 48, 900, "Buggy", "Roaches", "" ),
				-- ^ Maddox FVA 45
				VehicleBuyMenuEntry( 48, 900, "BuggyMG", "Roaches", "" ),
				-- ^ Maddox FVA 45 Mounted Gun
				VehicleBuyMenuEntry( 48, 900, "Buggy", "UlarBoys", "" ),
				-- ^ Maddox FVA 45
				VehicleBuyMenuEntry( 48, 900, "BuggyMG", "UlarBoys", "" ),
				-- ^ Maddox FVA 45 Mounted Gun
				VehicleBuyMenuEntry( 87, 800, "Hardtop", nil, "" ),
				-- ^ Wilforce Trekstar Hardtop
				VehicleBuyMenuEntry( 87, 800, "Softtop", nil, "" ),
				-- ^ Wilforce Trekstar Softtop
				VehicleBuyMenuEntry( 87, 800, "Cab", nil, "" ),
				-- ^ Wilforce Trekstar Opentop
				VehicleBuyMenuEntry( 87, 800, "Hardtop", "Reapers", "" ),
				-- ^ Wilforce Trekstar Hardtop
				VehicleBuyMenuEntry( 87, 800, "Softtop", "Reapers", "" ),
				-- ^ Wilforce Trekstar Softtop
				VehicleBuyMenuEntry( 87, 800, "Cab", "Reapers", "" ),
				-- ^ Wilforce Trekstar Opentop
				VehicleBuyMenuEntry( 87, 800, "Hardtop", "Roaches", "" ),
				-- ^ Wilforce Trekstar Hardtop
				VehicleBuyMenuEntry( 87, 800, "Softtop", "Roaches", "" ),
				-- ^ Wilforce Trekstar Softtop
				VehicleBuyMenuEntry( 87, 800, "Cab", "Roaches", "" ),
				-- ^ Wilforce Trekstar Opentop
				VehicleBuyMenuEntry( 87, 800, "Hardtop", "UlarBoys", "" ),
				-- ^ Wilforce Trekstar Hardtop
				VehicleBuyMenuEntry( 87, 800, "Softtop", "UlarBoys", "" ),
				-- ^ Wilforce Trekstar Softtop
				VehicleBuyMenuEntry( 87, 800, "Cab", "UlarBoys", "" ),
				-- ^ Wilforce Trekstar Opentop
				VehicleBuyMenuEntry( 52, 800, nil, nil, "" ),
				-- ^ Sass PP12 Hogg
				VehicleBuyMenuEntry( 10, 800, "Ingame", nil, "Karl Blaine's" ),
				-- ^ Sass PP12 Hogg (Karl Blaine's)
				VehicleBuyMenuEntry( 46, 1200, nil, nil, "" ),
				-- ^ MV V880
				VehicleBuyMenuEntry( 46, 1200, "Cab", nil, "" ),
				-- ^ MV V880 Opentop
				VehicleBuyMenuEntry( 46, 1200, "Combi", nil, "" ),
				-- ^ MV V880 Loaded with Gear
				VehicleBuyMenuEntry( 46, 1200, "CombiMG", nil, "" ),
				-- ^ MV V880 Loaded with Gear, Mounted Gun
				VehicleBuyMenuEntry( 46, 1200, nil, "Reapers", "" ),
				-- ^ MV V880
				VehicleBuyMenuEntry( 46, 1200, "Cab", "Reapers", "" ),
				-- ^ MV V880 Opentop
				VehicleBuyMenuEntry( 46, 1200, "Combi", "Reapers", "" ),
				-- ^ MV V880 Loaded with Gear
				VehicleBuyMenuEntry( 46, 1200, "CombiMG", "Reapers", "" ),
				-- ^ MV V880 Loaded with Gear, Mounted Gun
				VehicleBuyMenuEntry( 46, 1200, nil, "Roaches", "" ),
				-- ^ MV V880
				VehicleBuyMenuEntry( 46, 1200, "Cab", "Roaches", "" ),
				-- ^ MV V880 Opentop
				VehicleBuyMenuEntry( 46, 1200, "Combi", "Roaches", "" ),
				-- ^ MV V880 Loaded with Gear
				VehicleBuyMenuEntry( 46, 1200, "CombiMG", "Roaches", "" ),
				-- ^ MV V880 Loaded with Gear, Mounted Gun
				VehicleBuyMenuEntry( 46, 1200, nil, "UlarBoys", "" ),
				-- ^ MV V880
				VehicleBuyMenuEntry( 46, 1200, "Cab", "UlarBoys", "" ),
				-- ^ MV V880 Opentop
				VehicleBuyMenuEntry( 46, 1200, "Combi", "UlarBoys", "" ),
				-- ^ MV V880 Loaded with Gear
				VehicleBuyMenuEntry( 46, 1200, "CombiMG", "UlarBoys", "" ),
				-- ^ MV V880 Loaded with Gear, Mounted Gun
				VehicleBuyMenuEntry( 72, 1000, nil, nil, "" ),
				-- ^ Chepachet PVD
				VehicleBuyMenuEntry( 72, 1000, nil, "Reapers", "" ),
				-- ^ Chepachet PVD
				VehicleBuyMenuEntry( 72, 1000, nil, "Roaches", "" ),
				-- ^ Chepachet PVD
				VehicleBuyMenuEntry( 72, 1000, nil, "UlarBoys", "" ),
				-- ^ Chepachet PVD
				VehicleBuyMenuEntry( 84, 750, "HardtopMG", nil, "" ),
				-- ^ Marten Storm III Mounted Gun
				VehicleBuyMenuEntry( 84, 750, "Cab", nil, "" ),
				-- ^ Marten Storm III Opentop Truckbed
				VehicleBuyMenuEntry( 84, 750, "HardtopMG", "Reapers", "" ),
				-- ^ Marten Storm III Mounted Gun
				VehicleBuyMenuEntry( 84, 750, "Cab", "Reapers", "" ),
				-- ^ Marten Storm III Opentop Truckbed
				VehicleBuyMenuEntry( 84, 750, "HardtopMG", "Roaches", "" ),
				-- ^ Marten Storm III Mounted Gun
				VehicleBuyMenuEntry( 84, 750, "Cab", "Roaches", "" ),
				-- ^ Marten Storm III Opentop Truckbed
				VehicleBuyMenuEntry( 84, 750, "HardtopMG", "UlarBoys", "" ),
				-- ^ Marten Storm III Mounted Gun
				VehicleBuyMenuEntry( 84, 750, "Cab", "UlarBoys", "" ),
				-- ^ Marten Storm III Opentop Truckbed
				VehicleBuyMenuEntry( 77, 1500, "Default", nil, ""),
				-- ^ Hedge Wildchild
				VehicleBuyMenuEntry( 77, 1500, nil, nil, ""),
				-- ^ Hedge Wildchild
				VehicleBuyMenuEntry( 77, 1500, "Armed", nil, "" ),
				-- ^ Hedge Wildchild Rockets
			},

			["Pickup"] = {
				VehicleBuyMenuEntry( 60, 350, nil, nil, "" ),
				-- ^ Vaultier Patrolman
				VehicleBuyMenuEntry( 26, 500, nil, nil, "" ),
				-- ^ Chevalier Traveller SD
				VehicleBuyMenuEntry( 73, 500, nil, nil, "" ),
				-- ^ Chevalier Express HT
				VehicleBuyMenuEntry( 23, 500, nil, nil, "" ),
				-- ^ Chevalier Liner SB
				VehicleBuyMenuEntry( 63, 500, nil, nil, "" ),	
				-- ^ Chevalier Traveller SC
				VehicleBuyMenuEntry( 68, 500, nil, nil, "" ),				
				-- ^ Chevalier Traveller SX
				VehicleBuyMenuEntry( 33, 500, nil, nil, "" ),
				-- ^ Chevalier Piazza IX
				VehicleBuyMenuEntry( 86, 600, nil, nil, "" ),
				-- ^ Dalton N90
				VehicleBuyMenuEntry( 86, 600, nil, "Reapers", "" ),
				-- ^ Dalton N90
				VehicleBuyMenuEntry( 86, 600, nil, "Roaches", "" ),
				-- ^ Dalton N90
				VehicleBuyMenuEntry( 86, 600, nil, "UlarBoys", "" ),
				-- ^ Dalton N90
				VehicleBuyMenuEntry( 7, 1500, "Default", nil, "" ),
				-- ^ Poloma Renegade
				VehicleBuyMenuEntry( 7, 1500, "Armed", nil, "" ),
				-- ^ Poloma Renegade
				VehicleBuyMenuEntry( 7, 1500, "FullyUpgraded", nil, "" ),
				-- ^ Poloma Renegade Rockets
			},

			["Bus"] = {
				VehicleBuyMenuEntry( 66, 500, "Single", nil, "" ),
				-- ^ Dinggong 134D Single-Decker
				VehicleBuyMenuEntry( 66, 800, "Double", nil, "" ),
				-- ^ Dinggong 134D Double-Decker
				VehicleBuyMenuEntry( 12, 900 ),
				-- ^ Vanderbildt LeisureLiner
			},

			["Truck"] = {
				VehicleBuyMenuEntry( 42, 400, nil, nil, "" ),
				-- ^ Niseco Tusker P246
				VehicleBuyMenuEntry( 49, 400, nil, nil, "" ),
				-- ^ Niseco Tusker D18
				VehicleBuyMenuEntry( 71, 400, nil, nil, "" ),
				-- ^ Niseco Tusker G216
				VehicleBuyMenuEntry( 41, 400, nil, nil, "" ),
				-- ^ Niseco Tusker D22
				VehicleBuyMenuEntry( 4, 750, nil, nil, "" ),
				-- ^ Kenwall Heavy Rescue
				VehicleBuyMenuEntry( 79, 1300, nil, nil, "" ),
				-- ^ Pocumtruck Nomad
			},

			["Heavy"] = {
				VehicleBuyMenuEntry( 40, 800, "Regular", nil, "" ),
				-- ^ Fengding EC14FD2 Longbed
				VehicleBuyMenuEntry( 40, 800, "Crane", nil, "" ),
				-- ^ Fengding EC14FD2 Crane
				VehicleBuyMenuEntry( 40, 800, "Crate", nil, "" ),
				-- ^ Fengding EC14FD2 Shortbed
				VehicleBuyMenuEntry( 40, 800, "Regular", "Reapers", "" ),
				-- ^ Fengding EC14FD2 Longbed
				VehicleBuyMenuEntry( 40, 800, "Crane", "Reapers", "" ),
				-- ^ Fengding EC14FD2 Crane
				VehicleBuyMenuEntry( 40, 800, "Crate", "Reapers", "" ),
				-- ^ Fengding EC14FD2 Shortbed
				VehicleBuyMenuEntry( 40, 800, "Regular", "Roaches", "" ),
				-- ^ Fengding EC14FD2 Longbed
				VehicleBuyMenuEntry( 40, 800, "Crane", "Roaches", "" ),
				-- ^ Fengding EC14FD2 Crane
				VehicleBuyMenuEntry( 40, 800, "Crate", "Roaches", "" ),
				-- ^ Fengding EC14FD2 Shortbed
				VehicleBuyMenuEntry( 40, 800, "Regular", "UlarBoys", "" ),
				-- ^ Fengding EC14FD2 Longbed
				VehicleBuyMenuEntry( 40, 800, "Crane", "UlarBoys", "" ),
				-- ^ Fengding EC14FD2 Crane
				VehicleBuyMenuEntry( 40, 800, "Crate", "UlarBoys", "" ),
				-- ^ Fengding EC14FD2 Shortbed
				VehicleBuyMenuEntry( 31, 800, nil, nil, "" ),
				-- ^ URGA-9380 Tow Cables
				VehicleBuyMenuEntry( 31, 800, "Cab", nil, "" ),
				-- ^ URGA-9380 Empty
				VehicleBuyMenuEntry( 31, 800, "MG", nil, "" ),
				-- ^ URGA-9380 Mounted Gun
				VehicleBuyMenuEntry( 76, 2000, nil, nil, "" ),
				-- ^ SAAS PP30 Ox
				VehicleBuyMenuEntry( 18, 5000, nil, nil, "" ),
				-- ^ SV-1003 Raider Mounted Gun
				VehicleBuyMenuEntry( 18, 5000, "Russian", nil, "" ),
				-- ^ SV-1003 Raider Russin Minigun & Guard
				VehicleBuyMenuEntry( 18, 5000, "Cannon", nil, "" ),
				-- ^ SV-1007 Stonewall
				VehicleBuyMenuEntry( 18, 5000, nil, "Reapers", "" ),
				-- ^ SV-1003 Raider Mounted Gun
				VehicleBuyMenuEntry( 18, 5000, "Russian", "Reapers", "" ),
				-- ^ SV-1003 Raider Russin Minigun & Guard
				VehicleBuyMenuEntry( 18, 5000, "Cannon", "Reapers", "" ),
				-- ^ SV-1007 Stonewall
				VehicleBuyMenuEntry( 18, 5000, nil, "Roaches", "" ),
				-- ^ SV-1003 Raider Mounted Gun
				VehicleBuyMenuEntry( 18, 5000, "Russian", "Roaches", "" ),
				-- ^ SV-1003 Raider Russin Minigun & Guard
				VehicleBuyMenuEntry( 18, 5000, "Cannon", "Roaches", "" ),
				-- ^ SV-1007 Stonewall
				VehicleBuyMenuEntry( 18, 5000, nil, "UlarBoys", "" ),
				-- ^ SV-1003 Raider Mounted Gun
				VehicleBuyMenuEntry( 18, 5000, "Russian", "UlarBoys", "" ),
				-- ^ SV-1003 Raider Russin Minigun & Guard
				VehicleBuyMenuEntry( 18, 5000, "Cannon", "UlarBoys", "" ),
				-- ^ SV-1007 Stonewall
				VehicleBuyMenuEntry( 56, 5000, "Cab", nil, "" ),
				-- ^ GV-104 Razorback UnArmed
				VehicleBuyMenuEntry( 56, 5000, "Armed", nil, "" ),
				-- ^ GV-104 Razorback Minigun
				VehicleBuyMenuEntry( 56, 5000, nil, nil, "" ),
				-- ^ GV-104 Razorback Base with Autocannon
				VehicleBuyMenuEntry( 56, 5000, "FullyUpgraded", nil, "" ),
				-- ^ GV-104 Razorback with Autocannon & Machine Guns
			},

			["Tractor"] = {
				VehicleBuyMenuEntry( 1, 350, "Modern_Cab", nil, "" ),
				-- ^ Dongtai Agriboss 35 Modern Open Cab
				VehicleBuyMenuEntry( 1, 350, "Modern_Hardtop", nil, "" ),
				-- ^ Dongtai Agriboss 35 Modern Closed Cab
				VehicleBuyMenuEntry( 1, 350, "Classic_Cab", nil, "" ),
				-- ^ Dongtai Agriboss 35 Old Style Open Cab
				VehicleBuyMenuEntry( 1, 350, "Classic_Hardtop", nil, "" ),
				-- ^ Dongtai Agriboss 35 Old Style Closed Cab
			},

			["Heli"] = {
				VehicleBuyMenuEntry( 3, 3000, nil, nil, "" ),
				-- ^ Rowlinson K22
				VehicleBuyMenuEntry( 3, 3000, "FullyUpgraded", nil, "" ),
				-- ^ Rowlinson K22 Armed
				VehicleBuyMenuEntry( 14, 1500, nil, nil, "" ),
				-- ^ Mullen Skeeter Eagle
				VehicleBuyMenuEntry( 67, 2500, nil, nil, "" ),
				-- ^ Mullen Skeeter Hawk
--				VehicleBuyMenuEntry( 37, 0 ),
				-- ^ Sivirkin 15 Havoc
				VehicleBuyMenuEntry( 57, 5000, "Mission", nil, "" ),
				-- ^ Sivirkin 15 Havoc
				VehicleBuyMenuEntry( 57, 5000, "FullyUpgraded", nil, "" ),
				-- ^ Sivirkin 15 Havoc Rockets
				VehicleBuyMenuEntry( 57, 5000, "Mission", "Reapers", "" ),
				-- ^ Sivirkin 15 Havoc
				VehicleBuyMenuEntry( 57, 5000, "FullyUpgraded", "Reapers", "" ),
				-- ^ Sivirkin 15 Havoc Rockets
				VehicleBuyMenuEntry( 57, 5000, "Mission", "Roaches", "" ),
				-- ^ Sivirkin 15 Havoc
				VehicleBuyMenuEntry( 57, 5000, "FullyUpgraded", "Roaches", "" ),
				-- ^ Sivirkin 15 Havoc Rockets
				VehicleBuyMenuEntry( 57, 5000, "Mission", "UlarBoys", "" ),
				-- ^ Sivirkin 15 Havoc
				VehicleBuyMenuEntry( 57, 5000, "FullyUpgraded", "UlarBoys", "" ),
				-- ^ Sivirkin 15 Havoc Rockets
				VehicleBuyMenuEntry( 64, 4000, nil, nil, "" ),
				-- ^ AH-33 Topachula
				VehicleBuyMenuEntry( 64, 4000, nil, "Reapers", "" ),
				-- ^ AH-33 Topachula
				VehicleBuyMenuEntry( 64, 4000, nil, "Roaches", "" ),
				-- ^ AH-33 Topachula
				VehicleBuyMenuEntry( 64, 4000, nil, "UlarBoys", "" ),
				-- ^ AH-33 Topachula
				VehicleBuyMenuEntry( 65, 4000, nil, nil, "" ),
				-- ^ H-62 Quapaw
				VehicleBuyMenuEntry( 65, 4000, nil, "Reapers", "" ),
				-- ^ H-62 Quapaw
				VehicleBuyMenuEntry( 65, 4000, nil, "Roaches", "" ),
				-- ^ H-62 Quapaw
				VehicleBuyMenuEntry( 65, 4000, nil, "UlarBoys", "" ),
				-- ^ H-62 Quapaw
				VehicleBuyMenuEntry( 62, 4000, "UnArmed", nil, "" ),
				-- ^ UH-10 Chippewa (4 Seater)
				VehicleBuyMenuEntry( 62, 4000, "Armed", nil, "" ),
				-- ^ UH-10 Chippewa (4 Seater)
				VehicleBuyMenuEntry( 62, 4000, "Cutscene", nil, "" ),
				-- ^ UH-10 Chippewa (4 Seater)
				VehicleBuyMenuEntry( 62, 4000, "Dome", nil, "" ),
				-- ^ UH-10 Chippewa (4 Seater) Rockets
				VehicleBuyMenuEntry( 62, 4000, "UnArmed", "Reapers", "" ),
				-- ^ UH-10 Chippewa (4 Seater)
				VehicleBuyMenuEntry( 62, 4000, "Armed", "Reapers", "" ),
				-- ^ UH-10 Chippewa (4 Seater)
				VehicleBuyMenuEntry( 62, 4000, "Cutscene", "Reapers", "" ),
				-- ^ UH-10 Chippewa (4 Seater)
				VehicleBuyMenuEntry( 62, 4000, "Dome", "Reapers", "" ),
				-- ^ UH-10 Chippewa (4 Seater) Rockets
				VehicleBuyMenuEntry( 62, 4000, "UnArmed", "Roaches", "" ),
				-- ^ UH-10 Chippewa (4 Seater)
				VehicleBuyMenuEntry( 62, 4000, "Armed", "Roaches", "" ),
				-- ^ UH-10 Chippewa (4 Seater)
				VehicleBuyMenuEntry( 62, 4000, "Cutscene", "Roaches", "" ),
				-- ^ UH-10 Chippewa (4 Seater)
				VehicleBuyMenuEntry( 62, 4000, "Dome", "Roaches", "" ),
				-- ^ UH-10 Chippewa (4 Seater) Rockets
				VehicleBuyMenuEntry( 62, 4000, "UnArmed", "UlarBoys", "" ),
				-- ^ UH-10 Chippewa (4 Seater)
				VehicleBuyMenuEntry( 62, 4000, "Armed", "UlarBoys", "" ),
				-- ^ UH-10 Chippewa (4 Seater)
				VehicleBuyMenuEntry( 62, 4000, "Cutscene", "UlarBoys", "" ),
				-- ^ UH-10 Chippewa (4 Seater)
				VehicleBuyMenuEntry( 62, 4000, "Dome", "UlarBoys", "" ),
				-- ^ UH-10 Chippewa (4 Seater) Rockets
			},
			
			["Plane"] = {
				VehicleBuyMenuEntry( 59, 2000, nil, nil, "" ),
				-- ^ Peek Airhawk 225
				VehicleBuyMenuEntry( 81, 5000, nil, nil, "" ),
				-- ^ Pell Silverbolt 6
				VehicleBuyMenuEntry( 51, 3500, nil, nil, "" ),
				-- ^ Cassius 192
				VehicleBuyMenuEntry( 30, 8000, nil, nil, "" ),
				-- ^ Si-47 Leopard
				VehicleBuyMenuEntry( 30, 8000, nil, "Reapers", "" ),
				-- ^ Si-47 Leopard
				VehicleBuyMenuEntry( 30, 8000, nil, "Roaches", "" ),
				-- ^ Si-47 Leopard
				VehicleBuyMenuEntry( 30, 8000, nil, "UlarBoys", "" ),
				-- ^ Si-47 Leopard
				VehicleBuyMenuEntry( 34, 10000, nil, nil, "" ),
				-- ^ G9 Eclipse
				VehicleBuyMenuEntry( 39, 5000, nil, nil, "" ),
				-- ^ Aeroliner 474
				VehicleBuyMenuEntry( 85, 10000, nil, nil, "" ),
				-- ^ Bering I-86DP
				VehicleBuyMenuEntry( 85, 10000, nil, "Reapers", "" ),
				-- ^ Bering I-86DP
				VehicleBuyMenuEntry( 85, 10000, nil, "Roaches", "" ),
				-- ^ Bering I-86DP
				VehicleBuyMenuEntry( 85, 10000, nil, "UlarBoys", "" ),
				-- ^ Bering I-86DP
			},
			
			["Boat"] = {
				VehicleBuyMenuEntry( 38, 500, "Djonk01", nil, "" ),
				-- ^ Kuang Sunrise
				VehicleBuyMenuEntry( 38, 500, "Djonk02", nil, "" ),
				-- ^ Kuang Sunrise 
				VehicleBuyMenuEntry( 38, 500, "Djonk03", nil, "" ),
				-- ^ Kuang Sunrise 
				VehicleBuyMenuEntry( 38, 500, "Djonk04", nil, "" ),
				-- ^ Kuang Sunrise 
				VehicleBuyMenuEntry( 5, 500, "Cab", nil, "" ),
				-- ^ Pattani Gluay Empty
				VehicleBuyMenuEntry( 5, 500, "Softtop", nil, "" ),
				-- ^ Pattani Gluay Touring (6 Seater)
				VehicleBuyMenuEntry( 5, 500, "Fishing", nil, "" ),
				-- ^ Pattani Gluay Fishing
				VehicleBuyMenuEntry( 6, 800 ),
				-- ^ Orque Grandois 21TT
				VehicleBuyMenuEntry( 19, 800 ),
				-- ^ Orque Living 42T
				VehicleBuyMenuEntry( 45, 800 ),
				-- ^ Orque Bon Ton 71FT
				VehicleBuyMenuEntry( 16, 500 ),
				-- ^ YP-107 Phoenix
				VehicleBuyMenuEntry( 25, 700, "Softtop", nil, "" ),
				-- ^ Trat Tang-mo Cargo
				VehicleBuyMenuEntry( 25, 700, "Cab", nil, "" ),
				-- ^ Trat Tang-mo Empty
				VehicleBuyMenuEntry( 28, 900 ),
				-- ^ TextE Charteu 52CT
				VehicleBuyMenuEntry( 50, 500 ),
				-- ^ Zhejiang 6903
				VehicleBuyMenuEntry( 80, 1000 ),
				-- ^ Frisco Catshark S-38
				VehicleBuyMenuEntry( 27, 1100 ),
				-- ^ SnakeHead T20
				VehicleBuyMenuEntry( 88, 1050, "Default" ),
				-- ^ MTA Powerrun 77
				VehicleBuyMenuEntry( 88, 1050, nil, nil, "" ),
				-- ^ MTA Powerrun 77 Armed
				VehicleBuyMenuEntry( 88, 1050, "FullyUpgraded", nil, "" ),
				-- ^ MTA Powerrun 77 Rockets
				VehicleBuyMenuEntry( 69, 1000, nil, nil, "" ),
				-- ^ Winstons Amen 69 Dual Mounted Guns
				VehicleBuyMenuEntry( 69, 1000, "Roaches", nil, "" ),
				-- ^ Winstons Amen 69 Dual Mounted Guns
				VehicleBuyMenuEntry( 69, 1000, nil, "Reapers", "" ),
				-- ^ Winstons Amen 69 Dual Mounted Guns
				VehicleBuyMenuEntry( 69, 1000, "Roaches", "Reapers", "" ),
				-- ^ Winstons Amen 69 Dual Mounted Guns
				VehicleBuyMenuEntry( 69, 1000, nil, "Roaches", "" ),
				-- ^ Winstons Amen 69 Dual Mounted Guns
				VehicleBuyMenuEntry( 69, 1000, "Roaches", "Roaches", "" ),
				-- ^ Winstons Amen 69 Dual Mounted Guns
				VehicleBuyMenuEntry( 69, 1000, nil, "UlarBoys", "" ),
				-- ^ Winstons Amen 69 Dual Mounted Guns
				VehicleBuyMenuEntry( 69, 1000, "Roaches", "UlarBoys", "" ),
				-- ^ Winstons Amen 69 Dual Mounted Guns
			},
			
			["DLC"] = {
				VehicleBuyMenuEntry( 75, 1000, nil, nil, "" ),
				-- ^ Tuk Tuk Boom Boom
				VehicleBuyMenuEntry( 58, 2000, nil, nil, "" ),
				-- ^ Chevalier Classic
				VehicleBuyMenuEntry( 82, 1000, nil, nil, "" ),
				-- ^ Chevalier Ice Breaker
				VehicleBuyMenuEntry( 20, 8000, nil, nil, "" ),
				-- ^ Monster Truck
				VehicleBuyMenuEntry( 53, 10000 ),
				-- ^ Agency Hovercraft
				VehicleBuyMenuEntry( 24, 15000 ),
				-- ^ F-33 DragonFly
			}
        },

        [self.types.Weapon] = {
            { "Right Hand", "Left Hand" , "Primary" },
            ["Right Hand"] = {
--                WeaponBuyMenuEntry( Weapon.Handgun, Price, Slot(Left: 0, Right: 1, Primary: 2), "NAME", RequiredRankNumber ),
				WeaponBuyMenuEntry( Weapon.BubbleGun, 100, 1, "Bubble Gun" ),
                WeaponBuyMenuEntry( Weapon.Handgun, 500, 1, "Pistol" ),
                WeaponBuyMenuEntry( Weapon.Revolver, 1000, 1, "Revolver" ),
                WeaponBuyMenuEntry( Weapon.SMG, 1200, 1, "SMG" ),
                WeaponBuyMenuEntry( Weapon.SawnOffShotgun, 1100, 1, "Sawn-off Shotgun" ),
				WeaponBuyMenuEntry( Weapon.GrenadeLauncher, 2000, 1, "Grenade Launcher" ),
				WeaponBuyMenuEntry( Weapon.Assault, 2000, 1, "Assault Rifle" ),
				WeaponBuyMenuEntry( Weapon.Shotgun, 2000, 1, "Shotgun" ),
				WeaponBuyMenuEntry( Weapon.MachineGun, 4000, 1, "Machine Gun" ),
				WeaponBuyMenuEntry( Weapon.Sniper, 5000, 1, "Sniper Rifle" ),
				WeaponBuyMenuEntry( Weapon.RocketLauncher, 7500, 1, "Rocket Launcher" ),
				WeaponBuyMenuEntry( Weapon.PanayRocketLauncher, 10000, 1, "Panay Rocket Launcher" ),
				WeaponBuyMenuEntry( Weapon.Minigun, 7500, 1, "Minigun" ),
				WeaponBuyMenuEntry( Weapon.SignatureGun, 3500, 1, "Rico's Signature Gun - DLC" ),
				WeaponBuyMenuEntry( Weapon.Airzooka, 7500, 1, "Air Propulsion Gun - DLC" ),
				WeaponBuyMenuEntry( Weapon.ClusterBombLauncher, 7500, 1, "Cluster Bomb Launcher - DLC" ),
				WeaponBuyMenuEntry( Weapon.MultiTargetRocketLauncher, 10000, 1, "Multi-target Rocket Launcher - DLC" ),
				WeaponBuyMenuEntry( Weapon.QuadRocketLauncher, 10000, 1, "Quad Rocket Launcher - DLC" ),
				WeaponBuyMenuEntry( Weapon.AlphaDLCWeapon, 7500, 1, "Bull's Eye Assault Rifle - DLC" ),
            },

            ["Left Hand"] = {
				WeaponBuyMenuEntry( Weapon.BubbleGun, 100, 0, "Bubble Gun" ),
                WeaponBuyMenuEntry( Weapon.Handgun, 500, 0, "Pistol" ),
                WeaponBuyMenuEntry( Weapon.Revolver, 1000, 0, "Revolver" ),
                WeaponBuyMenuEntry( Weapon.SMG, 1200, 0, "SMG" ),
                WeaponBuyMenuEntry( Weapon.SawnOffShotgun, 1100, 0, "Sawn-off Shotgun" ),
				WeaponBuyMenuEntry( Weapon.GrenadeLauncher, 2000, 0, "Grenade Launcher" ),
				WeaponBuyMenuEntry( Weapon.Assault, 2000, 0, "Assault Rifle" ),
				WeaponBuyMenuEntry( Weapon.Shotgun, 2000, 0, "Shotgun" ),
				WeaponBuyMenuEntry( Weapon.MachineGun, 4000, 0, "Machine Gun" ),
				WeaponBuyMenuEntry( Weapon.Sniper, 5000, 0, "Sniper Rifle" ),
				WeaponBuyMenuEntry( Weapon.RocketLauncher, 7500, 0, "Rocket Launcher" ),
				WeaponBuyMenuEntry( Weapon.PanayRocketLauncher, 10000, 0, "Panay Rocket Launcher" ),
				WeaponBuyMenuEntry( Weapon.Minigun, 7500, 0, "Minigun" ),
				WeaponBuyMenuEntry( Weapon.SignatureGun, 3500, 0, "Rico's Signature Gun - DLC" ),
				WeaponBuyMenuEntry( Weapon.Airzooka, 7500, 0, "Air Propulsion Gun - DLC" ),
				WeaponBuyMenuEntry( Weapon.ClusterBombLauncher, 7500, 0, "Cluster Bomb Launcher - DLC" ),
				WeaponBuyMenuEntry( Weapon.MultiTargetRocketLauncher, 10000, 0, "Multi-target Rocket Launcher - DLC" ),
				WeaponBuyMenuEntry( Weapon.QuadRocketLauncher, 10000, 0, "Quad Rocket Launcher - DLC" ),
				WeaponBuyMenuEntry( Weapon.AlphaDLCWeapon, 7500, 0, "Bull's Eye Assault Rifle - DLC" ),
            },
			
            ["Primary"] = {
				WeaponBuyMenuEntry( Weapon.BubbleGun, 100, 2, "Bubble Gun" ),
                WeaponBuyMenuEntry( Weapon.Handgun, 500, 2, "Pistol" ),
                WeaponBuyMenuEntry( Weapon.Revolver, 1000, 2, "Revolver" ),
                WeaponBuyMenuEntry( Weapon.SMG, 1200, 2, "SMG" ),
                WeaponBuyMenuEntry( Weapon.SawnOffShotgun, 1100, 2, "Sawn-off Shotgun" ),
				WeaponBuyMenuEntry( Weapon.GrenadeLauncher, 2000, 2, "Grenade Launcher" ),
				WeaponBuyMenuEntry( Weapon.Assault, 2000, 2, "Assault Rifle" ),
				WeaponBuyMenuEntry( Weapon.Shotgun, 2000, 2, "Shotgun" ),
				WeaponBuyMenuEntry( Weapon.MachineGun, 4000, 2, "Machine Gun" ),
				WeaponBuyMenuEntry( Weapon.Sniper, 5000, 2, "Sniper Rifle" ),
				WeaponBuyMenuEntry( Weapon.RocketLauncher, 7500, 2, "Rocket Launcher" ),
				WeaponBuyMenuEntry( Weapon.PanayRocketLauncher, 10000, 2, "Panay Rocket Launcher" ),
				WeaponBuyMenuEntry( Weapon.Minigun, 7500, 2, "Minigun" ),
				WeaponBuyMenuEntry( Weapon.SignatureGun, 3500, 2, "Rico's Signature Gun - DLC" ),
				WeaponBuyMenuEntry( Weapon.Airzooka, 7500, 2, "Air Propulsion Gun - DLC" ),
				WeaponBuyMenuEntry( Weapon.ClusterBombLauncher, 7500, 2, "Cluster Bomb Launcher - DLC" ),
				WeaponBuyMenuEntry( Weapon.MultiTargetRocketLauncher, 10000, 2, "Multi-target Rocket Launcher - DLC" ),
				WeaponBuyMenuEntry( Weapon.QuadRocketLauncher, 10000, 2, "Quad Rocket Launcher - DLC" ),
				WeaponBuyMenuEntry( Weapon.AlphaDLCWeapon, 7500, 2, "Bull's Eye Assault Rifle - DLC" ),
            }
        },

        [self.types.Model] = {
            { "Roaches", "Ular Boys", "Reapers", "Government", "Agency", "Misc", "Civilians" },

            ["Roaches"] = {
--                ModelBuyMenuEntry( 2, 0, "Razak Razman", 1 ),
                ModelBuyMenuEntry( 2, 0, "Razak Razman" ),
                ModelBuyMenuEntry( 5, 0, "Elite" ),
                ModelBuyMenuEntry( 32, 0, "Technician" ),
                ModelBuyMenuEntry( 85, 0, "Soldier 1" ),
                ModelBuyMenuEntry( 59, 0, "Soldier 2" )
            },

            ["Ular Boys"] = {
                ModelBuyMenuEntry( 38, 500, "Sri Irawan" ),
                ModelBuyMenuEntry( 87, 800, "Elite" ),
                ModelBuyMenuEntry( 22, 0, "Technician" ),
                ModelBuyMenuEntry( 27, 0, "Soldier 1" ),
                ModelBuyMenuEntry( 103, 0, "Soldier 2" )
            },

            ["Reapers"] = {
                ModelBuyMenuEntry( 90, 0, "Bolo Santosi" ),
                ModelBuyMenuEntry( 63, 0, "Elite" ),
                ModelBuyMenuEntry( 8, 0, "Technician" ),
                ModelBuyMenuEntry( 12, 0, "Soldier 1" ),
                ModelBuyMenuEntry( 58, 0, "Soldier 2" ),
            },

            ["Government"] = {
                ModelBuyMenuEntry( 74, 750, "Baby Panay" ),
                ModelBuyMenuEntry( 67, 0, "Burned Baby Panay" ),
                ModelBuyMenuEntry( 101, 350, "Colonel" ),
                ModelBuyMenuEntry( 3, 0, "Demo Expert" ),
                ModelBuyMenuEntry( 98, 0, "Pilot" ),
                ModelBuyMenuEntry( 42, 0, "Black Hand" ),
                ModelBuyMenuEntry( 44, 750, "Ninja" ),
                ModelBuyMenuEntry( 23, 0, "Scientist" ),
                ModelBuyMenuEntry( 52, 0, "Soldier 1" ),
                ModelBuyMenuEntry( 66, 0, "Soldier 2" ) 
            },

            ["Agency"] = {
                ModelBuyMenuEntry( 9, 0, "Karl Blaine" ),
                ModelBuyMenuEntry( 65, 4000, "Jade Tan" ),
                ModelBuyMenuEntry( 25, 0, "Maria Kane" ),
                ModelBuyMenuEntry( 30, 0, "Marshall" ),
                ModelBuyMenuEntry( 34, 750, "Tom Sheldon" ),
                ModelBuyMenuEntry( 100, 0, "Black Market Dealer" ),
                ModelBuyMenuEntry( 83, 0, "White Tiger" ),
                ModelBuyMenuEntry( 51, 350, "Rico Rodriguez" )
            },

            ["Misc"] = {
                ModelBuyMenuEntry( 70, 0, "General Masayo" ),
                ModelBuyMenuEntry( 11, 250, "Zhang Sun" ),
                ModelBuyMenuEntry( 84, 750, "Alexander Mirikov" ),
                ModelBuyMenuEntry( 19, 0, "Chinese Businessman" ),
                ModelBuyMenuEntry( 36, 0, "Politician" ),
                ModelBuyMenuEntry( 78, 1100, "Thug Boss" ),
                ModelBuyMenuEntry( 71, 350, "Saul Sukarno" ),
                ModelBuyMenuEntry( 79, 0, "Japanese Veteran" ),
                ModelBuyMenuEntry( 96, 0, "Bodyguard" ),
                ModelBuyMenuEntry( 80, 0, "Suited Guest 1" ),
                ModelBuyMenuEntry( 95, 0, "Suited Guest 2" ),
                ModelBuyMenuEntry( 60, 0, "Race Challenge Girl" ),
                ModelBuyMenuEntry( 15, 1250, "Male Stripper 1" ),
                ModelBuyMenuEntry( 17, 1250, "Male Stripper 2" ),
                ModelBuyMenuEntry( 86, 1250, "Female Stripper" ),
                ModelBuyMenuEntry( 16, 0, "Panau Police" ),
                ModelBuyMenuEntry( 18, 5000, "Hacker" ),
                ModelBuyMenuEntry( 64, 4000, "Bom Bom Bohilano" ),
                ModelBuyMenuEntry( 40, 800, "Factory Boss" ),
                ModelBuyMenuEntry( 1, 350, "Thug 1" ),
                ModelBuyMenuEntry( 39, 0, "Thug 2" ),
                ModelBuyMenuEntry( 61, 350, "Soldier" ),
                ModelBuyMenuEntry( 26, 0, "Boat Captain" ),
                ModelBuyMenuEntry( 21, 350, "Paparazzi" ),
            },

			["Civilians"] = {
				ModelBuyMenuEntry( 7, 1250, "City Male 1" ),
				ModelBuyMenuEntry( 35, 1250, "City Male 2" ),
				ModelBuyMenuEntry( 88, 1250, "Male Tourist" ),
				ModelBuyMenuEntry( 4, 1250, "Female Tourist 1" ),
				ModelBuyMenuEntry( 82, 1250, "Female Tourist 2" ),
				ModelBuyMenuEntry( 43, 1250, "Civilian Male Stripper 1" ),
				ModelBuyMenuEntry( 81, 1250, "Civilian Male Stripper 2" ),
				ModelBuyMenuEntry( 53, 1250, "Civilian Female Stripper" ),
				ModelBuyMenuEntry( 92, 1000, "City Female" ),
				ModelBuyMenuEntry( 10, 1000, "Generic Male 1" ),
				ModelBuyMenuEntry( 28, 1000, "Generic Male 2" ),
				ModelBuyMenuEntry( 13, 1000, "Generic Male 3" ),
				ModelBuyMenuEntry( 24, 1000, "Generic Male 4" ),
				ModelBuyMenuEntry( 76, 1000, "Generic Male 5" ),
				ModelBuyMenuEntry( 46, 1000, "Generic Female 1" ),
				ModelBuyMenuEntry( 47, 1000, "Generic Female 2" ),
				ModelBuyMenuEntry( 94, 1000, "Generic Female 3" ),
				ModelBuyMenuEntry( 14, 1000, "Generic Female 4" ),
				ModelBuyMenuEntry( 72, 1000, "Generic Female 5" ),
				ModelBuyMenuEntry( 37, 600, "Generic Religious Male" ),
				ModelBuyMenuEntry( 57, 600, "Oil Platform Male 1" ),
				ModelBuyMenuEntry( 50, 600, "Oil Platform Male 2" ),
				ModelBuyMenuEntry( 56, 600, "Fisher Village Male 1" ),
				ModelBuyMenuEntry( 29, 600, "Fisher Village Male 2" ),
				ModelBuyMenuEntry( 93, 600, "Fisher Village Male 3" ),
				ModelBuyMenuEntry( 68, 600, "Fisher Village Male 4" ),
				ModelBuyMenuEntry( 99, 600, "Desert Village Male" ),
				ModelBuyMenuEntry( 62, 600, "Desert Village Female" ),
				ModelBuyMenuEntry( 75, 600, "Arctic Village Male 1" ),
				ModelBuyMenuEntry( 91, 600, "Arctic Village Male 2" ),
				ModelBuyMenuEntry( 73, 600, "Arctic Village Male 3" ),
				ModelBuyMenuEntry( 41, 600, "Arctic Village Female 1" ),
				ModelBuyMenuEntry( 102, 600, "Arctic Village Female 2" ),
				ModelBuyMenuEntry( 31, 600, "Arctic Village Female 3" )
						    }
        },

        [self.types.Appearance] = {
            { "Head - Hats", "Head - Caps & Helmets", "Head - Coverings", "Hair", "Face", "Neck", "Back" },

            ["Head - Hats"] = {
				AppearanceBuyMenuEntry( "Clear", 0, "Head", "Clear Head" ),
--				AppearanceBuyMenuEntry( "pd_arcticvillage_female2.eez/pd_arcticvillage_female_2-hat_winter.lod", 0, "Head", "Artic Linen Hat", 1 ),
				AppearanceBuyMenuEntry( "pd_arcticvillage_female2.eez/pd_arcticvillage_female_2-hat_winter.lod", 0, "Head", "Artic Linen Hat" ),
				AppearanceBuyMenuEntry( "pd_arcticvillage_male2.eez/pd_arcticvillage_male_2-hat_winter.lod", 0, "Head", "Artic Linen Hat Big" ),
				AppearanceBuyMenuEntry( "pd_generic_male_2.eez/pd_generic_male_2-hat_linen.lod", 0, "Head", "Linen Hat - White" ),
				AppearanceBuyMenuEntry( "pd_generic_male_3.eez/pd_generic_male_3-hat_linen.lod", 0, "Head", "Linen Hat - Speckled" ),
				AppearanceBuyMenuEntry( "pd_generic_female_1.eez/pd_generic_female_1-hat_linen.lod", 0, "Head", "Linen Hat - Black Strip" ),
				AppearanceBuyMenuEntry( "pd_generic_male_1.eez/pd_generic_male_1-hat_linen.lod", 0, "Head", "Linen Hat Big- Dark Stripe" ),
				AppearanceBuyMenuEntry( "pd_generic_female_2.eez/pd_generic_female_2-hat_linen.lod", 0, "Head", "Linen Hat - White Stripe" ),
				AppearanceBuyMenuEntry( "pd_generic_female_5.eez/pd_generic_female_5-hat_cloth.lod", 0, "Head", "Linen Hat - Black & White" ),
				AppearanceBuyMenuEntry( "pd_fishervillage_male1.eez/pd_fishervillage_male-hat_fisherman.lod", 0, "Head", "Fishing Floppy Hat" ),
				AppearanceBuyMenuEntry( "pd_generic_female_1.eez/pd_generic_female_1-hat_fisherman.lod", 0, "Head", "Fishing Floppy Hat Small" ),
				AppearanceBuyMenuEntry( "pd_tourist_male1.eez/pd_tourist_male-fisherhat.lod", 0, "Head", "Fishing Floppy Hat Slanted" ),
				AppearanceBuyMenuEntry( "pd_generic_male_1.eez/pd_generic_male_1-hat_fisherman.lod", 0, "Head", "Fishing Floppy Hat Lower" ),
				AppearanceBuyMenuEntry( "pd_fishervillage_male1.eez/pd_fishervillage_male-ricehat.lod", 0, "Head", "Worker Ricehat Big - Tan" ),
				AppearanceBuyMenuEntry( "pd_generic_female_5.eez/pd_generic_female_5-hat_straw2.lod", 0, "Head", "Worker Ricehat - Tan" ),
				AppearanceBuyMenuEntry( "pd_generic_female.eez/generic_female-ricehat.lod", 0, "Head", "Worker Ricehat Level - Beige" ),
				AppearanceBuyMenuEntry( "pd_generic_female_3.eez/pd_generic_female_3-hat_straw2.lod", 0, "Head", "Worker Ricehat - Beige" ),
				AppearanceBuyMenuEntry( "pd_generic_female_1.eez/pd_generic_female_1-hat_rice.lod", 0, "Head", "Worker Straw Hat" ),
				AppearanceBuyMenuEntry( "pd_generic_male_1.eez/pd_generic_male_1-hat_rice.lod", 0, "Head", "Worker Straw Hat Big" ),
				AppearanceBuyMenuEntry( "pd_generic_female_2.eez/pd_generic_female_2-hat_rice.lod", 0, "Head", "Worker Straw Hat - Yellow" ), 
				AppearanceBuyMenuEntry( "pd_generic_male.eez/pd_generic_male-hat.lod", 0, "Head", "Worker Straw Hat - Light" ),
				AppearanceBuyMenuEntry( "pd_thugs1.eez/pd_thugs-h_bandana.lod", 0, "Head", "Bandana Skullcap - Gray" ),
				AppearanceBuyMenuEntry( "pd_ms_doorman.eez/pd_doorman-h_bandana.lod", 0, "Head", "Bandana Skullcap Worn - Gray" ),
				AppearanceBuyMenuEntry( "pd_generic_male_2.eez/pd_generic_male_2-hat_fedora.lod", 0, "Head", "Fedora - Light Gray" ),
				AppearanceBuyMenuEntry( "pd_ms_strippers_male1.eez/pd_ms_stripper_male-hat.lod", 0, "Head", "Fedora Slanted" ),
				AppearanceBuyMenuEntry( "pd_ms_thugboss.eez/pd_executioner-h_felthat.lod", 0, "Head", "Felt Fedora Slanted - Gray" ),
				AppearanceBuyMenuEntry( "pd_roacheselite1.eez/pd_roaches_elite-h_headwear.lod", 0, "Head", "Roaches Elite Turban" ),
				AppearanceBuyMenuEntry( "pd_generic_female_2.eez/pd_generic_female_2-hat_towel.lod", 0, "Head", "Cloth Turban" ),
            },
			
            ["Head - Caps & Helmets"] = {
				AppearanceBuyMenuEntry( "Clear", 0, "Head", "Clear Head" ),
				AppearanceBuyMenuEntry( "pd_tourist_male1.eez/pd_tourist_male-keps.lod", 0, "Head", "Keppy Hat" ),
				AppearanceBuyMenuEntry( "pd_arcticvillage_male1.eez/pd_arcticvillage_male-hat.lod", 0, "Head", "Artic Hat" ),
				AppearanceBuyMenuEntry( "pd_generic_male_2.eez/pd_generic_male_2-hat_weird.lod", 0, "Head", "Ancient Crown" ),
				AppearanceBuyMenuEntry( "pd_ms_strippers_male2.eez/pd_ms_stripper_male-cowboyhat.lod", 0, "Head", "Cowboy Hat" ),
				AppearanceBuyMenuEntry( "pd_oilplatform_male1.eez/pd_oilplatform-greycap.lod", 0, "Head", "Oilrig Worker Beanie Cap - Gray" ),
				AppearanceBuyMenuEntry( "pd_oilplatform_male1.eez/pd_oilplatform-helmet.lod", 0, "Head", "Oilrig Worker Hardhat - Yellow" ),
				AppearanceBuyMenuEntry( "pd_ms_strippers_female1.eez/pd_stripper_female-ht_militarycap.lod", 0, "Head", "Military Commander Cap" ),
				AppearanceBuyMenuEntry( "pd_reaperselite1.eez/pd_reapers_elite_male-cap.lod", 0, "Head", "Reapers Elite Cap" ),
				AppearanceBuyMenuEntry( "pd_ms_japaneseveterans.eez/pd_ms_japaneseveterans-hat.lod", 0, "Head", "Japanese Cap" ),
				AppearanceBuyMenuEntry( "pd_ms_japaneseveterans.eez/pd_ms_japaneseveterans-helmet.lod", 0, "Head", "Japanese Helmet" ),
				AppearanceBuyMenuEntry( "pd_gov_base01.eez/pd_gov_base-hat.lod", 0, "Head", "Panau Police Hat" ),
				AppearanceBuyMenuEntry( "pd_panaupolice.eez/panaupolice-cap.lod", 0, "Head", "Panau Police Cap" ),
				AppearanceBuyMenuEntry( "pd_panaupolice.eez/panaupolice-helmet.lod", 0, "Head", "Panau Police Helmet" ),
				AppearanceBuyMenuEntry( "pd_panaupolice.eez/panaupolice-turban.lod", 0, "Head", "Panau Police Turban" ),
				AppearanceBuyMenuEntry( "pd_gov_elite.eez/pd_govnewfix_elite-helmet.lod", 0, "Head", "Government Elite Helmet" ),
				AppearanceBuyMenuEntry( "pd_gov_base01.eez/pd_gov_base-beret.lod", 0, "Head", "Government Elite Beret" ),
				AppearanceBuyMenuEntry( "pd_reaperselite1.eez/pd_reapers_elite_male-beret.lod", 0, "Head", "Reapers Elite Beret" ),
				AppearanceBuyMenuEntry( "pd_roacheselite1.eez/pd_roaches_elite-h_bandana.lod", 0, "Head", "Roaches Elite Beret" ),
            },
			
            ["Head - Coverings"] = {
				AppearanceBuyMenuEntry( "Clear", 0, "Covering", "Clear Covering" ),
				AppearanceBuyMenuEntry( "pd_arcticvillage_female1.eez/pd_arcticvillage_female-headcloth.lod", 0, "Covering", "Headcloth - Black" ),
				AppearanceBuyMenuEntry( "pd_arcticvillage_female1.eez/pd_arcticvillage_female-headcloth2.lod", 0, "Covering", "Headcloth - White & Dark" ),
				AppearanceBuyMenuEntry( "pd_desertvillage_female1.eez/pd_desertvillage_female-shawl.lod", 0, "Covering", "Headcloth - White" ), 
				AppearanceBuyMenuEntry( "pd_desertvillage_male1.eez/pd_desertvillage_male-turban.lod", 0, "Covering", "Headcloth & Turban" ),
				AppearanceBuyMenuEntry( "pd_generic_female.eez/generic_female-shawl.lod", 0, "Covering", "Headcloth Beige" ), 
				AppearanceBuyMenuEntry( "pd_generic_female_3.eez/pd_generic_female_3-hat_scarf.lod", 0, "Covering", "Bonnet - Light" ), 
				AppearanceBuyMenuEntry( "pd_generic_female_5.eez/pd_generic_female_5-hat_scarf.lod", 0, "Covering", "Bonnet - Dark" ),
            },

            ["Hair"] = {
				AppearanceBuyMenuEntry( "Clear", 0, "Hair", "Clear Hair" ),
				AppearanceBuyMenuEntry( "pd_tourist_female2.eez/pd_tourist_female-h_hair.lod", 0, "Hair", "Medium - Black" ),
				AppearanceBuyMenuEntry( "pd_ms_strippers_female1.eez/pd_stripper_female-h_hair1.lod", 0, "Hair", "Medium - Gray" ),
				AppearanceBuyMenuEntry( "pd_ms_strippers_female1.eez/pd_stripper_female-h_hair2.lod", 0, "Hair", "Short - Orange" ),
            },

            ["Face"] = {
				AppearanceBuyMenuEntry( "Clear", 0, "Face", "Clear Face" ),
				AppearanceBuyMenuEntry( "pd_ms_strippers_female1.eez/pd_stripper_female-a_sunglasses.lod", 0, "Face", "Round Sunglasses" ),
				AppearanceBuyMenuEntry( "pd_ularboyselite1.eez/pd_ularboys_elite_male-glasses.lod", 0, "Face", "Opaque Sunglasses - Dark" ),
				AppearanceBuyMenuEntry( "pd_blackhand.eez/pd_blackhand-glasses.lod", 0, "Face", "Opaque Sunglasses - Light" ),
				AppearanceBuyMenuEntry( "pd_ms_scientist_male.eez/pd_ms_scientists-glasses.lod", 0, "Face", "Clear Scientist Glasses" ),
				AppearanceBuyMenuEntry( "pd_thugs1.eez/pd_thugs-o_glasses.lod", 0, "Face", "Wide Sunglasses" ),
				AppearanceBuyMenuEntry( "pd_tourist_male1.eez/pd_tourist_male-sunglasses.lod", 0, "Face", "Dark Tourist Sunglasses" ),
            },

            ["Neck"] = {
				AppearanceBuyMenuEntry( "Neck", 0, "Neck", "Clear Neck" ),
				AppearanceBuyMenuEntry( "pd_ms_civ_strippers_male2.eez/pd_civilian_stripper_male-cowboyscarf.lod", 0, "Neck", "Red Scarf" ),
				AppearanceBuyMenuEntry( "pd_ms_strippers_male2.eez/pd_ms_stripper_male-cowboyscarf.lod", 0, "Neck", "Cowboy Scarf" ),
				AppearanceBuyMenuEntry( "pd_blackmarket.eez/pd_blackmarket-scarf.lod", 0, "Neck", "Blackmarket Scarf" ),
            },

            ["Back"] = {
				AppearanceBuyMenuEntry( "Clear", 0, "Back", "Clear Back" ),
				AppearanceBuyMenuEntry( "pd_ularboysbase1.eez/pd_ularboys_base_male-backpack.lod", 0, "Back", "Backpack" ),
				AppearanceBuyMenuEntry( "pd_gov_base02.eez/pd_gov_base-bags.lod", 0, "Back", "Spec Ops Backpack" ),
				AppearanceBuyMenuEntry( "pd_gov_elite.eez/pd_govnewfix_elite-vest1.lod", 0, "Back", "Ballistic Vest 1" ),
				AppearanceBuyMenuEntry( "pd_gov_elite.eez/pd_govnewfix_elite-vest2.lod", 0, "Back", "Ballistic Vest 2" ),
				AppearanceBuyMenuEntry( "pd_ularboysbase1.eez/pd_ularboys_base_male-ammopouch.lod", 0, "Back", "Ammo Pouch" ),
				AppearanceBuyMenuEntry( "pd_ularboysbase1.eez/pd_ularboys_base_male-waterbottle.lod", 0, "Back", "Military Water Bottle" ),
            }
        }
    }
end
