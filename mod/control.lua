require("prototypes.defs")

globals.talk_interval = 60 * 30
globals.last_talk = nil
globals.search_range = 64
globals.print_debug = false

function rue_debug_print(s)
  if globals.print_debug and game and game.players[1] then
    game.players[1].print(s)
  end
end

function rue_train_talk(player)
  local surface = player.surface
  local pos = player.position
  local search_area = {
    {pos.x - globals.search_range, pos.y - globals.search_range},
    {pos.x + globals.search_range, pos.y + globals.search_range}
  }
  local train_name = nil
  local nearby = {}

  for i, name in ipairs(globals.train_entities) do
    train_name = name .. '-train'
    rue_debug_print("checking: " .. train_name)
    local sounds = {}
    for key, entity in pairs(surface.find_entities_filtered({area=search_area, name=train_name})) do
       rue_debug_print("ent: " .. key .. ", talks:" .. globals.train_talk[name])
       for n=1, globals.train_talk[name], 1 do
         sounds[#sounds+1] = string.format("%s-talk-%d", name, n)
       end

       if #sounds > 0 then
         rue_debug_print("Nearby: " .. entity.name)
         nearby[#nearby + 1] = {
           entity=entity,
           sounds=sounds,
         }
       end
    end
  end

  local keyset = {}
  if #nearby > 0 then
    for k in pairs(nearby) do
        table.insert(keyset, k)
    end
    random_ent = nearby[keyset[math.random(#keyset)]]
    rue_debug_print("Selected: " .. random_ent.entity.name)

    sounds = random_ent.sounds
    picked_entity = random_ent.entity
    keyset = {}
    for k in pairs(sounds) do
        table.insert(keyset, k)
    end
    picked_sound = sounds[keyset[math.random(#keyset)]]

    if picked_entity and picked_sound then
        rue_debug_print("Playing.." .. picked_sound)
        picked_entity.surface.create_entity({name = picked_sound, position = picked_entity.position})
    end
  else
    rue_debug_print("Nothing nearby")
  end
end


function rue_on_tick(event)
  if globals.last_talk == nil then
     rue_debug_print("Talk init")
    globals.last_talk = game.tick
  else
      if game.tick - globals.last_talk > globals.talk_interval then
        rue_debug_print("Talk GO!")
        globals.last_talk = game.tick
        rue_train_talk(game.players[1])
      end
  end
end

script.on_event(defines.events.on_tick, rue_on_tick)
