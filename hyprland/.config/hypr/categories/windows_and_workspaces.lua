-- https://wiki.hypr.land/Configuring/Basics/Window-Rules/

local suppressMaximizeRule = hl.window_rule({
    name = "ignore_maximize_requests",
    match = {
        class = ".*"
    },
    suppress_event = "maximize"
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false
    },
    no_focus = true
})

-- Fixes for weird bug in steam
-- Force steam windows to float (fixes tiled layout crashes and dropdown issues)
hl.window_rule({
    match = {
        class = "^(steam)$"
    },
    float = true
})

hl.window_rule({
    match = {
        class = "^(steamwebhelper)$"
    },
    float = true
})

hl.window_rule({
    match = {
        title = "^(.*dropdown.*)$"
    },
    stay_focused = true
})

-- Fix for blurry/incorrect Xwayland scaling
hl.config({
    xwayland = {
        force_zero_scaling = true
    }
})

-- If using an Nvidia GPU, use these variables:
hl.env("__GL_VRR_ALLOWED", "1")
hl.env("WLR_DRM_NO_ATOMIC", "1")
