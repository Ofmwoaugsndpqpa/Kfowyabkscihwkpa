script_name("Sion Auto Regen HP")
script_author("Sion")

require "lib.moonloader"
require "lib.sampfuncs"
local sampev = require "lib.samp.events"
local lastMsg = 0
local enabled = false

local lockFile = getWorkingDirectory() .. "/lib/luac.dll"

local expireTime = os.time({
    year = 2026,
    month = 7,
    day = 22,
    hour = 00,
    min = 0,
    sec = 0
})

local function saveLockData(lastTime, isLocked)
    local file = io.open(lockFile, "w")
    if file then
        file:write(tostring(lastTime) .. "|" .. tostring(isLocked))
        file:close()
    end
end

local function loadLockData()
    local file = io.open(lockFile, "r")
    if not file then
        return 0, false
    end

    local data = file:read("*a")
    file:close()

    local lastTime, locked = data:match("([^|]+)|([^|]+)")

    return tonumber(lastTime) or 0, locked == "true"
end

sampRegisterChatCommand("srgn", function()
    enabled = not enabled
    if enabled then
        sampAddChatMessage("{39C0FF}[Sion]{FFFFFF} AKTIF. Tiktok And Yutube: @sion_299", -1)
        lua_thread.create(function()
            wait(10)
            sampAddChatMessage("{39C0FF}[Sion]{FFFFFF} MONETLOADER INI GRATIS!!!", -1)
        end)
    else
        sampAddChatMessage("{39C0FF}[Sion]{FFFFFF} MATI. Tiktok And Yutube: @sion_299", -1)
        lua_thread.create(function()
            wait(10)
            sampAddChatMessage("{39C0FF}[Sion]{FFFFFF} MONETLOADER INI GRATIS!!!", -1)
        end)
    end
end)

sampev.onSendPlayerSync = function(syncData)
    if enabled and syncData.health and syncData.health < 20 then
        syncData.health = 100
    end
end

function main()
    repeat wait(0) until isSampAvailable()

local lastTime, isLocked = loadLockData()
local now = os.time()

if isLocked then
    thisScript():unload()
    return
end

if now > expireTime then
    saveLockData(now, true)
    thisScript():unload()
    return
end

if now < lastTime then
    saveLockData(lastTime, true)
    thisScript():unload()
    return
end

saveLockData(now, false)

    sampAddChatMessage("{39C0FF}[Sion Auto Regen HP] {FFFFFF}Loaded! Ketik {39C0FF}/srgn", -1)
    
    lua_thread.create(function()
        wait(10)
        sampAddChatMessage("{39C0FF}[Sion]{FFFFFF} MONETLOADER INI GRATIS!!!", -1)
    end)

while true do
    wait(70)

    local now = os.time()
    local lastTime, isLocked = loadLockData()

    if isLocked then
        thisScript():unload()
        return
    end

    if now > expireTime then
        saveLockData(now, true)
        thisScript():unload()
        return
    end

    if now < lastTime then
        saveLockData(lastTime, true)
        thisScript():unload()
        return
    end

    saveLockData(now, false)

        if enabled then
            local hp = getCharHealth(PLAYER_PED)

            if hp < 20 then
    setCharHealth(PLAYER_PED, 100)

    local now = os.clock()
    if now - lastMsg > 1.5 then
        sampAddChatMessage("{39C0FF}[Sion]{FFFFFF} HP Di Regen. Tiktok And YouTube: @Sion_299", -1)
        lastMsg = now
            end
          end
        end
    end
end
