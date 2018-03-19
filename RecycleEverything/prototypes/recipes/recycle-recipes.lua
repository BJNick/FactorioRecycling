
require("scripts.recipe-functions")

smelting_base_energy = 5
advanced_smelting_base_energy = 4
max_getting_amount = 65535

function Add_All(prefix, recipe_category, recipe_subgroup, ingredient, ing_prefix, recipe_icon)
  for j,n in pairs(data.raw.recipe) do
    if (not n.category) or n.category == "crafting" or n.category == "advanced-crafting" then
      local count = PrintNil(Total_Raw(n.name, 1, {ingredient}, true)[1])
      local exp_count = PrintNil(Total_Raw(n.name, 1, {ingredient}, false)[1])
      if count > 0 and Find_Item(n.name) and (n.result or (n.normal and n.normal.result)) then
        count = count * settings.startup["bjnick-recycling-efficiency"].value
        local ingredient_count, count = Calculate_Best_Ingredient_Count(count)
        exp_count = exp_count * settings.startup["bjnick-recycling-efficiency"].value
        local exp_ingredient_count, exp_count = Calculate_Best_Ingredient_Count(exp_count)

        local stack_size = data.raw["item"][ingredient].stack_size
        local is_stacked, is_exp_stacked = stack_size < count, stack_size < exp_count

        local fin_ingredient, exp_ingredient = ingredient, ingredient
        local fin_energy, exp_energy = 1, 1
        if is_stacked then
          fin_ingredient = ing_prefix..ingredient
          exp_ingredient = fin_ingredient
          count = math.floor(count/10)
          exp_count = math.floor(exp_count/10)
          fin_energy = 10
          exp_energy = 10
        elseif is_exp_stacked then
          exp_ingredient = ing_prefix..ingredient
          exp_count = math.floor(exp_count/10)
          exp_energy = 10
        end

        count = math.min(max_getting_amount, count)
        exp_count = math.min(max_getting_amount, exp_count)

        if math.floor(count) > 0  then
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
              result = fin_ingredient,
              result_count = math.floor(count),
              energy_required = smelting_base_energy * (count/4) * fin_energy,
            },
            expensive =
            {
              ingredients = {{n.name, exp_ingredient_count}},
              result = exp_ingredient,
              result_count = math.floor(exp_count),
              energy_required = smelting_base_energy * (exp_count/4) * exp_energy,
            },
            subgroup = recipe_subgroup,
            hidden = settings.startup["bjnick-toggle-recipes"].value
          }})
        end
      end
    end
  end
end

function Add_Advanced(prefix, recipe_category, ingredient1, ingredient2, ing_prefix, recipe_icon)
  for j,n in pairs(data.raw.recipe) do
    if (not n.category) or n.category == "crafting" or n.category == "advanced-crafting" then

      local both_counts = Total_Raw(n.name, 1, {ingredient1, ingredient2}, true)
      local count1 = PrintNil(both_counts[1])
      local count2 = PrintNil(both_counts[2])

      local exp_both_counts = Total_Raw(n.name, 1, {ingredient1, ingredient2}, false)
      local exp_count1 = PrintNil(both_counts[1])
      local exp_count2 = PrintNil(both_counts[2])
    
      if (count1 > 0 or count2 > 0) and Find_Item(n.name) and (n.result or (n.normal and n.normal.result)) then

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

        local stack_size1 = data.raw["item"][ingredient1].stack_size
        local is_stacked1, is_exp_stacked1 = stack_size1 < count1, stack_size1 < exp_count1
        local stack_size2 = data.raw["item"][ingredient2].stack_size
        local is_stacked2, is_exp_stacked2 = stack_size2 < count2, stack_size2 < exp_count2

        local fin_ingredient1, exp_ingredient1 = ingredient1, ingredient1
        local fin_ingredient2, exp_ingredient2 = ingredient2, ingredient2

        local fin_energy1, exp_energy1 = 1, 1
        local fin_energy2, exp_energy2 = 1, 1

        if is_stacked1 then
          fin_ingredient1 = ing_prefix..ingredient1
          exp_ingredient1 = fin_ingredient1
          count1 = math.floor(count1/10)
          exp_count1 = math.floor(exp_count1/10)
          fin_energy1 = 10
          exp_energy1 = 10
        elseif is_exp_stacked1 then
          exp_ingredient1 = ing_prefix..ingredient1
          exp_count1 = math.floor(exp_count1/10)
          exp_energy1 = 10
        end

        if is_stacked2 then
          fin_ingredient2 = ing_prefix..ingredient2
          exp_ingredient2 = fin_ingredient2
          count2 = math.floor(count2/10)
          exp_count2 = math.floor(exp_count2/10)
          fin_energy2 = 10
          exp_energy2 = 10
        elseif is_exp_stacked2 then
          exp_ingredient2 = ing_prefix..ingredient2
          exp_count2 = math.floor(exp_count2/10)
          exp_energy2 = 10
        end

        count1 = math.min(max_getting_amount, count1)
        exp_count1 = math.min(max_getting_amount, exp_count1)
        count2 = math.min(max_getting_amount, count2)
        exp_count2 = math.min(max_getting_amount, exp_count2)

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
                {fin_ingredient1, math.floor(count1)},{fin_ingredient2, math.floor(count2)}
              },
              energy_required = advanced_smelting_base_energy * ((count1*fin_energy1+count2*fin_energy2)/2/4),
            },
            expensive =
            {
              ingredients = {{n.name, exp_ingredient_count}},
              results = {
                {exp_ingredient1, math.floor(exp_count1)},{exp_ingredient2, math.floor(exp_count2)}
              },
              energy_required = advanced_smelting_base_energy * ((exp_count1*exp_energy1+exp_count2*exp_energy2)/2/4),
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
            normal =
            {
              ingredients = {{n.name, ingredient_count}},
              results = {
                {fin_ingredient1, math.floor(count1)}
              },
              energy_required = advanced_smelting_base_energy * ((count1*fin_energy1+count2*fin_energy2)/2/4),
            },
            expensive =
            {
              ingredients = {{n.name, exp_ingredient_count}},
              results = {
                {exp_ingredient1, math.floor(exp_count1)}
              },
              energy_required = advanced_smelting_base_energy * ((exp_count1*exp_energy1+exp_count2*exp_energy2)/2/4),
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
                {fin_ingredient2, math.floor(count2)}
              },
              energy_required = advanced_smelting_base_energy * ((count1*fin_energy1+count2*fin_energy2)/2/4),
            },
            expensive =
            {
              ingredients = {{n.name, exp_ingredient_count}},
              results = {
                {exp_ingredient2, math.floor(exp_count2)}
              },
              energy_required = advanced_smelting_base_energy * ((exp_count1*exp_energy1+exp_count2*exp_energy2)/2/4),
            },
            subgroup = "both-recycling",
            hidden = true
          }})
        end
      end
    end
  end
end


Add_All("iron-recycle-", "iron-recycling", "iron-recycling", "iron-plate", "recycled-stack-", Find_Item_Icon("iron-plate"))

Add_All("copper-recycle-", "copper-recycling", "copper-recycling", "copper-plate", "recycled-stack-", Find_Item_Icon("copper-plate"))

Add_Advanced("both-recycle-", "both-recycling", "iron-plate", "copper-plate", "recycled-stack-", "__RecycleEverything__/graphics/recycle-sign-s.png")