data:extend({
  {
    type = "technology",
    name = "bjnick-metal-recycling",
    icon_size = 128,
    icon = "__RecycleEverything__/graphics/metal-recycling.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "iron-recycling-furnace"
      },
      {
        type = "unlock-recipe",
        recipe = "copper-recycling-furnace"
      }
    },
    prerequisites = {"advanced-material-processing"},
    unit =
    {
      count = 75,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
      },
      time = 30
    },
    order = "c-c-b"
  },
  {
    type = "technology",
    name = "bjnick-metal-recycling-2",
    icon_size = 128,
    icon = "__RecycleEverything__/graphics/metal-recycling.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "both-recycling-furnace"
      }
    },
    prerequisites = {"bjnick-metal-recycling"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
      },
      time = 30
    },
    order = "c-c-c"
  },
}
)