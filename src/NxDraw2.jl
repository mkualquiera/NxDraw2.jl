module NxDraw2

function init_event(ev_buffer::Array{UInt8})::Int32 
    ccall((:nxd_init_event, "libnxdraw"), Int32, (Ptr{Cvoid}, UInt32), 
                                    pointer(ev_buffer), length(ev_buffer))
end

function init_window(width::UInt32, height::UInt32)::Int32
    ccall((:nxd_init_window, "libnxdraw"), Int32, (UInt32, UInt32), 
                                                        width, height)
end

function init_canvas(sprite::Array{UInt8}, width::UInt32, height::UInt32,
                    depth::UInt32)::Int32                    
    ccall((:nxd_init_canvas, "libnxdraw"), Int32, (Ptr{Cvoid}, UInt32, UInt32, 
                                        UInt32), pointer(sprite), width, 
                                        height, depth)
end

function init_palette(palette::Array{UInt8}, size::UInt32)::Int32
    ccall((:nxd_init_palette, "libnxdraw"), Int32, (Ptr{Cvoid}, UInt32), 
                                                pointer(palette), size)
end

function palette_rgb(id::UInt32,r::UInt8,g::UInt8,b::UInt8)::Int32
    ccall((:nxd_palette_rgb, "libnxdraw"), Int32, (UInt32, UInt8, UInt8, UInt8), 
                                                id, r, g, b)
end

function palette_fg(id::UInt32)::Int32
    ccall((:nxd_palette_fg, "libnxdraw"), Int32, (UInt32,), id)
end

function palette_bg(id::UInt32)::Int32
    ccall((:nxd_palette_bg, "libnxdraw"), Int32, (UInt32,), id)
end

function draw_clear()::Int32
    ccall((:nxd_draw_clear, "libnxdraw"), Int32, ())
end

function tick()::Int32
    ccall((:nxd_tick, "libnxdraw"), Int32, ())
end

function time_await_limit(limit::UInt32)::Int32
    ccall((:nxd_time_await_limit, "libnxdraw"), Int32, (UInt32,), limit)
end

function events()::Int32
    ccall((:nxd_events, "libnxdraw"), Int32, ())
end

function event_pop()::Int32
    ccall((:nxd_event_pop, "libnxdraw"), Int32, ())
end

function event_kind()::Int32
    ccall((:nxd_event_kind, "libnxdraw"), Int32, ())
end

function event_x()::Int32
    ccall((:nxd_event_x, "libnxdraw"), Int32, ())
end

function event_y()::Int32
    ccall((:nxd_event_y, "libnxdraw"), Int32, ())
end

function draw_pixel(x::Int32,y::Int32)::Int32
    ccall((:nxd_draw_pixel, "libnxdraw"), Int32, (Int32, Int32), x, y)
end

function draw_rectangle(x::Int32,y::Int32,w::Int32,h::Int32)::Int32
    ccall((:nxd_draw_rectangle, "libnxdraw"), Int32, (Int32, Int32, Int32, 
                                                                    Int32), 
                                                            x, y, w, h)
end

function draw_rectangleb(x::Int32,y::Int32,w::Int32,h::Int32)::Int32
    ccall((:nxd_draw_rectangleb, "libnxdraw"), Int32, (Int32, Int32, Int32, 
                                                                    Int32), 
                                                            x, y, w, h)
end

function draw_line(x1::Int32,y1::Int32,x2::Int32,y2::Int32)::Int32
    ccall((:nxd_draw_line, "libnxdraw"), Int32, (Int32, Int32, Int32, Int32), 
                                                            x1, y1, x2, y2)
end

function cleanup()::Int32
    ccall((:nxd_cleanup, "libnxdraw"), Int32, ())
end

function clip(x::Int32,y::Int32,w::Int32,h::Int32)::Int32
    ccall((:nxd_clip, "libnxdraw"), Int32, (Int32, Int32, Int32, Int32), 
                                                            x, y, w, h)
end

function clip_disable()::Int32
    ccall((:nxd_clip_disable, "libnxdraw"), Int32, ())
end

function draw_bitmap(bitmap::Array{UInt8}, x::Int32, y::Int32, 
                    width::Int32, height::Int32)::Int32
    ccall((:nxd_draw_bitmap, "libnxdraw"), Int32, (Ptr{Cvoid}, Int32, Int32, 
                                                            Int32, Int32), 
                                                            pointer(bitmap), 
                                                            x, y, width, height)
end

function draw_char(font::Array{UInt8}, c::UInt8, x::Int32, y::Int32)::Int32
    ccall((:nxd_draw_char, "libnxdraw"), Int32, (Ptr{Cvoid}, UInt8, Int32, 
                                                            Int32), 
                                                            pointer(font), 
                                                            c, x, y)
end

function draw_cstring(font::Array{UInt8}, str::String, x::Int32, y::Int32)::Int32
    ccall((:nxd_draw_cstring, "libnxdraw"), Int32, (Ptr{Cvoid}, Cstring, 
                                                            Int32, Int32), 
                                                            pointer(font), 
                                                            str, x, y)
end

function event_ascii_low()::UInt8
    ccall((:nxd_event_ascii_low, "libnxdraw"), Int32, ())
end

function event_key()::UInt32
    ccall((:nxd_event_key, "libnxdraw"), UInt32, ())
end

function event_mods()::UInt32
    ccall((:nxd_event_mods, "libnxdraw"), UInt32, ())
end

function event_peek()::Int32
    ccall((:nxd_event_peek, "libnxdraw"), Int32, ())
end

function fullscreen(state::Int32)::Int32
    ccall((:nxd_fullscreen, "libnxdraw"), Int32, (Int32,), state)
end
    
function palette_swap()::Int32
    ccall((:nxd_palette_swap, "libnxdraw"), Int32, ())
end

function present()::Int32
    ccall((:nxd_present, "libnxdraw"), Int32, ())
end

function screen_info()::Tuple{Int32,Int32}
    w = 0
    h = 0
    ccall((:nxd_screen_info, "libnxdraw"), Int32, (Ptr{UInt32}, Ptr{UInt32}), 
                                                            Ref(w), 
                                                            Ref(h))
    (w, h)
end

function time_sleep(ms::UInt32)::Int32
    ccall((:nxd_time_sleep, "libnxdraw"), Int32, (UInt32,), ms)
end

function translate(x::Int32,y::Int32)::Int32
    ccall((:nxd_translate, "libnxdraw"), Int32, (Int32, Int32), x, y)
end

function translate_info()::Tuple{Int32,Int32}
    x = 0
    y = 0
    ccall((:nxd_translate_info, "libnxdraw"), Int32, (Ptr{Int32}, Ptr{Int32}), 
                                                            Ref(x), 
                                                            Ref(y))
    (x, y)
end

size_screen(w::Int32,h::Int32) = w*h*4

size_palette(n::Int32)::UInt32 = n*4

export init_event, event_pop, event_kind, event_x, event_y, draw_pixel, 
       draw_rectangle, draw_rectangleb, draw_line, cleanup, clip, 
       clip_disable, draw_bitmap, draw_char, draw_cstring, event_ascii_low, 
       event_key, event_mods, event_peek, fullscreen, palette_swap, 
       present, screen_info, time_sleep, translate, translate_info, 
       size_screen, size_palette

end # module
