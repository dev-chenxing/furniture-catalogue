local this = {}

---@class furnitureCatalogue.furniture
---@field id string The id of the furniture
---@field newId string The new id of the furniture copy
---@field name string The name of the furniture
---@field description string?
---@field category string
---@field cost number
---@field alwaysInStock boolean?
---@field scale number?
---@field ashlandersAvailable boolean?
---@field ashlandersOnly boolean?
---@field weight number?
---@field notForSale boolean?
---@field base string?
---@field deprecated boolean?

this.furniture = {
	-- Oldwood pack
	["001"] = { id = "active_de_p_bed_04", newId = "jsmk_fc_active_de_p_bed_04", name = "Single Bed, Olive", category = "Beds", cost = 60, weight = 30 }, -- MW
	["002"] = { id = "dr_asrt_p_f_bookcase_01", newId = "jsmk_fc_dr_asrt_p_f_bookcase_01", name = "Bookcase, Cheap", category = "Shelves", cost = 30, weight = 5 }, -- DR
	["003"] = { id = "de_p_closet_02", newId = "jsmk_fc_de_p_closet_02", name = "Closet, Cheap", category = "Containers", cost = 140, weight = 30 }, -- MW
	["004"] = { id = "furn_de_p_bench_03", newId = "jsmk_fc_furn_de_p_bench_03", name = "Bench, Cheap", category = "Seats", cost = 15, weight = 5 }, -- MW
	["005"] = { id = "furn_de_p_bookshelf_01", newId = "jsmk_fc_furn_de_p_bookshelf_01", name = "Bookshelf, Cheap", category = "Shelves", cost = 60, weight = 20, alwaysInStock = true }, -- MW
	["006"] = { id = "furn_de_p_chair_01", newId = "jsmk_fc_furn_de_p_chair_01", name = "Chair, Cheap", category = "Seats", cost = 15, weight = 5 }, -- MW
	["007"] = { id = "furn_de_p_chair_02", newId = "jsmk_fc_furn_de_p_chair_02", name = "Chair, Cheap", category = "Seats", cost = 15, weight = 5 }, -- MW
	["008"] = { id = "furn_de_p_shelf_02", newId = "jsmk_fc_furn_de_p_shelf_02", name = "Shelf, Cheap", category = "Shelves", cost = 10, weight = 5 }, -- MW
	["009"] = { id = "furn_de_p_stool_01", newId = "jsmk_fc_furn_de_p_stool_01", name = "Stool, Cheap", category = "Seats", cost = 10, weight = 5 }, -- MW
	["010"] = { id = "furn_de_p_stool_02", newId = "jsmk_fc_furn_de_p_stool_02", name = "Stool, Cheap", category = "Seats", cost = 10, weight = 5 }, -- MW
	["011"] = { id = "furn_de_p_table_01", newId = "jsmk_fc_furn_de_p_table_01", name = "Round Table, Cheap", category = "Tables", cost = 75, weight = 20 }, -- MW
	["012"] = { id = "furn_de_p_table_02", newId = "jsmk_fc_furn_de_p_table_02", name = "Small Telvanni Table, Cheap", category = "Tables", cost = 50, weight = 10 }, -- MW
	["013"] = { id = "furn_de_p_table_04", newId = "jsmk_fc_furn_de_p_table_04", name = "Large Table, Cheap", category = "Tables", cost = 100, weight = 30 }, -- MW
	["014"] = { id = "furn_de_p_table_05", newId = "jsmk_fc_furn_de_p_table_05", name = "End Table, Cheap", category = "Tables", cost = 40, weight = 10 }, -- MW
	["015"] = { id = "furn_de_p_table_06", newId = "jsmk_fc_furn_de_p_table_06", name = "Round Table, Stump", category = "Tables", cost = 150, weight = 30 }, -- MW
	["016"] = { id = "furn_de_rm_winerack", newId = "jsmk_fc_furn_de_rm_winerack", name = "Winerack, Cheap", category = "Shelves", cost = 150, weight = 30 }, -- MW
	["018"] = { id = "mwg_vivec_market_05", newId = "jsmk_fc_mwg_vivec_market_05", name = "Market Stand", category = "Shelves", cost = 30, weight = 10 }, -- MwG
	["019"] = { id = "de_p_desk_01", newId = "jsmk_fc_de_p_desk_01", name = "Desk, Cheap", category = "Containers", cost = 140, weight = 30 }, -- MW
	["020"] = { id = "de_drawers_02", newId = "jsmk_fc_de_drawers_02", name = "Chest of Drawers, Cheap", category = "Containers", cost = 140, weight = 30 }, -- MW
	["021"] = { id = "ab_o_deplntable01", newId = "jsmk_fc_ab_o_deplntable01", name = "End Table, Cheap", category = "Tables", cost = 130, weight = 30 }, -- OAAB
	["022"] = { id = "ab_furn_deplnscrollrack1", newId = "jsmk_fc_abfurn_deplnscrollrack1", name = "Scroll Rack, Cheap", category = "Shelves", cost = 175, weight = 30 }, -- OAAB
	["023"] = { id = "ab_furn_deplnscrollrack2", newId = "jsmk_fc_abfurn_deplnscrollrack2", name = "Scroll Rack, Cheap", category = "Shelves", cost = 175, weight = 30 }, -- OAAB

	-- Metal Iron Rusty pack
	["025"] = { id = "light_com_lamp_01", newId = "jsmk_fc_light_com_lamp_01", name = "Lamp, Iron", category = "Lights", cost = 20, weight = 10 }, -- MW
	["026"] = { id = "light_com_lamp_02", newId = "jsmk_fc_light_com_lamp_02", name = "Lamp, Iron", category = "Lights", cost = 20, weight = 10 }, -- MW
	["030"] = { id = "ab_furn_dnghook", newId = "jsmk_fc_ab_furn_dnghook", name = "Iron Hook", category = "Other", cost = 10, weight = 5, scale = 0.5 }, -- OAAB

	-- Khaki Wood pack
	["031"] = { id = "active_com_bed_03", newId = "jsmk_fc_active_com_bed_03", name = "Single Bed, Brown", category = "Beds", cost = 60, weight = 30 }, -- MW
	["032"] = { id = "furn_com_p_bench_01", newId = "jsmk_fc_furn_com_p_bench_01", name = "Bench, Khaki", category = "Seats", cost = 15, weight = 5 }, -- MW
	["033"] = { id = "active_com_bunk_02", newId = "jsmk_fc_active_com_bunk_02", name = "Bunk Bed, Grey", category = "Beds", cost = 120, weight = 40 }, -- MW
	["034"] = { id = "furn_com_p_shelf_03", newId = "jsmk_fc_furn_com_p_shelf_03", name = "Shelf, Khaki", category = "Shelves", cost = 10, weight = 2 }, -- MW
	["035"] = { id = "furn_com_p_table_01", newId = "jsmk_fc_furn_com_p_table_01", name = "Table, Khaki", category = "Tables", cost = 120, weight = 30 }, -- MW
	["036"] = { id = "light_com_chandelier_01", newId = "jsmk_fc_light_com_chandelier_01", name = "Chandelier, Khaki", category = "Lights", cost = 60, weight = 5 }, -- MW
	["037"] = { id = "t_imp_furnp_rack_02", newId = "jsmk_fc_t_imp_furnp_rack_02", name = "Rack, Khaki", category = "Shelves", cost = 120, weight = 30 }, -- PC
	["038"] = { id = "t_imp_furnp_wallscreen_01", newId = "jsmk_fc_t_imp_furnpwallscreen01", name = "Wallscreen, Khaki", category = "Other", cost = 60, weight = 10 }, -- PC
	["039"] = { id = "t_cyrimp_furnp_st1empty", newId = "jsmk_fc_t_cyrimp_furnp_st1empty", name = "Side Table, Khaki", category = "Containers", cost = 60, weight = 15 }, -- PC
	["040"] = { id = "t_com_furn_ladder_01", newId = "jsmk_fc_t_com_furn_ladder_01", name = "Ladder, Khaki", category = "Structures", cost = 60, weight = 15 }, -- TR

	-- Canvas Wrap pack
	["041"] = { id = "com_sack_01", newId = "jsmk_fc_com_sack_01", name = "Sack", category = "Containers", cost = 6, weight = 2, ashlandersAvailable = true }, -- MW
	["042"] = { id = "com_sack_03", newId = "jsmk_fc_com_sack_03", name = "Sack, Vertical", category = "Containers", cost = 6, weight = 2, ashlandersAvailable = true }, -- MW
	["043"] = { id = "furn_com_pm_chair_02", newId = "jsmk_fc_furn_com_pm_chair_02", name = "Chair, Foldable", category = "Seats", cost = 15, weight = 7 }, -- MW
	["044"] = { id = "furn_de_cushion_round_03", newId = "jsmk_fc_furn_de_cushion_round03", name = "Cushion, Round", category = "Seats", cost = 30, weight = 3 }, -- MW
	["045"] = { id = "furn_de_practice_mat", newId = "jsmk_fc_furn_de_practice_mat", name = "Practice Mat", category = "Rugs", cost = 30, weight = 3 }, -- MW

	-- Skyrim Wood Furniture 01 pack
	["046"] = { id = "t_nor_furnp_bench_01", newId = "jsmk_fc_t_nor_furnp_bench_01", name = "Bench, Nordic", category = "Seats", cost = 30, weight = 5 }, -- SKY
	["047"] = { id = "t_nor_furnp_bookshelf_01", newId = "jsmk_fc_t_nor_furnp_bookshelf01", name = "Bookshelf, Nordic", category = "Shelves", cost = 180, weight = 30 }, -- SKY
	["048"] = { id = "t_nor_furnp_chair_01", newId = "jsmk_fc_t_nor_furnp_chair_01", name = "Chair, Nordic", category = "Seats", cost = 60, weight = 10 }, -- SKY
	["049"] = { id = "t_nor_furnp_bar_01", newId = "jsmk_fc_t_nor_furnp_bar_01", name = "Counter, Nordic", category = "Shelves", cost = 150, weight = 25 }, -- SKY
	["050"] = { id = "t_nor_furnp_shelf_01", newId = "jsmk_fc_t_nor_furnp_shelf_01", name = "Bookshelf, Nordic", category = "Shelves", cost = 450, weight = 40 }, -- SKY
	["051"] = { id = "t_nor_furnp_shelf_04", newId = "jsmk_fc_t_nor_furnp_shelf_04", name = "Bookshelf, Nordic", category = "Shelves", cost = 75, weight = 15 }, -- SKY
	["052"] = { id = "t_nor_furnp_stool_01", newId = "jsmk_fc_t_nor_furnp_stool_01", name = "Stool, Nordic", category = "Seats", cost = 30, weight = 5 }, -- SKY
	["053"] = { id = "t_nor_furnp_table_02", newId = "jsmk_fc_t_nor_furnp_table_02", name = "Round Table, Nordic", category = "Tables", cost = 150, weight = 30 }, -- SKY
	["054"] = { id = "t_skynor_furnp_cb1empty", newId = "jsmk_fc_t_skynor_furnp_cb1empty", name = "Cupboard, Nordic", category = "Containers", cost = 100, weight = 15 }, -- SKY
	["055"] = { id = "t_skynor_furnp_cl1empty", newId = "jsmk_fc_t_skynor_furnp_cl1empty", name = "Closet, Nordic", category = "Containers", cost = 400, weight = 40 }, -- SKY
	["056"] = { id = "t_skynor_furnp_dw1empty", newId = "jsmk_fc_t_skynor_furnp_dw1empty", name = "Drawers, Nordic", category = "Containers", cost = 200, weight = 20 }, -- SKY
	["057"] = { id = "t_skynor_furnp_ds1empty", newId = "jsmk_fc_t_skynor_furnp_ds1empty", name = "Desk, Nordic", category = "Containers", cost = 100, weight = 15 }, -- SKY

	-- Wood Brown pack
	["058"] = { id = "furn_com_rm_shelf_02", newId = "jsmk_fc_furn_com_rm_shelf_02", name = "Shelf", category = "Shelves", cost = 20, weight = 10 }, -- MW
	["059"] = { id = "com_chest_02_empty", newId = "jsmk_fc_com_chest_02_empty", name = "Chest", category = "Containers", cost = 35, weight = 10, ashlandersAvailable = true }, -- MW
	["060"] = { id = "com_chest_11_empty", newId = "jsmk_fc_com_chest_11_empty", name = "Chest", category = "Containers", cost = 25, weight = 8, ashlandersAvailable = true }, -- MW
	["061"] = { id = "crate_01_empty", newId = "jsmk_fc_crate_01_empty", name = "Crate", category = "Containers", cost = 6, weight = 4 }, -- MW
	["062"] = { id = "furn_com_rm_bookshelf_02", newId = "jsmk_fc_furn_com_rm_bookshelf02", name = "Bookshelf", category = "Shelves", cost = 500, weight = 40 }, -- MW
	["063"] = { id = "furn_com_rm_table_03", newId = "jsmk_fc_furn_com_rm_table_03", name = "Round Table", category = "Tables", cost = 150, weight = 30 }, -- MW
	["064"] = { id = "furn_com_rm_table_04", newId = "jsmk_fc_furn_com_rm_table_04", name = "Table", category = "Tables", cost = 150, weight = 30 }, -- MW
	["065"] = { id = "furn_com_rm_table_05", newId = "jsmk_fc_furn_com_rm_table_05", name = "Small Table", category = "Tables", cost = 50, weight = 10, alwaysInStock = true }, -- MW
	["066"] = { id = "barrel_01_empty", newId = "jsmk_fc_barrel_01_empty", name = "Barrel", category = "Containers", cost = 30, weight = 10, ashlandersAvailable = true }, -- MW
	["067"] = { id = "barrel_02", newId = "jsmk_fc_barrel_02", name = "Barrel", category = "Containers", cost = 40, weight = 15 }, -- MW
	["068"] = { id = "ab_furn_combucket02water", newId = "jsmk_fc_ab_furncombucket02water", name = "Bucket of Water", category = "Water", cost = 30, weight = 10 }, -- OAAB
	["069"] = { id = "ab_furn_weprackwall", newId = "jsmk_fc_ab_furn_weprackwall", name = "Weapon Rack, Wall", category = "Shelves", cost = 40, weight = 5 }, -- OAAB
	["070"] = { id = "ab_o_barrel01group", newId = "jsmk_fc_ab_o_barrel01group", name = "Stack of Barrels", category = "Containers", cost = 150, weight = 50 }, -- OAAB
	["071"] = { id = "ab_o_comcrate01", newId = "jsmk_fc_ab_o_comcrate01", name = "Crate", category = "Containers", cost = 3, weight = 2 }, -- OAAB
	["072"] = { id = "t_imp_furnm_bookshelf_04", newId = "jsmk_fc_t_imp_furnm_bookshelf04", name = "Bookshelf", category = "Shelves", cost = 250, weight = 20 }, -- PC

	-- Wood Wethered pack
	["073"] = { id = "furn_de_ex_bench_01", newId = "jsmk_fc_furn_de_ex_bench_01", name = "Bench", category = "Seats", cost = 25, weight = 10, ashlandersAvailable = true }, -- MW
	["074"] = { id = "furn_de_ex_stool_02", newId = "jsmk_fc_furn_de_ex_stool_02", name = "Stool", category = "Seats", cost = 15, weight = 10, ashlandersAvailable = true }, -- MW
	["075"] = { id = "furn_de_ex_table_02", newId = "jsmk_fc_furn_de_ex_table_02", name = "Small Cheap Table", category = "Tables", cost = 35, weight = 25, ashlandersAvailable = true }, -- MW  
	["076"] = { id = "furn_de_ex_table_03", newId = "jsmk_fc_furn_de_ex_table_03", name = "Large Cheap Table", category = "Tables", cost = 50, weight = 30 }, -- MW
	["077"] = { id = "furn_de_lightpost_01", newId = "jsmk_fc_furn_de_lightpost_01", name = "Lightpost", category = "Other", cost = 25, weight = 10 }, -- MW
	["078"] = { id = "light_torch_01", newId = "jsmk_fc_light_torch_01", name = "Torch, Large", category = "Lights", cost = 12, weight = 5 }, -- MW
	["079"] = { id = "de_p_chest_02_empty", newId = "jsmk_fc_de_p_chest_02_empty", name = "Chest", category = "Containers", cost = 35, weight = 10 }, -- MW
	["080"] = { id = "ab_furn_deexdisplay01", newId = "jsmk_fc_ab_furn_deexdisplay01", name = "Display Shelf", category = "Shelves", cost = 50, weight = 20 }, -- OAAB
	["081"] = { id = "ab_furn_deexdisplay02", newId = "jsmk_fc_ab_furn_deexdisplay02", name = "Display Shelf", category = "Shelves", cost = 75, weight = 30 }, -- OAAB
	["082"] = { id = "ab_o_boxflour", newId = "jsmk_fc_ab_o_boxflour", name = "Box of Flour", category = "Containers", cost = 100, weight = 30 }, -- OAAB

	-- Rug pack
	["083"] = { id = "furn_de_rug_01", newId = "furn_de_rug_01", name = "Small Rectangular Rug, Blue", category = "Rugs", cost = 60, weight = 6 }, -- MW
	["084"] = { id = "furn_de_rug_02", newId = "jsmk_fc_furn_de_rug_02", name = "Small Rectangular Rug, Red", category = "Rugs", cost = 60, weight = 6, ashlandersAvailable = true }, -- MW     
	["085"] = { id = "furn_de_rug_big_01", newId = "jsmk_fc_furn_de_rug_big_01", name = "Large Oval Rug, Purple", category = "Rugs", cost = 120, weight = 6, ashlandersAvailable = true }, -- MW       
	["086"] = { id = "furn_de_rug_big_02", newId = "jsmk_fc_furn_de_rug_big_02", name = "Large Oval Rug, Red", category = "Rugs", cost = 120, weight = 6, scale = 0.8, ashlandersAvailable = true }, -- MW
	["087"] = { id = "furn_de_rug_big_03", newId = "jsmk_fc_furn_de_rug_big_03", name = "Large Oval Rug, Green", category = "Rugs", cost = 120, weight = 6, ashlandersAvailable = true }, -- MW       
	["088"] = { id = "furn_de_rug_big_05", newId = "jsmk_fc_furn_de_rug_big_05", name = "Large Rectangular Rug, Red", category = "Rugs", cost = 120, weight = 6, ashlandersAvailable = true }, -- MW
	["089"] = { id = "furn_de_rug_big_06", newId = "jsmk_fc_furn_de_rug_big_06", name = "Large Rectangular Rug, Green", category = "Rugs", cost = 120, scale = 0.7, weight = 6, ashlanders = true }, -- MW
	["090"] = { id = "furn_de_rug_big_07", newId = "jsmk_fc_furn_de_rug_big_07", name = "Large Rectangular Rug, Blue", category = "Rugs", cost = 120, weight = 6 }, -- MW
	["091"] = { id = "furn_de_rug_big_08", newId = "jsmk_fc_furn_de_rug_big_08", name = "Large Oval Rug", category = "Rugs", cost = 120, weight = 6, ashlandersAvailable = true }, -- MW       
	["092"] = { id = "furn_de_rug_big_09", newId = "jsmk_fc_furn_de_rug_big_09", name = "Large Rectangular Rug", category = "Rugs", cost = 120, weight = 6 }, -- MW
	["093"] = { id = "furn_rug_whitewolf", newId = "jsmk_fc_furn_rug_whitewolf", name = "Faux White Wolf Rug", category = "Rugs", cost = 120, weight = 6, scale = 1.2 }, -- MW
	["094"] = { id = "ab_furn_deplnrug00", newId = "jsmk_fc_ab_furn_deplnrug00", name = "Large Rectangular Rug", category = "Rugs", cost = 120, weight = 6 }, -- OAAB
	["095"] = { id = "ab_furn_deplnrug02", newId = "jsmk_fc_ab_furn_deplnrug02", name = "Large Rectangular Rug", category = "Rugs", cost = 120, weight = 6 }, -- OAAB
	["096"] = { id = "ab_furn_deplnrug03", newId = "jsmk_fc_ab_furn_deplnrug03", name = "Large Rectangular Rug", category = "Rugs", cost = 120, weight = 6 }, -- OAAB
	["097"] = { id = "ab_furn_deplnrug06", newId = "jsmk_fc_ab_furn_deplnrug06", name = "Large Round Rug", category = "Rugs", cost = 120, weight = 6, scale = 1.22 }, -- OAAB
	["098"] = { id = "ab_furn_deplnrug07", newId = "jsmk_fc_ab_furn_deplnrug07", name = "Large Rectangular Rug", category = "Rugs", cost = 120, weight = 6 }, -- OAAB

	-- Tapestry pack
	["099"] = { id = "furn_de_tapestry_02", newId = "jsmk_fc_furn_de_tapestry_02", name = "Tapestry, Tribunal", category = "Tapestries", cost = 120, weight = 5 }, -- MW
	["100"] = { id = "furn_de_tapestry_07", newId = "jsmk_fc_furn_de_tapestry_07", name = "Tapestry, Red", category = "Tapestries", cost = 120, weight = 5 }, -- MW
	["101"] = { id = "furn_de_tapestry_09", newId = "jsmk_fc_furn_de_tapestry_09", name = "Tapestry, Blue", category = "Tapestries", cost = 120, weight = 5 }, -- MW
	["102"] = { id = "furn_de_tapestry_10", newId = "jsmk_fc_furn_de_tapestry_10", name = "Tapestry, Green", category = "Tapestries", cost = 120, weight = 5 }, -- MW
	["103"] = { id = "furn_de_tapestry_11", newId = "jsmk_dc_furn_de_tapestry_11", name = "Tapestry, Purple", category = "Tapestries", cost = 120, weight = 5 }, -- MW
	["104"] = { id = "furn_com_tapestry_01", newId = "jsmk_fc_furn_com_tapestry_01", name = "Tapestry, Forest", category = "Tapestries", cost = 120, weight = 5 }, -- MW
	["105"] = { id = "furn_com_tapestry_02", newId = "jsmk_fc_furn_com_tapestry_02", name = "Tapestry, Blossom", category = "Tapestries", cost = 120, weight = 5 }, -- MW
	["106"] = { id = "furn_com_tapestry_03", newId = "jsmk_fc_furn_com_tapestry_03", name = "Tapestry, Compton", category = "Tapestries", cost = 120, weight = 5 }, -- MW
	["107"] = { id = "furn_com_tapestry_04", newId = "jsmk_fc_furn_com_tapestry_04", name = "Tapestry, Imperial", category = "Tapestries", cost = 120, weight = 5 }, -- MW
	["108"] = { id = "mwg_vivec_market_08", newId = "jsmk_fc_mwg_vivec_market_08", name = "Banners", category = "Tapestries", cost = 120, weight = 5 }, -- MwG
	["109"] = { id = "ab_furn_detapestrymini02", newId = "jsmk_fc_ab_furndetapestrymini02", name = "Tapestry Mini, Tribunal", category = "Tapestries", cost = 120, weight = 5 }, -- OAAB
	["110"] = { id = "ab_furn_detapestrymini06", newId = "jsmk_fc_ab_furndetapestrymini06", name = "Tapestry Mini, Red", category = "Tapestries", cost = 120, weight = 5 }, -- OAAB
	["111"] = { id = "ab_furn_detapestrymini10", newId = "jsmk_fc_ab_furndetapestrymini10", name = "Tapestry Mini, Blue", category = "Tapestries", cost = 120, weight = 5 }, -- OAAB
	["112"] = { id = "ab_furn_detapestrymini13", newId = "jsmk_fc_ab_furndetapestrymini13", name = "Tapestry Mini, Purple", category = "Tapestries", cost = 120, weight = 5 }, -- OAAB
	["113"] = { id = "t_imp_furn_tapestry_04", newId = "jsmk_fc_t_imp_furn_tapestry_04", name = "Tapestry, Leaves", category = "Tapestries", cost = 120, weight = 5 }, -- PC
	["114"] = { id = "t_imp_furn_tapestry_05", newId = "jsmk_fc_t_imp_furn_tapestry_05", name = "Tapestry, Grove", category = "Tapestries", cost = 120, weight = 5 }, -- PC
	["115"] = { id = "t_imp_furn_tapestrybastlarge_10", newId = "j_imp_furn_tapestrybastlarge_10", name = "Tapestry, Fern", category = "Tapestries", cost = 120, weight = 5 }, -- SKY
	["116"] = { id = "t_imp_furn_tapestrywoollarge_02", newId = "j_imp_furn_tapestrywoollarge_02", name = "Tapestry, Trellis", category = "Tapestries", cost = 120, weight = 5 }, -- SKY
	["117"] = { id = "t_imp_furn_tapestrywoollarge_06", newId = "j_imp_furn_tapestrywoollarge_06", name = "Tapestry, Wildflower", category = "Tapestries", cost = 120, weight = 5 }, -- SKY
	["118"] = { id = "t_imp_furn_tapestry_18", newId = "jsmk_fc_t_imp_furn_tapestry_18", name = "Tapestry, Golden", category = "Tapestries", cost = 120, weight = 5 }, -- TR
	["119"] = { id = "t_imp_furn_tapestry_28", newId = "jsmk_fc_t_imp_furn_tapestry_28", name = "Tapestry, Morning", category = "Tapestries", cost = 120, weight = 5 }, -- TR
	["120"] = { id = "t_imp_furn_tapestry_29", newId = "jsmk_fc_t_imp_furn_tapestry_29", name = "Tapestry, Indigo", category = "Tapestries", cost = 120, weight = 5 }, -- TR

	-- Cushion pack: All Cushion needs to be named exactly "Cushion"
	["121"] = { id = "furn_de_cushion_round_01", newId = "jsmk_fc_furn_de_cushion_round01", name = "Cushion, Round", category = "Seats", cost = 30, weight = 3, scale = 0.9, ashlandersAvailable = true }, -- MW
	["122"] = { id = "furn_de_cushion_round_02", newId = "jsmk_fc_furn_de_cushion_round02", name = "Cushion, Round", category = "Seats", cost = 30, weight = 3, scale = 0.89,
             ashlandersAvailable = true }, -- MW
	["123"] = { id = "furn_de_cushion_round_04", newId = "jsmk_fc_furn_de_cushion_round04", name = "Cushion, Round", category = "Seats", cost = 30, weight = 3, scale = 0.9, ashlandersAvailable = true }, -- MW
	["124"] = { id = "furn_de_cushion_round_07", newId = "jsmk_fc_furn_de_cushion_round07", name = "Cushion, Round", category = "Seats", cost = 30, weight = 3, scale = 0.89,
             ashlandersAvailable = true }, -- MW
	["125"] = { id = "furn_de_cushion_square_01", newId = "jsmk_fc_furn_de_cushionsquare01", name = "Cushion, Square", category = "Seats", cost = 30, weight = 3, ashlandersAvailable = true }, -- MW       
	["126"] = { id = "furn_de_cushion_square_02", newId = "jsmk_fc_furn_de_cushionsquare02", name = "Cushion, Square", category = "Seats", cost = 30, scale = 0.667 }, -- MW
	["127"] = { id = "furn_de_cushion_square_05", newId = "jsmk_fc_furn_de_cushionsquare05", name = "Cushion, Square", category = "Seats", cost = 30, weight = 3, ashlandersAvailable = true }, -- MW       
	["128"] = { id = "furn_de_cushion_square_06", newId = "jsmk_fc_furn_de_cushionsquare06", name = "Cushion, Square", category = "Seats", cost = 30, weight = 3, ashlandersAvailable = true }, -- MW

	-- TR Wood Dunmer rm
	["129"] = { id = "ab_furn_demidbench", newId = "jsmk_fc_", name = "Bench", category = "Seats", cost = 50, weight = 10 }, -- OAAB
	["130"] = { id = "ab_furn_demidscrollrack", newId = "jsmk_fc_", name = "Scroll Rack", category = "Shelves", cost = 300, weight = 30 }, -- OAAB
	["131"] = { id = "ab_furn_demidshelf", newId = "jsmk_fc_", name = "Shelf", category = "Shelves", cost = 50, weight = 10 }, -- OAAB
	["132"] = { id = "ab_furn_demidtable01", newId = "jsmk_fc_", name = "Large Table", category = "Tables", cost = 100, weight = 20 }, -- OAAB
	["133"] = { id = "t_de_furnm_bed_b_01", newId = "jsmk_fc_", name = "Bunk Bed, Green", category = "Beds", cost = 300, weight = 40 }, -- TR
	["134"] = { id = "t_de_furnm_bed_d_02", newId = "jsmk_fc_", name = "Double Bed, Brown", category = "Beds", cost = 300, weight = 40 }, -- TR
	["135"] = { id = "t_de_furnm_bed_s_03", newId = "jsmk_fc_", name = "Single Bed, Olive", category = "Beds", cost = 150, weight = 30 }, -- TR
	["136"] = { id = "t_de_furnm_bookshelf_01", newId = "jsmk_fc_", name = "Bookshelf", category = "Shelves", cost = 600, weight = 40 }, -- TR
	["137"] = { id = "t_de_furnm_chair_01", newId = "jsmk_fc_", name = "Chair", category = "Seats", cost = 30, weight = 5 }, -- TR
	["138"] = { id = "t_de_furnm_bench_01", newId = "jsmk_fc_", name = "Bench", category = "Seats", cost = 50, weight = 10 }, -- TR
	["139"] = { id = "t_de_furnm_table_01", newId = "jsmk_fc_", name = "Table", category = "Tables", cost = 100, weight = 20 }, -- TR
	["140"] = { id = "t_de_furnm_table_03", newId = "jsmk_fc_", name = "Table", category = "Tables", cost = 50, weight = 10 }, -- TR

	-- Skyrim Wood pack
	["141"] = { id = "t_nor_furnm_bar_04", newId = "jsmk_fc_", name = "Bar", category = "Tables", cost = 100, weight = 20 }, -- SKY
	["142"] = { id = "t_imp_furnsky_bench_01a", newId = "jsmk_fc_", name = "Bench, Nordic", category = "Seats", cost = 50, weight = 10 }, -- SKY
	["143"] = { id = "t_nor_furnm_bookshelf_01", newId = "jsmk_fc_", name = "Bookshelf", category = "Shelves", cost = 150, weight = 30 }, -- SKY
	["144"] = { id = "t_nor_furnm_chair_01", newId = "jsmk_fc_", name = "Chair, Nordic", category = "Seats", cost = 25, weight = 5 }, -- SKY
	["145"] = { id = "t_nor_furnm_table_01", newId = "jsmk_fc_", name = "Table", category = "Tables", cost = 100, weight = 20 }, -- SKY
	["146"] = { id = "t_imp_furnsky_table_01", newId = "jsmk_fc_", name = "Table", category = "Tables", cost = 100, weight = 20 }, -- SKY
	["147"] = { id = "t_imp_furnsky_table_03", newId = "jsmk_fc_", name = "Table", category = "Tables", cost = 100, weight = 20 }, -- SKY
	["148"] = { id = "t_skycom_var_cr6empty", newId = "jsmk_fc_", name = "Crate", category = "Containers", cost = 10, weight = 5 }, -- SKY
	["149"] = { id = "t_skynor_furnm_cb1empty", newId = "jsmk_fc_", name = "Cupboard", category = "Containers", cost = 100, weight = 20 }, -- SKY
	["150"] = { id = "t_skynor_furnm_cl1empty", newId = "jsmk_fc_", name = "Closet", category = "Containers", cost = 400, weight = 40 }, -- SKY

	-- Metal Silver pack
	["154"] = { id = "ab_light_comsconsilvblu_128", newId = "jsmk_fc_", name = "Silver Sconce, Blue Candles", category = "Lights", cost = 12, weight = 7 }, -- OAAB
	["155"] = { id = "ab_light_comsconsilvwht_128", newId = "jsmk_fc_", name = "Silver Sconce, White Candles", category = "Lights", cost = 12, weight = 7 }, -- OAAB        
	["156"] = { id = "t_imp_furn_incense_02_16", newId = "jsmk_fc_", name = "Silver Incense", category = "Lights", cost = 12, weight = 4 }, -- PC

	-- More Lights pack
	["157"] = { id = "light_com_candle_07", newId = "jsmk_fc_", name = "Candles, Orange", category = "Lights", cost = 12, weight = 4, ashlandersAvailable = true }, -- MW    
	["158"] = { id = "light_com_candle_11", newId = "jsmk_fc_", name = "Candles Three Blue, Blue Flame", category = "Lights", cost = 12, weight = 4 }, -- MW
	["159"] = { id = "light_com_candle_13", newId = "jsmk_fc_", name = "Candles, Red", category = "Lights", cost = 12, weight = 4 }, -- MW
	["163"] = { id = "light_de_lantern_04", newId = "jsmk_fc_", name = "Paper Lantern, Orange", category = "Lights", cost = 12, weight = 3 }, -- MW
	["166"] = { id = "light_de_streetlight_01", newId = "jsmk_fc_", name = "Street Light, Orange", category = "Lights", cost = 12, weight = 3 }, -- MW
	["167"] = { id = "ab_light_delantpapergrn00_256", newId = "jsmk_fc_", name = "Paper Lantern, Green", category = "Lights", cost = 12, weight = 3 }, -- OAAB
	["168"] = { id = "ab_light_delantglassblu01_256", newId = "jsmk_fc_", name = "Glass Lantern, Blue", category = "Lights", cost = 12, weight = 3 }, -- OAAB

	-- Swirlwood pack
	["170"] = { id = "active_de_r_bed_01", newId = "jsmk_fc_", name = "Single Bed, Aqua", category = "Beds", cost = 150, weight = 40 }, -- MW
	["171"] = { id = "furn_de_r_bench_01", newId = "jsmk_fc_", name = "Bench, Swirlwood", category = "Seats", cost = 55, weight = 10 }, -- MW
	["172"] = { id = "furn_de_r_bookshelf_02", newId = "jsmk_fc_", name = "Bookshelf", category = "Shelves", cost = 120, weight = 35 }, -- MW
	["173"] = { id = "furn_de_r_table_03", newId = "jsmk_fc_", name = "Oval Table", category = "Tables", cost = 150, weight = 40 }, -- MW
	["174"] = { id = "furn_de_r_table_07", newId = "jsmk_fc_", name = "Large Table, Swirlwood", category = "Tables", cost = 140, weight = 35 }, -- MW
	["175"] = { id = "furn_de_r_table_09", newId = "jsmk_fc_", name = "Table", category = "Tables", cost = 70, weight = 20 }, -- MW
	["176"] = { id = "de_r_drawers_01_empty", newId = "jsmk_fc_", name = "Dresser", category = "Containers", cost = 180, weight = 35 }, -- MW
	["177"] = { id = "ab_furn_derchbookshelftall", newId = "jsmk_fc_", name = "Bookshelf", category = "Shelves", cost = 200, weight = 40 }, -- OAAB
	["178"] = { id = "t_de_furnr_bookstand_01", newId = "jsmk_fc_", name = "Bookstand", category = "Other", cost = 100, weight = 5 }, -- TR
	["179"] = { id = "t_de_furnr_chair_01", newId = "jsmk_fc_", name = "Chair, Swirlwood", category = "Seats", cost = 50, weight = 5 }, -- TR
	["180"] = { id = "t_mwde_furnr_ds1empty", newId = "jsmk_fc_", name = "Desk", category = "Containers", cost = 200, weight = 35 }, -- TR

	-- Cherry Wood pack
	["181"] = { id = "active_com_bed_01", newId = "jsmk_fc_", name = "Single Bed, Blue", category = "Beds", cost = 225, weight = 40 }, -- MW
	["182"] = { id = "furn_com_r_bookshelf_01", newId = "jsmk_fc_", name = "Bookshelf, Cherry Wood", category = "Shelves", cost = 100, weight = 40 }, -- MW
	["183"] = { id = "furn_com_r_chair_01", newId = "jsmk_fc_", name = "Chair, Cherry Wood", category = "Seats", cost = 60, weight = 20 }, -- MW
	["184"] = { id = "furn_com_r_table_01", newId = "jsmk_fc_", name = "Table, Cherry Wood", category = "Tables", cost = 100, weight = 40 }, -- MW
	["185"] = { id = "com_drawers_01", newId = "jsmk_fc_", name = "Chest of Drawers, Cherry Wood", category = "Containers", cost = 120, weight = 35 }, -- MW
	["186"] = { id = "ab_o_comrchfootlckempty", newId = "jsmk_fc_", name = "Footlocker, Cherry Wood", category = "Containers", cost = 65, weight = 20 }, -- OAAB
	["187"] = { id = "ab_o_comrchdesk2empty", newId = "jsmk_fc_", name = "Desk, Cherry Wood", category = "Containers", cost = 200, weight = 35 }, -- OAAB
	["188"] = { id = "t_imp_furnr_shelf_01", newId = "jsmk_fc_", name = "Shelf, Cherry Wood", category = "Shelves", cost = 60, weight = 10 }, -- PC
	["189"] = { id = "t_cyrimp_furnr_display1", newId = "jsmk_fc_", name = "Display Case", category = "Containers", cost = 360, weight = 40 }, -- PC
	["190"] = { id = "t_cyrimp_furnr_ht1empty", newId = "jsmk_fc_", name = "Hutch", category = "Containers", cost = 360, weight = 40 }, -- PC
	["191"] = { id = "t_cyrimp_furnr_lc1empty", newId = "jsmk_fc_", name = "Lecturn", category = "Containers", cost = 120, weight = 15 }, -- PC

	-- Urn pack
	["192"] = { id = "furn_planter_01", newId = "jsmk_fc_", name = "Planter Small, AI Soil", category = "Planters", cost = 40, weight = 15 }, -- MW
	["193"] = { id = "furn_planter_02", newId = "jsmk_fc_", name = "Planter Med, AI Soil", category = "Planters", cost = 80, weight = 30, scale = 0.64 }, -- MW
	["194"] = { id = "furn_planter_04", newId = "jsmk_fc_", name = "Planter Large", category = "Planters", cost = 120, weight = 40, scale = 0.76 }, -- MW
	["195"] = { id = "urn_01", newId = "jsmk_fc_", name = "Urn", category = "Containers", cost = 30, weight = 20, ashlandersAvailable = true }, -- MW
	["196"] = { id = "urn_02", newId = "jsmk_fc_", name = "Urn", category = "Containers", cost = 120, weight = 6, scale = 0.7, ashlandersAvailable = true }, -- MW
	["197"] = { id = "ab_furn_deflagon_01", newId = "jsmk_fc_", name = "Flagon", category = "Other", cost = 20, weight = 15, scale = 0.66 }, -- OAAB
	["198"] = { id = "ab_furn_deplanter01ash", newId = "jsmk_fc_", name = "Planter, Ashland Soil", category = "Planters", cost = 40, weight = 15, scale = 0.5 }, -- OAAB     
	["199"] = { id = "ab_furn_deplanterbonsai", newId = "jsmk_fc_", name = "Planter, Bonsai", category = "Planters", cost = 50, weight = 15, scale = 0.5 }, -- OAAB
	["200"] = { id = "ab_o_urnash_01", newId = "jsmk_fc_", name = "Urn", category = "Containers", cost = 100, weight = 15 }, -- OAAB
	["201"] = { id = "t_de_furn_urnopen_01", newId = "jsmk_fc_", name = "Urn, Open", category = "Other", cost = 30, weight = 20 }, -- TR
	["203"] = { id = "t_mwde_furn_urntapempty", newId = "jsmk_fc_", name = "Urn, with Tapestry", category = "Containers", cost = 40, weight = 20 }, -- TR

	--- Plant pack
	["204"] = { id = "flora_bc_fern_03", newId = "jsmk_fc_", name = "Fern", category = "Plants", cost = 10, weight = 1, scale = 0.5 }, -- MW
	["205"] = { id = "flora_bc_mushroom_01", newId = "jsmk_fc_", name = "Luminous Russula", category = "Plants", cost = 100, weight = 1, scale = 0.5 }, -- MW
	["206"] = { id = "flora_bc_mushroom_06", newId = "jsmk_fc_", name = "Violet Coprinus", category = "Plants", cost = 100, weight = 1, scale = 0.5 }, -- MW
	["207"] = { id = "flora_grass_01", newId = "jsmk_fc_", name = "Grass", category = "Plants", cost = 10, weight = 1, scale = 1.43 }, -- MW
	["208"] = { id = "flora_ivy_01", newId = "jsmk_fc_", name = "Ivy", category = "Plants", cost = 10, weight = 1 }, -- MW
	["209"] = { id = "ab_f_bluekanet_01", newId = "jsmk_fc_", name = "Blue Kanet", category = "Plants", cost = 100, weight = 1 }, -- OAAB
	["210"] = { id = "ab_f_harrada_01", newId = "jsmk_fc_", name = "Harrada", category = "Plants", cost = 100, weight = 1 }, -- OAAB

	-- Unorganized
	["211"] = { id = "chest_small_02", newId = "jsmk_fc_", name = "Small Chest", category = "Containers", cost = 30, weight = 3 }, -- MW
	["212"] = { id = "com_chest_01", newId = "jsmk_fc_", name = "Chest", category = "Containers", cost = 15, weight = 8 }, -- MW
	["213"] = { id = "furn_com_coatofarms_01", newId = "jsmk_fc_", name = "Coat of Arms, Eagles", category = "Other", cost = 200, weight = 5 }, -- MW
	["214"] = { id = "furn_com_coatofarms_02", newId = "jsmk_fc_", name = "Coat of Arms, Beasts", category = "Other", cost = 200, weight = 5 }, -- MW
	["215"] = { id = "furn_com_lantern_hook_02", newId = "jsmk_fc_", name = "Lantern Hook", category = "Other", cost = 10, weight = 5 }, -- MW
	["216"] = { id = "furn_com_pm_stool_02", newId = "jsmk_fc_", name = "Stool", category = "Seats", cost = 20, weight = 5 }, -- MW
	["217"] = { id = "ab_furn_comincense01", newId = "jsmk_fc_", name = "Incense", category = "Other", cost = 100, weight = 5, ashlandersAvailable = true }, -- OAAB
	["218"] = { id = "ab_furn_lwbowlwater", newId = "jsmk_fc_", name = "Limeware Bowl of Water", category = "Water", cost = 200, weight = 5, ashlandersAvailable = true }, -- OAAB
	["219"] = { id = "ab_furn_pracmarkstarget02", newId = "", name = "Marksman Pratice Target", category = "Other", cost = 200, weight = 5, ashlandersAvailable = true }, -- OAAB
	["220"] = { id = "active_de_p_bed_28", newId = "jsmk_fc_", name = "Hammock", category = "Beds", cost = 50, weight = 10, ashlandersAvailable = true }, -- MW
	["221"] = { id = "furn_de_rope_03", newId = "jsmk_fc_", name = "Rope", category = "Ropes", cost = 10, weight = 1, ashlandersAvailable = true }, -- MW
	["222"] = { id = "furn_de_shack_basket_01", newId = "jsmk_fc_", name = "Basket", category = "Other", cost = 20, weight = 5, ashlandersAvailable = true }, -- MW
	["223"] = { id = "furn_de_shack_basket_02", newId = "jsmk_fc_", name = "Basket", category = "Other", cost = 20, weight = 5, ashlandersAvailable = true }, -- MW
	["224"] = { id = "furn_de_shack_hook", newId = "jsmk_fc_", name = "Iron Hook", category = "Other", cost = 10, weight = 1 }, -- MW
	["225"] = { id = "light_de_candle_07", newId = "jsmk_fc_", name = "Candle, Orange", category = "Lights", cost = 12, weight = 5 }, -- MW
	["226"] = { id = "t_nor_furnp_table_01", newId = "jsmk_fc_", name = "Table, Nordic", category = "Tables", cost = 120, weight = 35 }, -- SKY
	["227"] = { id = "furn_rug_bearskin", newId = "jsmk_fc_", name = "Rug, Bearskin", category = "Rugs", cost = 100, weight = 2, scale = 1.5 }, -- MW
	["228"] = { id = "t_nor_furn_chandelier01_256", newId = "jsmk_fc_", name = "Chandelier, Nordic", category = "Lights", cost = 120, weight = 5 }, -- SKY
	["229"] = { id = "ex_siltstrider_02", newId = "jsmk_fc_", name = "Silt Strider Shell", category = "Other", cost = 120, weight = 35, scale = 0.82, ashlandersOnly = true }, -- MW
	["230"] = { id = "flora_ash_grass_r_01", newId = "", name = "Grass, Ashland", category = "Plants", cost = 10, weight = 1, scale = 0.9, ashlandersAvailable = true }, -- MW
	["231"] = { id = "active_de_bedroll", newId = "jsmk_fc_", name = "Bedroll", category = "Beds", cost = 50, weight = 5, ashlandersAvailable = true }, -- MW
	["232"] = { id = "light_ashl_lantern_03", newId = "jsmk_fc_", name = "Lantern, Ashlanders", category = "Lights", cost = 12, weight = 5, ashlandersOnly = true }, -- MW   
	["233"] = { id = "com_basket_01_empty", newId = "jsmk_fc_", name = "Basket", category = "Containers", cost = 20, weight = 5, ashlandersAvailable = true }, -- MW
	["234"] = { id = "furn_de_basket_01", newId = "jsmk_fc_", name = "Basket", category = "Other", cost = 20, weight = 5, ashlandersAvailable = true }, -- MW
	["235"] = { id = "in_ashl_tent_banner_02", newId = "jsmk_fc_", name = "Banner, Ashlanders", category = "Tapestries", cost = 120, weight = 5, ashlandersOnly = true }, -- MW
	["236"] = { id = "in_ashl_tent_banner_08", newId = "jsmk_fc_", name = "Banner, Ashlanders", category = "Tapestries", cost = 120, weight = 5, ashlandersOnly = true }, -- MW
	["237"] = { id = "in_ashl_tent_banner_12", newId = "jsmk_fc_", name = "Banner, Ashlanders", category = "Tapestries", cost = 120, weight = 5, ashlandersOnly = true }, -- MW
	["238"] = { id = "t_de_var_guarskin_01", newId = "jsmk_fc_", name = "Guar Skin", category = "Tapestries", cost = 120, weight = 5, ashlandersAvailable = true }, -- TR     
	["239"] = { id = "furn_de_cushion_square_03", newId = "jsmk_fc_", name = "Cushion", category = "Seats", cost = 30, weight = 3, ashlandersAvailable = true }, -- MW       
	["240"] = { id = "in_ashl_tent_banner_09", newId = "jsmk_fc_", name = "Banner, Ashlanders", category = "Tapestries", cost = 120, weight = 5, ashlandersOnly = true }, -- MW
	["241"] = { id = "light_ashl_lantern_02", newId = "jsmk_fc_", name = "Lantern, Ashlanders", category = "Lights", cost = 12, weight = 5, ashlandersOnly = true }, -- MW   
	["242"] = { id = "light_de_candle_02", newId = "jsmk_fc_", name = "Candle, White", category = "Lights", cost = 12, weight = 5, ashlandersAvailable = true }, -- MW
	["243"] = { id = "t_mwde_furn_vs1empty", newId = "jsmk_fc_", name = "Vase", category = "Containers", cost = 60, weight = 20, scale = 0.8, ashlandersAvailable = true }, -- TR
	["244"] = { id = "t_mwde_furn_vs2empty", newId = "jsmk_fc_", name = "Vase", category = "Containers", cost = 60, weight = 20, scale = 0.7, ashlandersAvailable = true }, -- TR
	["245"] = { id = "t_mwde_furn_vs3empty", newId = "jsmk_fc_", name = "Vase", category = "Containers", cost = 60, weight = 20, scale = 0.5, ashlandersAvailable = true }, -- TR
	["246"] = { id = "urn_03", newId = "jsmk_fc_", name = "Urn", category = "Containers", cost = 30, weight = 20, ashlandersAvailable = true }, -- MW
	["247"] = { id = "urn_05", newId = "jsmk_fc_", name = "Urn", category = "Containers", cost = 30, weight = 20, ashlandersAvailable = true, scale = 0.5 }, -- MW
	["248"] = { id = "furn_de_cushion_round_06", newId = "jsmk_fc_", name = "Cushion", category = "Seats", cost = 30, weight = 3, scale = 0.8, ashlandersAvailable = true }, -- MW
	["249"] = { id = "furn_de_p_bench_04", newId = "jsmk_fc_", name = "Bench", category = "Seats", cost = 30, weight = 5, ashlandersAvailable = true }, -- MW
	["250"] = { id = "light_de_candle_08", newId = "jsmk_fc_", name = "Candle, White", category = "Lights", cost = 12, weight = 5, ashlandersAvailable = true }, -- MW
	["252"] = { id = "t_mwcom_var_bss1empty", newId = "jsmk_fc_", name = "Basket", category = "Containers", cost = 20, weight = 10, ashlandersAvailable = true }, -- TR       
	["253"] = { id = "t_mwde_furn_vs4food", newId = "jsmk_fc_", name = "Vase", category = "Containers", cost = 60, weight = 20, scale = 0.6, ashlandersAvailable = true }, -- TR
	["254"] = { id = "ab_furn_ashlincense", newId = "jsmk_fc_", name = "Incense, Ashlanders", category = "Other", cost = 100, weight = 5, ashlandersOnly = true }, -- OAAB   
	["255"] = { id = "ab_furn_ashlskull_02", newId = "jsmk_fc_", name = "Skulls, Ashlanders", category = "Other", cost = 100, weight = 5, ashlandersOnly = true }, -- OAAB   
	["256"] = { id = "furn_de_rope_07", newId = "jsmk_fc_", name = "Rope", category = "Ropes", cost = 10, weight = 1, ashlandersAvailable = true }, -- MW
	["257"] = { id = "ab_furn_ashlskull_03", newId = "jsmk_fc_", name = "Skulls, Ashlanders", category = "Other", cost = 150, weight = 10, ashlandersOnly = true }, -- OAAB   
	["258"] = { id = "furn_de_cushion_square_08", newId = "jsmk_fc_", name = "Cushion", category = "Seats", cost = 30, weight = 3, scale = 0.8, ashlandersAvailable = true }, -- MW
	["259"] = { id = "furn_de_rope_05", newId = "jsmk_fc_", name = "Rope", category = "Ropes", cost = 10, weight = 1, scale = 1.08, ashlandersAvailable = true }, -- MW      
	["260"] = { id = "light_de_candle_01", newId = "jsmk_fc_", name = "Candle, White", category = "Lights", cost = 12, weight = 5 }, -- MW
	["261"] = { id = "t_rga_furn_mat_02", newId = "jsmk_fc_", name = "Mat, Red", category = "Rugs", cost = 120, weight = 5 }, -- PC
	["262"] = { id = "light_ashl_lantern_01", newId = "jsmk_fc_", name = "Lantern, Ashlanders", category = "Lights", cost = 12, weight = 5, ashlandersOnly = true }, -- MW   
	["263"] = { id = "light_ashl_lantern_07", newId = "jsmk_fc_", name = "Lantern, Ashlanders", category = "Lights", cost = 12, weight = 5, ashlandersOnly = true }, -- MW 
	["265"] = { id = "t_de_furn_rug_06", newId = "jsmk_fc_", name = "Rug", category = "Rugs", cost = 120, weight = 6, scale = 0.5, ashlandersAvailable = true }, -- TR
	["266"] = { id = "furn_ashl_bugbowl", newId = "jsmk_fc_", name = "Bug Bowl, Ashlanders", category = "Other", cost = 40, weight = 5, ashlandersOnly = true }, -- MW       
	["267"] = { id = "ab_furn_debasket_01", newId = "jsmk_fc_", name = "Basket", category = "Other", cost = 20, weight = 5, ashlandersAvailable = true }, -- OAAB
	["268"] = { id = "ab_o_ashltrinketbox", newId = "jsmk_fc_", name = "Trinket Box", category = "Containers", cost = 340, weight = 5, scale = 0.6, ashlandersOnly = true }, -- OAAB
	["269"] = { id = "flora_wickwheat_01", newId = "jsmk_fc_", name = "Wickwheat", category = "Plants", cost = 100, weight = 1, scale = 0.6, ashlandersAvailable = true }, -- MW
	["270"] = { id = "furn_ashl_bugbowl_02", newId = "jsmk_fc_", name = "Bug Bowl, Ashlanders", category = "Other", cost = 40, weight = 5, ashlandersOnly = true }, -- MW
	["272"] = { id = "t_de_furn_rugsmall_01", newId = "jsmk_fc_", name = "Rug", category = "Rugs", cost = 60, weight = 6, scale = 0.5, ashlandersAvailable = true }, -- TR
	["273"] = { id = "ab_furn_barrel01water", newId = "jsmk_fc_", name = "Barrel of Water", category = "Water", cost = 40, weight = 6 }, -- OAAB
	["274"] = { id = "ab_furn_ropecoilhang", newId = "jsmk_fc_", name = "Coil of Rope", category = "Ropes", cost = 30, weight = 2 }, -- OAAB
	["275"] = { id = "ab_furn_deplnbookshelf01", newId = "jsmk_fc_", name = "Bookshelf, Cheap", category = "Shelves", cost = 60, weight = 6, notForSale = true }, -- OAAB, dupe for furn_de_p_bookshelf_01
	["276"] = { id = "ab_furn_deplntable04", newId = "jsmk_fc_", name = "Large Table, Cheap", category = "Tables", cost = 100, weight = 6, notForSale = true }, -- OAAB, dupe for furn_de_p_table_04
	["277"] = { id = "ab_furn_ropehang01", newId = "jsmk_fc_", name = "Rope", category = "Ropes", cost = 10, weight = 1 }, -- OAAB   
	["278"] = { id = "ab_furn_velincense01", newId = "jsmk_fc_", name = "Incense, Velothi", category = "Other", cost = 100, weight = 5 }, -- OAAB
	["279"] = { id = "ab_light_delantpaperblu01_256", newId = "jsmk_fc_", name = "Paper Lantern, Blue", category = "Lights", cost = 12, weight = 3 }, -- OAAB
	["280"] = { id = "ab_o_satchelingbasic", newId = "jsmk_fc_", name = "Satchel, Alchemist's", category = "Containers", cost = 50, weight = 3 }, -- OAAB
	["281"] = { id = "active_de_bed_30", newId = "jsmk_fc_", name = "Hammock", category = "Beds", cost = 50, weight = 10 }, -- MW
	["282"] = { id = "chest_small_01_empty", newId = "jsmk_fc_", name = "Small Chest", category = "Containers", cost = 30, weight = 3 }, -- MW
	["283"] = { id = "furn_de_ex_stool_01", newId = "jsmk_fc_", name = "Stool, Cheap", category = "Seats", cost = 10, weight = 4 }, -- MW
	["284"] = { id = "furn_de_r_chair_03", newId = "jsmk_fc_", name = "Chair, Swirlwood", category = "Seats", cost = 10, weight = 4 }, -- MW
	["285"] = { id = "aatl_furn_com_haypile", newId = "jsmk_fc_", name = "Hay Pile", category = "Other", cost = 10, weight = 1, scale = 1.56 }, -- AATL
	["286"] = { id = "aatl_furn_redoranaltar", newId = "jsmk_fc_", name = "Redoran Altar", category = "Other", cost = 10, weight = 1 }, -- AATL
	["287"] = { id = "ab_ex_derack02", newId = "jsmk_fc_", name = "Rack, Wooden", category = "Other", cost = 20, weight = 10 }, -- OAAB
	["288"] = { id = "ab_ex_velchimney", newId = "jsmk_fc_", name = "Chimney, Velothi", category = "Structures", cost = 20, weight = 10 }, -- OAAB
	["289"] = { id = "ab_f_dustcap_04", newId = "jsmk_fc_", name = "Dustcap", category = "Plants", cost = 100, weight = 1, scale = 0.78 }, -- OAAB
	["290"] = { id = "ab_f_fomentarius_03", newId = "jsmk_fc_", name = "Blistering Fomentarius", category = "Plants", cost = 100, weight = 1, deprecated = true }, -- OAAB
	["291"] = { id = "ab_f_glowingmuscaria_02", newId = "jsmk_fc_", name = "Glowing Chanterelle", category = "Plants", cost = 100, weight = 1, scale = 0.87 }, -- OAAB
	["292"] = { id = "ab_f_hacklelo3_o", newId = "jsmk_fc_", name = "Hackle-lo", category = "Plants", cost = 100, weight = 1, scale = 0.54 }, -- OAAB
	["293"] = { id = "ab_f_urnula_03", newId = "jsmk_fc_", name = "Veiled Urnula", category = "Plants", cost = 100, weight = 1 }, -- OAAB
	["294"] = { id = "ab_f_viciousmuscaria_02", newId = "jsmk_fc_", name = "Vicious Chanterelle", category = "Plants", cost = 100, weight = 1 }, -- OAAB
	["295"] = { id = "ab_flora_ashknee_01", newId = "jsmk_fc_", name = "Ash Knee", category = "Plants", cost = 10, weight = 5 }, -- OAAB
	["296"] = { id = "ab_furn_comarmorstandiron01", newId = "jsmk_fc_", name = "Armor Stand, Iron", category = "Other", cost = 400, weight = 40 }, -- OAAB
	["297"] = { id = "ab_furn_combucket02hang", newId = "jsmk_fc_", name = "Bucket", category = "Other", cost = 20, weight = 5 }, -- OAAB
	["298"] = { id = "ab_furn_demidchair", newId = "jsmk_fc_", name = "Chair", category = "Seats", cost = 50, weight = 10 }, -- OAAB
	["299"] = { id = "ab_furn_demidwallscreen", newId = "jsmk_fc_", name = "Wallscreen, Middle Class", category = "Other", cost = 100, weight = 10 }, -- OAAB
	["300"] = { id = "ab_furn_deplnloom04", newId = "jsmk_fc_", name = "Loom", category = "Other", cost = 200, weight = 20 }, -- OAAB
	["301"] = { id = "ab_furn_deplntable05", newId = "jsmk_fc_", name = "Small Table, Cheap", category = "Tables", cost = 50, weight = 5, notForSale = true }, -- OAAB, dupe for furn_de_p_table_05
	["302"] = { id = "ab_furn_derchwallscreen", newId = "jsmk_fc_", name = "Wallscreen, Rich", category = "Other", cost = 200, weight = 10 }, -- OAAB
	["303"] = { id = "ab_o_alchjarbgslime", newId = "jsmk_fc_", name = "Jar of Bittergreen Slime", category = "Containers", cost = 50, weight = 1 }, -- OAAB
	["304"] = { id = "ab_o_alchjardreughwax", newId = "jsmk_fc_", name = "Jar of Dreugh Wax", category = "Containers", cost = 50, weight = 1 }, -- OAAB
	["305"] = { id = "ab_o_alchjarresin", newId = "jsmk_fc_", name = "Jar of Resin", category = "Containers", cost = 50, weight = 1 }, -- OAAB
	["306"] = { id = "ab_o_ashlscathecraw", newId = "jsmk_fc_", name = "Scathecraw Bundle", category = "Plants", cost = 50, weight = 1 }, -- OAAB
	["307"] = { id = "ab_o_comclosetthin", newId = "jsmk_fc_", name = "Closet", category = "Containers", cost = 100, weight = 20 }, -- OAAB
	["308"] = { id = "ab_o_comrchdeskpos", newId = "jsmk_fc_", name = "Desk, Cherry Wood", category = "Containers", cost = 200, weight = 35, deprecated = true }, -- OAAB
	["309"] = { id = "ab_o_velothicoffer_01", newId = "jsmk_fc_", name = "Coffer, Velothi", category = "Containers", cost = 100, weight = 5 }, -- OAAB
	["310"] = { id = "ab_r_sfishdeadhang", newId = "jsmk_fc_", name = "Slaughterfish", category = "Containers", cost = 100, weight = 5, deprecated = true }, -- OAAB
	["311"] = { id = "ab_r_sfishsmallhang", newId = "jsmk_fc_", name = "Slaughterfish, Small", category = "Containers", cost = 50, weight = 2, deprecated = true }, -- OAAB
	["312"] = { id = "active_de_r_bed_20", newId = "jsmk_fc_", name = "Double Bed, Red", category = "Beds", cost = 300, weight = 40 }, -- MW
	["313"] = { id = "flora_bc_shelffungus_03", newId = "jsmk_fc_", name = "Hypha Facia", category = "Plants", cost = 100, weight = 1, scale = 0.55 }, -- MW
	["314"] = { id = "flora_black_lichen_02", newId = "jsmk_fc_", name = "Black Lichen", category = "Plants", cost = 100, weight = 1 }, -- MW
	["315"] = { id = "flora_gold_kanet_01", newId = "jsmk_fc_", name = "Gold Kanet Flower", category = "Plants", cost = 100, weight = 0.74 }, -- MW
	["316"] = { id = "flora_heather_01", newId = "jsmk_fc_", name = "Heather", category = "Plants", cost = 100, weight = 0.63 }, -- MW
	["317"] = { id = "furn_com_planter", newId = "jsmk_fc_", name = "Planter, Redware", category = "Planters", cost = 40, weight = 15 }, -- MW
	["318"] = { id = "furn_de_tapestry_05", newId = "jsmk_fc_", name = "Tapestry, Red", category = "Tapestries", cost = 120, weight = 5 }, -- MW
	["319"] = { id = "furn_de_tapestry_08", newId = "jsmk_fc_", name = "Tapestry, Checker", category = "Tapestries", cost = 120, weight = 5 }, -- MW
	["320"] = { id = "furn_de_tray_01", newId = "jsmk_fc_", name = "Tray", category = "Tapestries", cost = 20, weight = 2 }, -- MW
	["322"] = { id = "light_de_lamp_03", newId = "jsmk_fc_", name = "Lamp, Red", category = "Lights", cost = 20, weight = 10 }, -- MW
	["323"] = { id = "light_de_paper_lantern_01", newId = "jsmk_fc_", name = "Paper Lantern, Orange", category = "Lights", cost = 12, weight = 2 }, -- MW
	["324"] = { id = "ab_ex_ashlawning_03", newId = "jsmk_fc_", name = "Awning", category = "Structures", cost = 50, weight = 20, ashlandersAvailable = true }, -- OAAB
	["325"] = { id = "ab_ex_descaffold01", newId = "jsmk_fc_", name = "Scaffold", category = "Structures", cost = 50, weight = 20 }, -- OAAB
	["326"] = { id = "ab_furn_crate03open", newId = "jsmk_fc_", name = "Crate, Open", category = "Other", cost = 20, weight = 10 }, -- OAAB
	["327"] = { id = "ab_furn_detapestrymini04", newId = "jsmk_fc_", name = "Tapestry Mini, Red", category = "Tapestries", cost = 120, weight = 5 }, -- OAAB
	["328"] = { id = "ab_light_delantpaper01_256", newId = "jsmk_fc_", name = "Paper Lantern, Orange", category = "Lights", cost = 12, weight = 2 }, -- OAAB
	["329"] = { id = "ab_furn_barrel01open", newId = "jsmk_fc_", name = "Barrel, Open", category = "Other", cost = 30, weight = 10 }, -- OAAB
	["330"] = { id = "ab_furn_cartwheel", newId = "jsmk_fc_", name = "Cart Wheel", category = "Other", cost = 30, weight = 10 }, -- OAAB
	["331"] = { id = "ab_furn_sackgrain01", newId = "jsmk_fc_", name = "Sack of Grain", category = "Other", cost = 50, weight = 10 }, -- OAAB
	["332"] = { id = "ab_o_crate03", newId = "jsmk_fc_", name = "Crate", category = "Containers", cost = 10, weight = 4 }, -- OAAB
	["333"] = { id = "ab_o_deshkbasket01", newId = "jsmk_fc_", name = "Wicker Basket", category = "Containers", cost = 10, weight = 4 }, -- OAAB
	["334"] = { id = "ab_o_deshkbasket02", newId = "jsmk_fc_", name = "Wicker Basket", category = "Containers", cost = 10, weight = 4 }, -- OAAB
	["335"] = { id = "furn_com_p_shelf_04", newId = "jsmk_fc_", name = "Shelf, Khaki", category = "Shelves", cost = 20, weight = 5 }, -- MW
	["336"] = { id = "furn_com_torch_ring_01", newId = "jsmk_fc_", name = "Torch Ring", category = "Other", cost = 10, weight = 1 }, -- MW
	["338"] = { id = "flora_ashtree_03", newId = "jsmk_fc_", name = "Tree, Ashland", category = "Plants", cost = 100, weight = 10, scale = 1.15 }, -- MW
	["339"] = { id = "flora_red_lichen_01", newId = "jsmk_fc_", name = "Red Lichen", category = "Plants", cost = 100, weight = 1, deprecated = true }, -- MW
	["340"] = { id = "ab_light_delantpaper03_256", newId = "jsmk_fc_", name = "Paper Lantern, Orange", category = "Lights", cost = 12, weight = 2 }, -- OAAB
	["341"] = { id = "furn_de_rope1_01", newId = "jsmk_fc_", name = "Rope", category = "Ropes", cost = 10, weight = 1 }, -- MW
	["342"] = { id = "furn_de_bannerpost_01", newId = "jsmk_fc_", name = "Banner Post", category = "Other", cost = 10, weight = 4 }, -- MW
	["343"] = { id = "furn_banner_temple_01_indoors", newId = "jsmk_fc_", name = "Banner, Tribunal", category = "Tapestries", cost = 100, weight = 1 }, -- MW
	["344"] = { id = "furn_banner_temple_02_indoors", newId = "jsmk_fc_", name = "Banner, Tribunal", category = "Tapestries", cost = 100, weight = 1 }, -- MW
	["345"] = { id = "furn_banner_temple_03_indoors", newId = "jsmk_fc_", name = "Banner, Tribunal", category = "Tapestries", cost = 100, weight = 1 }, -- MW
	["346"] = { id = "furn_de_screen_guar_01", newId = "jsmk_fc_", name = "Wallscreen, Guar Skin", category = "Other", cost = 100, weight = 5 }, -- MW
	["347"] = { id = "furn_de_tapestry_12", newId = "jsmk_fc_", name = "Tapestry, Red", category = "Tapestries", cost = 120, weight = 5 }, -- MW
	["348"] = { id = "furn_de_tapestry_13", newId = "jsmk_fc_", name = "Tapestry, Red", category = "Tapestries", cost = 120, weight = 5 }, -- MW
	["349"] = { id = "light_com_candle_06", newId = "jsmk_fc_", name = "Candles, Red", category = "Lights", cost = 3, weight = 1 }, -- MW
	["350"] = { id = "active_de_p_bed_03", newId = "jsmk_fc_", name = "Bunk Bed, Olive", category = "Beds", cost = 120, weight = 40 }, -- MW
	["351"] = { id = "furn_de_rope_04", newId = "jsmk_fc_", name = "Rope", category = "Ropes", cost = 10, weight = 1, ashlandersAvailable = true }, -- MW
	["352"] = { id = "furn_de_tapestry_01", newId = "jsmk_fc_", name = "Tapestry, Purple", category = "Tapestries", cost = 120, weight = 5 }, -- MW
	["353"] = { id = "light_sconce10", newId = "jsmk_fc_", name = "Sconce", category = "Lights", cost = 10, weight = 3 }, -- MW
	["354"] = { id = "flora_stoneflower_01", newId = "jsmk_fc_", name = "Stoneflower", category = "Plants", cost = 100, weight = 1, scale = 0.5 }, -- MW
	["355"] = { id = "flora_willow_flower_01", newId = "jsmk_fc_", name = "Willow flower", category = "Plants", cost = 100, weight = 1, scale = 0.5 }, -- MW
	["356"] = { id = "light_com_candle_04", newId = "jsmk_fc_", name = "Candles Three Blue, Orange Flame", category = "Lights", cost = 3, weight = 1 }, -- MW
	["357"] = { id = "ab_furn_deeggcrateopen", newId = "jsmk_fc_", name = "Kwama Egg Crate, Open", category = "Other", cost = 20, weight = 10 }, -- MW
	["358"] = { id = "ab_furn_ropeverticallong", newId = "jsmk_fc_", name = "Rope, Long", category = "Ropes", cost = 20, weight = 2 }, -- MW
	["359"] = { id = "ab_light_delantpapergrn03_256", newId = "jsmk_fc_", name = "Paper Lantern, Green", category = "Lights", cost = 12, weight = 2 }, -- OAAB
	["360"] = { id = "ab_o_barrel02group", newId = "jsmk_fc_", name = "Stack of Barrels", category = "Containers", cost = 150, weight = 50 }, -- OAAB
	["361"] = { id = "flora_fire_fern_02", newId = "jsmk_fc_", name = "Fire Fern", category = "Plants", cost = 100, weight = 1, scale = 0.5 }, -- MW
	["362"] = { id = "nm_red_banner_s", newId = "jsmk_fc_", name = "Banner, Redoran", category = "Tapestries", cost = 100, weight = 1 }, -- N'Wah and Mushroom Team
	["363"] = { id = "ab_furn_comcandlered02", newId = "jsmk_fc_", name = "Fake Candles, Red", category = "Lights", cost = 12, weight = 1 }, -- OAAB
	["364"] = { id = "com_sack_02", newId = "jsmk_fc_", name = "Cloth Sack", category = "Containers", cost = 6, weight = 2, ashlandersAvailable = true }, -- MW
	["365"] = { id = "flora_black_anther_01", newId = "jsmk_fc_", name = "Black Anther", category = "Plants", cost = 100, weight = 1 }, -- MW
	["366"] = { id = "flora_muckspunge_01", newId = "jsmk_fc_", name = "Muckspunge", category = "Plants", cost = 100, weight = 1 }, -- MW
	["367"] = { id = "furn_com_cauldron_02", newId = "jsmk_fc_", name = "Cauldron", category = "Other", cost = 100, weight = 10 }, -- MW
	["368"] = { id = "t_mw_flora_bluefoot02", newId = "jsmk_fc_", name = "Bluefoot", category = "Plants", cost = 100, weight = 1 }, -- TR
	["369"] = { id = "t_mw_flora_munzur_01", newId = "jsmk_fc_", name = "Munzur", category = "Plants", cost = 100, weight = 1 }, -- TR
	["370"] = { id = "t_mw_flora_templedom01", newId = "jsmk_fc_", name = "Temple Dome", category = "Plants", cost = 100, weight = 1, scale = 1.4, deprecated = true }, -- TR
	["371"] = { id = "t_mw_flora_terrastree_02", newId = "jsmk_fc_", name = "Terras Tree", category = "Plants", cost = 100, weight = 1, scale = 1.4 }, -- TR
	["372"] = { id = "t_mw_flora_treecine_05", newId = "jsmk_fc_", name = "Cine Tree", category = "Plants", cost = 100, weight = 1, scale = 1.4 }, -- TR
	["373"] = { id = "ex_de_railing_01", newId = "jsmk_fc_", name = "Railing", category = "Ropes", cost = 10, weight = 2 }, -- MW
	["374"] = { id = "ex_de_railing_03", newId = "jsmk_fc_", name = "Railing Pole", category = "Ropes", cost = 10, weight = 2 }, -- MW
	["375"] = { id = "ex_hlaalu_pole_01", newId = "jsmk_fc_", name = "Pole, Horizontal", category = "Structures", cost = 10, weight = 2 }, -- MW
	["376"] = { id = "ex_hlaalu_pole_02", newId = "jsmk_fc_", name = "Pole, Vertical", category = "Structures", cost = 10, weight = 2 }, -- MW
	["377"] = { id = "flora_emp_parasol_03", newId = "jsmk_fc_", name = "Emperpr Parasol", category = "Plants", cost = 100, weight = 20 }, -- MW
	["378"] = { id = "light_de_lantern_05", newId = "jsmk_fc_", name = "Lantern, Orange", category = "Lights", cost = 12, weight = 3 }, -- MW
	["379"] = { id = "t_com_setfarm_box_01", newId = "jsmk_fc_", name = "Box", category = "Other", cost = 5, weight = 1 }, -- PC
	["380"] = { id = "t_com_var_cauldron_02", newId = "jsmk_fc_", name = "Cauldron", category = "Other", cost = 100, weight = 10 }, -- SKY
	["381"] = { id = "t_com_var_nail_01", newId = "jsmk_fc_", name = "Nail", category = "Other", cost = 1, weight = 1, scale = 1.35 }, -- TR
	["382"] = { id = "t_cyr_flora_aloevera02", newId = "jsmk_fc_", name = "Aloe Vera", category = "Plants", cost = 100, weight = 1 }, -- PC
	["383"] = { id = "t_de_set_cart_01", newId = "jsmk_fc_", name = "Cart", category = "Other", cost = 100, weight = 10 }, -- TR
	["384"] = { id = "flora_plant_04", newId = "jsmk_fc_", name = "Meadow Rye", category = "Plants", cost = 100, weight = 1, scale = 0.7 }, -- MW
	["385"] = { id = "furn_de_pathspear_04", newId = "jsmk_fc_", name = "Pathspear", category = "Ropes", cost = 10, weight = 5 }, -- MW
	["386"] = { id = "light_de_lantern_03", newId = "jsmk_fc_", name = "Lantern, Orange", category = "Lights", cost = 12, weight = 3 }, -- MW
	["387"] = { id = "t_com_var_souppot_01", newId = "jsmk_fc_", name = "Soup Pot", category = "Other", cost = 100, weight = 10 }, -- MW
	["388"] = { id = "t_de_furn_tapestry_08", newId = "jsmk_fc_", name = "Tapestry", category = "Tapestries", cost = 120, weight = 5 }, -- TR
	["389"] = { id = "t_de_furn_tapestry_05", newId = "jsmk_fc_", name = "Tapestry", category = "Tapestries", cost = 120, weight = 5 }, -- TR
	["390"] = { id = "t_de_furn_tapestry_21", newId = "jsmk_fc_", name = "Tapestry", category = "Tapestries", cost = 120, weight = 5 }, -- TR
	["391"] = { id = "t_mw_flora_blackrose02", newId = "jsmk_fc_", name = "Black Rose", category = "Plants", cost = 100, weight = 1 }, -- TR
	["392"] = { id = "t_mw_flora_hornlilly01", newId = "jsmk_fc_", name = "Horn Lily", category = "Plants", cost = 100, weight = 1 }, -- TR
	["393"] = { id = "t_mw_flora_nirthfly01", newId = "jsmk_fc_", name = "Nirthfly Stalks", category = "Plants", cost = 100, weight = 1 }, -- TR
	["394"] = { id = "de_r_chest_01", newId = "jsmk_fc_", name = "Chest", category = "Containers", cost = 200, weight = 10 }, -- MW
	["395"] = { id = "ab_o_comchestironempty", newId = "jsmk_fc_", name = "Small Iron Box", category = "Containers", cost = 100, weight = 10 }, -- OAAB
	["399"] = { id = "ab_light_delantpaperred03_256", newId = "jsmk_fc_", name = "Paper Lantern, Red", category = "Lights", cost = 12, weight = 2 }, -- OAAB
	["400"] = { id = "ab_light_delantpaperblu03_256", newId = "jsmk_fc_", name = "Paper Lantern, Blue", category = "Lights", cost = 12, weight = 2 }, -- OAAB
	["401"] = { id = "ab_light_comcandlebluebf01_128", newId = "jsmk_fc_", name = "Candle Blue, Blue Flame", category = "Lights", cost = 12, weight = 2 }, -- OAAB
	["402"] = { id = "ab_light_comcandleblue02_128", newId = "jsmk_fc_", name = "Candle Blue, Orange Flame", category = "Lights", cost = 12, weight = 2 }, -- OAAB
	["403"] = { id = "ab_ex_depalisadegateframe", newId = "jsmk_fc_", name = "Palisade Gate Frame", category = "Structures", cost = 100, weight = 20 }, -- OAAB
	["404"] = { id = "ab_furn_candlewaxblue02", newId = "jsmk_fc_", name = "Candle Wax, Blue", category = "Lights", cost = 6, weight = 1 }, -- OAAB
	["405"] = { id = "ab_furn_candlewaxblue03", newId = "jsmk_fc_", name = "Candle Wax, Blue", category = "Lights", cost = 6, weight = 1 }, -- OAAB
	["406"] = { id = "ab_ex_depalisadepole03", newId = "jsmk_fc_", name = "Palisade Pole", category = "Structures", cost = 20, weight = 5 }, -- OAAB
	["407"] = { id = "ab_furn_ropebase", newId = "jsmk_fc_", name = "Rope", category = "Ropes", cost = 10, weight = 1 }, -- OAAB
	["408"] = { id = "ab_furn_ropecoil", newId = "jsmk_fc_", name = "Coil of Rope", category = "Ropes", cost = 30, weight = 2 }, -- OAAB   
	["409"] = { id = "ab_furn_ropetiesmall", newId = "jsmk_fc_", name = "Rope Tie", category = "Ropes", cost = 10, weight = 1, scale = 0.75 }, -- OAAB   
	["410"] = { id = "ex_coiled_rope", newId = "jsmk_fc_", name = "Coiled Rope", category = "Ropes", cost = 5, weight = 1 }, -- MW
	["411"] = { id = "t_de_set_bannersaintvivec_02", newId = "jsmk_fc_", name = "Banner, Saint Vivec", category = "Tapestries", cost = 100, weight = 5, scale = 2 }, -- TR
	["412"] = { id = "@nb_red_flag", newId = "jsmk_fc_", name = "Flag, Red", category = "Tapestries", cost = 10, weight = 1 }, -- BCOM, We will go to mount Assarnibibi
	["413"] = { id = "@nb_yel_flag", newId = "jsmk_fc_", name = "Flag, Yellow", category = "Tapestries", cost = 10, weight = 1 }, -- BCOM, We will go to mount Assarnibibi
	["414"] = { id = "@nb_blue_flag", newId = "jsmk_fc_", name = "Flag, Blue", category = "Tapestries", cost = 10, weight = 1 }, -- BCOM, We will go to mount Assarnibibi
	["396"] = { id = "kal_red_flag", newId = "jsmk_fc_", name = "Flag, Red", category = "Tapestries", cost = 10, weight = 1, base = "@nb_red_flag" }, -- The Mountain of Fear
	["397"] = { id = "kal_yel_flag", newId = "jsmk_fc_", name = "Flag, Yellow", category = "Tapestries", cost = 10, weight = 1, base = "@nb_yel_flag" }, -- The Mountain of Fear
	["398"] = { id = "kal_blue_flag", newId = "jsmk_fc_", name = "Flag, Blue", category = "Tapestries", cost = 10, weight = 1, base = "@nb_blue_flag" }, -- The Mountain of Fear
	["415"] = { id = "ab_furn_ropewashsusp01", newId = "jsmk_fc_", name = "Clothes Line", category = "Ropes", cost = 50, weight = 5 }, -- OAAB
	["416"] = { id = "ab_ex_deshackladder", newId = "jsmk_fc_", name = "Ladder", category = "Structures", cost = 60, weight = 15 }, -- OAAB
	["417"] = { id = "ex_de_docks_center", newId = "jsmk_fc_", name = "Docks, Center", category = "Structures", cost = 60, weight = 15 }, -- MW
	["418"] = { id = "ex_de_docks_end", newId = "jsmk_fc_", name = "Docks, End", category = "Structures", cost = 60, weight = 15 }, -- MW
	["419"] = { id = "ex_de_oar", newId = "jsmk_fc_", name = "Oar", category = "Other", cost = 10, weight = 1 }, -- MW
	["420"] = { id = "ex_de_rowboat", newId = "jsmk_fc_", name = "Rowboat", category = "Other", cost = 100, weight = 10 }, -- MW
	["421"] = { id = "ex_ship_plank", newId = "jsmk_fc_", name = "Ship Plank", category = "Structures", cost = 10, weight = 2 }, -- MW
	["422"] = { id = "flora_bc_tree_01", newId = "jsmk_fc_", name = "Tree, Bitter Coast", category = "Plants", cost = 200, weight = 30 }, -- MW
	["423"] = { id = "ab_o_cratehlaalu", newId = "jsmk_fc_", name = "Crate, Hlaalu", category = "Containers", cost = 100, weight = 5 }, -- OAAB
	["424"] = { id = "ab_o_cratefg", newId = "jsmk_fc_", name = "Crate, Fighters' Guild", category = "Containers", cost = 100, weight = 5 }, -- OAAB
	["425"] = { id = "ab_light_delantpaper02_256", newId = "jsmk_fc_", name = "Paper Lantern, Orange", category = "Lights", cost = 12, weight = 2 }, -- OAAB
	["427"] = { id = "ab_furn_deplnrug01", newId = "jsmk_fc_", name = "Rug", category = "Rugs", cost = 30, weight = 3 }, -- OAAB
	["428"] = { id = "ab_light_telexballlamp01_256", newId = "jsmk_fc_", name = "Lamp, Telvanni Ball", category = "Lights", cost = 100, weight = 3 }, -- OAAB
	["429"] = { id = "ab_light_telexballspike_300", newId = "jsmk_fc_", name = "Lamp, Telvanni Ball Spike", category = "Lights", cost = 100, weight = 3 }, -- OAAB
	["430"] = { id = "ab_light_delantpaperblu02_256", newId = "jsmk_fc_", name = "Paper Lantern, Blue", category = "Lights", cost = 12, weight = 3 }, -- OAAB
	["431"] = { id = "ab_flora_telshroom01", newId = "jsmk_fc_", name = "Telvanni Mushroom", category = "Structures", cost = 100, weight = 5 }, -- OAAB
	["432"] = { id = "flora_t_mushroom_01", newId = "jsmk_fc_", name = "Telvanni Mushroom", category = "Structures", cost = 100, weight = 5 }, -- MW
	["433"] = { id = "flora_t_shelffungus_01", newId = "jsmk_fc_", name = "Telvanni Mushroom", category = "Structures", cost = 100, weight = 10 }, -- MW
	["434"] = { id = "ab_ex_telplatformroundflat", newId = "jsmk_fc_", name = "Telvanni Platform", category = "Structures", cost = 100, weight = 30 }, -- MW
	["435"] = { id = "ab_ex_telplanter", newId = "jsmk_fc_", name = "Telvanni Planter", category = "Planters", cost = 100, weight = 30 }, -- OAAB
	["436"] = { id = "flora_t_mushroom_02", newId = "jsmk_fc_", name = "Telvanni Mushroom", category = "Structures", cost = 100, weight = 5 }, -- MW
	["437"] = { id = "ex_t_hook", newId = "jsmk_fc_", name = "Telvanni Hook", category = "Structures", cost = 100, weight = 5 }, -- MW
	["438"] = { id = "ab_ex_telrootbranchsmall", newId = "jsmk_fc_", name = "Telvanni Root", category = "Structures", cost = 100, weight = 10 }, -- OAAB
	["439"] = { id = "ab_f_comberryhbundle", newId = "jsmk_fc_", name = "Comberry Hanging Bundle", category = "Plants", cost = 100, weight = 5 }, -- OAAB
	["440"] = { id = "ab_light_telinballlamp01_256", newId = "jsmk_fc_", name = "Lamp, Telvanni Ball", category = "Lights", cost = 100, weight = 3 }, -- OAAB
	["441"] = { id = "ab_misc_dicesingle", newId = "jsmk_fc_", name = "Die", category = "Debug", cost = 0, alwaysInStock = true }, -- OAAB
	["442"] = { id = "furn_uni_weaponrack_01", newId = "jsmk_fc_", name = "Weapon Rack", category = "Other", cost = 100 }, -- MW
	["443"] = { id = "rpnr_ashl_weapon_rack", newId = "jsmk_fc_", name = "Weapon Rack, Ashlander", category = "Other", cost = 100 }, -- BCOM
	["444"] = { id = "rpnr_dr_asrt_p_f_bookcase_02", newId = "jsmk_fc_", name = "Shelves", category = "Other", cost = 100 }, -- BCOM
	["445"] = { id = "t_imp_furnm_weaponrack_01", newId = "jsmk_fc_", name = "Weapon Rack", category = "Other", cost = 100 }, -- TR
	["446"] = { id = "ab_o_comrchdeskempty", newId = "jsmk_fc_", name = "Desk, Cherry Wood", category = "Containers", cost = 200, weight = 35 }, -- OAAB
}

this.furnitureIndices = {}

function this.getFurnitureIndices()
	for index, furniture in pairs(this.furniture) do
		this.furnitureIndices[furniture.id] = index
	end
end

return this
