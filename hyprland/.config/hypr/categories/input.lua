hl.config({
    -- https://wiki.hypr.land/Configuring/Basics/Variables/#input
    input = {
        -- {{{
        kb_model = "",
        kb_layout = "se",
        kb_variant = "",
        kb_options = "caps:escape",
        kb_rules = "",

        repeat_rate = 25,
        repeat_delay = 200,
        sensitivity = 0,
        follow_mouse = 2,

        touchpad = {
            natural_scroll = false
        }
        -- }}}
    }
})

-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/
hl.device({
    -- {{{
    name = "epic-mouse-v1",
    sensitivity = -0.5
    -- }}}
})
