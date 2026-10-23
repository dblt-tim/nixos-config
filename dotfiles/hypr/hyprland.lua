
hl.monitor({
    output = "eDP-1",
    mode = "1920x1200@60",
    position = "0x0",
    scale = 1.25
})
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1
})

hl.config({
    input = {
        kb_layout = "fr"
    }
})

hl.bind("SUPER + Q", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + F", hl.dsp.exec_cmd("firefox"))

hl.bind("SUPER + A", hl.dsp.focus({workspace = 1}))
hl.bind("SUPER + Z", hl.dsp.focus({workspace = 2}))
hl.bind("SUPER + E", hl.dsp.focus({workspace = 3}))
hl.bind("SUPER + R", hl.dsp.focus({workspace = 4}))


hl.bind("SUPER + SHIFT + A", hl.dsp.window.move({workspace = 1}))