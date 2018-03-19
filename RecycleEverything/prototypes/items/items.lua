data:extend(
{
  {
   type = "item",
   name = "iron-recycling-furnace",
   icons = {
      {
         icon = "__base__/graphics/icons/steel-furnace.png",
         tint={r=0.8,g=0.8,b=1,a=1}, --#D2D2FF
         icon_size = 32,
      }
   },
   flags = {"goes-to-quickbar"},
   subgroup = "smelting-machine",
   order = "c-b",
   place_result = "iron-recycling-furnace",
   stack_size = 50
  },
  {
   type = "item",
   name = "copper-recycling-furnace",
   icons = {
      {
         icon = "__base__/graphics/icons/steel-furnace.png",
         tint={r=1,g=0.75,b=0.75,a=1}, --#FFC0C0
         icon_size = 32,
      }
   },
   flags = {"goes-to-quickbar"},
   subgroup = "smelting-machine",
   order = "c-b",
   place_result = "copper-recycling-furnace",
   stack_size = 50
  },
  {
   type = "item",
   name = "both-recycling-furnace",
   icons = {
      {
         icon = "__base__/graphics/icons/steel-furnace.png",
         tint={r=0.8,g=1,b=0.8,a=1}, 
         icon_size = 32,
      }
   },
   flags = {"goes-to-quickbar"},
   subgroup = "smelting-machine",
   order = "c-b",
   place_result = "both-recycling-furnace",
   stack_size = 50
  },

  -- ELECTRIC
  {
   type = "item",
   name = "electric-iron-recycling-furnace",
   icons = {
      {
         icon = "__base__/graphics/icons/electric-furnace.png",
         tint={r=0.8,g=0.8,b=1,a=1}, --#D2D2FF
         icon_size = 32,
      }
   },
   flags = {"goes-to-quickbar"},
   subgroup = "smelting-machine",
   order = "d-c",
   place_result = "electric-iron-recycling-furnace",
   stack_size = 50
  },
  {
   type = "item",
   name = "electric-copper-recycling-furnace",
   icons = {
      {
         icon = "__base__/graphics/icons/electric-furnace.png",
         tint={r=1,g=0.75,b=0.75,a=1}, --#FFC0C0
         icon_size = 32,
      }
   },
   flags = {"goes-to-quickbar"},
   subgroup = "smelting-machine",
   order = "d-c",
   place_result = "electric-copper-recycling-furnace",
   stack_size = 50
  },
  {
   type = "item",
   name = "electric-both-recycling-furnace",
   icons = {
      {
         icon = "__base__/graphics/icons/electric-furnace.png",
         tint={r=0.8,g=1,b=0.8,a=1}, 
         icon_size = 32,
      }
   },
   flags = {"goes-to-quickbar"},
   subgroup = "smelting-machine",
   order = "d-c",
   place_result = "electric-both-recycling-furnace",
   stack_size = 50
  },

  -- BURNING


  {
   type = "item",
   name = "burning-furnace",
   icons = {
      {
         icon = "__base__/graphics/icons/steel-furnace.png",
         tint={r=0.5,g=0.5,b=0.5,a=1},
         icon_size = 32,
      }
   },
   flags = {"goes-to-quickbar"},
   subgroup = "smelting-machine",
   order = "z",
   place_result = "burning-furnace",
   stack_size = 50
  },
}
)