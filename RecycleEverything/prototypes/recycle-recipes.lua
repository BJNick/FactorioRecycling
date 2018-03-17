
smelting_base_energy = 5
advanced_smelting_base_energy = 4

function Count_Ingredients(elem, ing, sec)
  elcount = 0
  if elem.name then
    if elem.name == ing then
      elcount = elcount + 1
    else
      -- Go through all secondary
      for index, s in ipairs(sec) do
        if elem.name == s[1] then
          elcount = elcount + s[2]
        end
      end
    end
  elseif elem[1] == ing and elem[2] then
    elcount = elcount + elem[2]
  elseif elem[2] then
    -- Go through all secondary
    for index, s in ipairs(sec) do
      if elem[1] == s[1] then
        elcount = elcount + s[2]*elem[2]
      end
    end
  end
  return elcount
end

function Find_Item(item_name)
  searched_item = data.raw["item"][item_name]
  if data.raw["item"][item_name] then
    searched_item = data.raw["item"][item_name]
  elseif data.raw["item-with-entity-data"][item_name] then
    searched_item = data.raw["item-with-entity-data"][item_name]
  elseif data.raw["tool"][item_name] then
    searched_item = data.raw["tool"][item_name]
  elseif data.raw["gun"][item_name] then
    searched_item = data.raw["gun"][item_name]
  elseif data.raw["ammo"][item_name] then
    searched_item = data.raw["ammo"][item_name]
  elseif data.raw["armor"][item_name] then
    searched_item = data.raw["armor"][item_name]
  elseif data.raw["armor"][item_name] then
    searched_item = data.raw["armor"][item_name]
  elseif data.raw["mining-tool"][item_name] then
    searched_item = data.raw["mining-tool"][item_name]
  elseif data.raw["module"][item_name] then
    searched_item = data.raw["module"][item_name]
  elseif data.raw["mining-tool"][item_name] then
    searched_item = data.raw["mining-tool"][item_name]
  elseif data.raw["capsule"][item_name] then
    searched_item = data.raw["capsule"][item_name]
  elseif data.raw["mining-tool"][item_name] then
    searched_item = data.raw["mining-tool"][item_name]
  elseif data.raw["repair-tool"][item_name] then
    searched_item = data.raw["repair-tool"][item_name]
  elseif data.raw["rail-planner"][item_name] then
    searched_item = data.raw["rail-planner"][item_name]
  else
    error("No item-type found for "..item_name)
  end
  return searched_item
end

function Find_Item_Icon(item_name)
  searched_item = Find_Item(item_name)
  if searched_item.icon then
    n_icon = searched_item.icon;
  elseif searched_item.icons then
    n_icon = searched_item.icons[1].icon;
  end
  return n_icon
end

function Add_All(prefix, recipe_category, recipe_subgroup, ingredient, secondary, recipe_icon)
  for j,n in pairs(data.raw.recipe) do
    if (not n.category) or n.category == "crafting" or n.category == "advanced-crafting" then
      if n.normal then
        count = 0
        for h,b in pairs(n.normal.ingredients) do
          count = count + Count_Ingredients(b, ingredient, secondary);
        end
        if count > 0 then
          if n.result_count then
            count = count / n.result_count
          end
          ingredient_count = 1
          count = count * settings.startup["bjnick-recycling-efficiency"].value
          if count < 2 and count ~= math.floor(count) and 2*count == math.floor(2*count) then
            count = count * 2
            ingredient_count = ingredient_count * 2
          elseif count < 2 and count ~= math.floor(count) and 4*count == math.floor(4*count) then
            count = count * 4
            ingredient_count = ingredient_count * 4
          elseif count < 2 and count ~= math.floor(count) and 8*count == math.floor(8*count) then
            count = count * 8
            ingredient_count = ingredient_count * 8
          end
          if math.floor(count) > 0 then
            n_icon = Find_Item_Icon(n.normal.result)
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
              energy_required = smelting_base_energy * (count/4),
              ingredients = {{n.name, ingredient_count}},
              result = ingredient,
              result_count = math.floor(count),
              subgroup = recipe_subgroup,
              hidden = settings.startup["bjnick-toggle-recipes"].value
            }})
          end
      end
      elseif n.ingredients then
        count = 0
        for h,b in pairs(n.ingredients) do
          count = count + Count_Ingredients(b, ingredient, secondary);
        end
        if count > 0 then
          if n.result_count then
            count = count / n.result_count
          end
          ingredient_count = 1
          count = count * settings.startup["bjnick-recycling-efficiency"].value
          if count < 2 and count ~= math.floor(count) and 2*count == math.floor(2*count) then
            count = count * 2
            ingredient_count = ingredient_count * 2
          elseif count < 2 and count ~= math.floor(count) and 4*count == math.floor(4*count) then
            count = count * 4
            ingredient_count = ingredient_count * 4
          elseif count < 2 and count ~= math.floor(count) and 8*count == math.floor(8*count) then
            count = count * 8
            ingredient_count = ingredient_count * 8
          end
          if math.floor(count) > 0 then
            n_icon = Find_Item_Icon(n.result)
            data:extend({{
              type = "recipe",
              name = prefix..n.name,
              icons =
              {
                {icon = n_icon},
                {icon = recipe_icon, scale= 0.6, shift = {8, 9}},
              },
              icon_size = 32,
              category = recipe_category,
              energy_required = smelting_base_energy * (count/4),
              ingredients = {{n.name, ingredient_count}},
              result = ingredient,
              subgroup = recipe_subgroup,
              result_count = math.floor(count),
              hidden = settings.startup["bjnick-toggle-recipes"].value
            }})
          end
        end
      end
    end
  end
end

iron_secondary = {{"iron-gear-wheel", 2}, {"iron-stick", 0.5}, {"electronic-circuit", 1}}
Add_All("iron-recycle-", "iron-recycling", "iron-recycling", "iron-plate", iron_secondary, Find_Item_Icon("iron-plate"))

copper_secondary = {{"copper-cable", 0.5}, {"electronic-circuit", 1.5}}
Add_All("copper-recycle-", "copper-recycling", "copper-recycling", "copper-plate", copper_secondary, Find_Item_Icon("copper-plate"))

function Add_Advanced(prefix, recipe_category, ingredient1, secondary1, ingredient2, secondary2, recipe_icon)
  for j,n in pairs(data.raw.recipe) do
    if (not n.category) or n.category == "crafting" or n.category == "advanced-crafting" then
      if n.normal then
        count1 = 0
        count2 = 0
        for h,b in pairs(n.normal.ingredients) do
          count1 = count1 + Count_Ingredients(b, ingredient1, secondary1);
          count2 = count2 + Count_Ingredients(b, ingredient2, secondary2);
        end
        if count1 > 0 or count2 > 0 then
          if n.result_count then
            count1 = count1 / n.result_count
            count2 = count2 / n.result_count
          end
          ingredient_count = 1
          count1 = count1 * settings.startup["bjnick-recycling-efficiency"].value
          count2 = count2 * settings.startup["bjnick-recycling-efficiency"].value
          if count1 < 2 and count1 ~= math.floor(count1) and 2*count1 == math.floor(2*count1) then
            count1 = count1 * 2
            count2 = count2 * 2
            ingredient_count = ingredient_count * 2
          elseif count1 < 2 and count1 ~= math.floor(count1) and 4*count1 == math.floor(4*count1) then
            count1 = count1 * 4
            count2 = count2 * 4
            ingredient_count = ingredient_count * 4
          elseif count1 < 2 and count1 ~= math.floor(count1) and 8*count1 == math.floor(8*count1) then
            count1 = count1 * 8
            count2 = count2 * 8
            ingredient_count = ingredient_count * 8
          end
          if count2 < 2 and count2 ~= math.floor(count2) and 2*count2 == math.floor(2*count2) then
            count2 = count2 * 2
            count1 = count1 * 2
            ingredient_count = ingredient_count * 2
          elseif count2 < 2 and count2 ~= math.floor(count2) and 4*count2 == math.floor(4*count2) then
            count2 = count2 * 4
            count1 = count1 * 4
            ingredient_count = ingredient_count * 4
          elseif count2 < 2 and count2 ~= math.floor(count2) and 8*count2 == math.floor(8*count2) then
            count2 = count2 * 8
            count1 = count1 * 8
            ingredient_count = ingredient_count * 8
          end
          if math.floor(count1) > 0 and math.floor(count2) > 0 then
            n_icon = Find_Item_Icon(n.normal.result)
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
              energy_required = advanced_smelting_base_energy * ((count1+count2)/2/4),
              ingredients = {{n.name, ingredient_count}},
              results = {
                {ingredient1, math.floor(count1)},{ingredient2, math.floor(count2)}
              },
              subgroup = "both-recycling",
              hidden = settings.startup["bjnick-toggle-recipes"].value
            }})
          elseif math.floor(count1) > 0 and math.floor(count2) == 0 then
            n_icon = Find_Item_Icon(n.normal.result)
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
              ingredients = {{n.name, ingredient_count}},
              results = {
                {ingredient1, math.floor(count1)}
              },
              subgroup = "both-recycling",
              hidden = true
            }})
          elseif math.floor(count1) == 0 and math.floor(count2) > 0 then
            n_icon = Find_Item_Icon(n.normal.result)
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
              ingredients = {{n.name, ingredient_count}},
              results = {
                {ingredient2, math.floor(count2)}
              },
              subgroup = "both-recycling",
              hidden = true
            }})
          end
      end
      elseif n.ingredients then
        count1 = 0
        count2 = 0
        for h,b in pairs(n.ingredients) do
          count1 = count1 + Count_Ingredients(b, ingredient1, secondary1);
          count2 = count2 + Count_Ingredients(b, ingredient2, secondary2);
        end
        if count1 > 0 or count2 > 0 then
          if n.result_count then
            count1 = count1 / n.result_count
            count2 = count2 / n.result_count
          end
          ingredient_count = 1
          count1 = count1 * settings.startup["bjnick-recycling-efficiency"].value
          count2 = count2 * settings.startup["bjnick-recycling-efficiency"].value
          if count1 < 2 and count1 ~= math.floor(count1) and 2*count1 == math.floor(2*count1) then
            count1 = count1 * 2
            count2 = count2 * 2
            ingredient_count = ingredient_count * 2
          elseif count1 < 2 and count1 ~= math.floor(count1) and 4*count1 == math.floor(4*count1) then
            count1 = count1 * 4
            count2 = count2 * 4
            ingredient_count = ingredient_count * 4
          elseif count1 < 2 and count1 ~= math.floor(count1) and 8*count1 == math.floor(8*count1) then
            count1 = count1 * 8
            count2 = count2 * 8
            ingredient_count = ingredient_count * 8
          end
          if count2 < 2 and count2 ~= math.floor(count2) and 2*count2 == math.floor(2*count2) then
            count2 = count2 * 2
            count1 = count1 * 2
            ingredient_count = ingredient_count * 2
          elseif count2 < 2 and count2 ~= math.floor(count2) and 4*count2 == math.floor(4*count2) then
            count2 = count2 * 4
            count1 = count1 * 4
            ingredient_count = ingredient_count * 4
          elseif count2 < 2 and count2 ~= math.floor(count2) and 8*count2 == math.floor(8*count2) then
            count2 = count2 * 8
            count1 = count1 * 8
            ingredient_count = ingredient_count * 8
          end
          if math.floor(count1) > 0 and math.floor(count2) > 0 then
            n_icon = Find_Item_Icon(n.result)
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
              energy_required = advanced_smelting_base_energy * ((count1+count2)/2/4),
              ingredients = {{n.name, ingredient_count}},
              results = {
                {ingredient1, math.floor(count1)},{ingredient2, math.floor(count2)}
              },
              subgroup = "both-recycling",
              hidden = settings.startup["bjnick-toggle-recipes"].value
            }})
          elseif math.floor(count1) > 0 and math.floor(count2) == 0 then
            n_icon = Find_Item_Icon(n.result)
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
              ingredients = {{n.name, ingredient_count}},
              results = {
                {ingredient1, math.floor(count1)}
              },
              subgroup = "both-recycling",
              hidden = true
            }})
          elseif math.floor(count1) == 0 and math.floor(count2) > 0 then
            n_icon = Find_Item_Icon(n.result)
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
              ingredients = {{n.name, ingredient_count}},
              results = {
                {ingredient2, math.floor(count2)}
              },
              subgroup = "both-recycling",
              hidden = true
            }})
          end
        end
      end
    end
  end
end

iron_secondary = {{"iron-gear-wheel", 2}, {"iron-stick", 0.5}, {"electronic-circuit", 1}}
copper_secondary = {{"copper-cable", 0.5}, {"electronic-circuit", 1.5}}
Add_Advanced("both-recycle-", "both-recycling", "iron-plate", iron_secondary, "copper-plate", copper_secondary, "__Recycling__/graphics/recycle-sign-s.png")