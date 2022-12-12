require "hs.ipc"



package.path = hs.configdir ..'/stackline/?.lua;' .. package.path
stackline = require 'stackline.stackline'
stackline:init({
    paths = {
        yabai = '/opt/homebrew/bin/yabai'
    },
    appearance = {
        color = { white = 0.90 },
        showIcons = false,
        alpha = 1,
        dimmer = 2.5,
        iconDimmer = 1.1,
        size = 32,
        radius = 3,
        iconPadding = 4,
        pillThinness = 6,
        vertSpacing = 1.2,
        offset = { y = 2, x = 4 },
        shouldFade = true,
        fadeDuration = 0.2
    }
})
