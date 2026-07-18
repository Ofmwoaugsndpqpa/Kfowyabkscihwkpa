script_name("Sion Auto Regen HP")
script_author("Sion")

require "lib.moonloader"
require "lib.sampfuncs"
local sampev = require "lib.samp.events"

local enabled = false
local lastMsg = 0

sampRegisterChatCommand("srgn", function()
    enabled = not enabled
    if enabled then
        sampAddChatMessage("{39C0FF}[Sion]{FFFFFF} AUTO REGEN AKTIF", -1)
    else
        sampAddChatMessage("{39C0FF}[Sion]{FFFFFF} AUTO REGEN MATI", -1)
    end
end)

sampev.onSendPlayerSync = function(syncData)
    if enabled and syncData.health and syncData.health < 20 then
        syncData.health = 100
    end
end

lua_thread.create(function()
    while not isSampAvailable() do wait(100) end

    sampAddChatMessage("{39C0FF}[Sion Auto Regen HP] {FFFFFF}Loaded! Ketik {39C0FF}/srgn", -1)

    while true do
        wait(70)

        if enabled then
            local hp = getCharHealth(PLAYER_PED)

            if hp < 100 then
                setCharHealth(PLAYER_PED, 100)

                local now = os.clock()
                if now - lastMsg > 1.5 then
                    sampAddChatMessage("{39C0FF}[Sion]{FFFFFF} HP Di Regen. Tiktok & YouTube: @sion_299", -1)
                    lastMsg = now
                end
            end
        end
    end
end)            if hp < 100 then
                setCharHealth(PLAYER_PED, 100)

                local now = os.clock()
                if now - lastMsg > 1.5 then
                    sampAddChatMessage("{39C0FF}[Sion]{FFFFFF} HP Di Regen. Tiktok & YouTube: @sion_299", -1)
                    lastMsg = now
                end
            end
        end
    end
end
