--[[

==============================================================================


Recipe for no-glow standard colors:

dye
glass
glass
glass


Recipe for no-glow pastel colors:

light dye
white paint
glass
glass
glass


Recipe for no-glow faint colors:

light dye
white paint
white paint
glass
glass
glass

recipe for hi-glow-stained-glass:
see init.lua

recipe for low-glow-stained-glass:
see lowglow.lua


All recipes produce three blocks.

==============================================================================
]]--

function makenode(arg)
	name=arg.blockname
	--register item attributes

	minetest.register_node("stained_glass:noglow_" .. name, {
		description = "Stained Glass - (no glow) " .. name,
		drawtype = "glasslike",
		tiles = {"stained_glass_" .. name .. ".png"},
		paramtype = "light",
		sunlight_propagates = true,
		use_texture_alpha = true,
		light_source = 0,
		is_ground_content = true,
		groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3, not_in_creative_inventory=1},
		sounds = default.node_sound_glass_defaults()
	})

end

function defineregular_noglow (arg)
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
		output = "stained_glass:noglow_" .. name .." 3",
		recipe = { 
			mydye,
			"default:glass",
			"default:glass",
			"default:glass",
			},
	})

	makenode{blockname=name}

	minetest.register_alias( "stained_glass:noglow_" .. code, "stained_glass:noglow_" .. name)
	-- and an alias from the numeric to the named block
	-- we need to keep the numeric block for all the people that used
	-- pre-v1.4 blocks in their worlds.

end

function definelight_noglow(arg)
	code=arg.colorcode
	name=arg.colorname
	mydye=arg.recipe

	makenode{blockname=name}

	minetest.register_craft({
		type = "shapeless",
		output = "stained_glass:noglow_" .. name .." 3",
		recipe = { 
			mydye,
			"dye:white",
			"default:glass",
			"default:glass",
			"default:glass",
			},
	})
	minetest.register_alias( "stained_glass:noglow_" .. code, "stained_glass:noglow_" .. name)
end

function definepastel_noglow (arg)
	code=arg.colorcode
	name=arg.colorname	
	mydye=arg.recipe 

	minetest.register_craft({
		type = "shapeless",
		output = "stained_glass:noglow_" .. name .." 3",
		recipe = { 
			mydye,
			"dye:white",
			"dye:white",
			"default:glass",
			"default:glass",
			"default:glass",
			},
	})

	--register item attributes
	--
	makenode{blockname=name}
	minetest.register_alias( "stained_glass:noglow_" .. code, "stained_glass:noglow_" .. name)

end

defineregular_noglow{colorcode="1_3_6", colorname="dark_yellow_s50", recipe="group:dye,unicolor_dark_yellow_s50"} -- works
defineregular_noglow{colorcode="1_3_7", colorname="dark_yellow", recipe="group:dye,unicolor_dark_yellow"} -- works
defineregular_noglow{colorcode="1_4_6", colorname="medium_yellow_s50", recipe="group:dye,unicolor_medium_yellow_s50"} -- works
defineregular_noglow{colorcode="1_4_7", colorname="medium_yellow", recipe="group:dye,unicolor_medium_yellow"} -- works
defineregular_noglow{colorcode="1_5_6", colorname="yellow_s50", recipe="group:dye,unicolor_yellow_s50"} -- works
defineregular_noglow{colorcode="1_5_7", colorname="yellow", recipe="dye:yellow"} -- works
defineregular_noglow{colorcode="2_3_6", colorname="dark_lime_s50", recipe="group:dye,unicolor_dark_lime_s50"} -- works
defineregular_noglow{colorcode="2_3_7", colorname="dark_lime", recipe="group:dye,unicolor_dark_lime"} -- works
defineregular_noglow{colorcode="2_4_6", colorname="medium_lime_s50", recipe="group:dye,unicolor_medium_lime_s50"} -- works
defineregular_noglow{colorcode="2_4_7", colorname="medium_lime", recipe="group:dye,unicolor_medium_lime"} -- works
defineregular_noglow{colorcode="2_5_6", colorname="lime_s50", recipe="group:dye,unicolor_lime_s50"} -- works
defineregular_noglow{colorcode="2_5_7", colorname="lime", recipe="group:dye,excolor_lime"} -- works
defineregular_noglow{colorcode="3_3_6", colorname="dark_green_s50", recipe="group:dye,unicolor_dark_green_s50"} -- works
defineregular_noglow{colorcode="3_3_7", colorname="dark_green", recipe="dye:dark_green"} -- seems to be the same as regular green; PROBLEM
defineregular_noglow{colorcode="3_4_6", colorname="medium_green_s50", recipe="group:dye,unicolor_medium_green_s50"} -- works
defineregular_noglow{colorcode="3_4_7", colorname="medium_green", recipe="group:dye,unicolor_medium_green"} -- works
defineregular_noglow{colorcode="3_5_6", colorname="green_s50", recipe="group:dye,unicolor_green_s50"} -- works
defineregular_noglow{colorcode="3_5_7", colorname="green", recipe="dye:green"} --works -- do not change to group, or you'll break the darkgreen blocks
defineregular_noglow{colorcode="4_3_6", colorname="dark_aqua_s50", recipe="group:dye,unicolor_dark_aqua_s50"} -- works
defineregular_noglow{colorcode="4_3_7", colorname="dark_aqua", recipe="group:dye,unicolor_dark_aqua"} -- works
defineregular_noglow{colorcode="4_4_6", colorname="medium_aqua_s50", recipe="group:dye,unicolor_medium_aqua_s50"} -- works
defineregular_noglow{colorcode="4_4_7", colorname="medium_aqua", recipe="group:dye,unicolor_medium_aqua"} -- works
defineregular_noglow{colorcode="4_5_6", colorname="aqua_s50", recipe="group:dye,unicolor_aqua_s50"} -- works
defineregular_noglow{colorcode="4_5_7", colorname="aqua", recipe="group:dye,unicolor_aqua"} -- works
defineregular_noglow{colorcode="5_3_6", colorname="dark_cyan_s50", recipe="group:dye,unicolor_dark_cyan_s50"} -- works
defineregular_noglow{colorcode="5_3_7", colorname="dark_cyan", recipe="group:dye,unicolor_dark_cyan"} -- works
defineregular_noglow{colorcode="5_4_6", colorname="medium_cyan_s50", recipe="group:dye,unicolor_medium_cyan_s50"} -- works
defineregular_noglow{colorcode="5_4_7", colorname="medium_cyan", recipe="group:dye,unicolor_medium_cyan"} -- works
defineregular_noglow{colorcode="5_5_6", colorname="cyan_s50", recipe="group:dye,unicolor_cyan_s50"} -- works
defineregular_noglow{colorcode="5_5_7", colorname="cyan", recipe="group:dye,basecolor_cyan"} -- works
defineregular_noglow{colorcode="6_3_6", colorname="dark_skyblue_s50", recipe="group:dye,unicolor_dark_skyblue_s50"} -- works
defineregular_noglow{colorcode="6_3_7", colorname="dark_skyblue", recipe="group:dye,unicolor_dark_skyblue"} -- works
defineregular_noglow{colorcode="6_4_6", colorname="medium_skyblue_s50", recipe="group:dye,unicolor_medium_skyblue_s50"} -- works
defineregular_noglow{colorcode="6_4_7", colorname="medium_skyblue", recipe="group:dye,unicolor_medium_skyblue"} -- works
defineregular_noglow{colorcode="6_5_6", colorname="skyblue_s50", recipe="group:dye,unicolor_skyblue_s50"} -- works
defineregular_noglow{colorcode="6_5_7", colorname="skyblue", recipe="group:dye,excolor_sky_blue"} -- works
defineregular_noglow{colorcode="7_3_6", colorname="dark_blue_s50", recipe="group:dye,unicolor_dark_blue_s50"} -- works
defineregular_noglow{colorcode="7_3_7", colorname="dark_blue", recipe="group:dye,unicolor_dark_blue"} -- works
defineregular_noglow{colorcode="7_4_6", colorname="medium_blue_s50", recipe="group:dye,unicolor_medium_blue_s50"} -- works
defineregular_noglow{colorcode="7_4_7", colorname="medium_blue", recipe="group:dye,unicolor_medium_blue"} -- works
defineregular_noglow{colorcode="7_5_6", colorname="blue_s50", recipe="group:dye,unicolor_blue_s50"} -- works
defineregular_noglow{colorcode="7_5_7", colorname="blue", recipe="group:dye,basecolor_blue"} -- works
defineregular_noglow{colorcode="8_3_6", colorname="dark_violet_s50", recipe="group:dye,unicolor_dark_violet_s50"} -- works
defineregular_noglow{colorcode="8_3_7", colorname="dark_violet", recipe="group:dye,unicolor_dark_violet"} -- works
defineregular_noglow{colorcode="8_4_6", colorname="medium_violet_s50", recipe="group:dye,unicolor_medium_violet_s50"} -- works
defineregular_noglow{colorcode="8_4_7", colorname="medium_violet", recipe="group:dye,unicolor_medium_violet"} -- works
defineregular_noglow{colorcode="8_5_6", colorname="violet_s50", recipe="group:dye,unicolor_violet_s50"} -- works
defineregular_noglow{colorcode="8_5_7", colorname="violet", recipe="group:dye,excolor_violet"} -- works
defineregular_noglow{colorcode="9_3_6", colorname="dark_magenta_s50", recipe="group:dye,unicolor_dark_magenta_s50"} -- works
defineregular_noglow{colorcode="9_3_7", colorname="dark_magenta", recipe="group:dye,unicolor_dark_magenta"} -- works
defineregular_noglow{colorcode="9_4_6", colorname="medium_magenta_s50", recipe="group:dye,unicolor_medium_magenta_s50"} -- works
defineregular_noglow{colorcode="9_4_7", colorname="medium_magenta", recipe="group:dye,unicolor_medium_magenta"} -- works
defineregular_noglow{colorcode="9_5_6", colorname="magenta_s50", recipe="group:dye,unicolor_magenta_s50"} -- works
defineregular_noglow{colorcode="9_5_7", colorname="magenta", recipe="dye:magenta"} -- have to use exact dye name to get right color
defineregular_noglow{colorcode="10_3_6", colorname="dark_redviolet_s50", recipe="group:dye,unicolor_dark_redviolet_s50"} -- works
defineregular_noglow{colorcode="10_3_7", colorname="dark_redviolet", recipe="group:dye,unicolor_dark_redviolet"} -- works
defineregular_noglow{colorcode="10_4_6", colorname="medium_redviolet_s50", recipe="group:dye,unicolor_medium_redviolet_s50"} -- works
defineregular_noglow{colorcode="10_4_7", colorname="medium_redviolet", recipe="group:dye,unicolor_medium_redviolet"} -- works
defineregular_noglow{colorcode="10_5_6", colorname="redviolet_s50", recipe="group:dye,unicolor_redviolet_s50"} -- works
defineregular_noglow{colorcode="10_5_7", colorname="redviolet", recipe="dye:redviolet"} -- works now -- have to use exact dye name on this oone. -- looks broken again
defineregular_noglow{colorcode="11_3_6", colorname="dark_red_s50", recipe="group:dye,unicolor_dark_red_s50"} -- works
defineregular_noglow{colorcode="11_3_7", colorname="dark_red", recipe="group:dye,unicolor_dark_red"} -- works
defineregular_noglow{colorcode="11_4_6", colorname="medium_red_s50", recipe="group:dye,unicolor_medium_red_s50"} -- works
defineregular_noglow{colorcode="11_4_7", colorname="medium_red", recipe="group:dye,unicolor_medium_red"} -- works
defineregular_noglow{colorcode="11_5_6", colorname="red_s50", recipe="group:dye,unicolor_red_s50"} -- works
defineregular_noglow{colorcode="11_5_7", colorname="red", recipe="group:dye,basecolor_red"} -- works
defineregular_noglow{colorcode="12_3_6", colorname="dark_orange_s50", recipe="group:dye,unicolor_dark_orange_s50"} --works
defineregular_noglow{colorcode="12_3_7", colorname="dark_orange", recipe="group:dye,unicolor_dark_orange"} -- works
defineregular_noglow{colorcode="12_4_6", colorname="medium_orange_s50", recipe="group:dye,unicolor_medium_orange_s50"} -- works
defineregular_noglow{colorcode="12_4_7", colorname="medium_orange", recipe="group:dye,unicolor_medium_orange"} -- works
defineregular_noglow{colorcode="12_5_6", colorname="orange_s50", recipe="group:dye,unicolor_orange_s50"} -- works
defineregular_noglow{colorcode="12_5_7", colorname="orange", recipe="group:dye,basecolor_orange"} -- works

--if i could've figured out a way to pass multiple items in on recipe, I wouldn't have had to make
-- definelight_noglow or definepastel_noglow

definelight_noglow{colorcode="1_8", colorname="light_yellow", recipe="group:dye,unicolor_light_yellow"} -- works
definelight_noglow{colorcode="2_8", colorname="light_lime", recipe="group:dye,unicolor_light_lime"} -- works
definelight_noglow{colorcode="3_8", colorname="light_green", recipe="group:dye,unicolor_light_green"} -- works
definelight_noglow{colorcode="4_8", colorname="light_aqua", recipe="group:dye,unicolor_light_aqua"} -- works
definelight_noglow{colorcode="5_8", colorname="light_cyan", recipe="group:dye,unicolor_light_cyan"} -- works
definelight_noglow{colorcode="6_8", colorname="light_skyblue", recipe="group:dye,unicolor_light_skyblue"} -- works
definelight_noglow{colorcode="7_8", colorname="light_blue", recipe="group:dye,unicolor_light_blue"} -- works
definelight_noglow{colorcode="8_8", colorname="light_violet", recipe="group:dye,unicolor_light_violet"} -- works
definelight_noglow{colorcode="9_8", colorname="light_magenta", recipe="group:dye,unicolor_light_magenta"} --works
definelight_noglow{colorcode="10_8", colorname="light_redviolet", recipe="group:dye,unicolor_light_redviolet"} -- works
definelight_noglow{colorcode="11_8", colorname="light_red", recipe="group:dye,unicolor_light_red"} -- works (with pink, too!)
definelight_noglow{colorcode="12_8", colorname="light_orange", recipe="group:dye,unicolor_light_orange"} --works

definepastel_noglow{colorcode="1_9", colorname="pastel_yellow", recipe="group:dye,unicolor_light_yellow"}
defineregular_noglow{colorcode="2_9", colorname="pastel_lime", recipe="group:dye,unicolor_light_lime"}
defineregular_noglow{colorcode="3_9", colorname="pastel_green", recipe="group:dye,unicolor_light_green"}
defineregular_noglow{colorcode="4_9", colorname="pastel_aqua", recipe="group:dye,excolor_light_aqua"}
defineregular_noglow{colorcode="5_9", colorname="pastel_cyan", recipe="group:dye,unicolor_light_cyan"}
defineregular_noglow{colorcode="6_9", colorname="pastel_skyblue", recipe="group:dye,unicolor_light_skyblue"}
defineregular_noglow{colorcode="7_9", colorname="pastel_blue", recipe="group:dye,unicolor_light_blue"}
defineregular_noglow{colorcode="8_9", colorname="pastel_violet", recipe="group:dye,unicolor_light_violet"}
defineregular_noglow{colorcode="9_9", colorname="pastel_magenta", recipe="\"group:dye,unicolor_light_magenta"}
defineregular_noglow{colorcode="10_9", colorname="pastel_redviolet", recipe="group:dye,unicolor_light_redviolet"}
defineregular_noglow{colorcode="11_9", colorname="pastel_red", recipe="group:dye,unicolor_light_red"}
defineregular_noglow{colorcode="12_9", colorname="pastel_orange", recipe="group:dye,unicolor_light_orange"}
defineregular_noglow{colorcode="1_91", colorname="faint_yellow", recipe="group:dye,unicolor_light_yellow"}
defineregular_noglow{colorcode="2_91", colorname="faint_lime", recipe="group:dye,unicolor_light_lime"}
defineregular_noglow{colorcode="3_91", colorname="faint_green", recipe="group:dye,unicolor_light_green"}
defineregular_noglow{colorcode="4_91", colorname="faint_aqua", recipe="group:dye,unicolor_light_aqua"}
defineregular_noglow{colorcode="5_91", colorname="faint_cyan", recipe="group:dye,unicolor_light_cyan"}
defineregular_noglow{colorcode="6_91", colorname="faint_skyblue", recipe="group:dye,unicolor_light_skyblue"}
defineregular_noglow{colorcode="7_91", colorname="faint_blue", recipe="group:dye,unicolor_light_blue"}
defineregular_noglow{colorcode="8_91", colorname="faint_violet", recipe="group:dye,unicolor_light_violet"}
defineregular_noglow{colorcode="9_91", colorname="faint_magenta", recipe="group:dye,unicolor_light_magenta"}
defineregular_noglow{colorcode="10_91", colorname="faint_redviolet", recipe="group:dye,unicolor_light_redviolet"}
defineregular_noglow{colorcode="11_91", colorname="faint_red", recipe="group:dye,unicolor_light_red"}
defineregular_noglow{colorcode="12_91", colorname="faint_orange", recipe="group:dye,unicolor_light_orange"}

-- END JDA

print("[stained_glass] Loaded!")


