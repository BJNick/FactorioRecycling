

function Add_Recycler(recycler_name, recycler_crafting_group, recycler_tint, recycler_slots)
  data:extend(
  {
    {
      type = "furnace",
      name = recycler_name,
      icons = {
        {
           icon = "__base__/graphics/icons/steel-furnace.png",
           tint=recycler_tint,
           icon_size = 32,
        }
      },
      flags = {"placeable-neutral", "placeable-player", "player-creation"},
      minable = {mining_time = 1, result = recycler_name},
      max_health = 300,
      corpse = "medium-remnants",
      vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
      working_sound =
      {
        sound = { filename = "__base__/sound/furnace.ogg" }
      },
      resistances =
      {
        {
          type = "fire",
          percent = 100
        }
      },
      collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
      selection_box = {{-0.8, -1}, {0.8, 1}},
      crafting_categories = {recycler_crafting_group},
      result_inventory_size = recycler_slots,
      energy_usage = "180kW",
      crafting_speed = 2,
      source_inventory_size = 1,
      energy_source =
      {
        type = "burner",
        fuel_category = "chemical",
        effectivity = 1,
        emissions = 0.02,
        fuel_inventory_size = 1,
        smoke =
        {
          {
            name = "smoke",
            frequency = 10,
            position = {0.7, -1.2},
            starting_vertical_speed = 0.08,
            starting_frame_deviation = 60
          }
        }
      },
      animation =
      {
        layers = {
          {
            filename = "__base__/graphics/entity/steel-furnace/steel-furnace.png",
            tint=recycler_tint,
            priority = "high",
            width = 85,
            height = 87,
            frame_count = 1,
            shift = util.by_pixel(-1.5, 1.5),
            hr_version = {
              filename = "__base__/graphics/entity/steel-furnace/hr-steel-furnace.png",
              tint=recycler_tint,
              priority = "high",
              width = 171,
              height = 174,
              frame_count = 1,
              shift = util.by_pixel(-1.25, 2),
              scale = 0.5
            }
          },
          {
            filename = "__base__/graphics/entity/steel-furnace/steel-furnace-shadow.png",
            tint=recycler_tint,
            priority = "high",
            width = 139,
            height = 43,
            frame_count = 1,
            draw_as_shadow = true,
            shift = util.by_pixel(39.5, 11.5),
            hr_version = {
              filename = "__base__/graphics/entity/steel-furnace/hr-steel-furnace-shadow.png",
              tint=recycler_tint,
              priority = "high",
              width = 277,
              height = 85,
              frame_count = 1,
              draw_as_shadow = true,
              shift = util.by_pixel(39.25, 11.25),
              scale = 0.5
            }
          },
        },
      },
      working_visualisations =
      {
        {
          north_position = {0.0, 0.0},
          east_position = {0.0, 0.0},
          south_position = {0.0, 0.0},
          west_position = {0.0, 0.0},
          animation =
          {
            filename = "__base__/graphics/entity/steel-furnace/steel-furnace-fire.png",
            tint=recycler_tint,
            priority = "high",
            line_length = 8,
            width = 29,
            height = 40,
            frame_count = 48,
            axially_symmetrical = false,
            direction_count = 1,
            shift = util.by_pixel(-0.5, 6),
            hr_version = {
              filename = "__base__/graphics/entity/steel-furnace/hr-steel-furnace-fire.png",
              tint=recycler_tint,
              priority = "high",
              line_length = 8,
              width = 57,
              height = 81,
              frame_count = 48,
              axially_symmetrical = false,
              direction_count = 1,
              shift = util.by_pixel(-0.75, 5.75),
              scale = 0.5
            }
          },
          light = {intensity = 1, size = 1, color = {r = 1.0, g = 1.0, b = 1.0}}
        },
        {
          north_position = {0.0, 0.0},
          east_position = {0.0, 0.0},
          south_position = {0.0, 0.0},
          west_position = {0.0, 0.0},
          effect = "flicker", -- changes alpha based on energy source light intensity
          animation =
          {
            filename = "__base__/graphics/entity/steel-furnace/steel-furnace-glow.png",
            tint=recycler_tint,
            priority = "high",
            width = 60,
            height = 43,
            frame_count = 1,
            shift = {0.03125, 0.640625},
            blend_mode = "additive"
          }
        },
        {
          north_position = {0.0, 0.0},
          east_position = {0.0, 0.0},
          south_position = {0.0, 0.0},
          west_position = {0.0, 0.0},
          effect = "flicker", -- changes alpha based on energy source light intensity
          animation =
          {
            filename = "__base__/graphics/entity/steel-furnace/steel-furnace-working.png",
            tint=recycler_tint,
            priority = "high",
            line_length = 8,
            width = 64,
            height = 75,
            frame_count = 1,
            axially_symmetrical = false,
            direction_count = 1,
            shift = util.by_pixel(0, -4.5),
            blend_mode = "additive",
            hr_version = {
              filename = "__base__/graphics/entity/steel-furnace/hr-steel-furnace-working.png",
              tint=recycler_tint,
              priority = "high",
              line_length = 8,
              width = 130,
              height = 149,
              frame_count = 1,
              axially_symmetrical = false,
              direction_count = 1,
              shift = util.by_pixel(0, -4.25),
              blend_mode = "additive",
              scale = 0.5
            }
          }
        }
      }
    },
  }
  )
end

function Add_E_Recycler(recycler_name, recycler_crafting_group, recycler_tint, recycler_slots)
  data:extend(
  {
    {
      type = "furnace",
      name = recycler_name,
      icons = {
        {
           icon = "__base__/graphics/icons/electric-furnace.png",
           tint=recycler_tint,
           icon_size = 32,
        }
      },
      flags = {"placeable-neutral", "placeable-player", "player-creation"},
      minable = {mining_time = 1, result = recycler_name},
      max_health = 350,
      corpse = "big-remnants",
      dying_explosion = "medium-explosion",
      resistances =
      {
        {
          type = "fire",
          percent = 80
        }
      },
      collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
      selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
      module_specification =
      {
        module_slots = 3,
        module_info_icon_shift = {0, 0.8}
      },
      allowed_effects = {"consumption", "speed", "productivity", "pollution"},
      crafting_categories = {recycler_crafting_group},
      result_inventory_size = recycler_slots,
      crafting_speed = 2,
      energy_usage = "180kW",
      source_inventory_size = 1,
      energy_source =
      {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.005
      },
      vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
      working_sound =
      {
        sound =
        {
          filename = "__base__/sound/electric-furnace.ogg",
          volume = 0.7
        },
        apparent_volume = 1.5
      },
      animation =
      {
        layers = {
        {
          filename = "__base__/graphics/entity/electric-furnace/electric-furnace-base.png",
          tint=recycler_tint,
          priority = "high",
          width = 129,
          height = 100,
          frame_count = 1,
          shift = {0.421875, 0},
          hr_version = {
            filename = "__base__/graphics/entity/electric-furnace/hr-electric-furnace.png",
            tint=recycler_tint,
            priority = "high",
            width = 239,
            height = 219,
            frame_count = 1,
            shift = util.by_pixel(0.75, 5.75),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/electric-furnace/electric-furnace-shadow.png",
          tint=recycler_tint,
          priority = "high",
          width = 129,
          height = 100,
          frame_count = 1,
          shift = {0.421875, 0},
          draw_as_shadow = true,
          hr_version = {
            filename = "__base__/graphics/entity/electric-furnace/hr-electric-furnace-shadow.png",
            tint=recycler_tint,
            priority = "high",
            width = 227,
            height = 171,
            frame_count = 1,
            draw_as_shadow = true,
            shift = util.by_pixel(11.25, 7.75),
            scale = 0.5
          }
        }
        }
      },
      working_visualisations =
      {
        {
          animation =
          {
            filename = "__base__/graphics/entity/electric-furnace/electric-furnace-heater.png",
            tint=recycler_tint,
            priority = "high",
            width = 25,
            height = 15,
            frame_count = 12,
            animation_speed = 0.5,
            shift = {0.015625, 0.890625},
            hr_version = {
              filename = "__base__/graphics/entity/electric-furnace/hr-electric-furnace-heater.png",
              tint=recycler_tint,
              priority = "high",
              width = 60,
              height = 56,
              frame_count = 12,
              animation_speed = 0.5,
              shift = util.by_pixel(1.75, 32.75),
              scale = 0.5
            }
          },
          light = {intensity = 0.4, size = 6, shift = {0.0, 1.0}, color = {r = 1.0, g = 1.0, b = 1.0}}
        },
        {
          animation =
          {
            filename = "__base__/graphics/entity/electric-furnace/electric-furnace-propeller-1.png",
            tint=recycler_tint,
            priority = "high",
            width = 19,
            height = 13,
            frame_count = 4,
            animation_speed = 0.5,
            shift = {-0.671875, -0.640625},
            hr_version = {
              filename = "__base__/graphics/entity/electric-furnace/hr-electric-furnace-propeller-1.png",
              tint=recycler_tint,
              priority = "high",
              width = 37,
              height = 25,
              frame_count = 4,
              animation_speed = 0.5,
              shift = util.by_pixel(-20.5, -18.5),
              scale = 0.5
            }
          }
        },
        {
          animation =
          {
            filename = "__base__/graphics/entity/electric-furnace/electric-furnace-propeller-2.png",
            tint=recycler_tint,
            priority = "high",
            width = 12,
            height = 9,
            frame_count = 4,
            animation_speed = 0.5,
            shift = {0.0625, -1.234375},
            hr_version = {
              filename = "__base__/graphics/entity/electric-furnace/hr-electric-furnace-propeller-2.png",
              tint=recycler_tint,
              priority = "high",
              width = 23,
              height = 15,
              frame_count = 4,
              animation_speed = 0.5,
              shift = util.by_pixel(3.5, -38),
              scale = 0.5
            }
          }
        }
      },
      fast_replaceable_group = "furnace"
    },
  }
  )
end

Add_Recycler("iron-recycling-furnace", "iron-recycling", {r=0.8,g=0.8,b=1,a=1}, 1)
Add_Recycler("copper-recycling-furnace", "copper-recycling", {r=1,g=0.75,b=0.75,a=1}, 1)
Add_Recycler("both-recycling-furnace", "both-recycling", {r=0.8,g=1,b=0.8,a=1}, 2)

Add_E_Recycler("electric-iron-recycling-furnace", "iron-recycling", {r=0.8,g=0.8,b=1,a=1}, 1)
Add_E_Recycler("electric-copper-recycling-furnace", "copper-recycling", {r=1,g=0.75,b=0.75,a=1}, 1)
Add_E_Recycler("electric-both-recycling-furnace", "both-recycling", {r=0.8,g=1,b=0.8,a=1}, 2)

--Add_Recycler("burning-furnace", "smelting", {r=0.6,g=0.6,b=0.6,a=1}, 1)