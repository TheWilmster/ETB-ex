instance_destroy()
with (instance_create(x, y, obj_trashdead))
{
    hsp = (sign((x - obj_player.x)) * 2)
    image_xscale = (-(sign((x - obj_player.x))))
    vsp = -5
}
instance_create(x, y, obj_bangeffect)
instance_create(x, y, obj_bigcollect)
