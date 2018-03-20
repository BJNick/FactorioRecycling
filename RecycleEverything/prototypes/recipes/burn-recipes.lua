
require("scripts.recipe-functions")

burning_base_energy = 10

function Add_Burning(prefix, recipe_category, recipe_subgroup)
	for j,n in pairs(data.raw.recipe) do
		local n_item = nil
		if n.normal then
			n_item = n.normal.result
		elseif n.result then
			n_item = n.result
		elseif n.results[1] and n.results[1].type == "item" then
			n_item = n.results[1].name
		end
		if n_item and not data.raw["recipe"][prefix..n_item] then
			local n_icon = Find_Item_Icon(n_item)
			data:extend({{
				type = "recipe",
				name = prefix..n_item,
            	localised_name = {"recipe-name.burn-items"},
				category = recipe_category,
				icons =
				{
					{icon = n_icon},
					{icon = "__RecycleEverything__/graphics/burn.png", scale= 0.6, shift = {8, 9}},
				},
				icon_size = 32,
				ingredients = {{n_item, 1}},
				result = "coal",
				result_count = 0,
				energy_required = burning_base_energy,
				subgroup = recipe_subgroup,
				allow_as_intermediate = false,
				hidden = settings.startup["bjnick-toggle-burn-recipes"].value
			}})
		end
	end
	for i, v in pairs(data.raw["item"]) do
		n_item = v.name
		if n_item and not data.raw["recipe"][prefix..n_item] then
			local n_icon = Find_Item_Icon(n_item)
			data:extend({{
				type = "recipe",
				name = prefix..n_item,
            	localised_name = {"recipe-name.burn-items"},
				category = recipe_category,
				icons =
				{
					{icon = n_icon},
					{icon = "__RecycleEverything__/graphics/burn.png", scale= 0.6, shift = {8, 9}},
				},
				icon_size = 32,
				ingredients = {{n_item, 1}},
				result = "coal",
				result_count = 0,
				energy_required = burning_base_energy,
				subgroup = recipe_subgroup,
				allow_as_intermediate = false,
				hidden = settings.startup["bjnick-toggle-burn-recipes"].value
			}})
		end
	end
end

Add_Burning("destroy-burn-", "recycle-destroying", "burning")	