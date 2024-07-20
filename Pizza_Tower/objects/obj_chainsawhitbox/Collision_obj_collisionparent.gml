if (bumpeffect == 0)
{
    bumpeffect = 1
    obj_player.movespeed = 5
    with (instance_create((x + (image_xscale * 40)), y, obj_spikehurteffect))
        other.image_xscale = image_xscale
}
