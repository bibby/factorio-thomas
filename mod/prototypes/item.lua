function rue_item(name, order)
  return {
    type="item",
    name=string.format("%s-train", name),
    icon=string.format("__really_useful_engine__/graphics/%s-icon.png", name),
    icon_size=32,
    group="logistics",
    subgroup="transport",
    order = string.format("%s[%s]", order, name),
    place_result = string.format("%s-train", name),
    stack_size = 50,
    default_request_amount = 1,
  }
end

data:extend({
  rue_item('thomas', 'l'),
  rue_item('percy', 'm'),
  rue_item('emily', 'n'),
  rue_item('james', 'o'),
  rue_item('gordon', 'p'),
  rue_item('spencer', 'q'),
})
