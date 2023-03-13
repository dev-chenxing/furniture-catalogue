local this = {}
this.npcs = {
	["randoms"] = {
		"retail_cus_adv_01", -- dunmer m silver cuirass
		"retail_cus_adv_02", -- dunmer f chitin cuirass
		"retail_cus_adv_03", -- dunmer f bonemold cuirass
		"retail_cus_adv_04", -- imperial m netch leather cuirass
		"retail_cus_adv_05", -- nord m fur_bearskin_cuirass
		"retail_cus_adv_06", -- nord f BM_Nordic02_shirt
		"retail_cus_adv_07", -- imperial m fur_cuirass
		"retail_cus_adv_08", -- argonian m netch_leather_boiled_cuirass
		"retail_cus_adv_09", -- redguard m nordic_ringmail_cuirass
		"retail_cus_adv_10", -- imperial m imperial_chain_cuirass
		"retail_cus_adv_11", -- orc m steel_cuirass
		"retail_cus_adv_12", -- redguard f dragonscale_cuirass
		"retail_cus_adv_13", -- imperial f imperial_studded_cuirass
		"retail_cus_adv_14", -- dunmer f newtscale_cuirass
		"retail_cus_adv_15", -- nord f BM bear cuirass
		"retail_cus_com_01", -- dunmer f common_shirt_01
		"retail_cus_com_02", -- dunmer m extravagant_robe_01_r
		"retail_cus_com_03", -- dunmer m common_shirt_02_rr
		"retail_cus_com_04", -- dunmer f expensive_shirt_02
		"retail_cus_com_05", -- dunmer f common_robe_05_c
		"retail_cus_com_06", -- dunmer m extravagant_shirt_01
		"retail_cus_com_07", -- dunmer f common_robe_01
		"retail_cus_com_08", -- altmer f expensive_robe_03
		"retail_cus_com_09", -- altmer m extravagant_robe_02
		"retail_cus_com_10", -- dunmer m common_robe_03_a
		"retail_cus_com_11", -- dunmer m common_robe_05_b
		"retail_cus_com_12", -- argonian m common_shirt_03_c
		"retail_cus_com_13", -- breton f common_robe_02_t
		"retail_cus_com_14", -- bosmer f common_shirt_02_r
		"retail_cus_com_15", -- khajiit m common_shirt_05
		"retail_cus_com_16", -- nord f common_shirt_02_t
		"retail_cus_com_17", -- orc m common_shirt_07
		"retail_cus_com_18", -- redguard m common_shirt_04_c
		"retail_cus_com_19", -- imperial f common_shirt_02_h
		"retail_cus_com_20", -- orc f common_shirt_04
		"retail_cus_com_21", -- dunmer f common_shirt_03_b
		"retail_cus_com_22", -- breton m extravagant_shirt_02
		"retail_cus_com_23", -- dunmer m extravagant_robe_01_t
		"retail_cus_com_24", -- dunmer f extravagant_shirt_01_h
		"retail_cus_com_25", -- dunmer m common_shirt_02_hh
		"retail_cus_com_26", -- dunmer m common_shirt_04_a
		"retail_cus_com_27", -- dunmer m expensive_shirt_01
		"retail_cus_com_28", -- argonian f common_shirt_04_b
		"retail_cus_com_29", -- khajiit f expensive_shirt_03
		"retail_cus_com_30", -- nord m iron_cuirass
		"retail_cus_com_31", -- redguard f common_robe_05
		"retail_cus_com_32", -- bosmer m exquisite_shirt_01
	},
	["uniques"] = {
		"retail_tra_alchemist", -- dunmer f common_robe_02
		"retail_tra_herbalist_01", -- redguard m common_shirt_06
		"retail_tra_miner", -- dunmer m common_shirt_03
		"retail_tra_herbalist_02", -- dunmer f common_shirt_02
		"retail_tra_traveling_me", -- redguard m common_robe_05_a
		"retail_cus_u_ghost", -- ancestor ghost
		"retail_cus_u_brewer", -- dunmer f common_robe_02_r
		"retail_cus_u_fisherman", -- dunmer m common_shirt_gondolier
		"retail_cus_u_ordinator", -- dunmer m indoril cuirass
		"retail_cus_u_sorcerer", -- dunmer m common_robe_02_tt
	},
}
this.customerOutfits = {
	{
		{ item = "silver longsword", count = 1 },
		{ item = "common_shirt_02", count = 1 },
		{ item = "common_pants_03_c", count = 1 },
		{ item = "steel_shield", count = 1 },
		{ item = "iron_gauntlet_right", count = 1 },
		{ item = "iron_gauntlet_left", count = 1 },
		{ item = "iron boots", count = 1 },
		{ item = "iron_greaves", count = 1 },
		{ item = "iron_pauldron_right", count = 1 },
		{ item = "iron_pauldron_left", count = 1 },
		{ item = "silver_cuirass", count = 1 },
		{ item = "silver_helm", count = 1 },
		{ item = "l_b_amulets", count = 1 },
	}, -- retail_cus_adv_01
	{
		{ item = "chitin dagger", count = 2 },
		{ item = "common_pants_02", count = 1 },
		{ item = "cloth bracer right", count = 1 },
		{ item = "cloth bracer left", count = 1 },
		{ item = "netch_leather_boots", count = 1 },
		{ item = "chitin cuirass", count = 1 },
		{ item = "chitin pauldron - left", count = 1 },
		{ item = "chitin pauldron - right", count = 1 },
		{ item = "chitin greaves", count = 1 },
	}, -- retail_cus_adv_02
	{
		{ item = "iron longsword", count = 1 },
		{ item = "common_shirt_02", count = 1 },
		{ item = "common_shoes_01", count = 1 },
		{ item = "common_pants_03_c", count = 1 },
		{ item = "bonemold_cuirass", count = 1 },
	}, -- retail_cus_adv_03
	{
		{ item = "iron arrow", count = 29 },
		{ item = "steel longbow", count = 1 },
		{ item = "steel dagger", count = 1 },
		{ item = "common_pants_01", count = 1 },
		{ item = "netch_leather_gauntlet_right", count = 1 },
		{ item = "netch_leather_gauntlet_left", count = 1 },
		{ item = "netch_leather_boots", count = 1 },
		{ item = "netch_leather_greaves", count = 1 },
		{ item = "netch_leather_pauldron_right", count = 1 },
		{ item = "netch_leather_pauldron_left", count = 1 },
		{ item = "netch_leather_cuirass", count = 1 },
	}, -- retail_cus_adv_04
	{
		{ item = "iron battle axe", count = 1 },
		{ item = "common_shirt_01", count = 1 },
		{ item = "common_pants_02", count = 1 },
		{ item = "fur_bracer_right", count = 1 },
		{ item = "fur_bracer_left", count = 1 },
		{ item = "nordic_leather_shield", count = 1 },
		{ item = "fur_boots", count = 1 },
		{ item = "fur_bearskin_cuirass", count = 1 },
	}, -- retail_cus_adv_05
	{
		{ item = "silver dagger", count = 1 },
		{ item = "common_glove_left_01", count = 1 },
		{ item = "common_glove_right_01", count = 1 },
		{ item = "BM_Nordic02_shirt", count = 1 },
		{ item = "BM_NordicMail_Boots", count = 1 },
		{ item = "BM_NordicMail_greaves", count = 1 },
	}, -- retail_cus_adv_06
	{
		{ item = "steel dagger", count = 1 },
		{ item = "common_shirt_04", count = 1 },
		{ item = "common_pants_03", count = 1 },
		{ item = "fur_boots", count = 1 },
		{ item = "fur_cuirass", count = 1 },
		{ item = "fur_helm", count = 1 },
	}, -- retail_cus_adv_07
	{
		{ item = "common_skirt_01", count = 1 },
		{ item = "common_shirt_01", count = 1 },
		{ item = "common_shoes_01", count = 1 },
	}, -- retail_cus_com_01
	{
		{ item = "extravagant_amulet_01", count = 1 },
		{ item = "extravagant_ring_01", count = 1 },
		{ item = "extravagant_robe_01_r", count = 1 },
		{ item = "extravagant_shirt_01_t", count = 1 },
	}, -- retail_cus_com_02
	{
		{ item = "chitin shortsword", count = 1 },
		{ item = "common_shoes_05", count = 1 },
		{ item = "common_pants_04", count = 1 },
		{ item = "common_shirt_02_rr", count = 1 },
	}, -- retail_cus_com_03
	{
		{ item = "dwarven mace", count = 1 },
		{ item = "expensive_shirt_02", count = 1 },
		{ item = "exquisite_shoes_01", count = 1 },
		{ item = "expensive_pants_02", count = 1 },
	}, -- retail_cus_com_04
	{
		{ item = "iron dagger", count = 1 },
		{ item = "common_robe_05_c", count = 1 },
		{ item = "common_shoes_02", count = 1 },
		{ item = "bonemold_pauldron_r", count = 1 },
		{ item = "bonemold_pauldron_l", count = 1 },
		{ item = "bonemold_cuirass", count = 1 },
	}, -- retail_cus_com_05
	{
		{ item = "steel claymore", count = 1 },
		{ item = "extravagant_shirt_01", count = 1 },
		{ item = "extravagant_shoes_01", count = 1 },
		{ item = "extravagant_pants_02", count = 1 },
		{ item = "steel_gauntlet_right", count = 1 },
		{ item = "steel_gauntlet_left", count = 1 },
	}, -- retail_cus_com_06
	{ { item = "common_robe_01", count = 1 }, { item = "common_shoes_01", count = 1 } }, -- retail_cus_com_07
	{
		{ item = "steel club", count = 1 },
		{ item = "expensive_robe_03", count = 1 },
		{ item = "expensive_shoes_01", count = 1 },
	}, -- retail_cus_com_08
	{
		{ item = "silver staff", count = 1 },
		{ item = "extravagant_robe_02", count = 1 },
		{ item = "steel_gauntlet_right", count = 1 },
		{ item = "steel_gauntlet_left", count = 1 },
		{ item = "steel_boots", count = 1 },
		{ item = "steel_cuirass", count = 1 },
	}, -- retail_cus_com_09
	{ { item = "steel viperblade", count = 1 }, { item = "common_robe_03_a", count = 1 } }, -- retail_cus_com_10
	{ { item = "common_robe_05_b", count = 1 } }, -- retail_cus_com_11
	{
		{ item = "silver shardblade", count = 1 },
		{ item = "common_shirt_03_c", count = 1 },
		{ item = "common_pants_03_c", count = 1 },
	}, -- retail_cus_com_12
	{ { item = "common_robe_02_t", count = 1 }, { item = "common_shoes_02", count = 1 } }, -- retail_cus_com_13
	{
		{ item = "common_skirt_05", count = 1 },
		{ item = "common_shirt_02_r", count = 1 },
		{ item = "common_shoes_02", count = 1 },
		{ item = "common_pants_02", count = 1 },
	}, -- retail_cus_com_14
	{
		{ item = "common_ring_03", count = 1 },
		{ item = "common_shirt_05", count = 1 },
		{ item = "common_pants_05", count = 1 },
		{ item = "potion_skooma_01", count = 1 },
	}, -- retail_cus_com_15
	{
		{ item = "common_ring_05", count = 1 },
		{ item = "common_skirt_05", count = 1 },
		{ item = "common_belt_02", count = 1 },
		{ item = "common_shirt_02_t", count = 1 },
		{ item = "common_shoes_05", count = 1 },
		{ item = "common_pants_01", count = 1 },
	}, -- retail_cus_com_16
	{
		{ item = "orcish warhammer", count = 1 },
		{ item = "fur_gauntlet_right", count = 1 },
		{ item = "fur_gauntlet_left", count = 1 },
		{ item = "fur_boots", count = 1 },
		{ item = "fur_greaves", count = 1 },
		{ item = "common_shirt_07", count = 1 },
	}, -- retail_cus_com_17
	{
		{ item = "common_glove_left_01", count = 1 },
		{ item = "common_glove_right_01", count = 1 },
		{ item = "common_belt_01", count = 1 },
		{ item = "common_shirt_04_c", count = 1 },
		{ item = "common_shoes_03", count = 1 },
		{ item = "common_pants_04_b", count = 1 },
	}, -- retail_cus_com_18
	{
		{ item = "silver dagger", count = 1 },
		{ item = "expensive_ring_03", count = 1 },
		{ item = "expensive_skirt_03", count = 1 },
		{ item = "common_shirt_02_h", count = 1 },
		{ item = "expensive_shoes_03", count = 1 },
	}, -- retail_cus_com_19
	{
		{ item = "common_shirt_04", count = 1 },
		{ item = "common_shoes_04", count = 1 },
		{ item = "common_pants_04", count = 1 },
	}, -- retail_cus_com_20
	{
		{ item = "iron dagger", count = 1 },
		{ item = "common_shirt_03_b", count = 1 },
		{ item = "common_shoes_03", count = 1 },
		{ item = "common_pants_03", count = 1 },
	}, -- retail_cus_com_21
	{
		{ item = "silver dagger", count = 1 },
		{ item = "extravagant_glove_left_01", count = 1 },
		{ item = "extravagant_glove_right_01", count = 1 },
		{ item = "extravagant_shirt_02", count = 1 },
		{ item = "extravagant_shoes_02", count = 1 },
		{ item = "extravagant_pants_02", count = 1 },
	}, -- retail_cus_com_22
	{
		{ item = "wooden staff", count = 1 },
		{ item = "extravagant_robe_01_t", count = 1 },
		{ item = "common_shoes_02", count = 1 },
	}, -- retail_cus_com_23
	{
		{ item = "glass dagger", count = 1 },
		{ item = "extravagant_shirt_01_h", count = 1 },
		{ item = "expensive_shoes_03", count = 1 },
		{ item = "extravagant_pants_01", count = 1 },
	}, -- retail_cus_com_24
	{
		{ item = "steel shortsword", count = 1 },
		{ item = "common_shirt_02_hh", count = 1 },
		{ item = "common_shoes_02", count = 1 },
		{ item = "common_pants_01", count = 1 },
	}, -- retail_cus_com_25
	{
		{ item = "iron shortsword", count = 1 },
		{ item = "common_shirt_04_a", count = 1 },
		{ item = "common_shoes_04", count = 1 },
		{ item = "common_pants_04", count = 1 },
	}, -- retail_cus_com_26
	{
		{ item = "iron warhammer", count = 1 },
		{ item = "expensive_belt_03", count = 1 },
		{ item = "expensive_shirt_01", count = 1 },
		{ item = "expensive_shoes_02", count = 1 },
		{ item = "Expensive_pants_Mournhold", count = 1 },
	}, -- retail_cus_com_27
	{ { item = "common_shirt_04_b", count = 1 }, { item = "extravagant_pants_02", count = 1 } }, -- retail_cus_com_28
	{
		{ item = "silver dart", count = 9 },
		{ item = "silver dagger", count = 1 },
		{ item = "expensive_amulet_01", count = 1 },
		{ item = "expensive_belt_02", count = 1 },
		{ item = "expensive_shirt_03", count = 1 },
		{ item = "expensive_pants_03", count = 1 },
	}, -- retail_cus_com_29
	{
		{ item = "iron_cuirass", count = 1 },
		{ item = "expensive_shirt_03", count = 1 },
		{ item = "common_shoes_03", count = 1 },
		{ item = "common_pants_03", count = 1 },
	}, -- retail_cus_com_30
	{ { item = "iron tanto", count = 1 }, { item = "common_robe_05", count = 1 }, { item = "common_shoes_03", count = 1 } }, -- retail_cus_com_31
	{
		{ item = "steel mace", count = 1 },
		{ item = "exquisite_shirt_01", count = 1 },
		{ item = "exquisite_shoes_01", count = 1 },
		{ item = "exquisite_pants_01", count = 1 },
	}, -- retail_cus_com_32
	{
		{ item = "nordic battle axe", count = 1 },
		{ item = "common_shirt_02", count = 1 },
		{ item = "common_pants_01", count = 1 },
		{ item = "chitin pauldron - right", count = 1 },
		{ item = "chitin pauldron - left", count = 1 },
		{ item = "netch_leather_boiled_cuirass", count = 1 },
		{ item = "netch_leather_boiled_helm", count = 1 },
	}, -- retail_cus_adv_08
	{
		{ item = "bonemold arrow", count = 15 },
		{ item = "bonemold long bow", count = 1 },
		{ item = "common_pants_04_b", count = 1 },
		{ item = "bonemold_boots", count = 1 },
		{ item = "chitin greaves", count = 1 },
		{ item = "chitin pauldron - right", count = 1 },
		{ item = "chitin pauldron - left", count = 1 },
		{ item = "nordic_ringmail_cuirass", count = 1 },
	}, -- retail_cus_adv_09
	{
		{ item = "steel saber", count = 1 },
		{ item = "common_pants_02", count = 1 },
		{ item = "netch_leather_gauntlet_right", count = 1 },
		{ item = "netch_leather_gauntlet_left", count = 1 },
		{ item = "imperial boots", count = 1 },
		{ item = "imperial_chain_greaves", count = 1 },
		{ item = "imperial_chain_pauldron_right", count = 1 },
		{ item = "imperial left pauldron", count = 1 },
		{ item = "imperial_chain_pauldron_left", count = 1 },
		{ item = "imperial_chain_cuirass", count = 1 },
	}, -- retail_cus_adv_10
	{
		{ item = "merisan club", count = 1 },
		{ item = "imperial boots", count = 1 },
		{ item = "imperial_greaves", count = 1 },
		{ item = "steel_cuirass", count = 1 },
	}, -- retail_cus_adv_11
	{
		{ item = "steel stormsword", count = 1 },
		{ item = "common_glove_left_01", count = 1 },
		{ item = "common_glove_right_01", count = 1 },
		{ item = "common_shirt_02", count = 1 },
		{ item = "common_pants_05", count = 1 },
		{ item = "heavy_leather_boots", count = 1 },
		{ item = "dragonscale_cuirass", count = 1 },
		{ item = "dragonscale_helm", count = 1 },
	}, -- retail_cus_adv_12
	{
		{ item = "iron bolt", count = 25 },
		{ item = "steel crossbow", count = 1 },
		{ item = "common_shirt_04", count = 1 },
		{ item = "common_pants_06", count = 1 },
		{ item = "heavy_leather_boots", count = 1 },
		{ item = "imperial_studded_cuirass", count = 1 },
	}, -- retail_cus_adv_13
	{
		{ item = "orcish battle axe", count = 1 },
		{ item = "common_shirt_01", count = 1 },
		{ item = "common_pants_01", count = 1 },
		{ item = "BM bear shield", count = 1 },
		{ item = "BM bear right gauntlet", count = 1 },
		{ item = "bm bear left gauntlet", count = 1 },
		{ item = "BM bear boots", count = 1 },
		{ item = "BM bear greaves", count = 1 },
		{ item = "BM bear right pauldron", count = 1 },
		{ item = "BM Bear left Pauldron", count = 1 },
		{ item = "BM bear cuirass", count = 1 },
	}, -- retail_cus_adv_15
	{
		{ item = "iron wakizashi", count = 1 },
		{ item = "common_shirt_03_c", count = 1 },
		{ item = "common_shoes_04", count = 1 },
		{ item = "common_pants_03_c", count = 1 },
		{ item = "newtscale_cuirass", count = 1 },
	}, -- retail_cus_adv_14
}

return this
