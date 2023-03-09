local this = {}

this.shopManagers = { ["retail_ledger"] = { type = "ledger" } }

this.stockAmount = 50
this.furniture = {
	-- Oldwood pack
	{ id = "dr_asrt_p_f_bookcase_01", name = "Bookcase", category = "Shelves", cost = 28, tier = 0 }, -- DR
	{ id = "furn_de_p_bench_03", name = "Cheap Bench", category = "Seats", cost = 14, tier = 0 }, -- MW
	{ id = "furn_de_p_bookshelf_01", name = "Bookshelf", category = "Shelves", cost = 28, tier = 0, alwaysInStock = true }, -- MW
	{ id = "furn_de_p_shelf_02", name = "Shelf", category = "Shelves", cost = 5, tier = 0 }, -- MW
	{ id = "furn_de_p_table_01", name = "Round Table", category = "Tables", cost = 75, tier = 0 }, -- MW
	{ id = "furn_de_p_table_02", name = "Small Telvanni Table", category = "Tables", cost = 50, tier = 0 }, -- MW
	{ id = "furn_de_p_table_04", name = "Large Table", category = "Tables", cost = 80, tier = 0 }, -- MW
	{ id = "furn_de_p_table_05", name = "End Table", category = "Tables", cost = 15, tier = 0 }, -- MW
	{ id = "furn_de_rm_winerack", name = "Winerack", category = "Shelves", cost = 120, tier = 0 }, -- MW
	{ id = "light_de_lantern_05_128", name = "Paper Lantern, Orange", category = "Lights", cost = 10, tier = 0 }, -- MW
	{ id = "mwg_vivec_market_05", name = "Market Stand", category = "Shelves", cost = 28, tier = 0 }, -- MwG
	{ id = "de_p_desk_01", name = "Desk", category = "Containers", cost = 140, tier = 0 }, -- MW
	{ id = "de_drawers_02", name = "Chest of Drawers", category = "Containers", cost = 90, tier = 0 }, -- MW
	{ id = "ab_o_deplntable01", name = "End Table", category = "Containers", cost = 85, tier = 0 }, -- OAAB
	{ id = "ab_furn_deplnscrollrack1", name = "Scroll Rack", category = "Shelves", cost = 175, tier = 0 }, -- OAAB
	{ id = "ab_furn_deplnscrollrack2", name = "Scroll Rack", category = "Shelves", cost = 175, tier = 0 }, -- OAAB

	-- Metal Iron Rusty pack
	{ id = "light_com_candle_01_64", name = "Iron Candlestick, White", category = "Lights", cost = 3, tier = 0 }, -- MW
	{ id = "light_com_lamp_02_128", name = "Lamp", category = "Lights", cost = 30, tier = 0 }, -- MW
	{ id = "light_de_lantern_07", name = "Paper Lantern, Blue", category = "Lights", cost = 10, tier = 0 }, -- MW

	-- Khaki Wood pack
	{ id = "active_com_bed_03", name = "Single Bed, Brown", category = "Beds", cost = 60, tier = 0 }, -- MW
	{ id = "furn_com_p_bench_01", name = "Bench", category = "Seats", cost = 60, tier = 0 }, -- MW
	{ id = "active_com_bunk_02", name = "Bunk Bed, Grey", category = "Beds", cost = 60, tier = 0 }, -- MW
	{ id = "furn_com_p_shelf_03", name = "Shelf", category = "Shelves", cost = 60, tier = 0 }, -- MW
	{ id = "furn_com_p_table_01", name = "Table", category = "Tables", cost = 60, tier = 0 }, -- MW
	{ id = "light_com_chandelier_01", name = "Wooden Chandelier", category = "Lights", cost = 60, tier = 0 }, -- MW
	{ id = "t_imp_furnp_rack_02", name = "Rack", category = "Shelves", cost = 60, tier = 0 }, -- PC
	{ id = "t_imp_furnp_wallscreen_01", name = "Wallscreen", category = "Other", cost = 60, tier = 0 }, -- PC
	{ id = "t_cyrimp_furnp_st1empty", name = "Side Table", category = "Containers", cost = 60, tier = 0 }, -- PC
	{ id = "t_com_furn_ladder_01", name = "Ladder", category = "Other", cost = 60, tier = 0 }, -- TR

	-- Canvas Wrap pack
	{ id = "furn_com_pm_chair_02", name = "Chair", category = "Seats", cost = 60, tier = 0 }, -- MW
	{ id = "furn_de_cushion_round_03", name = "Cushion", category = "Seats", cost = 10, tier = 0 }, -- MW
	{ id = "furn_de_practice_mat", name = "Practice Mat", category = "Rugs", cost = 10, tier = 0 }, -- MW

	-- Skyrim Wood Furniture 01 pack
	{ id = "t_nor_furnp_bench_01", name = "Bench", category = "Seats", cost = 100, tier = 1 }, -- SKY
	{ id = "t_nor_furnp_bookshelf_01", name = "Bookshelf", category = "Shelves", cost = 100, tier = 1 }, -- SKY
	{ id = "t_nor_furnp_chair_01", name = "Chair", category = "Seats", cost = 100, tier = 1 }, -- SKY
	{ id = "t_nor_furnp_bar_01", name = "Counter", category = "Shelves", cost = 100, tier = 1 }, -- SKY
	{ id = "t_nor_furnp_shelf_01", name = "Bookshelf", category = "Shelves", cost = 100, tier = 1 }, -- SKY
	{ id = "t_nor_furnp_shelf_04", name = "Bookshelf", category = "Shelves", cost = 100, tier = 1 }, -- SKY
	{ id = "t_nor_furnp_stool_01", name = "Stool", category = "Seats", cost = 100, tier = 1 }, -- SKY
	{ id = "t_nor_furnp_table_02", name = "Round Table", category = "Tables", cost = 100, tier = 1 }, -- SKY
	{ id = "t_skynor_furnp_cb1empty", name = "Cupboard", category = "Containers", cost = 100, tier = 1 }, -- SKY
	{ id = "t_skynor_furnp_cl1empty", name = "Closet", category = "Containers", cost = 100, tier = 1 }, -- SKY
	{ id = "t_skynor_furnp_dw1empty", name = "Drawers", category = "Containers", cost = 100, tier = 1 }, -- SKY
	{ id = "t_skynor_furnp_ds1empty", name = "Desk", category = "Containers", cost = 100, tier = 1 }, -- SKY

	-- Wood Brown pack
	{ id = "furn_com_rm_shelf_02", name = "Shelf", category = "Shelves", cost = 10, tier = 1 }, -- MW
	{ id = "com_chest_11_empty", name = "Chest", category = "Containers", cost = 25, tier = 1 }, -- MW
	{ id = "crate_01_empty", name = "Crate", category = "Containers", cost = 10, tier = 1 }, -- MW
	{ id = "furn_com_rm_bookshelf_02", name = "Bookshelf", category = "Shelves", cost = 80, tier = 1 }, -- MW
	{ id = "furn_com_rm_table_03", name = "Round Table", category = "Tables", cost = 50, tier = 1 }, -- MW
	{ id = "furn_com_rm_table_04", name = "Table", category = "Tables", cost = 50, tier = 1 }, -- MW
	{ id = "furn_com_rm_table_05", name = "Small Table", category = "Tables", cost = 40, tier = 1, alwaysInStock = true }, -- MW
	{ id = "barrel_01_empty", name = "Barrel", category = "Containers", cost = 30, tier = 1 }, -- MW
	{ id = "t_imp_furnm_bookshelf_04", name = "Bookshelf", category = "Shelves", cost = 60, tier = 1 }, -- PC

	-- Wood Wethered pack
	{ id = "furn_de_ex_bench_01", name = "Bench", category = "Seats", cost = 35, tier = 1 }, -- MW
	{ id = "furn_de_ex_stool_02", name = "Stool", category = "Seats", cost = 35, tier = 1 }, -- MW
	{ id = "furn_de_ex_table_02", name = "Small Cheap Table", category = "Tables", cost = 35, tier = 1 }, -- MW
	{ id = "furn_de_ex_table_03", name = "Large Cheap Table", category = "Tables", cost = 35, tier = 1 }, -- MW
	{ id = "light_torch_01", name = "Torch", category = "Lights", cost = 35, tier = 1 }, -- MW
	{ id = "de_p_chest_02", name = "Chest", category = "Containers", cost = 25, tier = 1 }, -- MW
	{ id = "ab_furn_deexdisplay01", name = "Display Shelf", category = "Shelves", cost = 50, tier = 1 }, -- OAAB
	{ id = "ab_furn_deexdisplay02", name = "Display Shelf", category = "Shelves", cost = 100, tier = 1 }, -- OAAB
	{ id = "ab_o_boxflour", name = "Box of Flour", category = "Containers", cost = 100, tier = 1 }, -- OAAB

	-- Rug pack
	{ id = "furn_de_rug_01", name = "Small Rectangular Rug", category = "Rugs", cost = 60, tier = 1 }, -- MW
	{ id = "furn_de_rug_02", name = "Small Rectangular Rug", category = "Rugs", cost = 60, tier = 1 }, -- MW
	{ id = "furn_de_rug_big_01", name = "Large Oval Rug", category = "Rugs", cost = 120, tier = 1 }, -- MW
	{ id = "furn_de_rug_big_02", name = "Large Oval Rug", category = "Rugs", cost = 120, tier = 1 }, -- MW
	{ id = "furn_de_rug_big_03", name = "Large Oval Rug", category = "Rugs", cost = 120, tier = 1 }, -- MW
	{ id = "furn_de_rug_big_05", name = "Large Rectangular Rug", category = "Rugs", cost = 120, tier = 1 }, -- MW
	{ id = "furn_de_rug_big_06", name = "Large Rectangular Rug", category = "Rugs", cost = 120, tier = 1 }, -- MW
	{ id = "furn_de_rug_big_07", name = "Large Rectangular Rug", category = "Rugs", cost = 120, tier = 1 }, -- MW
	{ id = "furn_de_rug_big_08", name = "Large Oval Rug", category = "Rugs", cost = 120, tier = 1 }, -- MW
	{ id = "furn_de_rug_big_09", name = "Large Rectangular Rug", category = "Rugs", cost = 120, tier = 1 }, -- MW

	-- Cushion pack: All Cushion needs to be named exactly "Cushion"
	{ id = "furn_de_cushion_round_01", name = "Cushion", category = "Seats", cost = 10, tier = 2 }, -- MW
	{ id = "furn_de_cushion_round_02", name = "Cushion", category = "Seats", cost = 10, tier = 2 }, -- MW
	{ id = "furn_de_cushion_round_04", name = "Cushion", category = "Seats", cost = 10, tier = 2 }, -- MW
	{ id = "furn_de_cushion_square_01", name = "Cushion", category = "Seats", cost = 10, tier = 2 }, -- MW
	{ id = "furn_de_cushion_square_02", name = "Cushion", category = "Seats", cost = 10, tier = 2 }, -- MW

	-- TR Wood Dunmer rm 
	{ id = "ab_furn_demidbench", name = "Bench", category = "Seats", cost = 110, tier = 2 }, -- OAAB
	{ id = "ab_furn_demidscrollrack", name = "Scroll Rack", category = "Shelves", cost = 175, tier = 2 }, -- OAAB
	{ id = "ab_furn_demidshelf", name = "Shelf", category = "Shelves", cost = 25, tier = 2 }, -- OAAB
	{ id = "ab_furn_demidtable01", name = "Large Table", category = "Tables", cost = 85, tier = 2 }, -- OAAB
	{ id = "t_de_furnm_bed_b_01", name = "Bunk Bed, Green", category = "Beds", cost = 85, tier = 2 }, -- TR
	{ id = "t_de_furnm_bed_d_02", name = "Double Bed, Brown", category = "Beds", cost = 85, tier = 2 }, -- TR
	{ id = "t_de_furnm_bed_s_03", name = "Single Bed, Olive", category = "Beds", cost = 85, tier = 2 }, -- TR
	{ id = "t_de_furnm_bookshelf_01", name = "Bookshelf", category = "Shelves", cost = 85, tier = 2 }, -- TR
	{ id = "t_de_furnm_chair_01", name = "Chair", category = "Seats", cost = 85, tier = 2 }, -- TR
	{ id = "t_de_furnm_bench_01", name = "Bench", category = "Seats", cost = 110, tier = 2 }, -- TR
	{ id = "t_de_furnm_table_01", name = "Table", category = "Tables", cost = 110, tier = 2 }, -- TR
	{ id = "t_de_furnm_table_03", name = "Table", category = "Tables", cost = 110, tier = 2 }, -- TR

	-- Skyrim Wood pack
	{ id = "t_nor_furnm_bar_04", name = "Bar", category = "Tables", cost = 100, tier = 2 }, -- SKY
	{ id = "t_imp_furnsky_bench_01a", name = "Bench", category = "Seats", cost = 100, tier = 2 }, -- SKY
	{ id = "t_nor_furnm_bookshelf_01", name = "Bookshelf", category = "Shelves", cost = 100, tier = 2 }, -- SKY
	{ id = "t_nor_furnm_chair_01", name = "Chair", category = "Seats", cost = 100, tier = 2 }, -- SKY
	{ id = "t_nor_furnm_table_01", name = "Table", category = "Tables", cost = 100, tier = 2 }, -- SKY
	{ id = "t_imp_furnsky_table_01", name = "Table", category = "Tables", cost = 100, tier = 2 }, -- SKY
	{ id = "t_imp_furnsky_table_03", name = "Table", category = "Tables", cost = 100, tier = 2 }, -- SKY
	{ id = "t_skycom_var_cr6empty", name = "Crate", category = "Containers", cost = 100, tier = 2 }, -- SKY
	{ id = "t_skynor_furnm_cb1empty", name = "Cupboard", category = "Containers", cost = 100, tier = 2 }, -- SKY
	{ id = "t_skynor_furnm_cl1empty", name = "Closet", category = "Containers", cost = 100, tier = 2 }, -- SKY

	-- Metal Silver pack
	{ id = "light_com_candle_14", name = "Silver Candlestick, Blue", category = "Lights", cost = 12, tier = 3 }, -- MW
	{ id = "light_com_candle_15", name = "Silver Candlestick, Red", category = "Lights", cost = 12, tier = 3 }, -- MW
	{ id = "light_com_candle_16", name = "Silver Candlestick, Blue", category = "Lights", cost = 12, tier = 3 }, -- MW
	{ id = "ab_light_comsconsilvblu_128", name = "Silver Sconce, Blue Candles", category = "Lights", cost = 12, tier = 3 }, -- OAAB
	{ id = "ab_light_comsconsilvwht_128", name = "Silver Sconce, White Candles", category = "Lights", cost = 12, tier = 3 }, -- OAAB
	{ id = "t_imp_furn_incense_02_16", name = "Silver Incense", category = "Lights", cost = 12, tier = 3 }, -- PC

	-- Swirlwood pack
	{ id = "active_de_r_bed_01", name = "Single Bed, Aqua", category = "Beds", cost = 55, tier = 3 }, -- MW
	{ id = "furn_de_r_bench_01", name = "Bench", category = "Seats", cost = 55, tier = 3 }, -- MW
	{ id = "furn_de_r_bookshelf_02", name = "Bookshelf", category = "Shelves", cost = 120, tier = 3 }, -- MW
	{ id = "furn_de_r_table_03", name = "Oval Table", category = "Tables", cost = 120, tier = 3 }, -- MW
	{ id = "furn_de_r_table_07", name = "Large Table", category = "Tables", cost = 140, tier = 3 }, -- MW
	{ id = "furn_de_r_table_09", name = "Table", category = "Tables", cost = 75, tier = 3 }, -- MW
	{ id = "de_r_drawers_01_empty", name = "Dresser", category = "Containers", cost = 180, tier = 3 }, -- MW
	{ id = "ab_furn_derchbookshelftall", name = "Bookshelf", category = "Shelves", cost = 240, tier = 3 }, -- OAAB
	{ id = "t_de_furnr_bookstand_01", name = "Bookstand", category = "Other", cost = 240, tier = 3 }, -- TR
	{ id = "t_de_furnr_chair_01", name = "Chair", category = "Seats", cost = 240, tier = 3 }, -- TR
	{ id = "t_mwde_furnr_ds1empty", name = "Desk", category = "Containers", cost = 180, tier = 3 }, -- TR

	-- Cherry Wood pack
	{ id = "active_com_bed_01", name = "Single Bed, Blue", category = "Beds", cost = 100, tier = 3 }, -- MW
	{ id = "furn_com_r_bookshelf_01", name = "Bookshelf", category = "Shelves", cost = 100, tier = 3 }, -- MW
	{ id = "furn_com_r_chair_01", name = "Chair", category = "Seats", cost = 100, tier = 3 }, -- MW
	{ id = "furn_com_r_table_01", name = "Table", category = "Tables", cost = 150, tier = 3 }, -- MW
	{ id = "com_drawers_01", name = "Chest of Drawers", category = "Containers", cost = 110, tier = 3 }, -- MW
	{ id = "ab_o_comrchfootlckempty", name = "Footlocker", category = "Containers", cost = 110, tier = 3 }, -- OAAB
	{ id = "ab_o_comrchdesk2empty", name = "Desk", category = "Containers", cost = 110, tier = 3 }, -- OAAB
	{ id = "t_imp_furnr_shelf_01", name = "Shelf", category = "Shelves", cost = 150, tier = 3 }, -- PC
	{ id = "t_cyrimp_furnr_display1", name = "Display Case", category = "Containers", cost = 360, tier = 3 }, -- PC
	{ id = "t_cyrimp_furnr_ht1empty", name = "Hutch", category = "Containers", cost = 360, tier = 3 }, -- PC
	{ id = "t_cyrimp_furnr_lc1empty", name = "Lecturn", category = "Containers", cost = 360, tier = 3 }, -- PC
}

this.displayTables = {
	-- bar: activator (de)/static (com), single surface, modular
	-- table: static, single surface
	-- bookshelf: static, multiple surfaces
	-- bowl: misc, single surface
	-- crate: container, single surface
	-- desk: container, multiple surfaces
	-- Oldwood pack
	["dr\\dr_asrt_p_f_bookcase_01.nif"] = { name = "Bookcase", isStatic = true },
	["f\\furn_de_bar_01.nif"] = { type = "bar", name = "Bar", isStatic = true }, -- Holamayan Monastery
	["f\\furn_de_bar_02.nif"] = { type = "bar", name = "Bar", isStatic = true }, -- Suran, Oran Manor
	["f\\furn_de_bar_03.nif"] = { type = "bar", name = "Bar", isStatic = true },
	["f\\furn_de_bar_04.nif"] = { type = "bar", name = "Bar", isStatic = true }, -- Suran, Ibarnadad Assirnarari: Apothecary
	["f\\furn_de_bar_05.nif"] = { type = "bar", name = "Bar", isStatic = true },
	["f\\furn_de_bar_06.nif"] = { type = "bar", name = "Bar", isStatic = true },
	["f\\furn_de_bench_03.nif"] = { name = "Cheap Bench", isStatic = true }, -- MW
	["f\\furn_de_bookshelf_01.nif"] = { name = "Bookshelf", isStatic = true },
	["f\\furn_de_shelf_02.nif"] = { name = "Shelf", isStatic = true },
	["f\\furn_de_table_01.nif"] = { name = "Round Table", isStatic = true },
	["f\\furn_de_table_02.nif"] = { name = "Small Telvanni Table", isStatic = true },
	["f\\furn_de_table_04.nif"] = { name = "Large Table", isStatic = true },
	["f\\furn_de_table_05.nif"] = { name = "End Table", isStatic = true },
	["f\\furn_de_winerack.nif"] = { name = "Winerack", isStatic = true },
	["mwg\\mwg_vivec_market_05.nif"] = { name = "Market Stand", isStatic = true },
	["o\\contain_de_desk_01.nif"] = { name = "Desk", isStatic = false },
	["o\\contain_de_drawers_02.nif"] = { name = "Chest of Drawers", isStatic = false },
	["oaab\\o\\de_table_01.nif"] = { name = "End Table", isStatic = true },
	["oaab\\u\\de_scrollrack1.nif"] = { name = "Scroll Rack", isStatic = true },
	["oaab\\u\\de_scrollrack2.nif"] = { name = "Scroll Rack", isStatic = true },

	-- Khaki Wood pack
	["f\\furn_com_bench_01.nif"] = { name = "Bench", isStatic = true },
	["f\\furn_com_shelf_03.nif"] = { name = "Shelf", isStatic = true },
	["f\\furn_com_table_02.nif"] = { name = "Table", isStatic = true },
	["pc\\f\\pc_furn_com_p_rack_02.nif"] = { name = "Rack", isStatic = true },
	["pc\\f\\pc_furn_com_p_stbl_01.nif"] = { name = "Side Table", isStatic = false },

	-- Canvas Wrap pack
	["ashfall\\craft\\cush_01.nif"] = { name = "Pillow", isStatic = false },
	["ashfall\\craft\\rug_01.nif"] = { name = "Mat: Fabric", isStatic = false },
	["f\\furn_com_chair_02.nif"] = { name = "Chair", isStatic = true },
	["f\\furn_cushion_round_03.nif"] = { name = "Cushion", isStatic = true },
	["f\\furn_de_practice_mat.nif"] = { name = "Pratice Mat", isStatic = true },

	-- Skyrim Wood Furniture 01 pack
	["sky\\f\\sky_furn_n_b_01_01.nif"] = { name = "Bench", isStatic = true },
	["sky\\f\\sky_furn_n_bksf_01_01.nif"] = { name = "Bookshelf", isStatic = true },
	["sky\\f\\sky_furn_n_l_cr_01.nif"] = { name = "Chair", isStatic = true },
	["sky\\f\\sky_furn_n_l_ct_01.nif"] = { name = "Counter", isStatic = true },
	["sky\\f\\sky_furn_n_l_sf_01.nif"] = { name = "Bookshelf", isStatic = true },
	["sky\\f\\sky_furn_n_l_sf_04.nif"] = { name = "Bookshelf", isStatic = true },
	["sky\\f\\sky_furn_n_st_01_01.nif"] = { name = "Stool", isStatic = true },
	["sky\\f\\sky_furn_n_t_01_02.nif"] = { name = "Round Table", isStatic = true },
	["sky\\o\\sky_furn_n_l_cbrd_01.nif"] = { name = "Cupboard", isStatic = true },
	["sky\\o\\sky_furn_n_l_clst_01.nif"] = { name = "Closet", isStatic = true },
	["sky\\o\\sky_furn_n_l_drs_01.nif"] = { name = "Drawers", isStatic = true },
	["sky\\o\\sky_furn_n_l_dsk_01.nif"] = { name = "Desk", isStatic = true },

	-- Wood Brown pack
	["f\\furn_com_bar_01.nif"] = { type = "bar", name = "Bar", isStatic = true }, -- Dagon Fel, Heifnir: Trader
	["f\\furn_com_bar_02.nif"] = { type = "bar", name = "Bar", isStatic = true }, -- Tel Aruhn, Ferele Athram: Trader
	["f\\furn_com_bar_03.nif"] = { type = "bar", name = "Bar", isStatic = true },
	["f\\furn_com_bar_04.nif"] = { type = "bar", name = "Bar", isStatic = true }, -- Dagon Fel, End of the World Renter Rooms
	["f\\furn_com_bar_05.nif"] = { type = "bar", name = "Bar", isStatic = true }, -- Dagon Fel, End of the World Renter Rooms
	["f\\furn_com_bar_06.nif"] = { type = "bar", name = "Bar", isStatic = true },
	["f\\furn_com_shelf_02.nif"] = { name = "Shelf", isStatic = true },
	["f\\furn_com_bookshelf_02.nif"] = { name = "Bookshelf", isStatic = true },
	["f\\furn_com_table_03.nif"] = { name = "Round Table", isStatic = true },
	["f\\furn_com_table_04.nif"] = { name = "Table", isStatic = true },
	["f\\furn_com_table_05.nif"] = { name = "Small Table", isStatic = true },
	["o\\contain_barrel_01.nif"] = { name = "Barrel", isStatic = false },
	["o\\contain_chest10.nif"] = { name = "Chest", isStatic = false },
	["o\\contain_crate_01.nif"] = { name = "Crate", isStatic = false },
	["pc\\f\\pc_furn_com_m_bshlf_04.nif"] = { name = "Bookshelf", isStatic = true },

	-- Wood Wethered pack
	["ashfall\\craft\\chest_sml_01.nif"] = { name = "Wooden Chest", isStatic = false },
	["ashfall\\craft\\display_stand.nif"] = { name = "Display Stand", isStatic = false },
	["ashfall\\craft\\table_sml.nif"] = { name = "Table: Tall", isStatic = false },
	["ashfall\\craft\\table_sml_2.nif"] = { name = "Table: Long", isStatic = false },
	["f\\furn_de_ex_bench_01.nif"] = { name = "Bench", isStatic = true },
	["f\\furn_de_ex_stool_02.nif"] = { name = "Stool", isStatic = true },
	["f\\furn_de_ex_table_02.nif"] = { name = "Small Cheap Table", isStatic = true },
	["f\\furn_de_ex_table_03.nif"] = { name = "Large Cheap Table", isStatic = true },
	["o\\contain_de_chest_02.nif"] = { name = "Chest", isStatic = false },
	["oaab\\u\\deexdisplay01.nif"] = { name = "Display Shelf", isStatic = true },
	["oaab\\u\\deexdisplay02.nif"] = { name = "Display Shelf", isStatic = true },

	-- Rug pack
	["f\\furn_rug_01.nif"] = { name = "Small Rectangular Rug", isStatic = true },
	["f\\furn_rug_02.nif"] = { name = "Small Rectangular Rug", isStatic = true },
	["f\\furn_rug_big_01.nif"] = { name = "Large Oval Rug", isStatic = true },
	["f\\furn_rug_big_02.nif"] = { name = "Large Oval Rug", isStatic = true },
	["f\\furn_rug_big_03.nif"] = { name = "Large Oval Rug", isStatic = true },
	["f\\furn_rug_big_05.nif"] = { name = "Large Rectangular Rug", isStatic = true },
	["f\\furn_rug_big_06.nif"] = { name = "Large Rectangular Rug", isStatic = true },
	["f\\furn_rug_big_07.nif"] = { name = "Large Rectangular Rug", isStatic = true },
	["f\\furn_rug_big_08.nif"] = { name = "Large Oval Rug", isStatic = true },
	["f\\furn_rug_big_09.nif"] = { name = "Large Rectangular Rug", isStatic = true },

	-- Cushion pack
	["f\\furn_cushion_round_01.nif"] = { name = "Cushion", isStatic = true },
	["f\\furn_cushion_round_02.nif"] = { name = "Cushion", isStatic = true },
	["f\\furn_cushion_round_04.nif"] = { name = "Cushion", isStatic = true },
	["f\\furn_cushion_square_01.nif"] = { name = "Cushion", isStatic = true },
	["f\\furn_cushion_square_02.nif"] = { name = "Cushion", isStatic = true },

	-- TR Wood Dunmer rm 
	["oaab\\u\\de_rm_bench.nif"] = { name = "Bench", isStatic = true },
	["oaab\\u\\de_rm_scrack.nif"] = { name = "Scroll Rack", isStatic = true },
	["oaab\\u\\de_rm_shelf.nif"] = { name = "Shelf", isStatic = true },
	["oaab\\u\\de_rm_table01.nif"] = { name = "Large Table", isStatic = true },
	["tr\\f\\tr_furn_de_rm_bench.nif"] = { name = "Bench", isStatic = true },
	["tr\\f\\tr_furn_de_rm_bshelf.nif"] = { name = "Bookshelf", isStatic = true },
	["tr\\f\\tr_furn_de_rm_chair01.nif"] = { name = "Chair", isStatic = true },
	["tr\\f\\tr_furn_de_rm_table01.nif"] = { name = "Table", isStatic = true },
	["tr\\f\\tr_furn_de_rm_table03.nif"] = { name = "Table", isStatic = true },

	-- Skyrim Wood pack
	["sky\\f\\sky_furn_n_bar_04.nif"] = { name = "Bar", isStatic = true },
	["sky\\f\\sky_furn_bench_01_01.nif"] = { name = "Bench", isStatic = true },
	["sky\\f\\sky_furn_n_m_bksf_01.nif"] = { name = "Bookshelf", isStatic = true },
	["sky\\f\\sky_furn_n_m_st_01.nif"] = { name = "Chair", isStatic = true },
	["sky\\f\\sky_furn_n_m_tb1.nif"] = { name = "Table", isStatic = true },
	["sky\\f\\sky_furn_table_01_04.nif"] = { name = "Table", isStatic = true },
	["sky\\f\\sky_furn_table_01_06.nif"] = { name = "Table", isStatic = true },
	["sky\\o\\sky_cont_crate_06.nif"] = { name = "Crate", isStatic = true },
	["sky\\o\\sky_furn_n_m_cbrd_01.nif"] = { name = "Cupboard", isStatic = true },
	["sky\\o\\sky_furn_n_m_clst_01.nif"] = { name = "Closet", isStatic = true },

	-- Swirlwood pack
	["f\\furn_de_bench_01.nif"] = { name = "Bench", isStatic = true },
	["f\\furn_de_bookshelf_02.nif"] = { name = "Bookshelf", isStatic = true },
	["f\\furn_de_table_03.nif"] = { name = "Oval Table", isStatic = true },
	["f\\furn_de_table_07.nif"] = { name = "Large Table", isStatic = true },
	["f\\furn_de_table_09.nif"] = { name = "Table", isStatic = true },
	["o\\contain_de_drawers_01.nif"] = { name = "Dresser", isStatic = false },
	["oaab\\u\\de_bookshelf_tall.nif"] = { name = "Bookshelf", isStatic = true },
	["tr\\o\\tr_de_r_desk01.nif"] = { name = "Desk", isStatic = false },
	["tr\\f\\tr_furn_de_r_bkstand.nif"] = { name = "Bookstand", isStatic = true },
	["tr\\f\\tr_furn_de_r_chair.nif"] = { name = "Chair", isStatic = true },

	-- Cherry Wood pack
	["f\\furn_com_bookshelf_01.nif"] = { name = "Bookshelf", isStatic = true },
	["f\\furn_com_chair_01.nif"] = { name = "Chair", isStatic = true },
	["f\\furn_com_table_01.nif"] = { name = "Table", isStatic = true },
	["o\\contain_com_drawers_01.nif"] = { name = "Chest of Drawers", isStatic = false },
	["oaab\\o\\com_r_footlocker.nif"] = { name = "Footlocker", isStatic = true },
	["oaab\\o\\comrchdesk2.nif"] = { name = "Desk", isStatic = true },
	["pc\\f\\pc_furn_com_r_shelf_01.nif"] = { name = "Shelf", isStatic = true },
	["pc\\f\\pc_furn_com_r_displ_01.nif"] = { name = "Display Case", isStatic = true },
	["pc\\o\\pc_furn_com_r_htch01.nif"] = { name = "Hutch", isStatic = true },
	["pc\\o\\pc_furn_com_r_lectr_01.nif"] = { name = "Lecturn", isStatic = true },
}

return this
