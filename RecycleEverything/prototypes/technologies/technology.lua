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
        recipe = "both-recycling-furnace"
      },
      {
        type = "unlock-recipe",
        recipe = "unpack-iron-plates"
      },
      {
        type = "unlock-recipe",
        recipe = "unpack-copper-plates"
      },
      --[[{ -- Deprecated
        type = "unlock-recipe",
        recipe = "recycled-stack-iron-plate"
      },
      {
        type = "unlock-recipe",
        recipe = "recycled-stack-copper-plate"
      },]]
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
    order = "c-c-a-b"
  },

  {
    type = "technology",
    name = "bjnick-metal-recycling-2",
    icon_size = 128,
    icon = "__RecycleEverything__/graphics/material-recycling.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "shredding-machine"
      },
      --[[{ -- Deprecated
        type = "unlock-recipe",
        recipe = "both-recycling-furnace"
      }]]
    },
    prerequisites = {"bjnick-metal-recycling"},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
      },
      time = 30
    },
    order = "c-c-a-c"
  },

  --[[{ -- Deprecated
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
    order = "c-c-b-b"
  },]]

  {
    type = "technology",
    name = "bjnick-item-burning",
    icon_size = 128,
    icon = "__RecycleEverything__/graphics/item-burning.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "burning-furnace"
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
    order = "c-c-a-a"
  },

  {
    type = "technology",
    name = "bjnick-item-burning-2",
    icon_size = 128,
    icon = "__RecycleEverything__/graphics/item-burning.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "electric-burning-furnace"
      },
    },
    prerequisites = {"advanced-material-processing-2", "bjnick-item-burning"},
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
    order = "c-c-b-a"
  },

}
)