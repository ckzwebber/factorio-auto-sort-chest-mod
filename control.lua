local GUI_NAME = "auto_sort_chest_button"


local function is_container(entity)
  if not entity or not entity.valid then return false end
 
  local success, inv = pcall(function() return entity.get_inventory(defines.inventory.chest) end)
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

  local items = {}
  for i = 1, #inventory do
    local stack = inventory[i]
    if stack and stack.valid_for_read then
      local item = { name = stack.name, count = stack.count }

      local ok, v
      ok, v = pcall(function() return stack.quality end)
      if ok and v then item.quality = v end

      ok, v = pcall(function() return stack.health end)
      if ok and v then item.health = v end

      ok, v = pcall(function() return stack.durability end)
      if ok and v then item.durability = v end

      ok, v = pcall(function() return stack.ammo end)
      if ok and v then item.ammo = v end

      ok, v = pcall(function() return stack.tags end)
      if ok and v then item.tags = v end

      table.insert(items, item)
    end
  end

  inventory.clear()

  table.sort(items, function(a, b) return a.name < b.name end)

  for _, item in ipairs(items) do
    inventory.insert(item)
  end
end

script.on_event(defines.events.on_gui_opened, function(event)
  local player = game.get_player(event.player_index)
  if not player then return end

  local entity = event.entity
  
  if entity and entity.valid and is_container(entity) then
    create_button_for_player(player)
    return
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
        player.print("Organizando baú: " .. (opened.localised_name and opened.localised_name[1] or opened.name))
        autosort_inventory(inv)
      else
        player.print("Este container não tem inventário tratável.")
      end
    else
      player.print("Abra um baú para usar o Auto-sort.")
    end
  end
end)   
