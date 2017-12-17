require('prototypes.defs')

train_settings = {
  {
    type = "int-setting",
    name = "train-talk-interval",
    setting_type = "runtime-global",
    default_value = 30,
    minimum_value = 10,
    maximum_value = 7200,
    allow_blank = false,
    order = "rue-0"
  }
}

for i, name in ipairs(globals.train_entities) do
  train_settings[#train_settings + 1] = {
      type = "bool-setting",
      name = name .. "-talk",
      setting_type = "runtime-global",
      default_value = true,
      order = 'rue-' .. i
  }
end

data:extend(train_settings)
