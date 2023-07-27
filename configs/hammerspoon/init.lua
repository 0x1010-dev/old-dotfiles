-- Generate docs for syntax completion
hs.loadSpoon("EmmyLua")

-- Auto-Reload configuration
hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

-- Monitor screen changes
function SetDockPosition(location)
  local _, result = hs.applescript([[
    tell application "System Events" to tell dock preferences to screen edge as string
  ]])

  if (result ~= location) then
    hs.alert.show("Moving Dock to the " .. location .. ".")
    hs.applescript([[
      tell application "System Events" to tell dock preferences
        set properties to {screen edge:]] .. location .. [[}
      end tell
    ]])
  end
end

function OnScreenChange()
  -- look for sidecar
  local screen = hs.screen.find 'Sidecar'

  -- reposition dock if needed
  if (screen ~= nil) then
    local x, y = screen:position()

    if (x ~= nil and y ~= nil and x < 0 and y >= 0) then
      -- sidecar is on left side
      SetDockPosition('right')
    else
      -- sidecar is elsewhere
      SetDockPosition('left')
    end
  else
    -- no sidecar
    SetDockPosition('left')
  end
end

ScreenWatcher = hs.screen.watcher.new(OnScreenChange):start()
