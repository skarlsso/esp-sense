-- Sleep 5 seconds before executing the script.
-- This allows us to call tmr.stop() and prevent the script from running,
-- which is good if something is broken in the script. :)
tmr.alarm(0, 5000, 0, function()
    local script = 'main-rht03.lua'
    print("Running "..script)
    dofile(script)
end)
