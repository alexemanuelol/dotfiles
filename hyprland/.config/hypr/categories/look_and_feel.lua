-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/

hl.config({
    -- https://wiki.hypr.land/Configuring/Basics/Variables/#general
    general = {
        -- {{{
        border_size = 2,
        gaps_in = 2,
        gaps_out = 2,
        gaps_workspaces = 0,
        layout = "dwindle",

        col = {
            inactive_border = "rgba(282828ee)",
            active_border = {
                colors = {
                    "rgba(cc241dee)",
                    "rgba(98971aee)",
                    "rgba(d79921ee)",
                    "rgba(458588ee)",
                    "rgba(b16286ee)",
                    "rgba(689d6aee)" },
                angle = 45
            }
        },

        resize_on_border = false,
        allow_tearing = false
        -- }}}
    },

    -- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
    decoration = {
        -- {{{
        rounding = 2,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 1.0,

        -- https://wiki.hypr.land/Configuring/Basics/Variables/#blur
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696
        },

        -- https://wiki.hypr.land/Configuring/Basics/Variables/#shadow
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1d2021ee)",
        }
        -- }}}
    },

    -- https://wiki.hypr.land/Configuring/Basics/Variables/#animations
    animations = {
        -- {{{
        enabled = true
        --- }}}
    },

    -- https://wiki.hypr.land/Configuring/Basics/Variables/#misc
    misc = {
        -- {{{
        disable_hyprland_logo = true,
        force_default_wallpaper = 0
        -- }}}
    },

    -- https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/
    dwindle = {
        -- {{{
        preserve_split = true
        -- }}}
    },

    -- https://wiki.hypr.land/Configuring/Layouts/Master-Layout/
    master = {
        -- {{{
        new_status = "master"
        -- }}}
    }
})

local speed = 2
hl.animation({ leaf = "global",             enabled = true,     speed = speed,  bezier = "default" })
hl.animation({ leaf = "windows",            enabled = true,     speed = speed,  bezier = "default" })
hl.animation({ leaf = "windowsIn",          enabled = true,     speed = speed,  bezier = "default" })
hl.animation({ leaf = "windowsOut",         enabled = true,     speed = speed,  bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "layers",             enabled = true,     speed = speed,  bezier = "default", style = "fade" })
hl.animation({ leaf = "layersIn",           enabled = true,     speed = speed,  bezier = "default", style = "fade" })
hl.animation({ leaf = "layersOut",          enabled = true,     speed = speed,  bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "fade",               enabled = true,     speed = speed,  bezier = "default" })
hl.animation({ leaf = "border",             enabled = true,     speed = speed,  bezier = "default" })
hl.animation({ leaf = "workspaces",         enabled = true,     speed = speed,  bezier = "default" })
hl.animation({ leaf = "workspacesIn",       enabled = true,     speed = speed,  bezier = "default", style = "slide" })
hl.animation({ leaf = "workspacesOut",      enabled = true,     speed = speed,  bezier = "default", style = "slide" })
hl.animation({ leaf = "specialWorkspace",   enabled = true,     speed = speed,  bezier = "default", style = "slidevert" })
