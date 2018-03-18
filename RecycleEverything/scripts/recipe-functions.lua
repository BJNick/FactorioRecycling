
function Table_Has(table, element)
	local has = false;
	for i, v in ipairs(table) do
		if v == element then
			has = true
		end
	end
	return has;
end

-- ex. item_name="circuit", quantity=3, search_for={"iron_plate", "copper_plate"}
function Total_Raw(item_name, quantity, search_for, is_normal)
	if Table_Has(search_for, item_name) then
		-- If it is one of the components
		local returns = {}
		for i, v in ipairs(search_for) do
			if v == item_name then
				returns[i] = quantity
			end
		end
		return returns
	else
		-- If it is comlex
		local recipe = data.raw["recipe"][item_name]

		if not recipe or (recipe.category and recipe.category~="crafting" and recipe.category~="advanced-crafting") then
			-- if it does not have a non-chemical recipe
			return {}
		else
			local ingredients = nil
			if recipe.ingredients then
				ingredients = recipe.ingredients
			elseif recipe.normal and is_normal then
				ingredients = recipe.normal.ingredients
			elseif recipe.expensive and not is_normal then
				ingredients = recipe.expensive.ingredients
			end
			if not ingredients then
				error("No ingredients found for "..item_name)
			end
			local result_count = 1
			if recipe.result_count then
				result_count = recipe.result_count
			end
			local returns = {}
			for i, v in ipairs(ingredients) do
				if v[1] then
					local found = false
					-- If it is a raw ingredient
					for j, name in ipairs(search_for) do
						if v[1] == name then
							if returns[j] then
								returns[j] = returns[j] + v[2]*quantity/result_count
							else
								returns[j] = v[2]*quantity/result_count
							end
							found = true
						end
					end
					-- If it is a complex one
					if not found then
						local new_quantities = Total_Raw(v[1], v[2]*quantity/result_count, search_for, is_normal)
						for j, w in ipairs(search_for) do
							if new_quantities[j] then
								if returns[j] then
									returns[j] = returns[j]+new_quantities[j]
								else
									returns[j] = new_quantities[j]
								end
							end
						end
					end
				end
			end
			return returns
		end
	end
end

function PrintNil(obj)
	if obj then
		return obj
	else
		return 0
	end
end
--local raw = Total_Raw("construction-robot", 1, {"iron-plate", "copper-plate", "plastic-bar"}, true)
--error("Everything is awesome! i-"..PrintNil(raw[1]).." c-"..PrintNil(raw[2]).." p-"..PrintNil(raw[3]))

function Find_Item(item_name)
  local searched_item = data.raw["item"][item_name]
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
  local searched_item = Find_Item(item_name)
  if searched_item.icon then
    n_icon = searched_item.icon;
  elseif searched_item.icons then
    n_icon = searched_item.icons[1].icon;
  end
  return n_icon
end


function Calculate_Best_Ingredient_Count(count)
	local ingredient_count = 1
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
    return ingredient_count, count
end


