Config = {}

Config.locationsConfig = {
	['247supermarket'] = {
		['Zones'] = {
			['coords'] = vector3(29.11, -1345.5, 29.34),
			['length'] = 7,
            ['heading'] = 0,
			['width'] = 13,
			['minZ'] = 28.09,
			['maxZ'] = 32.09,
		},
		['Inside'] = {
			['rek'] = {
				['coords'] = vector3(28.10, -1345.28, 29.5),
				['label'] = 'Neem drinken...',
				['events'] = 'vyz-shops:client:Opemenu',
				['args'] = 'drinken',
				['length'] = 2,
                ['heading'] = 90,
				['width'] = 1,
				['minZ'] = 28.09,
				['maxZ'] = 32.09,
			},
            ['rek2'] = {
				['coords'] = vector3(30.89, -1345.26, 29.5),
				['label'] = 'Neem eten...',
				['events'] = 'vyz-shops:client:Opemenu',
				['args'] = 'eten',
                ['heading'] = 90,
				['length'] = 2,
				['width'] = 1,
				['minZ'] = 28.09,
				['maxZ'] = 32.09,
			},
            ['koelkast'] = {
				['coords'] = vector3(34.61, -1346.81, 29.5),
				['label'] = 'Neem alcohol...',
				['events'] = 'vyz-shops:client:Opemenu',
				['args'] = 'alcohol',
				['length'] = 1.2,
                ['width'] = 5,
                ['heading'] = 0,
				['minZ'] = 26.9,
				['maxZ'] = 30.9,
			},
            ['koffieApperaat'] = { -- TODO: Dit kan nog weg gehaald worden omdat sommige server dit al hebben
				['coords'] = vector3(24.13, -1342.42, 29.5),
				['label'] = 'Neem koffie...',
				['events'] = 'vyz-shops:client:Opemenu',
				['args'] = 'koffie',
				['length'] = 0.7,
                ['heading'] = 90,
				['width'] = 0.3,
				['minZ'] = 26.3,
				['maxZ'] = 30.3,
			},
            ['kassa'] = {
                    ['coords'] = vector3(25.02, -1344.94, 29.5),
                    ['length'] = 0.7,
                    ['width'] = 0.5,
                    ['label'] = 'afrekenen...',
                    ['events'] = 'vyz-shops:client:Openkassa',
                    ['args'] = 'iets',
                    ['minZ'] = 29.3,
                    ['maxZ'] = 29.9
            },
		}
	},
    ['BigBank247supermarket'] = {
		['Zones'] = {
			['coords'] = vector3(377.53, 327.12, 103.57),
            ['heading'] = 345,
			['length'] = 7,
			['width'] = 13,
			['minZ'] = 101.77,
			['maxZ'] = 105.77,
		},
		['Inside'] = {
			['rek'] = {
				['coords'] = vector3(376.68, 327.53, 103.57),
				['label'] = 'Neem drinken...',
				['events'] = 'vyz-shops:client:Opemenu',
				['args'] = 'drinken',
				['length'] = 2,
                ['heading'] = 257,
				['width'] = 1,
				['minZ'] = 100.17,
				['maxZ'] = 104.17,
			},
            ['rek2'] = {
				['coords'] = vector3(379.4, 326.82, 103.57),
				['label'] = 'Neem eten...',
				['events'] = 'vyz-shops:client:Opemenu',
				['args'] = 'eten',
                ['heading'] = 257,
				['length'] = 2,
				['width'] = 1,
				['minZ'] = 100.17,
				['maxZ'] = 104.17,
			},
            ['koelkast'] = {
				['coords'] = vector3(382.4, 324.53, 103.57),
				['label'] = 'Neem alcohol...',
				['events'] = 'vyz-shops:client:Opemenu',
				['args'] = 'alcohol',
				['length'] = 1.1,
                ['width'] = 4.8,
                ['heading'] = 345,
				['minZ'] = 101.17,
				['maxZ'] = 105.17,
			},
            ['koffieApperaat'] = { -- TODO: Dit kan nog weg gehaald worden omdat sommige server dit al hebben
				['coords'] = vector3(373.4, 331.27, 103.57),
				['label'] = 'Neem koffie...',
				['events'] = 'vyz-shops:client:Opemenu',
				['args'] = 'koffie',
				['length'] = 0.7,
                ['heading'] = 78,
				['width'] = 0.3,
				['minZ'] = 100.37,
				['maxZ'] = 104.37,
			},
            ['kassa'] = {
                    ['coords'] = vector3(373.64, 328.58, 103.57),
                    ['length'] = 0.7,
                    ['width'] = 0.5,
                    ['heading'] = 75,
                    ['label'] = 'afrekenen...',
                    ['events'] = 'vyz-shops:client:Openkassa',
                    ['args'] = 'iets',
                    ['minZ'] = 99.67,
                    ['maxZ'] = 103.87
            },
		}
	},
}

-- NOTE: HIER KAN JE ALLE ITEMS TOEVOEGEN DIE JE KAN KOPEN

Config.Items = {
	['eten'] = {
		['tosti'] = {
            name = "tosti",
            price = 2,
        },
        ['twerks'] = {
            name = "twerks_candy",
            price = 2,
        },
        ['snikkel'] = {
            name = "snikkel_candy",
            price = 2,
        },
        ['sandwich'] = {
            name = "sandwich",
            price = 2,
        },
	},
	['drinken'] = {
        ['Water'] = {
            name = "water_bottle",
            price = 2,
        },
        ['Cola'] = {
            name = "kurkakola",
            price = 2,
        },
	},
    ['alcohol'] = {
        ['bier'] = {
            name = "beer",
            price = 5,
        },
        ['whiskey'] = {
            name = "whiskey",
            price = 9,
        },
        ['vodka'] = {
            name = 'vodka',
            price = 6,
        },
        ['wijn'] = {
            name = 'wine',
            price = 10,
        }
    }
}
