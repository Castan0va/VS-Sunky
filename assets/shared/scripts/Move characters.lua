-- [Creado por ContraSakar - Contrix]
-- [Canal: https://youtube.com/@contrasakar?si=TJ8TKUWwzhbLbqHo]

-- |Event: Move characters v1.2|
function onUpdatePost()
-- |Posiciones por defecto del .json|
AddBFX = getProperty('boyfriend.x')
AddBFY = getProperty('boyfriend.y')
AddDADX = getProperty('dad.x')
AddDADY = getProperty('dad.y')
AddGFX = getProperty('gf.x')
AddGFY = getProperty('gf.y')
end

function valuesplit(input, Contrix)
    if Contrix == nil then
    Contrix = '%s'
    end
    local cs={}
    for str in string.gmatch(input,"([^"..Contrix.."]+)") do
    table.insert(cs,str)
    end
    return cs
end

local ease = 'linear'

function onEvent(n,v1,v2)
    if n == 'Move characters' then
    local table=valuesplit(v2,",")
    if v1 == '1' or v1:lower() == 'bfx' then
    BFX = table [1]
    Time = table [2]
    ease = table [3]
    doTweenX('BFXE', 'boyfriend', AddBFX + BFX, Time, ease)
    end
    if v1 == '2' or v1:lower() == 'bfy' then
    BFY = table [1]
    Time = table [2]
    ease = table [3]
    doTweenY('BFYE', 'boyfriend', AddBFY + BFY, Time, ease)
    end
    if v1 == '3' or v1:lower() == 'dadx' then
    DADX = table [1]
    Time = table [2]
    ease = table [3]
    doTweenX('DADXE', 'dad', AddDADX + DADX, Time, ease)
    end
    if v1 == '4' or v1:lower() == 'dady' then
    DADY = table [1]
    Time = table [2]
    ease = table [3]
    doTweenY('DADYE', 'dad', AddDADY + DADY, Time, ease)
    end
    if v1 == '5' or v1:lower() == 'gfx' then
    GFX = table [1]
    Time = table [2]
    ease = table [3]
    doTweenX('GFXE', 'gf', AddGFX + GFX, Time, ease)
    end
    if v1 == '6' or v1:lower() == 'gfy' then
    GFY = table [1]
    Time = table [2]
    ease = table [3]
    doTweenY('GFYE', 'gf', AddGFY + GFY, Time, ease)
    end
end
end