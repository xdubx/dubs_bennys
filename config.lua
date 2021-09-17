Config = {}
Config.DrawDistance = 100.0
Config.Locale = 'en'

Config.Zones = {
    ls1 = {
        Pos = {x = -211.427, y = -1323.703, z = 30.790},
        Size = {x = 3.0, y = 3.0, z = 0.2},
        Color = {r = 204, g = 204, b = 0},
        Marker = 1,
        Name = "Bennys Customs",
        Hint = _U('press_custom')
    }
}

local BasicColors = {
    {name = "Black", colorindex = 0}, {name = "Carbon Black", colorindex = 147},
    {name = "Hraphite", colorindex = 1},
    {name = "Anhracite Black", colorindex = 11},
    {name = "Black Steel", colorindex = 2},
    {name = "Dark Steel", colorindex = 3}, {name = "Silver", colorindex = 4},
    {name = "Bluish Silver", colorindex = 5},
    {name = "Rolled Steel", colorindex = 6},
    {name = "Shadow Silver", colorindex = 7},
    {name = "Stone Silver", colorindex = 8},
    {name = "Midnight Silver", colorindex = 9},
    {name = "Cast Iron Silver", colorindex = 10},
    {name = "Red", colorindex = 27}, {name = "Torino Red", colorindex = 28},
    {name = "Formula Red", colorindex = 29},
    {name = "Lava Red", colorindex = 150},
    {name = "Blaze Red", colorindex = 30},
    {name = "Grace Red", colorindex = 31},
    {name = "Garnet Red", colorindex = 32},
    {name = "Sunset Red", colorindex = 33},
    {name = "Cabernet Red", colorindex = 34},
    {name = "Wine Red", colorindex = 143},
    {name = "Candy Red", colorindex = 35},
    {name = "Hot Pink", colorindex = 135},
    {name = "Pfsiter Pink", colorindex = 137},
    {name = "Salmon Pink", colorindex = 136},
    {name = "Sunrise Orange", colorindex = 36},
    {name = "Orange", colorindex = 38},
    {name = "Bright Orange", colorindex = 138},
    {name = "Gold", colorindex = 99}, {name = "Bronze", colorindex = 90},
    {name = "Yellow", colorindex = 88}, {name = "Race Yellow", colorindex = 89},
    {name = "Dew Yellow", colorindex = 91},
    {name = "Dark Green", colorindex = 49},
    {name = "Racing Green", colorindex = 50},
    {name = "Sea Green", colorindex = 51},
    {name = "Olive Green", colorindex = 52},
    {name = "Bright Green", colorindex = 53},
    {name = "Gasoline Green", colorindex = 54},
    {name = "Lime Green", colorindex = 92},
    {name = "Midnight Blue", colorindex = 141},
    {name = "Galaxy Blue", colorindex = 61},
    {name = "Dark Blue", colorindex = 62},
    {name = "Saxon Blue", colorindex = 63}, {name = "Blue", colorindex = 64},
    {name = "Mariner Blue", colorindex = 65},
    {name = "Harbor Blue", colorindex = 66},
    {name = "Diamond Blue", colorindex = 67},
    {name = "Surf Blue", colorindex = 68},
    {name = "Nautical Blue", colorindex = 69},
    {name = "Racing Blue", colorindex = 73},
    {name = "Ultra Blue", colorindex = 70},
    {name = "Light Blue", colorindex = 74},
    {name = "Chocolate Brown", colorindex = 96},
    {name = "Bison Brown", colorindex = 101},
    {name = "Creeen Brown", colorindex = 95},
    {name = "Feltzer Brown", colorindex = 94},
    {name = "Maple Brown", colorindex = 97},
    {name = "Beechwood Brown", colorindex = 103},
    {name = "Sienna Brown", colorindex = 104},
    {name = "Saddle Brown", colorindex = 98},
    {name = "Moss Brown", colorindex = 100},
    {name = "Woodbeech Brown", colorindex = 102},
    {name = "Straw Brown", colorindex = 99},
    {name = "Sandy Brown", colorindex = 105},
    {name = "Bleached Brown", colorindex = 106},
    {name = "Schafter Purple", colorindex = 71},
    {name = "Spinnaker Purple", colorindex = 72},
    {name = "Midnight Purple", colorindex = 142},
    {name = "Bright Purple", colorindex = 145},
    {name = "Cream", colorindex = 107}, {name = "Ice White", colorindex = 111},
    {name = "Frost White", colorindex = 112}
}

Config.allow = {Armor = true}

Config.prices = {

    Armor = {
        Data = {
            {name = "Armor Upgrade 20%", modtype = 16, mod = 0, price = 2500},
            {name = "Armor Upgrade 40%", modtype = 16, mod = 1, price = 5000},
            {name = "Armor Upgrade 60%", modtype = 16, mod = 2, price = 7500},
            {name = "Armor Upgrade 80%", modtype = 16, mod = 3, price = 10000},
            {name = "Armor Upgrade 100%", modtype = 16, mod = 4, price = 12500}
        },
        modIndex = 16
    },

    Brakes = {
        Data = {
            {name = "Street Brakes", mod = 0, price = 6500},
            {name = "Sport Brakes", mod = 1, price = 8775},
            {name = "Race Brakes", mod = 2, price = 11375}
        },
        modIndex = 12
    },

    RearBumpers = {startprice = 2500, increaseby = 500, modIndex = 2},

    FrontBumpers = {startprice = 2500, increaseby = 500, modIndex = 1},

    Chassis = {
        ArchCover = {startprice = 5000, increaseby = 1250, modIndex = 42},
        Aerials = {startprice = 5000, increaseby = 1250, modIndex = 43},
        Roof = { -- as trim
            startprice = 5000,
            increaseby = 1250,
            modIndex = 44
        },
        Tank = {startprice = 5000, increaseby = 1250, modIndex = 45}

    },
    Engine = {
        EngineTune = {
            Data = {
                {name = "EMS Upgrade, Level 2", mod = 0, price = 4500},
                {name = "EMS Upgrade, Level 3", mod = 1, price = 8000},
                {name = "EMS Upgrade, Level 4", mod = 2, price = 10500}
            },
            modIndex = 11

        },

        EngineBlock = {startprice = 5000, increaseby = 1250, modIndex = 39},
        Airfilter = {startprice = 5000, increaseby = 1250, modIndex = 40},
        Struts = {startprice = 5000, increaseby = 1250, modIndex = 41}
    },

    Grille = {startprice = 1250, increaseby = 400, modIndex = 6},

    Exhaust = {startprice = 1000, increaseby = 400, modIndex = 4},

    Hood = {startprice = 1500, increaseby = 400, modIndex = 7},

    Fender = {startprice = 1500, increaseby = 400, modIndex = 8},

    Horn = {
        Data = {
            {name = "Truck Horn", mod = 0, price = 1625},
            {name = "Police Horn", mod = 1, price = 4062},
            {name = "Clown Horn", mod = 2, price = 6500},
            {name = "Musical Horn 1", mod = 3, price = 11375},
            {name = "Musical Horn 2", mod = 4, price = 11375},
            {name = "Musical Horn 3", mod = 5, price = 11375},
            {name = "Musical Horn 4", mod = 6, price = 11375},
            {name = "Musical Horn 5", mod = 7, price = 11375},
            {name = "Sadtrombone Horn", mod = 8, price = 11375},
            {name = "Calssical Horn 1", mod = 9, price = 11375},
            {name = "Calssical Horn 2", mod = 10, price = 11375},
            {name = "Calssical Horn 3", mod = 11, price = 11375},
            {name = "Calssical Horn 4", mod = 12, price = 11375},
            {name = "Calssical Horn 5", mod = 13, price = 11375},
            {name = "Calssical Horn 6", mod = 14, price = 11375},
            {name = "Calssical Horn 7", mod = 15, price = 11375},
            {name = "Scaledo Horn", mod = 16, price = 11375},
            {name = "Scalere Horn", mod = 17, price = 11375},
            {name = "Scalemi Horn", mod = 18, price = 11375},
            {name = "Scalefa Horn", mod = 19, price = 11375},
            {name = "Scalesol Horn", mod = 20, price = 11375},
            {name = "Scalela Horn", mod = 21, price = 11375},
            {name = "Scaleti Horn", mod = 22, price = 11375},
            {name = "Scaledo Horn High", mod = 23, price = 11375},
            {name = "Jazz Horn 1", mod = 25, price = 11375},
            {name = "Jazz Horn 2", mod = 26, price = 11375},
            {name = "Jazz Horn 3", mod = 27, price = 11375},
            {name = "Jazzloop Horn", mod = 28, price = 11375},
            {name = "Starspangban Horn 1", mod = 29, price = 11375},
            {name = "Starspangban Horn 2", mod = 30, price = 11375},
            {name = "Starspangban Horn 3", mod = 31, price = 11375},
            {name = "Starspangban Horn 4", mod = 32, price = 11375},
            {name = "Classicalloop Horn 1", mod = 33, price = 11375},
            {name = "Classicalloop Horn 2", mod = 34, price = 11375},
            {name = "Classicalloop Horn 3", mod = 35, price = 11375}
        },
        modIndex = 14
    },

    Hydraulics = {startprice = 15000, increaseby = 2500, modIndex = 38},
    Interior = {
        Trim = {startprice = 5000, increaseby = 1250, modIndex = 27},
        Ornaments = {startprice = 5000, increaseby = 1250, modIndex = 28},
        Dashboard = {startprice = 5000, increaseby = 1250, modIndex = 29},
        Dial = {startprice = 5000, increaseby = 1250, modIndex = 30},
        Doors = {startprice = 5000, increaseby = 1250, modIndex = 31},
        Seats = {startprice = 5000, increaseby = 1250, modIndex = 32},
        SteeringWheels = {startprice = 5000, increaseby = 1250, modIndex = 33},
        ShiftLeavers = {startprice = 5000, increaseby = 1250, modIndex = 34},
        Plaques = {startprice = 5000, increaseby = 1250, modIndex = 35},
        Speakers = {startprice = 5000, increaseby = 1250, modIndex = 36},
        LightColor = {
            -- todo
        },
        RollCage = {startprice = 1250, increaseby = 400, modIndex = 5}
    },
    Lights = {
        Headlights = {
            Data = {
                {name = "Stock Lights", mod = 0, price = 0},
                {name = "Xenon Lights", mod = 1, price = 1625}
            },
            modIndex = 22
        },
        Neonlayout = {
            Data = {
                {name = "Front", price = 5000}, {name = "Back", price = 5000},
                {name = "Sides", price = 5000},
                {name = "Front,Back and Sides", price = 5000}
            },
            modIndex = "neon_layout"
            -- todo fix price and modindex
        },
        -- Neon color
        Neoncolor = {
            Data = {
                {name = "White", neon = {255, 255, 255}, price = 1000},
                {name = "Blue", neon = {0, 0, 255}, price = 1000},
                {name = "Electric Blue", neon = {0, 150, 255}, price = 1000},
                {name = "Mint Green", neon = {50, 255, 155}, price = 1000},
                {name = "Lime Green", neon = {0, 255, 0}, price = 1000},
                {name = "Yellow", neon = {255, 255, 0}, price = 1000},
                {name = "Golden Shower", neon = {204, 204, 0}, price = 1000},
                {name = "Orange", neon = {255, 128, 0}, price = 1000},
                {name = "Red", neon = {255, 0, 0}, price = 1000},
                {name = "Pony Pink", neon = {255, 102, 255}, price = 1000},
                {name = "Hot Pink", neon = {255, 0, 255}, price = 1000},
                {name = "Purple", neon = {153, 0, 153}, price = 1000},
                {name = "Brown", neon = {139, 69, 19}, price = 1000}
            },
            modIndex = "neonColor"
            -- todo add more colors
        }
    },
    -- Livery
    Plates = {
        PlateHolder = {startprice = 5000, increaseby = 1250, modIndex = 25},
        VanityPlates = {startprice = 5000, increaseby = 1250, modIndex = 26},
        PlatesVariants = {
            Data = {
                {name = "Blue on White 1", plateindex = 0, price = 200},
                {name = "Blue On White 2", plateindex = 3, price = 200},
                {name = "Blue On White 3", plateindex = 4, price = 200},
                {name = "Yellow on Blue", plateindex = 2, price = 300},
                {name = "Yellow on Black", plateindex = 1, price = 600}
            },
            modIndex = "plates"
        }
    },

    Respray = {
        Chrome = {Colors = {{name = "Chrome", colorindex = 120}}, Price = 1000},
        Classic = {Colors = BasicColors, Price = 200},
        Matt = {
            Colors = {
                {name = "Black", colorindex = 12},
                {name = "Gray", colorindex = 13},
                {name = "Light Gray", colorindex = 14},
                {name = "Ice White", colorindex = 131},
                {name = "Blue", colorindex = 83},
                {name = "Dark Blue", colorindex = 82},
                {name = "Midnight Blue", colorindex = 84},
                {name = "Midnight Purple", colorindex = 149},
                {name = "Schafter Purple", colorindex = 148},
                {name = "Red", colorindex = 39},
                {name = "Dark Red", colorindex = 40},
                {name = "Orange", colorindex = 41},
                {name = "Yellow", colorindex = 42},
                {name = "Lime Green", colorindex = 55},
                {name = "Green", colorindex = 128},
                {name = "Frost Green", colorindex = 151},
                {name = "Foliage Green", colorindex = 155},
                {name = "Olive Darb", colorindex = 152},
                {name = "Dark Earth", colorindex = 153},
                {name = "Desert Tan", colorindex = 154}
            },
            Price = 500
        },
        Metallic = {Colors = BasicColors, Price = 300},
        Metal = {
            Colors = {
                {name = "Brushed Steel", colorindex = 117},
                {name = "Brushed Black Steel", colorindex = 118},
                {name = "Brushed Aluminum", colorindex = 119},
                {name = "Pure Gold", colorindex = 158},
                {name = "Brushed Gold", colorindex = 159}
            },
            Price = 300
        },
        Pearl = {
            Colors = {
                -- todo
            },
            Price = 500
        }
    },

    Roof = {startprice = 1250, increaseby = 400, modIndex = 10},

    Skirts = {startprice = 1250, increaseby = 400, modIndex = 3},
    Spoiler = {startprice = 2500, increaseby = 400, modIndex = 0},
    Suspension = {
        Data = {
            {name = "Lowered Suspension", mod = 0, price = 1000},
            {name = "Street Suspension", mod = 1, price = 2000},
            {name = "Sport Suspension", mod = 2, price = 3500},
            {name = "Competition Suspension", mod = 3, price = 4000}
        },
        modIndex = 15
    },
    Transmission = {
        Data = {
            {name = "Street Transmission", mod = 0, price = 10000},
            {name = "Sports Transmission", mod = 1, price = 12500},
            {name = "Race Transmission", mod = 2, price = 15000}
        },
        modIndex = 13
    },
    Trunk = {startprice = 5000, increaseby = 1250, modIndex = 37},
    Turbo = {
        Data = {
            {name = "None", mod = 0, price = 0},
            {name = "Turbo Tuning", mod = 1, price = 15000}
        },
        modIndex = 18
    },
    Wheels = {
        Sportwheels = {
            Data = {
                {name = "Stock", wtype = 0, mod = -1, price = 1000},
                {name = "Inferno", wtype = 0, mod = 0, price = 1000},
                {name = "Deepfive", wtype = 0, mod = 1, price = 1000},
                {name = "Lozspeed", wtype = 0, mod = 2, price = 1000},
                {name = "Diamondcut", wtype = 0, mod = 3, price = 1000},
                {name = "Chrono", wtype = 0, mod = 4, price = 1000},
                {name = "Feroccirr", wtype = 0, mod = 5, price = 1000},
                {name = "Fiftynine", wtype = 0, mod = 6, price = 1000},
                {name = "Mercie", wtype = 0, mod = 7, price = 1000},
                {name = "Syntheticz", wtype = 0, mod = 8, price = 1000},
                {name = "Organictyped", wtype = 0, mod = 9, price = 1000},
                {name = "Endov1", wtype = 0, mod = 10, price = 1000},
                {name = "Duper7", wtype = 0, mod = 11, price = 1000},
                {name = "Uzer", wtype = 0, mod = 12, price = 1000},
                {name = "Groundride", wtype = 0, mod = 13, price = 1000},
                {name = "Spacer", wtype = 0, mod = 14, price = 1000},
                {name = "Venum", wtype = 0, mod = 15, price = 1000},
                {name = "Cosmo", wtype = 0, mod = 16, price = 1000},
                {name = "Dashvip", wtype = 0, mod = 17, price = 1000},
                {name = "Icekid", wtype = 0, mod = 18, price = 1000},
                {name = "Ruffeld", wtype = 0, mod = 19, price = 1000},
                {name = "Wangenmaster", wtype = 0, mod = 20, price = 1000},
                {name = "Superfive", wtype = 0, mod = 21, price = 1000},
                {name = "Endov2", wtype = 0, mod = 22, price = 1000},
                {name = "Slitsix", wtype = 0, mod = 23, price = 1000}
            },
            modIndex = "Sportwheels"
        },
        Muscle = {
            Data = {
                {name = "Stock", wtype = 1, mod = -1, price = 1000},
                {name = "Classicfive", wtype = 1, mod = 0, price = 1000},
                {name = "Dukes", wtype = 1, mod = 1, price = 1000},
                {name = "Musclefreak", wtype = 1, mod = 2, price = 1000},
                {name = "Kracka", wtype = 1, mod = 3, price = 1000},
                {name = "Azrea", wtype = 1, mod = 4, price = 1000},
                {name = "Mecha", wtype = 1, mod = 5, price = 1000},
                {name = "Blacktop", wtype = 1, mod = 6, price = 1000},
                {name = "Dragspl", wtype = 1, mod = 7, price = 1000},
                {name = "Revolver", wtype = 1, mod = 8, price = 1000},
                {name = "Classicrod", wtype = 1, mod = 9, price = 1000},
                {name = "Spooner", wtype = 1, mod = 10, price = 1000},
                {name = "Fivestar", wtype = 1, mod = 11, price = 1000},
                {name = "Oldschool", wtype = 1, mod = 12, price = 1000},
                {name = "Eljefe", wtype = 1, mod = 13, price = 1000},
                {name = "Dodman", wtype = 1, mod = 14, price = 1000},
                {name = "Sixgun", wtype = 1, mod = 15, price = 1000},
                {name = "Mercenary", wtype = 1, mod = 16, price = 1000}
            },
            modIndex = "Muscle"
        },
        Lowrider = {
            Data = {
                {name = "Stock", wtype = 2, mod = -1, price = 1000},
                {name = "Flare", wtype = 2, mod = 0, price = 1000},
                {name = "Wired", wtype = 2, mod = 1, price = 1000},
                {name = "Triplegolds", wtype = 2, mod = 2, price = 1000},
                {name = "Bigworm", wtype = 2, mod = 3, price = 1000},
                {name = "Sevenfives", wtype = 2, mod = 4, price = 1000},
                {name = "Splitsix", wtype = 2, mod = 5, price = 1000},
                {name = "Freshmesh", wtype = 2, mod = 6, price = 1000},
                {name = "Leadsled", wtype = 2, mod = 7, price = 1000},
                {name = "Turbine", wtype = 2, mod = 8, price = 1000},
                {name = "Superfin", wtype = 2, mod = 9, price = 1000},
                {name = "Classicrod", wtype = 2, mod = 10, price = 1000},
                {name = "Dollar", wtype = 2, mod = 11, price = 1000},
                {name = "Dukes", wtype = 2, mod = 12, price = 1000},
                {name = "Lowfive", wtype = 2, mod = 13, price = 1000},
                {name = "Gooch", wtype = 2, mod = 14, price = 1000}
            },
            modIndex = "Lowrider"
        },
        Suv = {
            Data = {
                {name = "Stock", wtype = 3, mod = -1, price = 1000},
                {name = "Vip", wtype = 3, mod = 0, price = 1000},
                {name = "Benefactor", wtype = 3, mod = 1, price = 1000},
                {name = "Cosmo", wtype = 3, mod = 2, price = 1000},
                {name = "Bippu", wtype = 3, mod = 3, price = 1000},
                {name = "Royalsix", wtype = 3, mod = 4, price = 1000},
                {name = "Fagorme", wtype = 3, mod = 5, price = 1000},
                {name = "Deluxe", wtype = 3, mod = 6, price = 1000},
                {name = "Icedout", wtype = 3, mod = 7, price = 1000},
                {name = "Cognscenti", wtype = 3, mod = 8, price = 1000},
                {name = "Lozspeedten", wtype = 3, mod = 9, price = 1000},
                {name = "Supernova", wtype = 3, mod = 10, price = 1000},
                {name = "Obeyrs", wtype = 3, mod = 11, price = 1000},
                {name = "Lozspeedballer", wtype = 3, mod = 12, price = 1000},
                {name = "Extra vaganzo", wtype = 3, mod = 13, price = 1000},
                {name = "Splitsix", wtype = 3, mod = 14, price = 1000},
                {name = "Empowered", wtype = 3, mod = 15, price = 1000},
                {name = "Sunrise", wtype = 3, mod = 16, price = 1000},
                {name = "Dashvip", wtype = 3, mod = 17, price = 1000},
                {name = "Cutter", wtype = 3, mod = 18, price = 1000}
            },
            modIndex = "Suv"

        },
        Offroad = {
            Data = {
                {name = "Stock", wtype = 4, mod = -1, price = 1000},
                {name = "Raider", wtype = 4, mod = 0, price = 1000}, {
                    name = "Mudslinger",
                    wtype = 4,
                    modtype = 23,
                    wtype = 4,
                    mod = 1,
                    price = 1000
                }, {name = "Nevis", wtype = 4, mod = 2, price = 1000},
                {name = "Cairngorm", wtype = 4, mod = 3, price = 1000},
                {name = "Amazon", wtype = 4, mod = 4, price = 1000},
                {name = "Challenger", wtype = 4, mod = 5, price = 1000},
                {name = "Dunebasher", wtype = 4, mod = 6, price = 1000},
                {name = "Fivestar", wtype = 4, mod = 7, price = 1000},
                {name = "Rockcrawler", wtype = 4, mod = 8, price = 1000},
                {name = "Milspecsteelie", wtype = 4, mod = 9, price = 1000}
            },
            modIndex = "Offroad"

        },
        Tuner = {
            Data = {
                {name = "Stock", wtype = 5, mod = -1, price = 1000},
                {name = "Cosmo", wtype = 5, mod = 0, price = 1000},
                {name = "Supermesh", wtype = 5, mod = 1, price = 1000},
                {name = "Outsider", wtype = 5, mod = 2, price = 1000},
                {name = "Rollas", wtype = 5, mod = 3, price = 1000},
                {name = "Driffmeister", wtype = 5, mod = 4, price = 1000},
                {name = "Slicer", wtype = 5, mod = 5, price = 1000},
                {name = "Elquatro", wtype = 5, mod = 6, price = 1000},
                {name = "Dubbed", wtype = 5, mod = 7, price = 1000},
                {name = "Fivestar", wtype = 5, mod = 8, price = 1000},
                {name = "Slideways", wtype = 5, mod = 9, price = 1000},
                {name = "Apex", wtype = 5, mod = 10, price = 1000},
                {name = "Stancedeg", wtype = 5, mod = 11, price = 1000},
                {name = "Countersteer", wtype = 5, mod = 12, price = 1000},
                {name = "Endov1", wtype = 5, mod = 13, price = 1000},
                {name = "Endov2dish", wtype = 5, mod = 14, price = 1000},
                {name = "Guppez", wtype = 5, mod = 15, price = 1000},
                {name = "Chokadori", wtype = 5, mod = 16, price = 1000},
                {name = "Chicane", wtype = 5, mod = 17, price = 1000},
                {name = "Saisoku", wtype = 5, mod = 18, price = 1000},
                {name = "Dishedeight", wtype = 5, mod = 19, price = 1000},
                {name = "Fujiwara", wtype = 5, mod = 20, price = 1000},
                {name = "Zokusha", wtype = 5, mod = 21, price = 1000},
                {name = "Battlevill", wtype = 5, mod = 22, price = 1000},
                {name = "Rallymaster", wtype = 5, mod = 23, price = 1000}
            },
            modIndex = "Tuner"
        },
        Highend = {
            Data = {
                {name = "Stock", wtype = 7, mod = -1, price = 1000},
                {name = "Shadow", wtype = 7, mod = 0, price = 1000},
                {name = "Hyper", wtype = 7, mod = 1, price = 1000},
                {name = "Blade", wtype = 7, mod = 2, price = 1000},
                {name = "Diamond", wtype = 7, mod = 3, price = 1000},
                {name = "Supagee", wtype = 7, mod = 4, price = 1000},
                {name = "Chromaticz", wtype = 7, mod = 5, price = 1000},
                {name = "Merciechlip", wtype = 7, mod = 6, price = 1000},
                {name = "Obeyrs", wtype = 7, mod = 7, price = 1000},
                {name = "Gtchrome", wtype = 7, mod = 8, price = 1000},
                {name = "Cheetahr", wtype = 7, mod = 9, price = 1000},
                {name = "Solar", wtype = 7, mod = 10, price = 1000},
                {name = "Splitten", wtype = 7, mod = 11, price = 1000},
                {name = "Dashvip", wtype = 7, mod = 12, price = 1000},
                {name = "Lozspeedten", wtype = 7, mod = 13, price = 1000},
                {name = "Carboninferno", wtype = 7, mod = 14, price = 1000},
                {name = "Carbonshadow", wtype = 7, mod = 15, price = 1000},
                {name = "Carbonz", wtype = 7, mod = 16, price = 1000},
                {name = "Carbonsolar", wtype = 7, mod = 17, price = 1000},
                {name = "Carboncheetahr", wtype = 7, mod = 18, price = 1000},
                {name = "Carbonsracer", wtype = 7, mod = 19, price = 1000}
            },
            modIndex = "Tuner"
        },
        Color = {Colors = BasicColors, Price = 1000}
    },
    Window = {
        Data = {
            {name = "None", tint = 0, price = 0},
            {name = "Pure Black", tint = 1, price = 1000},
            {name = "Darksmoke", tint = 2, price = 1000},
            {name = "Lightsmoke", tint = 3, price = 1000},
            {name = "Limo", tint = 4, price = 1000},
            {name = "Green", tint = 5, price = 1000}
        },
        modIndex = 46
    },
    Tire = {
        Smoke = {
            Data ={
                {name = "White Smoke", r = 254, g = 254, b = 254, price = 3000},
                {name = "Black Smoke", r = 1, g = 1, b = 1, price = 3000},
                {name = "Blue Smoke", r = 0, g = 150, b = 255, price = 3000},
                {name = "Yellow Smoke", r = 255, g = 255, b = 50, price = 3000},
                {name = "Orange Smoke", r = 255, g = 153, b = 51, price = 3000},
                {name = "Red Smoke", r = 255, g = 10, b = 10, price = 3000},
                {name = "Green Smoke", r = 10, g = 255, b = 10, price = 3000},
                {name = "Purple Smoke", r = 153, g = 10, b = 153, price = 3000},
                {name = "Pink Smoke", r = 255, g = 102, b = 178, price = 3000},
                {name = "Gray Smoke", r = 128, g = 128, b = 128, price = 3000}      
            },
        modIndex = 46
        }

    }

}
