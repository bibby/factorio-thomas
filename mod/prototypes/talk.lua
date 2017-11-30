require("defs")

function rue_talk(name, num)
  local ent_name = string.format("%s-talk-%d", name, num)
  return {
    type = "explosion",
    name = ent_name,
    flags = {"not-on-map"},
    animations =
    {
      {
        filename = "__really_useful_engine__/graphics/blank.png",
        priority = "low",
        width = 1,
        height = 1,
        frame_count = 1,
        line_length = 1,
        animation_speed = 1
      },
    },
    light = {intensity = 0, size = 0},
    sound =
    {
      {
        filename = string.format("__really_useful_engine__/audio/%s.ogg", ent_name),
        volume = 1.0,
      }
    }
  }
end

function rue_talks(name, talks)
  local sounds = {}
  for i=1, talks, 1 do
    sounds[#sounds+1] = rue_talk(name, i)
  end
  return sounds
end


for name, talks in pairs(globals.train_talk) do
  if talks > 0 then
    for i, talk in ipairs(rue_talks(name, talks)) do
      data:extend({talk})
    end
  end
end
