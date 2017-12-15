rue_no_wheels =
{
	priority = "very-low",
	width = 1,
	height = 1,
	direction_count = 1,
	filenames =
	{
		"__really_useful_engine__/graphics/blank.png",
	},
	line_length = 1,
	lines_per_file = 1,
}


function rue_deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[rue_deepcopy(orig_key)] = rue_deepcopy(orig_value)
        end
        setmetatable(copy, rue_deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

rue_proto = {
  air_resistance = 0.0075,
  back_light = {
    {
      add_perspective = true,
      color = {
        a = 0,
        b = 0.05,
        g = 0.1,
        r = 1
      },
      intensity = 0.6,
      minimum_darkness = 0.3,
      shift = {
        -0.6,
        3.5
      },
      size = 2
    },
    {
      add_perspective = true,
      color = {
        a = 0,
        b = 0.05,
        g = 0.1,
        r = 1
      },
      intensity = 0.6,
      minimum_darkness = 0.3,
      shift = {
        0.6,
        3.5
      },
      size = 2
    }
  },
  braking_force = 10,
  burner = {
    effectivity = 1,
    fuel_category = "chemical",
    fuel_inventory_size = 3,
    smoke = {
      {
        deviation = {
          0.3,
          0.3
        },
        frequency = 100,
        height = 2,
        height_deviation = 0.5,
        name = "train-smoke",
        position = {
          0,
          0
        },
        starting_frame = 0,
        starting_frame_deviation = 60,
        starting_vertical_speed = 0.2,
        starting_vertical_speed_deviation = 0.1
      }
    }
  },
  close_sound = {
    filename = "__base__/sound/car-door-close.ogg",
    volume = 0.7
  },
  collision_box = {
    {
      -0.6,
      -2.6000000000000001
    },
    {
      0.6,
      2.6000000000000001
    }
  },
  color = {
    a = 0.5,
    b = 0,
    g = 0.070000000000000009,
    r = 0.92000000000000011
  },
  connection_distance = 3,
  corpse = "medium-remnants",
  drawing_box = {
    {
      -1,
      -4
    },
    {
      1,
      3
    }
  },
  drive_over_tie_trigger = {
    sound = {
      {
        filename = "__base__/sound/train-tie-1.ogg",
        volume = 0.6
      },
      {
        filename = "__base__/sound/train-tie-2.ogg",
        volume = 0.6
      },
      {
        filename = "__base__/sound/train-tie-3.ogg",
        volume = 0.6
      },
      {
        filename = "__base__/sound/train-tie-4.ogg",
        volume = 0.6
      }
    },
    type = "play-sound"
  },
  dying_explosion = "medium-explosion",
  energy_per_hit_point = 5,
  flags = {
    "placeable-neutral",
    "player-creation",
    "placeable-off-grid",
    "not-on-map"
  },
  friction_force = 0.5,
  front_light = {
    {
      color = {
        b = 0.9,
        g = 0.9,
        r = 1
      },
      intensity = 0.6,
      minimum_darkness = 0.3,
      picture = {
        filename = "__core__/graphics/light-cone.png",
        flags = {
          "light"
        },
        height = 200,
        priority = "extra-high",
        scale = 2,
        width = 200
      },
      shift = {
        -0.6,
        -16
      },
      size = 2,
      type = "oriented"
    },
    {
      color = {
        b = 0.9,
        g = 0.9,
        r = 1
      },
      intensity = 0.6,
      minimum_darkness = 0.3,
      picture = {
        filename = "__core__/graphics/light-cone.png",
        flags = {
          "light"
        },
        height = 200,
        priority = "extra-high",
        scale = 2,
        width = 200
      },
      shift = {
        0.6,
        -16
      },
      size = 2,
      type = "oriented"
    }
  },
  icon = "",
  icon_size=32,
  joint_distance = 4,
  max_health = 1000,
  max_power = "600kW",
  max_speed = 1.2,
  minable = {
    mining_time = 1,
    result = "__proto"
  },
  mined_sound = {
    filename = "__core__/sound/deconstruct-medium.ogg"
  },
  name = "__proto",
  open_sound = {
    filename = "__base__/sound/car-door-open.ogg",
    volume = 0.7
  },
  pictures = {
    layers = {
      {
        direction_count = 256,
        filenames = {},
        height = 256,
        line_length = 8,
        lines_per_file = 8,
        priority = "very-low",
        shift = {
          0.5,
          -0.5
        },
        width = 256
      },
    }
  },
  rail_category = "regular",
  resistances = {
    {
      decrease = 15,
      percent = 50,
      type = "fire"
    },
    {
      decrease = 15,
      percent = 30,
      type = "physical"
    },
    {
      decrease = 50,
      percent = 60,
      type = "impact"
    },
    {
      decrease = 15,
      percent = 30,
      type = "explosion"
    },
    {
      decrease = 10,
      percent = 20,
      type = "acid"
    }
  },
  reversing_power_modifier = 0.6,
  selection_box = {
    {
      -1,
      -3
    },
    {
      1,
      3
    }
  },
  sound_minimum_speed = 0.5,
  stand_by_light = {
    {
      add_perspective = true,
      color = {
        a = 0,
        b = 1,
        g = 0.2,
        r = 0.05
      },
      intensity = 0.5,
      minimum_darkness = 0.3,
      shift = {
        -0.6,
        -3.5
      },
      size = 2
    },
    {
      add_perspective = true,
      color = {
        a = 0,
        b = 1,
        g = 0.2,
        r = 0.05
      },
      intensity = 0.5,
      minimum_darkness = 0.3,
      shift = {
        0.6,
        -3.5
      },
      size = 2
    }
  },
  stop_trigger = {
    {
      smoke_name = "smoke-train-stop",
      initial_height = 0,
      offset_deviation = {
        {
          -0.75,
          -2.7000000000000002
        },
        {
          -0.3,
          2.7000000000000002
        }
      },
      repeat_count = 125,
      speed = {
        -0.03,
        0
      },
      speed_multiplier = 0.75,
      speed_multiplier_deviation = 1.1000000000000001,
      type = "create-trivial-smoke"
    },
    {
      smoke_name = "smoke-train-stop",
      initial_height = 0,
      offset_deviation = {
        {
          0.3,
          -2.7000000000000002
        },
        {
          0.75,
          2.7000000000000002
        }
      },
      repeat_count = 125,
      speed = {
        0.03,
        0
      },
      speed_multiplier = 0.75,
      speed_multiplier_deviation = 1.1000000000000001,
      type = "create-trivial-smoke"
    },
    {
      sound = {
        {
          filename = "__proto",
          volume = 1.0
        }
      },
      type = "play-sound"
    }
  },
  tie_distance = 50,
  type = "locomotive",
  vehicle_impact_sound = {
    filename = "__base__/sound/car-metal-impact.ogg",
    volume = 0.65
  },
  vertical_selection_shift = -0.5,
  weight = 2000,
  wheels = rue_no_wheels,
  working_sound = {
    match_speed_to_activity = true,
    sound = {
      filename = "__base__/sound/train-engine.ogg",
      volume = 0.5
    }
  }
}

function rue_train(name, pics)
  local train = rue_deepcopy(rue_proto)
  local pictures = {}
  local pic_fmt = "__really_useful_engine__/graphics/%s_%d.png"
  local i = 0

  for i = 0, 3, 1 do
    pictures[#pictures+1] = string.format(pic_fmt, name, i)
  end

  train.pictures.layers[1].filenames = pictures
  train.minable.result = string.format("%s-train", name)
  train.name = string.format("%s-train", name)
  train.icon = string.format("__really_useful_engine__/graphics/%s-icon.png", name)
  train.stop_trigger[#train.stop_trigger].sound[1].filename = string.format("__really_useful_engine__/audio/%s-whistle.ogg", name)
  return train
end


data:extend({
  rue_train('thomas'),
  rue_train('percy'),
  rue_train('emily'),
  rue_train('james'),
  rue_train('gordon'),
  rue_train('spencer'),
})
