
local S = minetest.get_translator()

orez = {}



orez.easy_create_gem = function(gem_name,gem_external_name,block_level)
	
	local the_group = {}
	
	the_group[gem_name] = 1
	
	minetest.register_node("orez:" .. gem_name .. "_block", {
		description = S("@1 Block",gem_external_name),
		groups = {cracky=block_level},
		tiles = {"orez_" .. gem_name .. "_block.png"},
		sounds = default.node_sound_metal_defaults(),
	})
	
	minetest.register_craftitem("orez:" .. gem_name, {
	description = gem_external_name,
	inventory_image = "orez_" .. gem_name .. ".png",
	groups = the_group
	})
	
	minetest.register_node("orez:stone_with_" .. gem_name, {
		description = S("@1 Ore",gem_external_name),
		tiles = {"default_stone.png^orez_mineral_" .. gem_name .. ".png"},
		groups = {cracky = block_level},
		drop = "orez:" .. gem_name,
		sounds = default.node_sound_stone_defaults(),
	})
	
	minetest.register_craft({
		output = "orez:" .. gem_name .. "_block",
		recipe = {
			{"group:" .. gem_name,"group:" .. gem_name,"group:" .. gem_name},
			{"group:" .. gem_name,"group:" .. gem_name,"group:" .. gem_name},
			{"group:" .. gem_name,"group:" .. gem_name,"group:" .. gem_name},
		}
	})

end





orez.easy_create_gem("ruby",S("Ruby"),2)

bens_gear.add_ore({
	internal_name = "orez_ruby",
	display_name = S("Ruby"),
	item_name = "group:ruby",
	max_drop_level = 2,
	damage_groups_any = {fleshy=3},
	damage_groups_sword = {fleshy=4},
	damage_groups_axe = {fleshy=5},
	full_punch_interval = 0.8,
	uses = 18,
	flammable = false,
	groupcaps = { --the groupcaps for the tool. durability is typically used instead of "uses" so there is no need to define it
		crumbly = {times={[1]=1.10, [2]=0.50, [3]=0.35}, maxlevel=2},
		cracky = {times={[1]=2.0, [2]=1.0, [3]=0.55}, maxlevel=2},
		choppy = {times={[1]=2.01, [2]=0.81, [3]=0.41}, maxlevel=2},
		snappy = {times={[1]=1.90, [2]=0.90, [3]=0.35}, maxlevel=2},
	
	},
	tool_list = {
	--"pickaxe"
	},
	tool_list_whitelist = false, --if this is true, then tool_list should act like a whitelist, otherwise, it'll act like a blacklist
	color = "E52228",
	tool_textures = {
		default_alias = "gem", --what to append to the end of the default texture name, example: "bens_gear_axe_" would become "bens_gear_axe_metal"
		--pickaxe = {"bens_gear_pick_wood.png",true} --use a custom texture for pickaxes, you can add more for other tools
	},
	misc_data = {magic=7}, --here you can store various other weird stats for other mods to utilize, the only stat that is officially supported at the moment is "magic"
	additional_functions = { --a list of additional functions that'll be called upon certain conditions. This is here so that custom tools don't have to have support manually added.
		node_mined = nil,
		tool_destroyed = nil,
		tool_attempt_place = nil,
	},
	pre_finalization_function = nil --this function should be called RIGHT BEFORE the tool/item/whatever gets created, so that the material can add its own custom handling/data
	--it should be called like this: func(tool_id,data)
})

orez.easy_create_gem("onyx",S("Onyx"),1)

bens_gear.add_ore({
	internal_name = "orez_onyx",
	display_name = S("Onyx"),
	item_name = "group:onyx",
	max_drop_level = 1,
	damage_groups_any = {fleshy=2},
	damage_groups_sword = {fleshy=4},
	damage_groups_axe = {fleshy=5},
	full_punch_interval = 1.2,
	uses = 20,
	flammable = false,
	groupcaps = { --the groupcaps for the tool. durability is typically used instead of "uses" so there is no need to define it
		crumbly = {times={[1]=1.40, [2]=0.80, [3]=0.30}, maxlevel=2},
		cracky = {times={[1]=4.05, [2]=1.65, [3]=0.85}, maxlevel=2},
		choppy = {times={[1]=2.55, [2]=1.45, [3]=1.05}, maxlevel=2},
		snappy = {times={[1]=2.55, [2]=1.25, [3]=0.4}, maxlevel=2},
	
	},
	tool_list = {
	--"pickaxe"
	},
	tool_list_whitelist = false, --if this is true, then tool_list should act like a whitelist, otherwise, it'll act like a blacklist
	color = "0E0E0E",
	tool_textures = {
		default_alias = "gem", --what to append to the end of the default texture name, example: "bens_gear_axe_" would become "bens_gear_axe_metal"
		--pickaxe = {"bens_gear_pick_wood.png",true} --use a custom texture for pickaxes, you can add more for other tools
	},
	misc_data = {magic=1}, --here you can store various other weird stats for other mods to utilize, the only stat that is officially supported at the moment is "magic"
	additional_functions = { --a list of additional functions that'll be called upon certain conditions. This is here so that custom tools don't have to have support manually added.
		node_mined = nil,
		tool_destroyed = nil,
		tool_attempt_place = nil,
	},
	pre_finalization_function = nil --this function should be called RIGHT BEFORE the tool/item/whatever gets created, so that the material can add its own custom handling/data
	--it should be called like this: func(tool_id,data)
})


minetest.register_ore({
		ore_type       = "scatter",
		ore            = "orez:stone_with_ruby",
		wherein        = "default:stone",
		clust_scarcity = 16 * 16 * 17,
		clust_num_ores = 2,
		clust_size     = 2,
		y_max          = -114,
		y_min          = -512,
})

minetest.register_ore({
		ore_type       = "scatter",
		ore            = "orez:stone_with_ruby",
		wherein        = "default:stone",
		clust_scarcity = 16 * 16 * 16,
		clust_num_ores = 1,
		clust_size     = 2,
		y_max          = -512,
		y_min          = -30500,
})


minetest.register_ore({
		ore_type       = "scatter",
		ore            = "orez:stone_with_onyx",
		wherein        = "default:stone",
		clust_scarcity = (8 * 12 * 8) + 70,
		clust_num_ores = 2,
		clust_size     = 2,
		y_max          = -100,
		y_min          = -31000,
})

orez.easy_create_gem("peridot",S("Peridot"),1)

bens_gear.add_ore({
	internal_name = "orez_peridot",
	display_name = S("Peridot"),
	item_name = "group:peridot",
	max_drop_level = 3,
	damage_groups_any = {fleshy=2},
	damage_groups_sword = {fleshy=7},
	damage_groups_axe = {fleshy=5},
	full_punch_interval = 1.3,
	uses = 20,
	flammable = false,
	groupcaps = { --the groupcaps for the tool. durability is typically used instead of "uses" so there is no need to define it
		crumbly = {times={[1]=1.80, [2]=1.20, [3]=0.50}, maxlevel=3},
		cracky = {times={[1]=4.00, [2]=2.0, [3]=1.00}, maxlevel=3},
		choppy = {times={[1]=3.00, [2]=2.00, [3]=1.30}, maxlevel=3},
		snappy = {times={[2]=0.4, [3]=0.20}, maxlevel=3},
	
	},
	tool_list = {
	--"pickaxe"
	},
	tool_list_whitelist = false, --if this is true, then tool_list should act like a whitelist, otherwise, it'll act like a blacklist
	color = "0CA11D",
	tool_textures = {
		default_alias = "gem", --what to append to the end of the default texture name, example: "bens_gear_axe_" would become "bens_gear_axe_metal"
		--pickaxe = {"bens_gear_pick_wood.png",true} --use a custom texture for pickaxes, you can add more for other tools
	},
	misc_data = {magic=8}, --here you can store various other weird stats for other mods to utilize, the only stat that is officially supported at the moment is "magic"
	additional_functions = { --a list of additional functions that'll be called upon certain conditions. This is here so that custom tools don't have to have support manually added.
		node_mined = nil,
		tool_destroyed = nil,
		tool_attempt_place = nil,
	},
	pre_finalization_function = nil --this function should be called RIGHT BEFORE the tool/item/whatever gets created, so that the material can add its own custom handling/data
	--it should be called like this: func(tool_id,data)
})

minetest.register_ore({
		ore_type       = "scatter",
		ore            = "orez:stone_with_peridot",
		wherein        = "default:stone",
		clust_scarcity = (16 * 15 * 16) + 10,
		clust_num_ores = 2,
		clust_size     = 12,
		y_max          = 200,
		y_min          = -200,
})

orez.easy_create_gem("saphire","Saphire",1)

bens_gear.add_ore({
	internal_name = "orez_saphire",
	display_name = S("Saphire"),
	item_name = "group:saphire",
	max_drop_level = 3,
	damage_groups_any = {fleshy=3},
	damage_groups_sword = {fleshy=5},
	damage_groups_axe = {fleshy=4},
	full_punch_interval = 0.7,
	uses = 30,
	flammable = false,
	groupcaps = { --the groupcaps for the tool. durability is typically used instead of "uses" so there is no need to define it
		crumbly = {times={[1]=1.30, [2]=0.70, [3]=0.50}, maxlevel=3},
		cracky = {times={[1]=1.8, [2]=0.8, [3]=0.40}, maxlevel=3},
		choppy = {times={[1]=2.30, [2]=1.20, [3]=0.70}, maxlevel=3},
		snappy = {times={[1]=1.80, [2]=1.30, [3]=0.60}, maxlevel=3},
	
	},
	tool_list = {
	--"pickaxe"
	},
	tool_list_whitelist = false, --if this is true, then tool_list should act like a whitelist, otherwise, it'll act like a blacklist
	color = "0016B3",
	tool_textures = {
		default_alias = "gem", --what to append to the end of the default texture name, example: "bens_gear_axe_" would become "bens_gear_axe_metal"
		--pickaxe = {"bens_gear_pick_wood.png",true} --use a custom texture for pickaxes, you can add more for other tools
	},
	misc_data = {magic=9}, --here you can store various other weird stats for other mods to utilize, the only stat that is officially supported at the moment is "magic"
	additional_functions = { --a list of additional functions that'll be called upon certain conditions. This is here so that custom tools don't have to have support manually added.
		node_mined = nil,
		tool_destroyed = nil,
		tool_attempt_place = nil,
	},
	pre_finalization_function = nil --this function should be called RIGHT BEFORE the tool/item/whatever gets created, so that the material can add its own custom handling/data
	--it should be called like this: func(tool_id,data)
})

minetest.register_ore({
		ore_type       = "scatter",
		ore            = "orez:stone_with_saphire",
		wherein        = "default:stone",
		clust_scarcity = 16 * 16 * 17,
		clust_num_ores = 3,
		clust_size     = 16,
		y_max          = -750,
		y_min          = -31000,
})
