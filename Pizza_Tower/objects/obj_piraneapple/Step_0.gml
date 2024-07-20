if (vsp < 12)
    vsp += grav
image_speed = 0.35
if place_meeting(x, y, obj_water2)
    vsp = 0
if (attack == 0)
{
    movespeed = 2
    hsp = (image_xscale * movespeed)
    if (place_meeting((x + 1), y, obj_solid) && image_xscale == 1)
        image_xscale = -1
    if (place_meeting((x - 1), y, obj_solid) && image_xscale == -1)
        image_xscale = 1
    sprite_index = spr_piraneapple
}
if (attack == 1)
{
    hsp = 0
    sprite_index = spr_piraneappleattack
}
scr_collideandmove()
