--[[

Stained Glass 1.5

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


August 2013 -- rewritten a bit by VanessaEzekowitz to further condense the code.

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


All recipes produce three stained glass blocks.

==============================================================================
]]--

function makenode(arg)
	name=arg.blockname

	--register item attributes

	minetest.register_node("stained_glass:"..arg.prefix..name, {
		description = "Stained Glass - "..arg.prefix..name,
		drawtype = "glasslike",
		tiles = {"stained_glass_" .. name .. ".png"},
		paramtype = "light",
		sunlight_propagates = true,
		use_texture_alpha = true,
		light_source = arg.light,
		is_ground_content = true,
		groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3, not_in_creative_inventory=1},
		sounds = default.node_sound_glass_defaults()
	})
end


-- the purpose of this is to abstract out all the registration 
-- stuff - duplicated code is bad mmmmmkay?  At least where one can avoid it 

-- so, instead of 4 loops that each have craft registrations, 
-- we'll have one block that does registrations, and just call
-- the procedure repeatedly
--

function stained_glass_define_regular(arg)
	code=arg.colorcode
	name=arg.colorname	
	mydye=arg.recipe 
	myprefix = arg.prefix
	glasstype = arg.glasstype

	minetest.register_craft({
		type = "shapeless",
		output = "stained_glass:"..myprefix..name.." 3",
		recipe = { 
			mydye,
			glasstype,
			glasstype,
			glasstype,
			},
	})

	makenode{blockname=name, light=arg.light, prefix=myprefix}

	if myprefix == "" then
		minetest.register_alias( "stained_glass:" .. code, "stained_glass:" .. name)
	end
	-- and an alias from the numeric to the named block
	-- we need to keep the numeric block for all the people that used
	-- pre-v1.4 blocks in their worlds.

end

function stained_glass_define_pastel(arg)
	code=arg.colorcode
	name=arg.colorname
	mydye=arg.recipe
	myprefix = arg.prefix
	glasstype = arg.glasstype

	minetest.register_craft({
		type = "shapeless",
		output = "stained_glass:"..myprefix..name .." 3",
		recipe = { 
			mydye,
			"dye:white",
			glasstype,
			glasstype,
			glasstype,
			},
	})

	makenode{blockname=name,light=arg.light, prefix=myprefix}

	if myprefix == "" then
		minetest.register_alias( "stained_glass:" .. code, "stained_glass:" .. name)
	end
end

function stained_glass_define_faint(arg)
	code=arg.colorcode
	name=arg.colorname	
	mydye=arg.recipe
	myprefix = arg.prefix
	glasstype = arg.glasstype

	minetest.register_craft({
		type = "shapeless",
		output = "stained_glass:"..myprefix..name.." 3",
		recipe = { 
			mydye,
			"dye:white",
			"dye:white",
			glasstype,
			glasstype,
			glasstype,
			},
	})

	--register item attributes
	--
	makenode{blockname=name,light=arg.light, prefix=myprefix}

	if myprefix == "" then
		minetest.register_alias( "stained_glass:" .. code, "stained_glass:" .. name)
	end
end

-- true means this color's recipe must use a direct "dye:xxxxx" item name
-- (perhaps because the related groups overlap two or more distinct colors)
-- false means the recipe uses "group:dye,unicolor_xxxxx"

stained_glass_hues = {
	{ "yellow", true },
	{ "lime", false },
	{ "green", true },
	{ "aqua", false },
	{ "cyan", false },
	{ "skyblue", false },
	{ "blue", false },
	{ "violet", true },
	{ "magenta", true },
	{ "redviolet", true },
	{ "red", true },
	{ "orange", false },
}

stained_glass_shades = {
	{"dark_",   3  },
	{"medium_", 4  },
	{"",        5  }, -- full brightness
	{"light_",  8  },
	{"pastel_", 9  },
	{"faint_",  91 }
}

dofile(minetest.get_modpath("stained_glass").."/high_glow.lua") 
dofile(minetest.get_modpath("stained_glass").."/low_glow.lua") 
dofile(minetest.get_modpath("stained_glass").."/no_glow.lua") 

print("[stained_glass] Loaded!")


