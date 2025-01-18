local util = require("control-util")

script.on_event(defines.events.on_console_command, util.list)

script.on_configuration_changed(util.ore_fix)
util.add_regenerate_command_handler()
util.add_list_command_handler()

util.warptorio2_expansion_helper()

function update_recycling_on_research(event)
  if event.research.name == "alloy-separation" then
    update_recycling(event.research.force)
  end
end
script.on_event(defines.events.on_research_finished, update_recycling_on_research)

function update_recycling_on_reset(event)
  update_recycling(event.force)
end
script.on_event(defines.events.on_technology_effects_reset, update_recycling_on_reset)

function update_recycling(force)
  if not force.technologies["alloy-separation"].researched then
    -- In this case the player is probably trying to unresearch the tech, and we should fix
    -- recipes as would be expected in this case
    for _, recipe in pairs(force.recipes) do 
      if force.recipes[recipe.name.."-separation"] then
        force.recipes[recipe.name].enabled = true
        force.recipes[recipe.name.."-separation"].enabled = false
      end
    end
    return
  end

  -- disable self recycling, and ensure separation is enabled
  for _, recipe in pairs(force.recipes) do 
    if force.recipes[recipe.name.."-separation"] then
      force.recipes[recipe.name].enabled = false
      force.recipes[recipe.name.."-separation"].enabled = true
    end
  end

  -- make sure any entities doing old recipe can update to new one next tick
  for _, surface in pairs(game.surfaces) do
    for _, entity in pairs(surface.find_entities_filtered(
        {type="furnace", force=force.name})) do
      local recipe = entity.get_recipe()
      if recipe then
        if recipe.name:match("-recycling") then
          local newr = recipe.name.."-separation"
          if entity.force.recipes[newr] and entity.force.recipes[newr].enabled then
            local item = recipe.name:gsub("-recycling", "")
            -- mark the craft as finished and clear recycler inventory, to give the furnace-type
            -- a chance to reset its recipe to the newly available recipe
            entity.crafting_progress = 1
            entity.get_inventory(defines.inventory.furnace_source).clear()
            -- clear inserting inserters hands, giving an extra swing to reset recipes, just in case
            for _, inserter in pairs(surface.find_entities_filtered(
                {type={"inserter"}, position=entity.position, radius=5})) do
              if inserter.held_stack.valid_for_read and inserter.held_stack.name == item then
                inserter.held_stack.clear()
              end
            end
            -- clear all items in nearby input loaders,
            -- Overshoots, but with loaders it's harder to be precise
            for _, loader in pairs(surface.find_entities_filtered(
                {type={"loader"}, position=entity.position, radius=5})) do
              if loader.loader_type == "input" then
                loader.clear_items_inside()
              end
            end
          end
        end
      end
    end
  end
end
