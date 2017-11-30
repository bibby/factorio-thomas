require("defs")

rue_tech_unlocks = {}
for i, name in pairs(globals.train_entities) do
  rue_tech_unlocks[#rue_tech_unlocks+1] = {
      type = "unlock-recipe",
      recipe = name .. '-train'
  }
end

data:extend({
  {
      type = "technology",
      name = "really-useful-tech",
      icon = "__really_useful_engine__/graphics/technology.png",
      icon_size = 128,
      effects = rue_tech_unlocks,
      prerequisites = {"railway"},
      unit =
      {
        count = 75,
        ingredients =
        {
          {"science-pack-1", 1},
          {"science-pack-2", 1},
        },
        time = 30
      }
  }
})
