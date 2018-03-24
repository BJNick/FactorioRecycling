
function Table_Has(table, element)
	local has = false
	for i, v in ipairs(table) do
		if v == element then
			has = true
		end
	end
	return has;
end

function Map(list, lfunction)
  for i, v in ipairs(list) do
    list[i] = lfunction(list[i], i)
  end
  return list
end

function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
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
			local returns = deepcopy(search_for)
			returns = Map(returns, function(v) return 0 end)
			return returns
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
			local returns = deepcopy(search_for)
			returns = Map(returns, function(v) return 0 end)
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

-- Doesn't do anything but works...
NOT_ITEM_CATEGORIES = {"recipe", "technology", "fluid"}

function Find_Item(item_name)
  local searched_item = nil
  for i, v in pairs(data.raw) do
  	if not Table_Has(NOT_ITEM_CATEGORIES, i) and v[item_name] and (v[item_name].icon or v[item_name].icons) then
    	searched_item = v[item_name]
	end
  end
  return searched_item
end

function Find_Item_Icon(item_name)
  local searched_item = Find_Item(item_name)
  if not searched_item then
  	error("No item for "..PrintNil(item_name))
  end
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

function Calculate_Just_Ingredient_Count(count)
	local ingredient_count = 1
	if count < 2 and count ~= math.floor(count) and 2*count == math.floor(2*count) then
  		ingredient_count = ingredient_count * 2
    elseif count < 2 and count ~= math.floor(count) and 4*count == math.floor(4*count) then
  		ingredient_count = ingredient_count * 4
    elseif count < 2 and count ~= math.floor(count) and 8*count == math.floor(8*count) then
      	ingredient_count = ingredient_count * 8
    end
    return ingredient_count
end

function Find_Max(list)
  local max = 0
  for i, v in pairs(list) do
    if max < v then
      max = v
    end
  end
  return max
end

function Find_Sum(list)
  local sum = 0
  for i, v in pairs(list) do
    sum = sum + v
  end
  return sum
end