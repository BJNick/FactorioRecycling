
require("scripts.recipe-functions")

shredding_base_energy = 2
max_getting_amount = 50000

function Add_Shredding(ingredients, recyclates, recipe_icon)
  for j,n in pairs(data.raw.recipe) do
    if (not n.category) or n.category == "crafting" or n.category == "advanced-crafting" then

      local counts = Total_Raw(n.name, 1, ingredients, true)
      local exp_counts = Total_Raw(n.name, 1, ingredients, false)

      if Find_Max(counts) > 0 and Find_Item(n.name) and (n.result or (n.normal and n.normal.result)) then

        counts = Map(counts, function(v) return v * settings.startup["bjnick-recycling-efficiency"].value end)
        exp_counts = Map(exp_counts, function(v) return v * settings.startup["bjnick-recycling-efficiency"].value end)

        local ingredient_count = 1
        local exp_ingredient_count = 1

        counts = Map(counts, function(v) ingredient_count = math.max(ingredient_count, Calculate_Just_Ingredient_Count(v)) return v end)
        exp_counts = Map(exp_counts, function(v) exp_ingredient_count = math.max(exp_ingredient_count, Calculate_Just_Ingredient_Count(v)) return v end)

        counts = Map(counts, function(v) return v * ingredient_count end)
        exp_counts = Map(exp_counts, function(v) return v * exp_ingredient_count end)

        counts = Map(counts, function(v) return math.floor(math.min(max_getting_amount, v)) end)
        exp_counts = Map(exp_counts, function(v) return math.floor(math.min(max_getting_amount, v)) end)

        if math.floor(Find_Max(counts)) > 0  then

          local n_icon = nil
          if n.normal then
            n_icon = Find_Item_Icon(n.normal.result)
          else
            n_icon = Find_Item_Icon(n.result)
          end

          local norm_results = deepcopy(recyclates)
          norm_results = Map(norm_results, function(v,i) 
            if counts[i] > 0 then
              return {amount=counts[i], name=v} 
            end
          end)

          local exp_results = deepcopy(recyclates)
          exp_results = Map(exp_results, function(v,i) 
            if exp_counts[i] > 0 then
              return {amount=exp_counts[i], name=v} 
            end
          end)

          data:extend({{
            type = "recipe",
            name = "shred-"..n.name,
            localised_name = {"looped-name.shredding"},
            category = "recycle-shredding",
            icons =
            {
              {icon = n_icon},
              {icon = recipe_icon, scale= 0.6, shift = {8, 9}},
            },
            icon_size = 32,
            normal =
            {
              ingredients = {{n.name, ingredient_count}},
              results = norm_results,
              energy_required = math.log(Find_Sum(counts) * shredding_base_energy),
              allow_as_intermediate = false,
            },
            expensive =
            {
              ingredients = {{n.name, exp_ingredient_count}},
              results = exp_results,
              energy_required = math.log(Find_Sum(exp_counts) * shredding_base_energy),
              allow_as_intermediate = false,
            },
            subgroup = "shredding",
            allow_as_intermediate = false,
            hidden = settings.startup["bjnick-toggle-recipes"].value
          }})
        end
      end
    end
  end
end

Add_Shredding({"iron-plate", "copper-plate", "steel-plate", "plastic-bar"}, {"iron-recyclate", "copper-recyclate", "steel-recyclate", "plastic-recyclate"}, "__RecycleEverything__/graphics/recycle-sign-s.png")
