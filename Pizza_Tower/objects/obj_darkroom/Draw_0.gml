draw_set_color(c_black)
draw_rectangle(0, 0, (view_xview[0] + view_wview[0]), (view_yview[0] + view_hview[0]), false)
with (obj_player)
    image_blend = make_color_hsv(255, 255, 0)
