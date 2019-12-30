local vassal_faction = {} --# assume vassal_faction: VASSAL_FACTION

--v function(key: string) --> VASSAL_FACTION
function vassal_faction.new(key)
    local self = {}
    setmetatable(self, {
        __index = vassal_faction
    }) --# assume self: VASSAL_FACTION

    self.key = key
    self.is_vassal = false --:boolean
    self.vassals = {} --:map<string, boolean>
    self.liege = "" --:string

    return self
end

local instances = {} --:map<string, VASSAL_FACTION>

local function refresh_vassal_list()
    local faction_list = dev.faction_list()
    for i = 0, faction_list:num_items() - 1 do
        local faction = faction_list:item_at(i)
        local this_instance = instances[faction:name()]
        if not this_instance.is_vassal then
            for j = 0, faction_list:num_items() - 1 do
                local other_faction = faction_list:item_at(j)
                if other_faction:is_vassal_of(faction) then
                    instances[other_faction:name()].is_vassal = true
                    instances[other_faction:name()].liege = this_instance.key
                    this_instance.vassals[other_faction:name()] = true
                end
            end
        end
    end
end

dev.first_tick(function(context)
    local faction_list = dev.faction_list()
    for i = 0, faction_list:num_items() - 1 do
        local faction = faction_list:item_at(i)
        instances[faction:name()] = vassal_faction.new(faction:name())
    end
    refresh_vassal_list()


    dev.eh:add_listener(
        "VassalsNegativeDiplomaticEvent",
        "NegativeDiplomaticEvent",
        true,
        function(context)
            refresh_vassal_list()
        end,
        true)
    dev.eh:add_listener(
        "VassalsFactionSubjugatesOtherFaction",
        "FactionSubjugatesOtherFaction",
        true,
        function(context)
            instances[context:other_faction():name()].is_vassal = true
            instances[context:faction():name()].vassals[context:other_faction():name()] = true
        end,
        true)

end)

--v function(faction_key: string) --> boolean
local function is_faction_vassal(faction_key)
    return instances[faction_key].is_vassal
end

--v function(faction_key: string) --> string
local function get_faction_liege(faction_key) 
    local instance = instances[faction_key]
    if not instance.is_vassal then
        return nil
    end
    return instance.liege
end

--v function(faction_key: string) --> vector<string>
local function get_faction_vassals(faction_key) 
    local vassals = {} --:vector<string>
    for k,v in pairs(instances[faction_key].vassals) do
        table.insert(vassals, k)
    end
    return vassals
end

return {
    is_faction_vassal = is_faction_vassal,
    get_faction_liege = get_faction_liege,
    get_faction_vassals = get_faction_vassals
}