--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
RegisterNetEvent('DokusCore:Characters:SendWaring', function()
    DisplayHud(true)
    NoteObjective('WARNING', 'Only make 1 character per server login! Making a 2nd character on the same login will break the skin creator!', 'Horn', 5000)
    NoteObjective('WARNING', 'We are investigating the issue and patch it in a later version!', 'Horn', 5000) Wait(1000)
    DisplayHud(false)
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
