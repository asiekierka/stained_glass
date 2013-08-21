--[[

Stained Glass 1.4

This mod provides luminescent stained glass blocks for Minetest 0.4.x.

Depends:
[moreblocks] by Calinou
[unifieddyes] by VanessaE

==============================================================================
Sat 04 May 2013 01:52:35 PM EDT

Copyright (C) 2013, Eli Innis
Email: doyousketch2 @ yahoo.com

Unified Dyes was released under GNU-GPL 2.0, see LICENSE for info.
More Blocks was released under zlib/libpng for code and CC BY-SA 3.0 Unported for textures, see LICENSE.txt for info.

Additional changes by VanessaEzekowitz in July 2013 to take all items 
out of creative inventory.

August 2013 -- Jeremy Anderson tries to get this working after the new color
changes, and to resurrect the craft recipes. Still GPL'd as far as I'm concerned.

==============================================================================


Recipe for standard colors:

dye
super glow glass
super glow glass
super glow glass


Recipe for pastel colors:

light dye
white paint
super glow glass
super glow glass
super glow glass


Recipe for faint colors:

light dye
white paint
white paint
super glow glass
super glow glass
super glow glass


All recipes produce three glowing stained glass blocks.

==============================================================================
]]--

function makenode(arg)
	name=arg.blockname
	--register item attributes

	minetest.register_node("stained_glass:" .. name, {
		description = "Stained Glass - " .. name,
		drawtype = "glasslike",
		tiles = {"stained_glass_" .. name .. ".png"},
		paramtype = "light",
		sunlight_propagates = true,
		use_texture_alpha = true,
		light_source = LIGHT_MAX,
	-- now using light_max, so we're always as bright as possible.
	-- future possibility is to allow gentle glow bricks.
		is_ground_content = true,
		groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3, not_in_creative_inventory=1},
		sounds = default.node_sound_glass_defaults()
	})

end

function defineregular (arg)
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
		output = "stained_glass:" .. name .." 3",
		recipe = { 
			mydye,
			"moreblocks:super_glow_glass",
			"moreblocks:super_glow_glass",
			"moreblocks:super_glow_glass",
			},
	})

	makenode{blockname=name}

	minetest.register_alias( "stained_glass:" .. code, "stained_glass:" .. name)
	-- and an alias from the numeric to the named block
	-- we need to keep the numeric block for all the people that used
	-- pre-v1.4 blocks in their worlds.

end

function definelight(arg)
	code=arg.colorcode
	name=arg.colorname
	mydye=arg.recipe

	makenode{blockname=name}

	minetest.register_craft({
		type = "shapeless",
		output = "stained_glass:" .. name .." 3",
		recipe = { 
			mydye,
			"dye:white",
			"moreblocks:super_glow_glass",
			"moreblocks:super_glow_glass",
			"moreblocks:super_glow_glass",
			},
	})
	minetest.register_alias( "stained_glass:" .. code, "stained_glass:" .. name)
end

function definepastel (arg)
	code=arg.colorcode
	name=arg.colorname	
	mydye=arg.recipe 

	minetest.register_craft({
		type = "shapeless",
		output = "stained_glass:" .. name .." 3",
		recipe = { 
			mydye,
			"dye:white",
			"dye:white",
			"moreblocks:super_glow_glass",
			"moreblocks:super_glow_glass",
			"moreblocks:super_glow_glass",
			},
	})

	--register item attributes
	--
	makenode{blockname=name}
	minetest.register_alias( "stained_glass:" .. code, "stained_glass:" .. name)

end

defineregular{colorcode="1_3_6", colorname="dark_yellow_s50", recipe="group:dye,unicolor_dark_yellow_s50"} -- works
defineregular{colorcode="1_3_7", colorname="dark_yellow", recipe="group:dye,unicolor_dark_yellow"} -- works
defineregular{colorcode="1_4_6", colorname="medium_yellow_s50", recipe="group:dye,unicolor_medium_yellow_s50"} -- works
defineregular{colorcode="1_4_7", colorname="medium_yellow", recipe="group:dye,unicolor_medium_yellow"} -- works
defineregular{colorcode="1_5_6", colorname="yellow_s50", recipe="group:dye,unicolor_yellow_s50"} -- works
defineregular{colorcode="1_5_7", colorname="yellow", recipe="dye:yellow"} -- works
defineregular{colorcode="2_3_6", colorname="dark_lime_s50", recipe="group:dye,unicolor_dark_lime_s50"} -- works
defineregular{colorcode="2_3_7", colorname="dark_lime", recipe="group:dye,unicolor_dark_lime"} -- works
defineregular{colorcode="2_4_6", colorname="medium_lime_s50", recipe="group:dye,unicolor_medium_lime_s50"} -- works
defineregular{colorcode="2_4_7", colorname="medium_lime", recipe="group:dye,unicolor_medium_lime"} -- works
defineregular{colorcode="2_5_6", colorname="lime_s50", recipe="group:dye,unicolor_lime_s50"} -- works
defineregular{colorcode="2_5_7", colorname="lime", recipe="group:dye,excolor_lime"} -- works
defineregular{colorcode="3_3_6", colorname="dark_green_s50", recipe="group:dye,unicolor_dark_green_s50"} -- works
defineregular{colorcode="3_3_7", colorname="dark_green", recipe="dye:dark_green"} -- seems to be the same as regular green; PROBLEM
defineregular{colorcode="3_4_6", colorname="medium_green_s50", recipe="group:dye,unicolor_medium_green_s50"} -- works
defineregular{colorcode="3_4_7", colorname="medium_green", recipe="group:dye,unicolor_medium_green"} -- works
defineregular{colorcode="3_5_6", colorname="green_s50", recipe="group:dye,unicolor_green_s50"} -- works
defineregular{colorcode="3_5_7", colorname="green", recipe="dye:green"} --works -- do not change to group, or you'll break the darkgreen blocks
defineregular{colorcode="4_3_6", colorname="dark_aqua_s50", recipe="group:dye,unicolor_dark_aqua_s50"} -- works
defineregular{colorcode="4_3_7", colorname="dark_aqua", recipe="group:dye,unicolor_dark_aqua"} -- works
defineregular{colorcode="4_4_6", colorname="medium_aqua_s50", recipe="group:dye,unicolor_medium_aqua_s50"} -- works
defineregular{colorcode="4_4_7", colorname="medium_aqua", recipe="group:dye,unicolor_medium_aqua"} -- works
defineregular{colorcode="4_5_6", colorname="aqua_s50", recipe="group:dye,unicolor_aqua_s50"} -- works
defineregular{colorcode="4_5_7", colorname="aqua", recipe="group:dye,unicolor_aqua"} -- works
defineregular{colorcode="5_3_6", colorname="dark_cyan_s50", recipe="group:dye,unicolor_dark_cyan_s50"} -- works
defineregular{colorcode="5_3_7", colorname="dark_cyan", recipe="group:dye,unicolor_dark_cyan"} -- works
defineregular{colorcode="5_4_6", colorname="medium_cyan_s50", recipe="group:dye,unicolor_medium_cyan_s50"} -- works
defineregular{colorcode="5_4_7", colorname="medium_cyan", recipe="group:dye,unicolor_medium_cyan"} -- works
defineregular{colorcode="5_5_6", colorname="cyan_s50", recipe="group:dye,unicolor_cyan_s50"} -- works
defineregular{colorcode="5_5_7", colorname="cyan", recipe="group:dye,basecolor_cyan"} -- works
defineregular{colorcode="6_3_6", colorname="dark_skyblue_s50", recipe="group:dye,unicolor_dark_skyblue_s50"} -- works
defineregular{colorcode="6_3_7", colorname="dark_skyblue", recipe="group:dye,unicolor_dark_skyblue"} -- works
defineregular{colorcode="6_4_6", colorname="medium_skyblue_s50", recipe="group:dye,unicolor_medium_skyblue_s50"} -- works
defineregular{colorcode="6_4_7", colorname="medium_skyblue", recipe="group:dye,unicolor_medium_skyblue"} -- works
defineregular{colorcode="6_5_6", colorname="skyblue_s50", recipe="group:dye,unicolor_skyblue_s50"} -- works
defineregular{colorcode="6_5_7", colorname="skyblue", recipe="group:dye,excolor_sky_blue"} -- works
defineregular{colorcode="7_3_6", colorname="dark_blue_s50", recipe="group:dye,unicolor_dark_blue_s50"} -- works
defineregular{colorcode="7_3_7", colorname="dark_blue", recipe="group:dye,unicolor_dark_blue"} -- works
defineregular{colorcode="7_4_6", colorname="medium_blue_s50", recipe="group:dye,unicolor_medium_blue_s50"} -- works
defineregular{colorcode="7_4_7", colorname="medium_blue", recipe="group:dye,unicolor_medium_blue"} -- works
defineregular{colorcode="7_5_6", colorname="blue_s50", recipe="group:dye,unicolor_blue_s50"} -- works
defineregular{colorcode="7_5_7", colorname="blue", recipe="group:dye,basecolor_blue"} -- works
defineregular{colorcode="8_3_6", colorname="dark_violet_s50", recipe="group:dye,unicolor_dark_violet_s50"} -- works
defineregular{colorcode="8_3_7", colorname="dark_violet", recipe="group:dye,unicolor_dark_violet"} -- works
defineregular{colorcode="8_4_6", colorname="medium_violet_s50", recipe="group:dye,unicolor_medium_violet_s50"} -- works
defineregular{colorcode="8_4_7", colorname="medium_violet", recipe="group:dye,unicolor_medium_violet"} -- works
defineregular{colorcode="8_5_6", colorname="violet_s50", recipe="group:dye,unicolor_violet_s50"} -- works
defineregular{colorcode="8_5_7", colorname="violet", recipe="group:dye,excolor_violet"} -- works
defineregular{colorcode="9_3_6", colorname="dark_magenta_s50", recipe="group:dye,unicolor_dark_magenta_s50"} -- works
defineregular{colorcode="9_3_7", colorname="dark_magenta", recipe="group:dye,unicolor_dark_magenta"} -- works
defineregular{colorcode="9_4_6", colorname="medium_magenta_s50", recipe="group:dye,unicolor_medium_magenta_s50"} -- works
defineregular{colorcode="9_4_7", colorname="medium_magenta", recipe="group:dye,unicolor_medium_magenta"} -- works
defineregular{colorcode="9_5_6", colorname="magenta_s50", recipe="group:dye,unicolor_magenta_s50"} -- works
defineregular{colorcode="9_5_7", colorname="magenta", recipe="dye:magenta"} -- have to use exact dye name to get right color
defineregular{colorcode="10_3_6", colorname="dark_redviolet_s50", recipe="group:dye,unicolor_dark_redviolet_s50"} -- works
defineregular{colorcode="10_3_7", colorname="dark_redviolet", recipe="group:dye,unicolor_dark_redviolet"} -- works
defineregular{colorcode="10_4_6", colorname="medium_redviolet_s50", recipe="group:dye,unicolor_medium_redviolet_s50"} -- works
defineregular{colorcode="10_4_7", colorname="medium_redviolet", recipe="group:dye,unicolor_medium_redviolet"} -- works
defineregular{colorcode="10_5_6", colorname="redviolet_s50", recipe="group:dye,unicolor_redviolet_s50"} -- works
defineregular{colorcode="10_5_7", colorname="redviolet", recipe="dye:redviolet"} -- works now -- have to use exact dye name on this oone. -- looks broken again
defineregular{colorcode="11_3_6", colorname="dark_red_s50", recipe="group:dye,unicolor_dark_red_s50"} -- works
defineregular{colorcode="11_3_7", colorname="dark_red", recipe="group:dye,unicolor_dark_red"} -- works
defineregular{colorcode="11_4_6", colorname="medium_red_s50", recipe="group:dye,unicolor_medium_red_s50"} -- works
defineregular{colorcode="11_4_7", colorname="medium_red", recipe="group:dye,unicolor_medium_red"} -- works
defineregular{colorcode="11_5_6", colorname="red_s50", recipe="group:dye,unicolor_red_s50"} -- works
defineregular{colorcode="11_5_7", colorname="red", recipe="group:dye,basecolor_red"} -- works
defineregular{colorcode="12_3_6", colorname="dark_orange_s50", recipe="group:dye,unicolor_dark_orange_s50"} --works
defineregular{colorcode="12_3_7", colorname="dark_orange", recipe="group:dye,unicolor_dark_orange"} -- works
defineregular{colorcode="12_4_6", colorname="medium_orange_s50", recipe="group:dye,unicolor_medium_orange_s50"} -- works
defineregular{colorcode="12_4_7", colorname="medium_orange", recipe="group:dye,unicolor_medium_orange"} -- works
defineregular{colorcode="12_5_6", colorname="orange_s50", recipe="group:dye,unicolor_orange_s50"} -- works
defineregular{colorcode="12_5_7", colorname="orange", recipe="group:dye,basecolor_orange"} -- works

--if i could've figured out a way to pass multiple items in on recipe, I wouldn't have had to make
-- definelight or definepastel

definelight{colorcode="1_8", colorname="light_yellow", recipe="group:dye,unicolor_light_yellow"} -- works
definelight{colorcode="2_8", colorname="light_lime", recipe="group:dye,unicolor_light_lime"} -- works
definelight{colorcode="3_8", colorname="light_green", recipe="group:dye,unicolor_light_green"} -- works
definelight{colorcode="4_8", colorname="light_aqua", recipe="group:dye,unicolor_light_aqua"} -- works
definelight{colorcode="5_8", colorname="light_cyan", recipe="group:dye,unicolor_light_cyan"} -- works
definelight{colorcode="6_8", colorname="light_skyblue", recipe="group:dye,unicolor_light_skyblue"} -- works
definelight{colorcode="7_8", colorname="light_blue", recipe="group:dye,unicolor_light_blue"} -- works
definelight{colorcode="8_8", colorname="light_violet", recipe="group:dye,unicolor_light_violet"} -- works
definelight{colorcode="9_8", colorname="light_magenta", recipe="group:dye,unicolor_light_magenta"} --works
definelight{colorcode="10_8", colorname="light_redviolet", recipe="group:dye,unicolor_light_redviolet"} -- works
definelight{colorcode="11_8", colorname="light_red", recipe="group:dye,unicolor_light_red"} -- works (with pink, too!)
definelight{colorcode="12_8", colorname="light_orange", recipe="group:dye,unicolor_light_orange"} --works

definepastel{colorcode="1_9", colorname="pastel_yellow", recipe="group:dye,unicolor_light_yellow"}
defineregular{colorcode="2_9", colorname="pastel_lime", recipe="group:dye,unicolor_light_lime"}
defineregular{colorcode="3_9", colorname="pastel_green", recipe="group:dye,unicolor_light_green"}
defineregular{colorcode="4_9", colorname="pastel_aqua", recipe="group:dye,excolor_light_aqua"}
defineregular{colorcode="5_9", colorname="pastel_cyan", recipe="group:dye,unicolor_light_cyan"}
defineregular{colorcode="6_9", colorname="pastel_skyblue", recipe="group:dye,unicolor_light_skyblue"}
defineregular{colorcode="7_9", colorname="pastel_blue", recipe="group:dye,unicolor_light_blue"}
defineregular{colorcode="8_9", colorname="pastel_violet", recipe="group:dye,unicolor_light_violet"}
defineregular{colorcode="9_9", colorname="pastel_magenta", recipe="\"group:dye,unicolor_light_magenta"}
defineregular{colorcode="10_9", colorname="pastel_redviolet", recipe="group:dye,unicolor_light_redviolet"}
defineregular{colorcode="11_9", colorname="pastel_red", recipe="group:dye,unicolor_light_red"}
defineregular{colorcode="12_9", colorname="pastel_orange", recipe="group:dye,unicolor_light_orange"}
defineregular{colorcode="1_91", colorname="faint_yellow", recipe="group:dye,unicolor_light_yellow"}
defineregular{colorcode="2_91", colorname="faint_lime", recipe="group:dye,unicolor_light_lime"}
defineregular{colorcode="3_91", colorname="faint_green", recipe="group:dye,unicolor_light_green"}
defineregular{colorcode="4_91", colorname="faint_aqua", recipe="group:dye,unicolor_light_aqua"}
defineregular{colorcode="5_91", colorname="faint_cyan", recipe="group:dye,unicolor_light_cyan"}
defineregular{colorcode="6_91", colorname="faint_skyblue", recipe="group:dye,unicolor_light_skyblue"}
defineregular{colorcode="7_91", colorname="faint_blue", recipe="group:dye,unicolor_light_blue"}
defineregular{colorcode="8_91", colorname="faint_violet", recipe="group:dye,unicolor_light_violet"}
defineregular{colorcode="9_91", colorname="faint_magenta", recipe="group:dye,unicolor_light_magenta"}
defineregular{colorcode="10_91", colorname="faint_redviolet", recipe="group:dye,unicolor_light_redviolet"}
defineregular{colorcode="11_91", colorname="faint_red", recipe="group:dye,unicolor_light_red"}
defineregular{colorcode="12_91", colorname="faint_orange", recipe="group:dye,unicolor_light_orange"}

-- END JDA

print("[stained_glass] Loaded!")


