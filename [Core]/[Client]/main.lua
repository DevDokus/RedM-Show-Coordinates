--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
function Wait(args) Citizen.Wait(args) end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local SC = false
--------------------------------------------------------------------------------

RegisterCommand('coords', function()
  if AdminOnly then
    TriggerServerEvent('DevDokus:Coords:S:CheckAdmin')
  else
    TriggerEvent('DevDokus:Coords:C:ShowCoords')
  end
end)

RegisterNetEvent('DevDokus:Coords:C:ShowCoords')
AddEventHandler('DevDokus:Coords:C:ShowCoords', function(IsAdmin)
  SC = not SC
  while SC do Wait(1)
    local ped = GetPlayerPed(source)
    local coords = GetEntityCoords(ped)
    local head = GetEntityHeading(ped)
    local X = ('~e~X~q~ '..(math.floor(coords.x * 10) / 10))
    local Y = ('~e~Y~q~ '..(math.floor(coords.y * 10) / 10))
    local Z = ('~e~Z~q~ '..(math.floor(coords.z * 10) / 10))
    local H = ('~e~H~q~ '..(math.floor(head * 10) / 10))
    local s = ShowCoords
    DrawCoords(X, s.PosX.Horizon, s.PosX.Vertical, s.FontSize)
    DrawCoords(Y, s.PosY.Horizon, s.PosY.Vertical, s.FontSize)
    DrawCoords(Z, s.PosZ.Horizon, s.PosZ.Vertical, s.FontSize)
    DrawCoords(H, s.PosH.Horizon, s.PosH.Vertical, s.FontSize)
  end
end)

function DrawCoords(text, x, y, size)
  local xc = x / 1.0;
  local yc = y / 1.0;
  SetScriptGfxDrawOrder(3)
  SetTextScale(size, size)
  SetTextCentre(true)
  SetTextColor(255, 255, 255, 100)
  SetTextFontForCurrentCommand(6)
  DisplayText(CreateVarString(10, 'LITERAL_STRING', text), xc, yc)
  SetScriptGfxDrawOrder(3)
end
