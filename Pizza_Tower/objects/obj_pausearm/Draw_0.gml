font = font_add_sprite(spr_numbers, 48, 0, -10)
draw_set_font(font)
draw_set_halign(fa_center)
draw_set_color(c_white)
draw_self()
if (global.seconds < 10)
{
    if (global.minutes <= 1)
        draw_set_color(c_red)
    else
        draw_set_color(c_white)
    draw_text(x, y, ((string(global.minutes) + ":0") + string(global.seconds)))
}
else if (global.seconds >= 10)
{
    if (global.minutes <= 1)
        draw_set_color(c_red)
    else
        draw_set_color(c_white)
    draw_text(x, y, ((string(global.minutes) + ":") + string(global.seconds)))
}
