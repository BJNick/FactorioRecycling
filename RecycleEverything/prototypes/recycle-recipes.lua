
require("scripts.recipe-functions")

smelting_base_energy = 5
advanced_smelting_base_energy = 4

function Add_All(prefix, recipe_category, recipe_subgroup, ingredient, recipe_icon)
  for j,n in pairs(data.raw.recipe) do
    if (not n.category) or n.category == "crafting" or n.category == "advanced-crafting" then
      local count = PrintNil(Total_Raw(n.name, 1, {ingredient}, true)[1])
      local exp_count = PrintNil(Total_Raw(n.name, 1, {ingredient}, false)[1])
      if count > 0 then
        count = count * settings.startup["bjnick-recycling-efficiency"].value
        local ingredient_count, count = Calculate_Best_Ingredient_Count(count)
        exp_count = exp_count * settings.startup["bjnick-recycling-efficiency"].value
        exp_ingredient_count, exp_count = Calculate_Best_Ingredient_Count(exp_count)
        if math.floor(count) > 0 then
          local n_icon = nil
          if n.normal then
            n_icon = Find_Item_Icon(n.normal.result)
          else
            n_icon = Find_Item_Icon(n.result)
          end
          data:extend({{
            type = "recipe",
            name = prefix..n.name,
            category = recipe_category,
            icons =
            {
              {icon = n_icon},
              {icon = recipe_icon, scale= 0.6, shift = {8, 9}},
            },
            icon_size = 32,
            normal =
            {
              ingredients = {{n.name, ingredient_count}},
              result = ingredient,
              result_count = math.floor(count),
              energy_required = smelting_base_energy * (count/4),
            },
            expensive =
            {
              ingredients = {{n.name, exp_ingredient_count}},
              result = ingredient,
              result_count = math.floor(exp_count),
              energy_required = smelting_base_energy * (exp_count/4),
            },
            subgroup = recipe_subgroup,
            hidden = settings.startup["bjnick-toggle-recipes"].value
          }})
        end
      end
    end
  end
end

function Add_Advanced(prefix, recipe_category, ingredient1, ingredient2, recipe_icon)
  for j,n in pairs(data.raw.recipe) do
    if (not n.category) or n.category == "crafting" or n.category == "advanced-crafting" then

      local both_counts = Total_Raw(n.name, 1, {ingredient1, ingredient2}, true)
      local count1 = PrintNil(both_counts[1])
      local count2 = PrintNil(both_counts[2])

      local exp_both_counts = Total_Raw(n.name, 1, {ingredient1, ingredient2}, false)
      local exp_count1 = PrintNil(both_counts[1])
      local exp_count2 = PrintNil(both_counts[2])
    
      if count1 > 0 or count2 > 0 then

        count1 = count1 * settings.startup["bjnick-recycling-efficiency"].value
        count2 = count2 * settings.startup["bjnick-recycling-efficiency"].value
        local ingredient_count_1 = Calculate_Best_Ingredient_Count(count1)
        local ingredient_count_2 = Calculate_Best_Ingredient_Count(count2)
        local ingredient_count = math.max(ingredient_count_1, ingredient_count_2)
        count1 = count1 * ingredient_count
        count2 = count2 * ingredient_count

        exp_count1 = exp_count1 * settings.startup["bjnick-recycling-efficiency"].value
        exp_count2 = exp_count2 * settings.startup["bjnick-recycling-efficiency"].value
        local exp_ingredient_count_1 = Calculate_Best_Ingredient_Count(exp_count1)
        local exp_ingredient_count_2 = Calculate_Best_Ingredient_Count(exp_count2)
        local exp_ingredient_count = math.max(exp_ingredient_count_1, exp_ingredient_count_2)
        exp_count1 = exp_count1 * exp_ingredient_count
        exp_count2 = exp_count2 * exp_ingredient_count

        local n_icon = nil
        if n.normal then
          n_icon = Find_Item_Icon(n.normal.result)
        else
          n_icon = Find_Item_Icon(n.result)
        end
        if math.floor(count1) > 0 and math.floor(count2) > 0 then
          data:extend({{
            type = "recipe",
            name = prefix..n.name,
            localised_name = {"looped-name.recycling"},
            category = recipe_category,
            icons =
            {
              {icon = n_icon},
              {icon = recipe_icon, scale= 0.6, shift = {8, 9}},
            },
            icon_size = 32,
            normal =
            {
              ingredients = {{n.name, ingredient_count}},
              results = {
                {ingredient1, math.floor(count1)},{ingredient2, math.floor(count2)}
              },
              energy_required = advanced_smelting_base_energy * ((count1+count2)/2/4),
            },
            expensive =
            {
              ingredients = {{n.name, exp_ingredient_count}},
              results = {
                {ingredient1, math.floor(exp_count1)},{ingredient2, math.floor(exp_count2)}
              },
              energy_required = advanced_smelting_base_energy * ((exp_count1+exp_count2)/2/4),
            },
            subgroup = "both-recycling",
            hidden = settings.startup["bjnick-toggle-recipes"].value
          }})
        elseif math.floor(count1) > 0 and math.floor(count2) == 0 then
          data:extend({{
            type = "recipe",
            name = prefix..n.name,
            category = recipe_category,
            icons =
            {
              {icon = n_icon},
              {icon = recipe_icon, scale= 0.6, shift = {8, 9}},
            },
            icon_size = 32,
            energy_required = advanced_smelting_base_energy * ((count1+count2)/2/4),
            normal =
            {
              ingredients = {{n.name, ingredient_count}},
              results = {
                {ingredient1, math.floor(count1)}
              },
            },
            expensive =
            {
              ingredients = {{n.name, exp_ingredient_count}},
              results = {
                {ingredient1, math.floor(exp_count1)}
              },
            },
            subgroup = "both-recycling",
            hidden = true
          }})
        elseif math.floor(count1) == 0 and math.floor(count2) > 0 then
          data:extend({{
            type = "recipe",
            name = prefix..n.name,
            category = recipe_category,
            icons =
            {
              {icon = n_icon},
              {icon = recipe_icon, scale= 0.6, shift = {8, 9}},
            },              
            icon_size = 32,
            energy_required = advanced_smelting_base_energy * ((count1+count2)/2/4),
            normal =
            {
              ingredients = {{n.name, ingredient_count}},
              results = {
                {ingredient2, math.floor(count2)}
              },
            },
            expensive =
            {
              ingredients = {{n.name, exp_ingredient_count}},
              results = {
                {ingredient2, math.floor(exp_count2)}
              },
            },
            subgroup = "both-recycling",
            hidden = true
          }})
        end
      end
    end
  end
end


Add_All("iron-recycle-", "iron-recycling", "iron-recycling", "iron-plate", Find_Item_Icon("iron-plate"))

Add_All("copper-recycle-", "copper-recycling", "copper-recycling", "copper-plate", Find_Item_Icon("copper-plate"))

Add_Advanced("both-recycle-", "both-recycling", "iron-plate", "copper-plate", "__RecycleEverything__/graphics/recycle-sign-s.png")