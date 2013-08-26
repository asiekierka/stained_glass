for i in ipairs(stained_glass_hues) do

	local huename = stained_glass_hues[i][1]
	local huenumber = i

	for j in ipairs(stained_glass_shades) do

		local shadename = stained_glass_shades[j][1]
		local shadenumber = stained_glass_shades[j][2]

		local recipevalue = nil

		if stained_glass_hues[i][2] then
			recipevalue = "dye:"..shadename..huename
		else
			recipevalue = "group:dye,unicolor_"..shadename..huename
		end

		if shadename == "dark_" or shadename == "medium_" or shadename == "" then

			stained_glass_define_regular({
				colorcode = huenumber.."_"..shadenumber.."_7",
				colorname = shadename..huename,
				recipe = recipevalue,
				light = LIGHT_MAX,
				prefix = "",
				glasstype = "moreblocks:super_glow_glass"
			})

			stained_glass_define_regular({
				colorcode = huenumber.."_"..shadenumber.."_6",
				colorname = shadename..huename.."_s50",
				recipe = recipevalue.."_s50",
				light = LIGHT_MAX,
				prefix = "",
				glasstype = "moreblocks:super_glow_glass"
			})

		elseif shadename == "light_" then

			stained_glass_define_regular({
				colorcode = huenumber.."_"..shadenumber.."_",
				colorname = shadename..huename,
				recipe = recipevalue,
				light = LIGHT_MAX,
				prefix = "",
				glasstype = "moreblocks:super_glow_glass"
			})
			
		elseif shadename == "pastel_" then

			stained_glass_define_pastel({
				colorcode = huenumber.."_"..shadenumber.."_",
				colorname = shadename..huename,
				recipe = recipevalue,
				light = LIGHT_MAX,
				prefix = "",
				glasstype = "moreblocks:super_glow_glass"
			})

		elseif shadename == "faint_" then

			stained_glass_define_faint({
				colorcode = huenumber.."_"..shadenumber.."_",
				colorname = shadename..huename,
				recipe = recipevalue,
				light = LIGHT_MAX,
				prefix = "",
				glasstype = "moreblocks:super_glow_glass"
			})
		end
	end
end
