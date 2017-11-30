function rue_recipe(item, engines, circuits, steel)
  return {
    type = "recipe",
    enabled = false,
    ingredients = {
      {
        "engine-unit",
        engines
      },
      {
        "electronic-circuit",
        circuits
      },
      {
        "steel-plate",
        steel
      }
    },
    name = item,
    result = item,
    type = "recipe"
  }
end

data:extend({
  rue_recipe('thomas-train', 20, 10, 30),
  rue_recipe('percy-train', 15, 10, 20),
  rue_recipe('emily-train', 25, 10, 40),
  rue_recipe('james-train', 20, 10, 30),
  rue_recipe('gordon-train', 40, 15, 50),
  rue_recipe('spencer-train', 45, 20, 50),
})
