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
      },
      {
        type = "unlock-recipe",
        recipe = "unpack-iron-plates"
      },
      {
        type = "unlock-recipe",
        recipe = "unpack-copper-plates"
      },
      {
        type = "unlock-recipe",
        recipe = "recycled-stack-iron-plate"
      },
      {
        type = "unlock-recipe",
        recipe = "recycled-stack-copper-plate"
      },
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
  {
    type = "technology",
    name = "bjnick-metal-recycling-3",
    icon_size = 128,
    icon = "__RecycleEverything__/graphics/metal-recycling.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "electric-iron-recycling-furnace"
      },
      {
        type = "unlock-recipe",
        recipe = "electric-copper-recycling-furnace"
      },
      {
        type = "unlock-recipe",
        recipe = "electric-both-recycling-furnace"
      }
    },
    prerequisites = {"advanced-material-processing-2", "bjnick-metal-recycling-2"},
    unit =
    {
      count = 250,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
      },
      time = 30
    },
    order = "c-c-d"
  },
}
)