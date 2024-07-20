image_speed = 0.35
if (!(place_meeting(x, (y + 1), obj_collisionparent)))
{
    hsp = 0
    roam = 0
}
if (roam == 1 && bounce == 0)
{
    if place_meeting(x, (y + 1), obj_enemiesbumpable)
        hsp = (image_xscale * movespeed)
    sprite_index = spr_slimemove
    if (place_meeting((x + 1), y, obj_enemiesbumpable) && image_xscale == 1)
        image_xscale = -1
    if (place_meeting((x - 1), y, obj_enemiesbumpable) && image_xscale == -1)
        image_xscale = 1
    if (!(place_meeting((x + 15), (y + 3), obj_enemiesbumpable)))
        image_xscale = -1
    if (!(place_meeting((x - 15), (y + 3), obj_enemiesbumpable)))
        image_xscale = 1
}
if (roam == 0 && bounce == 0)
{
    hsp = 0
    sprite_index = spr_slimeidle
}
if (bounce == 1)
{
    hsp = 0
    sprite_index = spr_slimebounce
    if (floor(image_index) == 12)
        bounce = 0
}
if (stun == 1)
    sprite_index = spr_slimeidle
scr_collideandmoveonlywall()
