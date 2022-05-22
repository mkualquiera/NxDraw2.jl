include("../src/NxDraw2.jl")

include("font.jl")

using .NxDraw2

function test()
    w = Int32(320)
    h = Int32(240)
    palette_size = Int32(16)

    evbuf = Array{UInt8}(undef,2048)
    screen = Array{UInt8}(undef, NxDraw2.size_screen(w,h))
    palette = Array{UInt8}(undef,NxDraw2.size_palette(palette_size))

    NxDraw2.init_event(evbuf)
    NxDraw2.init_window(UInt32.((w*4,h*4))...)
    NxDraw2.init_canvas(screen,UInt32.((w,h,4))...)
    NxDraw2.init_palette(palette,NxDraw2.size_palette(palette_size))

    # Initialize palette colours
    NxDraw2.palette_rgb(UInt32(0),UInt8.((255,255,255))...)
    NxDraw2.palette_rgb(UInt32(1),UInt8.((0,0,0))...)
    NxDraw2.palette_rgb(UInt32(2),UInt8.((16,16,26))...)
    NxDraw2.palette_rgb(UInt32(3),UInt8.((127,0,0))...)
    NxDraw2.palette_rgb(UInt32(4),UInt8.((255,127,0))...)

    # While the program is ticking...
    while NxDraw2.tick() != 0 
        dt = NxDraw2.time_await_limit(UInt32(30))

        NxDraw2.palette_fg(UInt32(4))
        NxDraw2.palette_bg(UInt32(1))

        # While there are events...
        while NxDraw2.events() != 0
            NxDraw2.event_pop()

            print(NxDraw2.event_kind())
        end

        NxDraw2.draw_cstring(testfont, "The quick goose something idk", Int32.((0, 8))...)

        NxDraw2.present()
    end
end

test()