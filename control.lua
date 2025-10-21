local GUI_NAME = "auto_sort_chest_button"

local function is_container(entity)
  if not entity or not entity.valid then return false end
 
  local success, inv = pcall(function() return entity.get_inventory(defines.inventory.chest) end)
  if success and inv and inv.valid then
    return true
  end

  success, inv = pcall(function() return entity.get_inventory(defines.inventory.chest) end)
  return success and inv and inv.valid
end

local function create_button_for_player(player)
  
  if player.gui.top[GUI_NAME] then return end
  player.gui.top.add{
    type = "button",
    name = GUI_NAME,
    caption = "Auto-sort"
  }
end

local function destroy_button_for_player(player)
  if player.gui.top[GUI_NAME] then
    player.gui.top[GUI_NAME].destroy()
  end
end

local function autosort_inventory(inventory)
  if not (inventory and inventory.valid) then return end

  local contents = inventory.get_contents() 

  inventory.clear()

  local items = {}
  for name, count in pairs(contents) do
    table.insert(items, {name = name, count = count})
  end
  table.sort(items, function(a,b) return a.name < b.name end)

  for _, entry in ipairs(items) do
    local prototype = game.item_prototypes[entry.name]
    local stack_size = prototype and prototype.stack_size or 100
    local remaining = entry.count
    while remaining > 0 do
      local to_insert = math.min(remaining, stack_size)

      inventory.insert({name = entry.name, count = to_insert})
      remaining = remaining - to_insert
    end
  end
end

script.on_event(defines.events.on_gui_opened, function(event)
  local player = game.get_player(event.player_index)
  if not player then return end

  local opened = player.opened

  if type(opened) == "table" and opened.valid and opened.type then
    if is_container(opened) then
      create_button_for_player(player)
      return
    end
  end

  destroy_button_for_player(player)
end)

script.on_event(defines.events.on_gui_closed, function(event)
  local player = game.get_player(event.player_index)
  if not player then return end
  destroy_button_for_player(player)
end)

script.on_event(defines.events.on_gui_click, function(event)
  local player = game.get_player(event.player_index)
  if not player then return end
  local element = event.element
  if not (element and element.valid) then return end

  if element.name == GUI_NAME then
    local opened = player.opened
    if opened and opened.valid and is_container(opened) then

        local inv = opened.get_inventory(defines.inventory.chest)
      if inv and inv.valid then
        player.print("Organizando baú: " .. (opened.localised_name or opened.name))
        autosort_inventory(inv)
      else
        player.print("Este container não tem inventário tratável.")
      end
    else
      player.print("Abra um baú para usar o Auto-sort.")
    end
  end
end)   
