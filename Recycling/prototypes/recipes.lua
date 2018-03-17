data:extend(
{
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
    ingredients = {{"steel-furnace", 1}, {"copper-plate", 8}, {"iron-plate", 8}},
    result = "both-recycling-furnace",
    energy_required = 3,
  }
}
)