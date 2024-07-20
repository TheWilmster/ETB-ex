if (image_angle == 0)
    x = (ID.x + (image_xscale * 15))
else
    x = ID.x
y = ID.y
if (ID.state != 81 || ID.sprite_index == ID.stunfallspr || ID.sprite_index == ID.stunfalltransspr)
    instance_destroy()
