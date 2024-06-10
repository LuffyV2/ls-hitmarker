ShowHealth = false


function DrawTextOnScreen(text, xPosition, yPosition)
    SetTextFont(0)
    SetTextScale(1.0, 0.4)
    SetTextColour(color['p'], color['g'], color['b'], color['a'])
    SetTextOutline()
    BeginTextCommandDisplayText("STRING");
    AddTextComponentSubstringPlayerName(text);
    EndTextCommandDisplayText(xPosition, yPosition);


end

function Round(number, places)  -- http://lua-users.org/wiki/SimpleRound
    local mult = 10^(places or 0)
    return math.floor(number * mult + 0.5) / mult
end

-- heli engine. white smoke below 900, cutting out below 600, gray smoke below 500 (use 400 for display, or dont include), failure below 200
-- aero vehicles in general: 900 yellow, 600 orange, 300 red, 200 black
-- https://github.com/TomGrobbe/vMenu/blob/master/vMenu/FunctionsController.cs
-- https://github.com/TomGrobbe/vMenu/blob/master/vMenu/CommonFunctions.cs
-- https://forum.cfx.re/t/how-to-use-colors-in-lua-scripting/458
-- cars and motorcycles: hiss & smoke below 400, sputtering below 300, engine degradation (delayed) below 100, fire below 0, explosion below 0 if moving
-- TODO: DO BOATS AND SUBMARINES