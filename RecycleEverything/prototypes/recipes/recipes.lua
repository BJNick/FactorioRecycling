data:extend(
{

  -- ENTITIES

  {
    type = "recipe",
    name = "iron-recycling-furnace",
    enabled = false,
    ingredients = {{"steel-furnace", 1}, {"iron-plate", 10}},
    result = "iron-recycling-furnace",
    energy_required = 3,
  },
  {
    type = "recipe",
    name = "copper-recycling-furnace",
    enabled = false,
    ingredients = {{"steel-furnace", 1}, {"copper-plate", 10}},
    result = "copper-recycling-furnace",
    energy_required = 3,
  },
  {
    type = "recipe",
    name = "both-recycling-furnace",
    enabled = false,
    ingredients = {{"steel-furnace", 1}, {"copper-plate", 10}, {"iron-plate", 10}},
    result = "both-recycling-furnace",
    energy_required = 3,
  },
  {
    type = "recipe",
    name = "electric-iron-recycling-furnace",
    enabled = false,
    ingredients = {{"electric-furnace", 1}, {"iron-plate", 20}},
    result = "electric-iron-recycling-furnace",
    energy_required = 3,
  },
  {
    type = "recipe",
    name = "electric-copper-recycling-furnace",
    enabled = false,
    ingredients = {{"electric-furnace", 1}, {"copper-plate", 20}},
    result = "electric-copper-recycling-furnace",
    energy_required = 3,
  },
  {
    type = "recipe",
    name = "electric-both-recycling-furnace",
    enabled = false,
    ingredients = {{"electric-furnace", 1}, {"copper-plate", 20}, {"iron-plate", 20}},
    result = "electric-both-recycling-furnace",
    energy_required = 3,
  },

  {
    type = "recipe",
    name = "burning-furnace",
    enabled = false,
    ingredients = {{"steel-furnace", 1}, {"coal", 10}},
    result = "burning-furnace",
    energy_required = 3,
  },
  {
    type = "recipe",
    name = "electric-burning-furnace",
    enabled = false,
    ingredients = {{"electric-furnace", 1}, {"coal", 20}},
    result = "electric-burning-furnace",
    energy_required = 3,
  },

  -- ITEMS

  {
    type = "recipe",
    name = "unpack-iron-plates",
    enabled = false,
    ingredients = {{"recycled-stack-iron-plate", 1}},
    result = "iron-plate",
    order = "d-c",
    result_count = 10,
    allow_as_intermediate = false,
  },
  {
    type = "recipe",
    name = "unpack-copper-plates",
    enabled = false,
    ingredients = {{"recycled-stack-copper-plate", 1}},
    result = "copper-plate",
    order = "d-c",
    result_count = 10,
    allow_as_intermediate = false,
  },
  {
    type = "recipe",
    name = "recycled-stack-iron-plate",
    enabled = false,
    ingredients = {{"iron-plate", 10}},
    result = "recycled-stack-iron-plate",
    order = "d-c",
    result_count = 1,
    allow_as_intermediate = false,
  },
  {
    type = "recipe",
    name = "recycled-stack-copper-plate",
    enabled = false,
    ingredients = {{"copper-plate", 10}},
    result = "recycled-stack-copper-plate",
    order = "d-c",
    result_count = 1,
    allow_as_intermediate = false,
  },
}
)