
hl.monitor({
    output = "eDP-1",
    mode = "1920x1200@60",
    position = "0x0",
    scale = 1.5
})
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1
})

hl.config({
    input = {
        kb_layout = "fr",

        touchpad = {
            natural_scroll = true
        }
    }
})

hl.on("hyprland.start", function () 
  hl.exec_cmd("ags run")
end)

hl.bind("SUPER + Q", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + F", hl.dsp.exec_cmd("firefox"))

hl.bind("SUPER + A", hl.dsp.focus({workspace = 1}))
hl.bind("SUPER + Z", hl.dsp.focus({workspace = 2}))
hl.bind("SUPER + E", hl.dsp.focus({workspace = 3}))
hl.bind("SUPER + R", hl.dsp.focus({workspace = 4}))


hl.bind("SUPER + SHIFT + A", hl.dsp.window.move({workspace = 1}))
hl.bind("SUPER + SHIFT + Z", hl.dsp.window.move({workspace = 2}))
hl.bind("SUPER + SHIFT + E", hl.dsp.window.move({workspace = 3}))
hl.bind("SUPER + SHIFT + R", hl.dsp.window.move({workspace = 4}))

hl.bind("SUPER + X", hl.dsp.window.close())

hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("ags request launcher"))


-- animations --

local function spring(name, stiff, damp)
    hl.curve( name, { type = "spring", mass = 1.0, stiffness = stiff, dampening = damp})
end

spring("snap", 400, 38)
spring("settle", 180, 27)
spring("bloom", 150, 16)
spring("breathe", 40, 6)

hl.curve("fade", { type = "bezier", points = { {0.23, 1}, {0.32, 1} } })

hl.config({ animations = { enabled = true } })

-- Windows
hl.animation({ leaf = "windowsIn",   enabled = true, speed = 5, spring = "bloom",  style = "popin 85%" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 5, spring = "snap",   style = "popin 90%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 5, spring = "settle" })

-- Workspaces
hl.animation({ leaf = "workspaces",       enabled = true, speed = 5, spring = "settle",  style = "slidefade 15%" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 5, spring = "breathe", style = "slidefadevert 20%" })

-- Opacity and borders: no overshoot
hl.animation({ leaf = "fade",   enabled = true, speed = 5, bezier = "fade" })
hl.animation({ leaf = "border", enabled = true, speed = 5, bezier = "fade" })


hl.config({
    general = {
        border_size = 0,
        gaps_in = 10,
        gaps_out = 20,
        layout = "dwindle",
        resize_on_border = true,

        snap = {
            enabled = true,
            window_gap = 5,
            monitor_gap = 10
        }
    },

    decoration = {
        rounding = 15,
        rounding_power = 3.0,

        shadow = {
            enabled = true
        },

        motion_blur = {
            enabled = true
        }
    },

    
})