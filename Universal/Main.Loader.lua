--[[
 Feito por: Rain
 Pessoas: 1
 equipe: Eu
 Pode Olhar o code avontade meu mano
]]

local function loadPlatformScript()
    local platformType = _G.Type or "Beta"
    local gameName = _G.Game or "Universal"
    
    print("Carregando plataforma: " .. platformType .. " (Jogo: " .. gameName .. ")")
    
    local url
    if platformType == "New" then
        url = "https://raw.githubusercontent.com/RainCreatorHub/Games/refs/heads/main/Universal/Plataform%20New.lua"
    elseif platformType == "Beta" then
        url = "https://raw.githubusercontent.com/RainCreatorHub/Games/refs/heads/main/Universal/Plataform%20Beta.lua"
    elseif platformType == "Old" then
        url = "https://raw.githubusercontent.com/RainCreatorHub/Games/refs/heads/main/Universal/Plataform%20Old.lua"
    else
        warn("Tipo de plataforma inválido: " .. tostring(platformType) .. ". Usando Beta como padrão.")
        url = "https://raw.githubusercontent.com/RainCreatorHub/Games/refs/heads/main/Universal/Plataform%20Beta.lua"
    end
    
    local success, result = pcall(function()
        return game:HttpGet(url)
    end)
    
    if success and result then
        print("Script carregado com sucesso de: " .. url)
        local loadedFunc = loadstring(result)
        if loadedFunc then
            loadedFunc()
        else
            warn("Falha ao compilar o script carregado.")
        end
    else
        warn("Falha ao carregar o script de: " .. url .. ". Erro: " .. tostring(result))
    end
end

loadPlatformScript()
