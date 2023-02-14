local me = {}

me.name = "bztin"
me.list = {}
me.recipes = {"tin-plate", "solder", "organotins",
              "enriched-tin",
              "enriched-tin-plate",
              "tin-smelting-vulcanite",
              "molten-tin",
              "enriched-tin-smelting-vulcanite", "bronze-plate", "tinned-cable"}


function me.use_cable()
  if me.get_setting("bz-all-intermediates") then return true end
  return me.get_setting("bztin-more-intermediates") == "cable" or me.use_bronze()
end

function me.use_bronze()
  if me.get_setting("bz-all-intermediates") then return true end
  return me.get_setting("bztin-more-intermediates") == "bronze"
end

function me.get_setting(name)
  if settings.startup[name] == nil then
    return nil
  end
  return settings.startup[name].value
end

me.bypass = {}
if me.get_setting(me.name.."-recipe-bypass") then 
  for recipe in string.gmatch(me.get_setting(me.name.."-recipe-bypass"), '[^",%s]+') do
    me.bypass[recipe] = true
  end
end

function me.add_modified(name) 
  if me.get_setting(me.name.."-list") then 
    table.insert(me.list, name)
  end
end


return me
