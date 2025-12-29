local chromeBundle = "com.google.Chrome"

hs.hotkey.bind({ "alt" }, "space", function()
  hs.application.launchOrFocusByBundleID(chromeBundle)
  hs.urlevent.openURLWithBundle("chrome://newtab", chromeBundle)
end)
