require("prototypes.defs")

global.talkers = {}
globals.talk_interval = 60 * 30
globals.last_talk = nil
globals.search_range = 64
globals.print_debug = false
globals.initialized = false

function rue_debug_print(s)
  if globals.print_debug and game and game.players[1] then
    game.players[1].print(s)
  end
end

function rue_train_talk(player)
  -- selects a random nearby train and plays one of its sounds
  local surface = player.surface
  local pos = player.position
  local search_area = {
    {pos.x - globals.search_range, pos.y - globals.search_range},
    {pos.x + globals.search_range, pos.y + globals.search_range}
  }
  local train_name = nil
  local nearby = {}

  -- each train type
  for i, name in ipairs(globals.train_entities) do
    train_name = name .. '-train'

    rue_debug_print(name)
    rue_debug_print(global.talkers[name])

    if global.talkers[name]
    then
      rue_debug_print("checking: " .. train_name)
      local sounds = {}
      -- locate nearby trains of this prototype, if any
      for key, entity in pairs(surface.find_entities_filtered({area=search_area, name=train_name})) do
         rue_debug_print("ent: " .. key .. ", talks:" .. globals.train_talk[name])
         -- build a list of sound files for this proto
         for n=1, globals.train_talk[name], 1 do
           sounds[#sounds+1] = string.format("%s-talk-%d", name, n)
         end

         -- append a table entry with entity and possible sounds
         if #sounds > 0 then
           rue_debug_print("Nearby: " .. entity.name)
           nearby[#nearby + 1] = {
             entity=entity,
             sounds=sounds,
           }
         end
      end
    end
  end

  -- from the table of possible entities, pick one randomly
  local keyset = {}
  if #nearby > 0 then
    for k in pairs(nearby) do
        table.insert(keyset, k)
    end
    random_ent = nearby[keyset[math.random(#keyset)]]
    rue_debug_print("Selected: " .. random_ent.entity.name)

    -- pick one random sound
    picked_entity = random_ent.entity
    picked_sound = random_ent.sounds[math.random(#random_ent.sounds)]

    -- play the sound at the entity position
    if picked_entity and picked_sound then
        rue_debug_print("Playing.." .. picked_sound)
        picked_entity.surface.create_entity({name = picked_sound, position = picked_entity.position})
    end
  else
    rue_debug_print("Nothing nearby")
  end
end


function rue_on_tick(event)
  if not globals.initialized then
    globals.initialized = true
    rue_init()
  end

  -- bail early if it is not time to play a sound
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

function rue_init(...)
  rue_debug_print('=rue_init=')
  -- assign globals according to mod settings
  if settings.global["train-talk-interval"].value then
    globals.talk_interval = 60 * settings.global["train-talk-interval"].value
  end

  global.talkers = {}
  for i, name in ipairs(globals.train_entities)
  do
    local setting = name .. "-talk"
    rue_debug_print("setting value: " .. setting)
    rue_debug_print(settings.global[setting].value)
    if settings.global[setting].value
    then
      rue_debug_print(name .. ' talker')
      global.talkers[name] = true
    end
  end
end

-- script.on_init(rue_init)
script.on_event(defines.events.on_runtime_mod_setting_changed, rue_init)
script.on_event(defines.events.on_tick, rue_on_tick)
