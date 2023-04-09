local this = {}

this.catalogue = { ["jsmk_fc_catalogue_01"] = true, ["jsmk_fc_catalogue_02"] = true }

---@class furnitureCatalogue.furniture
---@field id string The id of the furniture
---@field name string The name of the furniture
---@field description string?
---@field category string
---@field cost number
---@field size furnitureCatalogue.furniture.size?
---@field alwaysInStock boolean?
---@field scale number?
---@field ashlandersAvailable boolean?
---@field ashlandersOnly boolean?
---@field previewScale number?
---@field previewHeight number?
---@field weight number?

---@alias furnitureCatalogue.furniture.size
---| '"s"'
---| '"m"'
---| '"l"'
---| '"xl"'

this.furniture = {
	-- Oldwood pack
	["001"] = { id = "active_de_p_bed_04", name = "Single Bed, Olive", category = "Beds", cost = 60, weight = 30 },
	["002"] = { id = "dr_asrt_p_f_bookcase_01", name = "Bookcase", category = "Shelves", cost = 30, weight = 5 }, -- DR
	["003"] = { id = "de_p_closet_02", name = "Closet", category = "Containers", cost = 140, weight = 30 }, -- MW
	["004"] = { id = "furn_de_p_bench_03", name = "Cheap Bench", category = "Seats", cost = 15, weight = 5 }, -- MW
	["005"] = { id = "furn_de_p_bookshelf_01", name = "Bookshelf", category = "Shelves", cost = 60, weight = 20, alwaysInStock = true }, -- MW
	["006"] = { id = "furn_de_p_chair_01", name = "Chair", category = "Seats", cost = 15, weight = 5 }, -- MW
	["007"] = { id = "furn_de_p_chair_02", name = "Chair", category = "Seats", cost = 15, weight = 5 }, -- MW
	["008"] = { id = "furn_de_p_shelf_02", name = "Shelf", category = "Shelves", cost = 10, weight = 5 }, -- MW
	["009"] = { id = "furn_de_p_stool_01", name = "Stool", category = "Seats", cost = 10, weight = 5 }, -- MW
	["010"] = { id = "furn_de_p_stool_02", name = "Stool", category = "Seats", cost = 10, weight = 5 }, -- MW
	["011"] = { id = "furn_de_p_table_01", name = "Round Table", category = "Tables", cost = 75, weight = 20 }, -- MW
	["012"] = { id = "furn_de_p_table_02", name = "Small Telvanni Table", category = "Tables", cost = 50, weight = 10 }, -- MW
	["013"] = { id = "furn_de_p_table_04", name = "Large Table", category = "Tables", cost = 100, weight = 30 }, -- MW
	["014"] = { id = "furn_de_p_table_05", name = "End Table", category = "Tables", cost = 40, weight = 10 }, -- MW
	["015"] = { id = "furn_de_p_table_06", name = "Round Table", category = "Tables", cost = 150, weight = 30 }, -- MW
	["016"] = { id = "furn_de_rm_winerack", name = "Winerack", category = "Shelves", cost = 150, weight = 30 }, -- MW
	["018"] = { id = "mwg_vivec_market_05", name = "Market Stand", category = "Shelves", cost = 30, weight = 10 }, -- MwG
	["019"] = { id = "de_p_desk_01", name = "Desk", category = "Containers", cost = 140, weight = 30 }, -- MW
	["020"] = { id = "de_drawers_02", name = "Chest of Drawers", category = "Containers", cost = 140, weight = 30 }, -- MW
	["021"] = { id = "ab_o_deplntable01", name = "End Table", category = "Table", cost = 130, weight = 30 }, -- OAAB
	["022"] = { id = "ab_furn_deplnscrollrack1", name = "Scroll Rack", category = "Shelves", cost = 175, weight = 30 }, -- OAAB
	["023"] = { id = "ab_furn_deplnscrollrack2", name = "Scroll Rack", category = "Shelves", cost = 175, weight = 30 }, -- OAAB

	-- Metal Iron Rusty pack
	["024"] = { id = "light_com_candle_01_64", name = "Iron Candlestick, White", category = "Lights", cost = 3, weight = 0 }, -- MW
	["025"] = { id = "light_com_lamp_01", name = "Lamp", category = "Lights", cost = 20, weight = 10 }, -- MW
	["026"] = { id = "light_com_lamp_02", name = "Lamp", category = "Lights", cost = 20, weight = 10 }, -- MW
	["027"] = { id = "light_com_lantern_01", name = "Lantern", category = "Lights", cost = 10, weight = 5 }, -- MW
	["028"] = { id = "light_de_candle_03", name = "Candle, Orange", category = "Lights", cost = 2, weight = 1 }, -- MW
	["029"] = { id = "light_de_lantern_07", name = "Paper Lantern, Blue", category = "Lights", cost = 10, weight = 3 }, -- MW
	["030"] = { id = "ab_furn_dnghook", name = "Hook", category = "Other", cost = 10, weight = 5, scale = 0.5 }, -- OAAB

	-- Khaki Wood pack
	["031"] = { id = "active_com_bed_03", name = "Single Bed, Brown", category = "Beds", cost = 60, weight = 30 }, -- MW
	["032"] = { id = "furn_com_p_bench_01", name = "Bench", category = "Seats", cost = 15, weight = 5 }, -- MW
	["033"] = { id = "active_com_bunk_02", name = "Bunk Bed, Grey", category = "Beds", cost = 120, weight = 40 }, -- MW
	["034"] = { id = "furn_com_p_shelf_03", name = "Shelf", category = "Shelves", cost = 10, weight = 2 }, -- MW
	["035"] = { id = "furn_com_p_table_01", name = "Table", category = "Tables", cost = 120, weight = 30 }, -- MW
	["036"] = { id = "light_com_chandelier_01", name = "Wooden Chandelier", category = "Lights", cost = 60, weight = 5 }, -- MW
	["037"] = { id = "t_imp_furnp_rack_02", name = "Rack", category = "Shelves", cost = 120, weight = 30 }, -- PC
	["038"] = { id = "t_imp_furnp_wallscreen_01", name = "Wallscreen", category = "Other", cost = 60, weight = 10 }, -- PC
	["039"] = { id = "t_cyrimp_furnp_st1empty", name = "Side Table", category = "Containers", cost = 60, weight = 15 }, -- PC
	["040"] = { id = "t_com_furn_ladder_01", name = "Ladder", category = "Other", cost = 60, weight = 15 }, -- TR

	-- Canvas Wrap pack
	["041"] = { id = "com_sack_01", name = "Sack", category = "Containers", cost = 6, weight = 2, ashlandersAvailable = true }, -- MW
	["042"] = { id = "com_sack_03", name = "Sack", category = "Containers", cost = 6, weight = 2, ashlandersAvailable = true }, -- MW
	["043"] = { id = "furn_com_pm_chair_02", name = "Chair", category = "Seats", cost = 15, weight = 7 }, -- MW
	["044"] = { id = "furn_de_cushion_round_03", name = "Cushion", category = "Seats", cost = 30, weight = 3 }, -- MW
	["045"] = { id = "furn_de_practice_mat", name = "Practice Mat", category = "Rugs", cost = 30, weight = 3 }, -- MW

	-- Skyrim Wood Furniture 01 pack
	["046"] = { id = "t_nor_furnp_bench_01", name = "Bench", category = "Seats", cost = 30, weight = 5 }, -- SKY
	["047"] = { id = "t_nor_furnp_bookshelf_01", name = "Bookshelf", category = "Shelves", cost = 180, weight = 30 }, -- SKY
	["048"] = { id = "t_nor_furnp_chair_01", name = "Chair", category = "Seats", cost = 60, weight = 10 }, -- SKY
	["049"] = { id = "t_nor_furnp_bar_01", name = "Counter", category = "Shelves", cost = 150, weight = 25 }, -- SKY
	["050"] = { id = "t_nor_furnp_shelf_01", name = "Bookshelf", category = "Shelves", cost = 450, weight = 40 }, -- SKY
	["051"] = { id = "t_nor_furnp_shelf_04", name = "Bookshelf", category = "Shelves", cost = 75, weight = 15 }, -- SKY
	["052"] = { id = "t_nor_furnp_stool_01", name = "Stool", category = "Seats", cost = 30, weight = 5 }, -- SKY
	["053"] = { id = "t_nor_furnp_table_02", name = "Round Table", category = "Tables", cost = 150, weight = 30 }, -- SKY
	["054"] = { id = "t_skynor_furnp_cb1empty", name = "Cupboard", category = "Containers", cost = 100, weight = 15 }, -- SKY
	["055"] = { id = "t_skynor_furnp_cl1empty", name = "Closet", category = "Containers", cost = 400, weight = 40 }, -- SKY
	["056"] = { id = "t_skynor_furnp_dw1empty", name = "Drawers", category = "Containers", cost = 200, weight = 20 }, -- SKY
	["057"] = { id = "t_skynor_furnp_ds1empty", name = "Desk", category = "Containers", cost = 100, weight = 15 }, -- SKY

	-- Wood Brown pack
	["058"] = { id = "furn_com_rm_shelf_02", name = "Shelf", category = "Shelves", cost = 20, weight = 10 }, -- MW
	["059"] = { id = "com_chest_02_empty", name = "Chest", category = "Containers", cost = 35, weight = 10, ashlandersAvailable = true }, -- MW
	["060"] = { id = "com_chest_11_empty", name = "Chest", category = "Containers", cost = 25, weight = 8, ashlandersAvailable = true }, -- MW
	["061"] = { id = "crate_01_empty", name = "Crate", category = "Containers", cost = 6, weight = 4 }, -- MW
	["062"] = { id = "furn_com_rm_bookshelf_02", name = "Bookshelf", category = "Shelves", cost = 500, weight = 40 }, -- MW
	["063"] = { id = "furn_com_rm_table_03", name = "Round Table", category = "Tables", cost = 150, weight = 30 }, -- MW
	["064"] = { id = "furn_com_rm_table_04", name = "Table", category = "Tables", cost = 150, weight = 30 }, -- MW
	["065"] = { id = "furn_com_rm_table_05", name = "Small Table", category = "Tables", cost = 50, weight = 10, alwaysInStock = true }, -- MW
	["066"] = { id = "barrel_01_empty", name = "Barrel", category = "Containers", cost = 30, weight = 10, ashlandersAvailable = true }, -- MW
	["067"] = { id = "barrel_02", name = "Barrel", category = "Containers", cost = 40, weight = 15 }, -- MW
	["068"] = { id = "ab_furn_combucket02water", name = "Bucket of Water", category = "Other", cost = 30, weight = 10 }, -- OAAB
	["069"] = { id = "ab_furn_weprackwall", name = "Weapon Rack, Wall", category = "Shelves", cost = 40, weight = 5 }, -- OAAB
	["070"] = { id = "AB_o_Barrel01Group", name = "Stack of Barrels", category = "Containers", cost = 150, weight = 50 }, -- OAAB
	["071"] = { id = "ab_o_comcrate01", name = "Crate", category = "Containers", cost = 3, weight = 2 }, -- OAAB
	["072"] = { id = "t_imp_furnm_bookshelf_04", name = "Bookshelf", category = "Shelves", cost = 250, weight = 20 }, -- PC

	-- Wood Wethered pack
	["073"] = { id = "furn_de_ex_bench_01", name = "Bench", category = "Seats", cost = 25, weight = 10, ashlandersAvailable = true }, -- MW
	["074"] = { id = "furn_de_ex_stool_02", name = "Stool", category = "Seats", cost = 15, weight = 10, ashlandersAvailable = true }, -- MW
	["075"] = { id = "furn_de_ex_table_02", name = "Small Cheap Table", category = "Tables", cost = 35, weight = 25, ashlandersAvailable = true }, -- MW  
	["076"] = { id = "furn_de_ex_table_03", name = "Large Cheap Table", category = "Tables", cost = 50, weight = 30 }, -- MW
	["077"] = { id = "furn_de_lightpost_01", name = "Lightpost", category = "Other", cost = 25, weight = 10 }, -- MW
	["078"] = { id = "light_torch_01", name = "Torch", category = "Lights", cost = 12, weight = 5 }, -- MW
	["079"] = { id = "de_p_chest_02", name = "Chest", category = "Containers", cost = 35, weight = 10 }, -- MW
	["080"] = { id = "ab_furn_deexdisplay01", name = "Display Shelf", category = "Shelves", cost = 50, weight = 20 }, -- OAAB
	["081"] = { id = "ab_furn_deexdisplay02", name = "Display Shelf", category = "Shelves", cost = 75, weight = 30 }, -- OAAB
	["082"] = { id = "ab_o_boxflour", name = "Box of Flour", category = "Containers", cost = 100, weight = 30 }, -- OAAB

	-- Rug pack
	["083"] = { id = "furn_de_rug_01", name = "Small Rectangular Rug", category = "Rugs", cost = 60, weight = 6 }, -- MW
	["084"] = { id = "furn_de_rug_02", name = "Small Rectangular Rug", category = "Rugs", cost = 60, weight = 6, ashlandersAvailable = true }, -- MW     
	["085"] = { id = "furn_de_rug_big_01", name = "Large Oval Rug", category = "Rugs", cost = 120, weight = 6, ashlandersAvailable = true }, -- MW       
	["086"] = { id = "furn_de_rug_big_02", name = "Large Oval Rug", category = "Rugs", cost = 120, weight = 6, scale = 0.8, ashlandersAvailable = true }, -- MW
	["087"] = { id = "furn_de_rug_big_03", name = "Large Oval Rug", category = "Rugs", cost = 120, weight = 6, ashlandersAvailable = true }, -- MW       
	["088"] = { id = "furn_de_rug_big_05", name = "Large Rectangular Rug", category = "Rugs", cost = 120, weight = 6, ashlandersAvailable = true }, -- MW

	["089"] = { id = "furn_de_rug_big_06", name = "Large Rectangular Rug", category = "Rugs", cost = 120, scale = 0.7, weight = 6, ashlanders = true }, -- MW
	["090"] = { id = "furn_de_rug_big_07", name = "Large Rectangular Rug", category = "Rugs", cost = 120, weight = 6 }, -- MW
	["091"] = { id = "furn_de_rug_big_08", name = "Large Oval Rug", category = "Rugs", cost = 120, weight = 6, ashlandersAvailable = true }, -- MW       
	["092"] = { id = "furn_de_rug_big_09", name = "Large Rectangular Rug", category = "Rugs", cost = 120, weight = 6 }, -- MW
	["093"] = { id = "furn_rug_whitewolf", name = "Faux White Wolf Rug", category = "Rugs", cost = 120, weight = 6, scale = 1.2 }, -- MW
	["094"] = { id = "ab_furn_deplnrug00", name = "Large Rectangular Rug", category = "Rugs", cost = 120, weight = 6 }, -- OAAB
	["095"] = { id = "ab_furn_deplnrug02", name = "Large Rectangular Rug", category = "Rugs", cost = 120, weight = 6 }, -- OAAB
	["096"] = { id = "ab_furn_deplnrug03", name = "Large Rectangular Rug", category = "Rugs", cost = 120, weight = 6 }, -- OAAB
	["097"] = { id = "ab_furn_deplnrug06", name = "Large Round Rug", category = "Rugs", cost = 120, weight = 6, scale = 1.22 }, -- OAAB
	["098"] = { id = "ab_furn_deplnrug07", name = "Large Rectangular Rug", category = "Rugs", cost = 120, weight = 6 }, -- OAAB

	-- Tapestry pack
	["099"] = { id = "furn_de_tapestry_02", name = "Tapestry, Tribunal", category = "Tapestries", cost = 120, weight = 5 }, -- MW
	["100"] = { id = "furn_de_tapestry_07", name = "Tapestry, Red", category = "Tapestries", cost = 120, weight = 5 }, -- MW
	["101"] = { id = "furn_de_tapestry_09", name = "Tapestry, Green", category = "Tapestries", cost = 120, weight = 5 }, -- MW
	["102"] = { id = "furn_de_tapestry_10", name = "Tapestry, Blue", category = "Tapestries", cost = 120, weight = 5 }, -- MW
	["103"] = { id = "furn_de_tapestry_11", name = "Tapestry, Purple", category = "Tapestries", cost = 120, weight = 5 }, -- MW
	["104"] = { id = "furn_com_tapestry_01", name = "Tapestry, Forest", category = "Tapestries", cost = 120, weight = 5 }, -- MW
	["105"] = { id = "furn_com_tapestry_02", name = "Tapestry, Blossom", category = "Tapestries", cost = 120, weight = 5 }, -- MW
	["106"] = { id = "furn_com_tapestry_03", name = "Tapestry, Compton", category = "Tapestries", cost = 120, weight = 5 }, -- MW
	["107"] = { id = "furn_com_tapestry_04", name = "Tapestry, Imperial", category = "Tapestries", cost = 120, weight = 5 }, -- MW
	["108"] = { id = "mwg_vivec_market_08", name = "Banners", category = "Tapestries", cost = 120, weight = 5 }, -- MwG
	["109"] = { id = "ab_furn_detapestrymini02", name = "Tapestry Mini, Tribunal", category = "Tapestries", cost = 120, weight = 5 }, -- OAAB
	["110"] = { id = "ab_furn_detapestrymini06", name = "Tapestry Mini, Red", category = "Tapestries", cost = 120, weight = 5 }, -- OAAB
	["111"] = { id = "ab_furn_detapestrymini10", name = "Tapestry Mini, Blue", category = "Tapestries", cost = 120, weight = 5 }, -- OAAB
	["112"] = { id = "ab_furn_detapestrymini13", name = "Tapestry Mini, Purple", category = "Tapestries", cost = 120, weight = 5 }, -- OAAB
	["113"] = { id = "t_imp_furn_tapestry_04", name = "Tapestry, Leaves", category = "Tapestries", cost = 120, weight = 5 }, -- PC
	["114"] = { id = "t_imp_furn_tapestry_05", name = "Tapestry, Grove", category = "Tapestries", cost = 120, weight = 5 }, -- PC
	["115"] = { id = "t_imp_furn_tapestrybastlarge_10", name = "Tapestry, Fern", category = "Tapestries", cost = 120, weight = 5 }, -- SKY
	["116"] = { id = "t_imp_furn_tapestrywoollarge_02", name = "Tapestry, Trellis", category = "Tapestries", cost = 120, weight = 5 }, -- SKY
	["117"] = { id = "t_imp_furn_tapestrywoollarge_06", name = "Tapestry, Wildflower", category = "Tapestries", cost = 120, weight = 5 }, -- SKY
	["118"] = { id = "t_imp_furn_tapestry_18", name = "Tapestry, Golden", category = "Tapestries", cost = 120, weight = 5 }, -- TR
	["119"] = { id = "t_imp_furn_tapestry_28", name = "Tapestry, Morning", category = "Tapestries", cost = 120, weight = 5 }, -- TR
	["120"] = { id = "t_imp_furn_tapestry_29", name = "Tapestry, Indigo", category = "Tapestries", cost = 120, weight = 5 }, -- TR

	-- Cushion pack: All Cushion needs to be named exactly "Cushion"
	["121"] = { id = "furn_de_cushion_round_01", name = "Cushion", category = "Seats", cost = 30, weight = 3, scale = 0.9, ashlandersAvailable = true }, -- MW
	["122"] = { id = "furn_de_cushion_round_02", name = "Cushion", category = "Seats", cost = 30, weight = 3, scale = 0.89, ashlandersAvailable = true }, -- MW
	["123"] = { id = "furn_de_cushion_round_04", name = "Cushion", category = "Seats", cost = 30, weight = 3, scale = 0.9, ashlandersAvailable = true }, -- MW
	["124"] = { id = "furn_de_cushion_round_07", name = "Cushion", category = "Seats", cost = 30, weight = 3, scale = 0.89, ashlandersAvailable = true }, -- MW
	["125"] = { id = "furn_de_cushion_square_01", name = "Cushion", category = "Seats", cost = 30, weight = 3, ashlandersAvailable = true }, -- MW       
	["126"] = { id = "furn_de_cushion_square_02", name = "Cushion", category = "Seats", cost = 30, weight = 3, scale = 0.667, ashlandersAvailable = true }, -- MW
	["127"] = { id = "furn_de_cushion_square_05", name = "Cushion", category = "Seats", cost = 30, weight = 3, ashlandersAvailable = true }, -- MW       
	["128"] = { id = "furn_de_cushion_square_06", name = "Cushion", category = "Seats", cost = 30, weight = 3, ashlandersAvailable = true }, -- MW

	-- TR Wood Dunmer rm
	["129"] = { id = "ab_furn_demidbench", name = "Bench", category = "Seats", cost = 50, weight = 10 }, -- OAAB
	["130"] = { id = "ab_furn_demidscrollrack", name = "Scroll Rack", category = "Shelves", cost = 300, weight = 30 }, -- OAAB
	["131"] = { id = "ab_furn_demidshelf", name = "Shelf", category = "Shelves", cost = 50, weight = 10 }, -- OAAB
	["132"] = { id = "ab_furn_demidtable01", name = "Large Table", category = "Tables", cost = 100, weight = 20 }, -- OAAB
	["133"] = { id = "t_de_furnm_bed_b_01", name = "Bunk Bed, Green", category = "Beds", cost = 300, weight = 40 }, -- TR
	["134"] = { id = "t_de_furnm_bed_d_02", name = "Double Bed, Brown", category = "Beds", cost = 300, weight = 40 }, -- TR
	["135"] = { id = "t_de_furnm_bed_s_03", name = "Single Bed, Olive", category = "Beds", cost = 150, weight = 30 }, -- TR
	["136"] = { id = "t_de_furnm_bookshelf_01", name = "Bookshelf", category = "Shelves", cost = 600, weight = 40 }, -- TR
	["137"] = { id = "t_de_furnm_chair_01", name = "Chair", category = "Seats", cost = 30, weight = 5 }, -- TR
	["138"] = { id = "t_de_furnm_bench_01", name = "Bench", category = "Seats", cost = 50, weight = 10 }, -- TR
	["139"] = { id = "t_de_furnm_table_01", name = "Table", category = "Tables", cost = 100, weight = 20 }, -- TR
	["140"] = { id = "t_de_furnm_table_03", name = "Table", category = "Tables", cost = 50, weight = 10 }, -- TR

	-- Skyrim Wood pack
	["141"] = { id = "t_nor_furnm_bar_04", name = "Bar", category = "Tables", cost = 100, weight = 20 }, -- SKY
	["142"] = { id = "t_imp_furnsky_bench_01a", name = "Bench", category = "Seats", cost = 50, weight = 10 }, -- SKY
	["143"] = { id = "t_nor_furnm_bookshelf_01", name = "Bookshelf", category = "Shelves", cost = 150, weight = 30 }, -- SKY
	["144"] = { id = "t_nor_furnm_chair_01", name = "Chair", category = "Seats", cost = 25, weight = 5 }, -- SKY
	["145"] = { id = "t_nor_furnm_table_01", name = "Table", category = "Tables", cost = 100, weight = 20 }, -- SKY
	["146"] = { id = "t_imp_furnsky_table_01", name = "Table", category = "Tables", cost = 100, weight = 20 }, -- SKY
	["147"] = { id = "t_imp_furnsky_table_03", name = "Table", category = "Tables", cost = 100, weight = 20 }, -- SKY
	["148"] = { id = "t_skycom_var_cr6empty", name = "Crate", category = "Containers", cost = 10, weight = 5 }, -- SKY
	["149"] = { id = "t_skynor_furnm_cb1empty", name = "Cupboard", category = "Containers", cost = 100, weight = 20 }, -- SKY
	["150"] = { id = "t_skynor_furnm_cl1empty", name = "Closet", category = "Containers", cost = 400, weight = 40 }, -- SKY

	-- Metal Silver pack
	["151"] = { id = "light_com_candle_14", name = "Silver Candlestick, Blue", category = "Lights", cost = 12, weight = 4 }, -- MW
	["152"] = { id = "light_com_candle_15", name = "Silver Candlestick, Red", category = "Lights", cost = 12, weight = 4 }, -- MW
	["153"] = { id = "light_com_candle_16", name = "Silver Candlestick, Blue", category = "Lights", cost = 25, weight = 7 }, -- MW
	["154"] = { id = "ab_light_comsconsilvblu_128", name = "Silver Sconce, Blue Candles", category = "Lights", cost = 12, weight = 7 }, -- OAAB
	["155"] = { id = "ab_light_comsconsilvwht_128", name = "Silver Sconce, White Candles", category = "Lights", cost = 12, weight = 7 }, -- OAAB        
	["156"] = { id = "t_imp_furn_incense_02_16", name = "Silver Incense", category = "Lights", cost = 12, weight = 4 }, -- PC

	-- More Lights pack
	["157"] = { id = "light_com_candle_07", name = "Candles, Orange", category = "Lights", cost = 12, weight = 4, ashlandersAvailable = true }, -- MW    
	["158"] = { id = "light_com_candle_11", name = "Candles, Blue", category = "Lights", cost = 12, weight = 4 }, -- MW
	["159"] = { id = "light_com_candle_13", name = "Candles, Red", category = "Lights", cost = 12, weight = 4 }, -- MW
	["160"] = { id = "light_de_candle_blue_02", name = "Bamboo Candlestick, Blue", category = "Lights", cost = 3, weight = 2 }, -- MW
	["161"] = { id = "light_de_candle_ivory_01", name = "Bamboo Candlestick", category = "Lights", cost = 3, weight = 2 }, -- MW
	["162"] = { id = "light_de_lantern_02", name = "Glass Lantern, Blue", category = "Lights", cost = 12, weight = 3 }, -- MW
	["163"] = { id = "light_de_lantern_04", name = "Paper Lantern, Orange", category = "Lights", cost = 12, weight = 3 }, -- MW
	["164"] = { id = "light_de_lantern_05", name = "Paper Lantern, Orange", category = "Lights", cost = 10, weight = 3 }, -- MW
	["165"] = { id = "light_de_lantern_06", name = "Glass Lantern, Orange", category = "Lights", cost = 12, weight = 3 }, -- MW
	["166"] = { id = "light_de_streetlight_01", name = "Street Light, Orange", category = "Lights", cost = 12, weight = 3 }, -- MW
	["167"] = { id = "ab_light_delantpapergrn00_256", name = "Paper Lantern, Green", category = "Lights", cost = 12, weight = 3 }, -- OAAB
	["168"] = { id = "ab_light_delantglassblu01_256", name = "Glass Lantern, Blue", category = "Lights", cost = 12, weight = 3 }, -- OAAB
	["169"] = { id = "ab_light_delantglass02ylw_256", name = "Glass Lantern, Yellow", category = "Lights", cost = 12, weight = 3 }, -- OAAB

	-- Swirlwood pack
	["170"] = { id = "active_de_r_bed_01", name = "Single Bed, Aqua", category = "Beds", cost = 150, weight = 40 }, -- MW
	["171"] = { id = "furn_de_r_bench_01", name = "Bench", category = "Seats", cost = 55, weight = 10 }, -- MW
	["172"] = { id = "furn_de_r_bookshelf_02", name = "Bookshelf", category = "Shelves", cost = 120, weight = 35 }, -- MW
	["173"] = { id = "furn_de_r_table_03", name = "Oval Table", category = "Tables", cost = 150, weight = 40 }, -- MW
	["174"] = { id = "furn_de_r_table_07", name = "Large Table", category = "Tables", cost = 140, weight = 35 }, -- MW
	["175"] = { id = "furn_de_r_table_09", name = "Table", category = "Tables", cost = 70, weight = 20 }, -- MW
	["176"] = { id = "de_r_drawers_01_empty", name = "Dresser", category = "Containers", cost = 180, weight = 35 }, -- MW
	["177"] = { id = "ab_furn_derchbookshelftall", name = "Bookshelf", category = "Shelves", cost = 200, weight = 40 }, -- OAAB
	["178"] = { id = "t_de_furnr_bookstand_01", name = "Bookstand", category = "Other", cost = 100, weight = 5 }, -- TR
	["179"] = { id = "t_de_furnr_chair_01", name = "Chair", category = "Seats", cost = 50, weight = 5 }, -- TR
	["180"] = { id = "t_mwde_furnr_ds1empty", name = "Desk", category = "Containers", cost = 200, weight = 35 }, -- TR

	-- Cherry Wood pack
	["181"] = { id = "active_com_bed_01", name = "Single Bed, Blue", category = "Beds", cost = 225, weight = 40 }, -- MW
	["182"] = { id = "furn_com_r_bookshelf_01", name = "Bookshelf", category = "Shelves", cost = 100, weight = 40 }, -- MW
	["183"] = { id = "furn_com_r_chair_01", name = "Chair", category = "Seats", cost = 60, weight = 20 }, -- MW
	["184"] = { id = "furn_com_r_table_01", name = "Table", category = "Tables", cost = 100, weight = 40 }, -- MW
	["185"] = { id = "com_drawers_01", name = "Chest of Drawers", category = "Containers", cost = 120, weight = 35 }, -- MW
	["186"] = { id = "ab_o_comrchfootlckempty", name = "Footlocker", category = "Containers", cost = 65, weight = 20 }, -- OAAB
	["187"] = { id = "ab_o_comrchdesk2empty", name = "Desk", category = "Containers", cost = 200, weight = 35 }, -- OAAB
	["188"] = { id = "t_imp_furnr_shelf_01", name = "Shelf", category = "Shelves", cost = 60, weight = 10 }, -- PC
	["189"] = { id = "t_cyrimp_furnr_display1", name = "Display Case", category = "Containers", cost = 360, weight = 40 }, -- PC
	["190"] = { id = "t_cyrimp_furnr_ht1empty", name = "Hutch", category = "Containers", cost = 360, weight = 40 }, -- PC
	["191"] = { id = "t_cyrimp_furnr_lc1empty", name = "Lecturn", category = "Containers", cost = 120, weight = 15 }, -- PC

	-- Urn pack
	["192"] = { id = "furn_planter_01", name = "Planter Small, AI Soil", category = "Planters", cost = 40, weight = 15, scale = 0.5 }, -- MW
	["193"] = { id = "furn_planter_02", name = "Planter Med, AI Soil", category = "Planters", cost = 80, weight = 30, scale = 0.64 }, -- MW
	["194"] = { id = "furn_planter_04", name = "Planter Large", category = "Planters", cost = 120, weight = 40, scale = 0.76 }, -- MW
	["195"] = { id = "urn_01", name = "Urn", category = "Containers", cost = 30, weight = 20, ashlandersAvailable = true }, -- MW
	["196"] = {
		id = "urn_02",
		name = "Urn",
		category = "Containers",
		cost = 120,
		weight = 6,
		scale = 0.7,
		ashlandersAvailable = true,
		previewScale = 0.5,
		previewHeight = 40,
	}, -- MW
	["197"] = { id = "ab_furn_deflagon_01", name = "Flagon", category = "Containers", cost = 20, weight = 15, scale = 0.66 }, -- OAAB
	["198"] = { id = "ab_furn_deplanter01ash", name = "Planter, Ashland Soil", category = "Planters", cost = 40, weight = 15, scale = 0.5 }, -- OAAB     
	["199"] = { id = "ab_furn_deplanterbonsai", name = "Planter, Bonsai", category = "Planters", cost = 50, weight = 15, scale = 0.5 }, -- OAAB
	["200"] = { id = "ab_o_urnash_01", name = "Urn, with Ash", category = "Containers", cost = 100, weight = 15 }, -- OAAB
	["201"] = { id = "t_de_furn_urnopen_01", name = "Urn, Open", category = "Other", cost = 30, weight = 20 }, -- TR
	["202"] = { id = "t_de_urn_01", name = "Urn, Small", category = "Other", cost = 20, weight = 15 }, -- TR
	["203"] = { id = "t_mwde_furn_urntapempty", name = "Urn, with Tapestry", category = "Containers", cost = 40, weight = 20 }, -- TR

	--- Plant pack
	["204"] = { id = "flora_bc_fern_03", name = "Fern", category = "Plants", cost = 10, weight = 1, scale = 0.5 }, -- MW
	["205"] = { id = "flora_bc_mushroom_01", name = "Luminous Russula", category = "Plants", cost = 100, weight = 1, scale = 0.5 }, -- MW
	["206"] = { id = "flora_bc_mushroom_06", name = "Violet Coprinus", category = "Plants", cost = 100, weight = 1, scale = 0.5 }, -- MW
	["207"] = { id = "flora_grass_01", name = "Grass", category = "Plants", cost = 10, weight = 1 }, -- MW
	["208"] = { id = "flora_ivy_01", name = "Ivy", category = "Plants", cost = 10, weight = 1 }, -- MW
	["209"] = { id = "ab_f_bluekanet_01", name = "Blue Kanet", category = "Plants", cost = 100, weight = 1 }, -- OAAB
	["210"] = { id = "ab_f_harrada_01", name = "Harrada", category = "Plants", cost = 100, weight = 1 }, -- OAAB

	-- Unorganized
	["211"] = { id = "chest_small_02", name = "Small Chest", category = "Containers", cost = 30, weight = 3 }, -- MW
	["212"] = { id = "com_chest_01", name = "Chest", category = "Containers", cost = 15, weight = 8 }, -- MW
	["213"] = { id = "furn_com_coatofarms_01", name = "Coat of Arms, Eagles", category = "Other", cost = 200, weight = 5 }, -- MW
	["214"] = { id = "furn_com_coatofarms_02", name = "Coat of Arms, Beasts", category = "Other", cost = 200, weight = 5 }, -- MW
	["215"] = { id = "furn_com_lantern_hook_02", name = "Lantern Hook", category = "Other", cost = 10, weight = 5 }, -- MW
	["216"] = { id = "furn_com_pm_stool_02", name = "Stool", category = "Seats", cost = 20, weight = 5 }, -- MW
	["217"] = { id = "ab_furn_comincense01", name = "Incense", category = "Other", cost = 100, weight = 5, ashlandersAvailable = true }, -- OAAB
	["218"] = { id = "ab_furn_lwbowlwater", name = "Limeware Bowl of Water", category = "Other", cost = 200, weight = 5, ashlandersAvailable = true }, -- OAAB
	["219"] = {
		id = "ab_furn_pracmarkstarget02",
		name = "Marksman Pratice Target",
		category = "Other",
		cost = 200,
		weight = 5,
		ashlandersAvailable = true,
	}, -- OAAB
	["220"] = { id = "active_de_p_bed_28", name = "Hammock", category = "Beds", cost = 50, weight = 10, ashlandersAvailable = true }, -- MW
	["221"] = { id = "furn_de_rope_03", name = "Rope", category = "Other", cost = 10, weight = 1, ashlandersAvailable = true }, -- MW
	["222"] = { id = "furn_de_shack_basket_01", name = "Basket", category = "Other", cost = 20, weight = 5, ashlandersAvailable = true }, -- MW
	["223"] = { id = "furn_de_shack_basket_02", name = "Basket", category = "Other", cost = 20, weight = 5, ashlandersAvailable = true }, -- MW
	["224"] = { id = "furn_de_shack_hook", name = "Hook", category = "Other", cost = 10, weight = 1 }, -- MW
	["225"] = { id = "light_de_candle_07", name = "Candle, Orange", category = "Lights", cost = 12, weight = 5 }, -- MW
	["226"] = { id = "t_nor_furnp_table_01", name = "Table, Nordic", category = "Tables", cost = 120, weight = 35 }, -- SKY
	["227"] = { id = "furn_rug_bearskin", name = "Rug, Bearskin", category = "Rugs", cost = 100, weight = 2, scale = 1.5 }, -- MW
	["228"] = { id = "t_nor_furn_chandelier01_256", name = "Chandelier, Nordic", category = "Lights", cost = 120, weight = 5 }, -- SKY
	["229"] = { id = "ex_siltstrider_02", name = "Silt Strider Shell", category = "Other", cost = 120, weight = 35, scale = 0.82, ashlandersOnly = true }, -- MW
	["230"] = { id = "flora_ash_grass_r_01", name = "Grass, Ashland", category = "Plants", cost = 10, weight = 1, scale = 0.9,
             ashlandersAvailable = true }, -- MW
	["231"] = { id = "active_de_bedroll", name = "Bedroll", category = "Beds", cost = 50, weight = 5, ashlandersAvailable = true }, -- MW
	["232"] = { id = "light_ashl_lantern_03", name = "Lantern, Ashlanders", category = "Lights", cost = 12, weight = 5, ashlandersOnly = true }, -- MW   
	["233"] = { id = "com_basket_01", name = "Basket", category = "Containers", cost = 20, weight = 5, ashlandersAvailable = true }, -- MW
	["234"] = { id = "furn_de_basket_01", name = "Basket", category = "Other", cost = 20, weight = 5, ashlandersAvailable = true }, -- MW
	["235"] = { id = "in_ashl_tent_banner_02", name = "Banner, Ashlanders", category = "Tapestries", cost = 120, weight = 5, ashlandersOnly = true }, -- MW
	["236"] = { id = "in_ashl_tent_banner_08", name = "Banner, Ashlanders", category = "Tapestries", cost = 120, weight = 5, ashlandersOnly = true }, -- MW
	["237"] = { id = "in_ashl_tent_banner_12", name = "Banner, Ashlanders", category = "Tapestries", cost = 120, weight = 5, ashlandersOnly = true }, -- MW
	["238"] = { id = "t_de_var_guarskin_01", name = "Guar Skin", category = "Tapestries", cost = 120, weight = 5, ashlandersAvailable = true }, -- TR     
	["239"] = { id = "furn_de_cushion_square_03", name = "Cushion", category = "Seats", cost = 30, weight = 3, ashlandersAvailable = true }, -- MW       
	["240"] = { id = "in_ashl_tent_banner_09", name = "Banner, Ashlanders", category = "Tapestries", cost = 120, weight = 5, ashlandersOnly = true }, -- MW
	["241"] = { id = "light_ashl_lantern_02", name = "Lantern, Ashlanders", category = "Lights", cost = 12, weight = 5, ashlandersOnly = true }, -- MW   
	["242"] = { id = "light_de_candle_02", name = "Candle", category = "Lights", cost = 12, weight = 5, ashlandersAvailable = true }, -- MW
	["243"] = { id = "t_mwde_furn_vs1empty", name = "Vase", category = "Containers", cost = 60, weight = 20, scale = 0.8, ashlandersAvailable = true }, -- TR
	["244"] = { id = "t_mwde_furn_vs2empty", name = "Vase", category = "Containers", cost = 60, weight = 20, scale = 0.7, ashlandersAvailable = true }, -- TR
	["245"] = { id = "t_mwde_furn_vs3empty", name = "Vase", category = "Containers", cost = 60, weight = 20, scale = 0.5, ashlandersAvailable = true }, -- TR
	["246"] = { id = "urn_03", name = "Urn", category = "Containers", cost = 30, weight = 20, ashlandersAvailable = true }, -- MW
	["247"] = { id = "urn_05", name = "Urn", category = "Containers", cost = 30, weight = 20, ashlandersAvailable = true, scale = 0.5 }, -- MW
	["248"] = { id = "furn_de_cushion_round_06", name = "Cushion", category = "Seats", cost = 30, weight = 3, scale = 0.8, ashlandersAvailable = true }, -- MW
	["249"] = { id = "furn_de_p_bench_04", name = "Bench", category = "Seats", cost = 30, weight = 5, ashlandersAvailable = true }, -- MW
	["250"] = { id = "light_de_candle_08", name = "Candle", category = "Lights", cost = 12, weight = 5, ashlandersAvailable = true }, -- MW
	["251"] = { id = "light_de_candle_18", name = "Candle", category = "Lights", cost = 12, weight = 5, ashlandersAvailable = true }, -- MW
	["252"] = { id = "t_mwcom_var_bss1empty", name = "Basket", category = "Containers", cost = 20, weight = 10, ashlandersAvailable = true }, -- TR       
	["253"] = { id = "t_mwde_furn_vs4food", name = "Vase", category = "Containers", cost = 60, weight = 20, scale = 0.6, ashlandersAvailable = true }, -- TR
	["254"] = { id = "ab_furn_ashlincense", name = "Incense, Ashlanders", category = "Other", cost = 100, weight = 5, ashlandersOnly = true }, -- OAAB   
	["255"] = { id = "ab_furn_ashlskull_02", name = "Skulls, Ashlanders", category = "Other", cost = 100, weight = 5, ashlandersOnly = true }, -- OAAB   
	["256"] = { id = "furn_de_rope_07", name = "Rope", category = "Other", cost = 10, weight = 1, ashlandersAvailable = true }, -- MW
	["257"] = { id = "ab_furn_ashlskull_03", name = "Skulls, Ashlanders", category = "Other", cost = 150, weight = 10, ashlandersOnly = true }, -- OAAB   
	["258"] = { id = "furn_de_cushion_square_08", name = "Cushion", category = "Seats", cost = 30, weight = 3, scale = 0.8, ashlandersAvailable = true }, -- MW
	["259"] = { id = "furn_de_rope_05", name = "Rope", category = "Other", cost = 10, weight = 1, scale = 1.08, ashlandersAvailable = true }, -- MW      
	["260"] = { id = "light_de_candle_01", name = "Candle, Orange", category = "Lights", cost = 12, weight = 5 }, -- MW
	["261"] = { id = "t_rga_furn_mat_02", name = "Mat, Red", category = "Rugs", cost = 120, weight = 5 }, -- PC
	["262"] = { id = "light_ashl_lantern_01", name = "Lantern, Ashlanders", category = "Lights", cost = 12, weight = 5, ashlandersOnly = true }, -- MW   
	["263"] = { id = "light_ashl_lantern_07", name = "Lantern, Ashlanders", category = "Lights", cost = 12, weight = 5, ashlandersOnly = true }, -- MW   
	["264"] = { id = "light_com_candle_09", name = "Candles, Orange", category = "Lights", cost = 12, weight = 5 }, -- MW    
	["265"] = { id = "t_de_furn_rug_06", name = "Rug", category = "Rugs", cost = 120, weight = 6, scale = 0.5, ashlandersAvailable = true }, -- TR
	["266"] = { id = "furn_ashl_bugbowl", name = "Bug Bowl, Ashlanders", category = "Other", cost = 40, weight = 5, ashlandersOnly = true }, -- MW       
	["267"] = { id = "ab_furn_debasket_01", name = "Basket", category = "Other", cost = 20, weight = 5, ashlandersAvailable = true }, -- OAAB
	["268"] = { id = "ab_o_sshltrinketbox", name = "Trinket Box", category = "Containers", cost = 40, weight = 5, scale = 0.6, ashlandersOnly = true }, -- OAAB
	["269"] = { id = "flora_wickwheat_01", name = "Wickwheat", category = "Plants", cost = 100, weight = 1, scale = 0.6, ashlandersAvailable = true }, -- MW
	["270"] = { id = "furn_ashl_bugbowl_02", name = "Bug Bowl, Ashlanders", category = "Other", cost = 40, weight = 5, ashlandersOnly = true }, -- MW    
	["271"] = { id = "light_de_buglamp_01", name = "Bug Lamp", category = "Lights", cost = 12, weight = 3, ashlandersOnly = true }, -- MW
	["272"] = { id = "t_de_furn_rugsmall_01", name = "Rug", category = "Rugs", cost = 60, weight = 6, scale = 0.5, ashlandersAvailable = true }, -- TR   
}

return this
