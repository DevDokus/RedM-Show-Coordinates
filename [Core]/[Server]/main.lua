--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
local VorpCore = {}
TriggerEvent("getCore", function(core) VorpCore = core end)
function Wait(args) Citizen.Wait(args) end
--------------------------------------------------------------------------------
-- Event Register
RegisterServerEvent('DevDokus:Coords:S:CheckAdmin')
--------------------------------------------------------------------------------
-- Core
--------------------------------------------------------------------------------
AddEventHandler('DevDokus:Coords:S:CheckAdmin', function()
  local User = VorpCore.getUser(source)
  for k, v in pairs(User) do
    local IsAdmin = User.getGroup
    if IsAdmin == AdminGroup then
      TriggerClientEvent('DevDokus:Coords:C:ShowCoords', source)
      return
    else
      Notify(Error, 5000)
      return
    end
  end
end)

function Notify(text, time)
  TriggerClientEvent("vorp:TipRight", source, text, time)
end





































--------------------------------------------------------------------------------
