--[[

==============================================================================

Recipe for standard colors:

dye
glow glass
glow glass
glow glass


Recipe for pastel colors:

light dye
white paint
glow glass
glow glass
glow glass


Recipe for faint colors:

light dye
white paint
white paint
glow glass
glow glass
glow glass

recipe for hi-glow-stained-glass:
see init.lua

recipe for no-glow-stained-glass:
see noglow.lua


All recipes produce three glowing stained glass blocks.

==============================================================================
]]--

function makenode(arg)
	name=arg.blockname
	--register item attributes

	minetest.register_node("stained_glass:lowglow_" .. name, {
		description = "Stained Glass - (low glow) " .. name,
		drawtype = "glasslike",
		tiles = {"stained_glass_" .. name .. ".png"},
		paramtype = "light",
		sunlight_propagates = true,
		use_texture_alpha = true,
		light_source = 11,
		is_ground_content = true,
		groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3, not_in_creative_inventory=1},
		sounds = default.node_sound_glass_defaults()
	})

end

function defineregular_lowglow (arg)
	code=arg.colorcode
	name=arg.colorname	
	mydye=arg.recipe 

	-- the purpose of this is to abstract out all the registration 
	-- stuff - duplicated code is bad mmmmmkay?  At least where one can avoid it 

	-- so, instead of 4 loops that each have craft registrations, 
	-- we'll have one block that does registrations, and just call
	-- the procedure repeatedly
	--
	minetest.register_craft({
		type = "shapeless",
		output = "stained_glass:lowglow_" .. name .." 3",
		recipe = { 
			mydye,
			"moreblocks:glow_glass",
			"moreblocks:glow_glass",
			"moreblocks:glow_glass",
			},
	})

	makenode{blockname=name}

	minetest.register_alias( "stained_glass:lowglow_" .. code, "stained_glass:lowglow_" .. name)
	-- and an alias from the numeric to the named block
	-- we need to keep the numeric block for all the people that used
	-- pre-v1.4 blocks in their worlds.

end

function definelight_lowglow(arg)
	code=arg.colorcode
	name=arg.colorname
	mydye=arg.recipe

	makenode{blockname=name}

	minetest.register_craft({
		type = "shapeless",
		output = "stained_glass:lowglow_" .. name .." 3",
		recipe = { 
			mydye,
			"dye:white",
			"moreblocks:glow_glass",
			"moreblocks:glow_glass",
			"moreblocks:glow_glass",
			},
	})
	minetest.register_alias( "stained_glass:lowglow_" .. code, "stained_glass:lowglow_" .. name)
end

function definepastel_lowglow (arg)
	code=arg.colorcode
	name=arg.colorname	
	mydye=arg.recipe 

	minetest.register_craft({
		type = "shapeless",
		output = "stained_glass:lowglow_" .. name .." 3",
		recipe = { 
			mydye,
			"dye:white",
			"dye:white",
			"moreblocks:glow_glass",
			"moreblocks:glow_glass",
			"moreblocks:glow_glass",
			},
	})

	--register item attributes
	--
	makenode{blockname=name}
	minetest.register_alias( "stained_glass:lowglow_" .. code, "stained_glass:lowglow_" .. name)

end

defineregular_lowglow{colorcode="1_3_6", colorname="dark_yellow_s50", recipe="group:dye,unicolor_dark_yellow_s50"} -- works
defineregular_lowglow{colorcode="1_3_7", colorname="dark_yellow", recipe="group:dye,unicolor_dark_yellow"} -- works
defineregular_lowglow{colorcode="1_4_6", colorname="medium_yellow_s50", recipe="group:dye,unicolor_medium_yellow_s50"} -- works
defineregular_lowglow{colorcode="1_4_7", colorname="medium_yellow", recipe="group:dye,unicolor_medium_yellow"} -- works
defineregular_lowglow{colorcode="1_5_6", colorname="yellow_s50", recipe="group:dye,unicolor_yellow_s50"} -- works
defineregular_lowglow{colorcode="1_5_7", colorname="yellow", recipe="dye:yellow"} -- works
defineregular_lowglow{colorcode="2_3_6", colorname="dark_lime_s50", recipe="group:dye,unicolor_dark_lime_s50"} -- works
defineregular_lowglow{colorcode="2_3_7", colorname="dark_lime", recipe="group:dye,unicolor_dark_lime"} -- works
defineregular_lowglow{colorcode="2_4_6", colorname="medium_lime_s50", recipe="group:dye,unicolor_medium_lime_s50"} -- works
defineregular_lowglow{colorcode="2_4_7", colorname="medium_lime", recipe="group:dye,unicolor_medium_lime"} -- works
defineregular_lowglow{colorcode="2_5_6", colorname="lime_s50", recipe="group:dye,unicolor_lime_s50"} -- works
defineregular_lowglow{colorcode="2_5_7", colorname="lime", recipe="group:dye,excolor_lime"} -- works
defineregular_lowglow{colorcode="3_3_6", colorname="dark_green_s50", recipe="group:dye,unicolor_dark_green_s50"} -- works
defineregular_lowglow{colorcode="3_3_7", colorname="dark_green", recipe="dye:dark_green"} -- seems to be the same as regular green; PROBLEM
defineregular_lowglow{colorcode="3_4_6", colorname="medium_green_s50", recipe="group:dye,unicolor_medium_green_s50"} -- works
defineregular_lowglow{colorcode="3_4_7", colorname="medium_green", recipe="group:dye,unicolor_medium_green"} -- works
defineregular_lowglow{colorcode="3_5_6", colorname="green_s50", recipe="group:dye,unicolor_green_s50"} -- works
defineregular_lowglow{colorcode="3_5_7", colorname="green", recipe="dye:green"} --works -- do not change to group, or you'll break the darkgreen blocks
defineregular_lowglow{colorcode="4_3_6", colorname="dark_aqua_s50", recipe="group:dye,unicolor_dark_aqua_s50"} -- works
defineregular_lowglow{colorcode="4_3_7", colorname="dark_aqua", recipe="group:dye,unicolor_dark_aqua"} -- works
defineregular_lowglow{colorcode="4_4_6", colorname="medium_aqua_s50", recipe="group:dye,unicolor_medium_aqua_s50"} -- works
defineregular_lowglow{colorcode="4_4_7", colorname="medium_aqua", recipe="group:dye,unicolor_medium_aqua"} -- works
defineregular_lowglow{colorcode="4_5_6", colorname="aqua_s50", recipe="group:dye,unicolor_aqua_s50"} -- works
defineregular_lowglow{colorcode="4_5_7", colorname="aqua", recipe="group:dye,unicolor_aqua"} -- works
defineregular_lowglow{colorcode="5_3_6", colorname="dark_cyan_s50", recipe="group:dye,unicolor_dark_cyan_s50"} -- works
defineregular_lowglow{colorcode="5_3_7", colorname="dark_cyan", recipe="group:dye,unicolor_dark_cyan"} -- works
defineregular_lowglow{colorcode="5_4_6", colorname="medium_cyan_s50", recipe="group:dye,unicolor_medium_cyan_s50"} -- works
defineregular_lowglow{colorcode="5_4_7", colorname="medium_cyan", recipe="group:dye,unicolor_medium_cyan"} -- works
defineregular_lowglow{colorcode="5_5_6", colorname="cyan_s50", recipe="group:dye,unicolor_cyan_s50"} -- works
defineregular_lowglow{colorcode="5_5_7", colorname="cyan", recipe="group:dye,basecolor_cyan"} -- works
defineregular_lowglow{colorcode="6_3_6", colorname="dark_skyblue_s50", recipe="group:dye,unicolor_dark_skyblue_s50"} -- works
defineregular_lowglow{colorcode="6_3_7", colorname="dark_skyblue", recipe="group:dye,unicolor_dark_skyblue"} -- works
defineregular_lowglow{colorcode="6_4_6", colorname="medium_skyblue_s50", recipe="group:dye,unicolor_medium_skyblue_s50"} -- works
defineregular_lowglow{colorcode="6_4_7", colorname="medium_skyblue", recipe="group:dye,unicolor_medium_skyblue"} -- works
defineregular_lowglow{colorcode="6_5_6", colorname="skyblue_s50", recipe="group:dye,unicolor_skyblue_s50"} -- works
defineregular_lowglow{colorcode="6_5_7", colorname="skyblue", recipe="group:dye,excolor_sky_blue"} -- works
defineregular_lowglow{colorcode="7_3_6", colorname="dark_blue_s50", recipe="group:dye,unicolor_dark_blue_s50"} -- works
defineregular_lowglow{colorcode="7_3_7", colorname="dark_blue", recipe="group:dye,unicolor_dark_blue"} -- works
defineregular_lowglow{colorcode="7_4_6", colorname="medium_blue_s50", recipe="group:dye,unicolor_medium_blue_s50"} -- works
defineregular_lowglow{colorcode="7_4_7", colorname="medium_blue", recipe="group:dye,unicolor_medium_blue"} -- works
defineregular_lowglow{colorcode="7_5_6", colorname="blue_s50", recipe="group:dye,unicolor_blue_s50"} -- works
defineregular_lowglow{colorcode="7_5_7", colorname="blue", recipe="group:dye,basecolor_blue"} -- works
defineregular_lowglow{colorcode="8_3_6", colorname="dark_violet_s50", recipe="group:dye,unicolor_dark_violet_s50"} -- works
defineregular_lowglow{colorcode="8_3_7", colorname="dark_violet", recipe="group:dye,unicolor_dark_violet"} -- works
defineregular_lowglow{colorcode="8_4_6", colorname="medium_violet_s50", recipe="group:dye,unicolor_medium_violet_s50"} -- works
defineregular_lowglow{colorcode="8_4_7", colorname="medium_violet", recipe="group:dye,unicolor_medium_violet"} -- works
defineregular_lowglow{colorcode="8_5_6", colorname="violet_s50", recipe="group:dye,unicolor_violet_s50"} -- works
defineregular_lowglow{colorcode="8_5_7", colorname="violet", recipe="group:dye,excolor_violet"} -- works
defineregular_lowglow{colorcode="9_3_6", colorname="dark_magenta_s50", recipe="group:dye,unicolor_dark_magenta_s50"} -- works
defineregular_lowglow{colorcode="9_3_7", colorname="dark_magenta", recipe="group:dye,unicolor_dark_magenta"} -- works
defineregular_lowglow{colorcode="9_4_6", colorname="medium_magenta_s50", recipe="group:dye,unicolor_medium_magenta_s50"} -- works
defineregular_lowglow{colorcode="9_4_7", colorname="medium_magenta", recipe="group:dye,unicolor_medium_magenta"} -- works
defineregular_lowglow{colorcode="9_5_6", colorname="magenta_s50", recipe="group:dye,unicolor_magenta_s50"} -- works
defineregular_lowglow{colorcode="9_5_7", colorname="magenta", recipe="dye:magenta"} -- have to use exact dye name to get right color
defineregular_lowglow{colorcode="10_3_6", colorname="dark_redviolet_s50", recipe="group:dye,unicolor_dark_redviolet_s50"} -- works
defineregular_lowglow{colorcode="10_3_7", colorname="dark_redviolet", recipe="group:dye,unicolor_dark_redviolet"} -- works
defineregular_lowglow{colorcode="10_4_6", colorname="medium_redviolet_s50", recipe="group:dye,unicolor_medium_redviolet_s50"} -- works
defineregular_lowglow{colorcode="10_4_7", colorname="medium_redviolet", recipe="group:dye,unicolor_medium_redviolet"} -- works
defineregular_lowglow{colorcode="10_5_6", colorname="redviolet_s50", recipe="group:dye,unicolor_redviolet_s50"} -- works
defineregular_lowglow{colorcode="10_5_7", colorname="redviolet", recipe="dye:redviolet"} -- works now -- have to use exact dye name on this oone. -- looks broken again
defineregular_lowglow{colorcode="11_3_6", colorname="dark_red_s50", recipe="group:dye,unicolor_dark_red_s50"} -- works
defineregular_lowglow{colorcode="11_3_7", colorname="dark_red", recipe="group:dye,unicolor_dark_red"} -- works
defineregular_lowglow{colorcode="11_4_6", colorname="medium_red_s50", recipe="group:dye,unicolor_medium_red_s50"} -- works
defineregular_lowglow{colorcode="11_4_7", colorname="medium_red", recipe="group:dye,unicolor_medium_red"} -- works
defineregular_lowglow{colorcode="11_5_6", colorname="red_s50", recipe="group:dye,unicolor_red_s50"} -- works
defineregular_lowglow{colorcode="11_5_7", colorname="red", recipe="group:dye,basecolor_red"} -- works
defineregular_lowglow{colorcode="12_3_6", colorname="dark_orange_s50", recipe="group:dye,unicolor_dark_orange_s50"} --works
defineregular_lowglow{colorcode="12_3_7", colorname="dark_orange", recipe="group:dye,unicolor_dark_orange"} -- works
defineregular_lowglow{colorcode="12_4_6", colorname="medium_orange_s50", recipe="group:dye,unicolor_medium_orange_s50"} -- works
defineregular_lowglow{colorcode="12_4_7", colorname="medium_orange", recipe="group:dye,unicolor_medium_orange"} -- works
defineregular_lowglow{colorcode="12_5_6", colorname="orange_s50", recipe="group:dye,unicolor_orange_s50"} -- works
defineregular_lowglow{colorcode="12_5_7", colorname="orange", recipe="group:dye,basecolor_orange"} -- works

--if i could've figured out a way to pass multiple items in on recipe, I wouldn't have had to make
-- definelight_lowglow or definepastel_lowglow

definelight_lowglow{colorcode="1_8", colorname="light_yellow", recipe="group:dye,unicolor_light_yellow"} -- works
definelight_lowglow{colorcode="2_8", colorname="light_lime", recipe="group:dye,unicolor_light_lime"} -- works
definelight_lowglow{colorcode="3_8", colorname="light_green", recipe="group:dye,unicolor_light_green"} -- works
definelight_lowglow{colorcode="4_8", colorname="light_aqua", recipe="group:dye,unicolor_light_aqua"} -- works
definelight_lowglow{colorcode="5_8", colorname="light_cyan", recipe="group:dye,unicolor_light_cyan"} -- works
definelight_lowglow{colorcode="6_8", colorname="light_skyblue", recipe="group:dye,unicolor_light_skyblue"} -- works
definelight_lowglow{colorcode="7_8", colorname="light_blue", recipe="group:dye,unicolor_light_blue"} -- works
definelight_lowglow{colorcode="8_8", colorname="light_violet", recipe="group:dye,unicolor_light_violet"} -- works
definelight_lowglow{colorcode="9_8", colorname="light_magenta", recipe="group:dye,unicolor_light_magenta"} --works
definelight_lowglow{colorcode="10_8", colorname="light_redviolet", recipe="group:dye,unicolor_light_redviolet"} -- works
definelight_lowglow{colorcode="11_8", colorname="light_red", recipe="group:dye,unicolor_light_red"} -- works (with pink, too!)
definelight_lowglow{colorcode="12_8", colorname="light_orange", recipe="group:dye,unicolor_light_orange"} --works

definepastel_lowglow{colorcode="1_9", colorname="pastel_yellow", recipe="group:dye,unicolor_light_yellow"}
defineregular_lowglow{colorcode="2_9", colorname="pastel_lime", recipe="group:dye,unicolor_light_lime"}
defineregular_lowglow{colorcode="3_9", colorname="pastel_green", recipe="group:dye,unicolor_light_green"}
defineregular_lowglow{colorcode="4_9", colorname="pastel_aqua", recipe="group:dye,excolor_light_aqua"}
defineregular_lowglow{colorcode="5_9", colorname="pastel_cyan", recipe="group:dye,unicolor_light_cyan"}
defineregular_lowglow{colorcode="6_9", colorname="pastel_skyblue", recipe="group:dye,unicolor_light_skyblue"}
defineregular_lowglow{colorcode="7_9", colorname="pastel_blue", recipe="group:dye,unicolor_light_blue"}
defineregular_lowglow{colorcode="8_9", colorname="pastel_violet", recipe="group:dye,unicolor_light_violet"}
defineregular_lowglow{colorcode="9_9", colorname="pastel_magenta", recipe="\"group:dye,unicolor_light_magenta"}
defineregular_lowglow{colorcode="10_9", colorname="pastel_redviolet", recipe="group:dye,unicolor_light_redviolet"}
defineregular_lowglow{colorcode="11_9", colorname="pastel_red", recipe="group:dye,unicolor_light_red"}
defineregular_lowglow{colorcode="12_9", colorname="pastel_orange", recipe="group:dye,unicolor_light_orange"}
defineregular_lowglow{colorcode="1_91", colorname="faint_yellow", recipe="group:dye,unicolor_light_yellow"}
defineregular_lowglow{colorcode="2_91", colorname="faint_lime", recipe="group:dye,unicolor_light_lime"}
defineregular_lowglow{colorcode="3_91", colorname="faint_green", recipe="group:dye,unicolor_light_green"}
defineregular_lowglow{colorcode="4_91", colorname="faint_aqua", recipe="group:dye,unicolor_light_aqua"}
defineregular_lowglow{colorcode="5_91", colorname="faint_cyan", recipe="group:dye,unicolor_light_cyan"}
defineregular_lowglow{colorcode="6_91", colorname="faint_skyblue", recipe="group:dye,unicolor_light_skyblue"}
defineregular_lowglow{colorcode="7_91", colorname="faint_blue", recipe="group:dye,unicolor_light_blue"}
defineregular_lowglow{colorcode="8_91", colorname="faint_violet", recipe="group:dye,unicolor_light_violet"}
defineregular_lowglow{colorcode="9_91", colorname="faint_magenta", recipe="group:dye,unicolor_light_magenta"}
defineregular_lowglow{colorcode="10_91", colorname="faint_redviolet", recipe="group:dye,unicolor_light_redviolet"}
defineregular_lowglow{colorcode="11_91", colorname="faint_red", recipe="group:dye,unicolor_light_red"}
defineregular_lowglow{colorcode="12_91", colorname="faint_orange", recipe="group:dye,unicolor_light_orange"}

-- END JDA

print("[stained_glass] Loaded!")


