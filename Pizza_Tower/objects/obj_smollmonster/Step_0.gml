if (vsp < 12)
    vsp += grav
image_speed = 0.35
if (roam == 1 && attack == 0)
{
    hsp = (image_xscale * 2)
    if (place_meeting((x + 1), y, obj_solid) && image_xscale == 1)
        image_xscale = -1
    if (place_meeting((x - 1), y, obj_solid) && image_xscale == -1)
        image_xscale = 1
    if (place_meeting((x + 1), y, obj_enemylimit) && image_xscale == 1)
        image_xscale = -1
    if (place_meeting((x - 1), y, obj_enemylimit) && image_xscale == -1)
        image_xscale = 1
}
if (roam == 0 && attack == 0)
{
    if (!((place_meeting((x + 1), y, obj_player) || place_meeting((x - 1), y, obj_player))))
        hsp = (image_xscale * 6)
    else
        attack = 1
    if (place_meeting((x + 1), y, obj_solid) && image_xscale == 1)
        image_xscale = -1
    if (place_meeting((x - 1), y, obj_solid) && image_xscale == -1)
        image_xscale = 1
    if (place_meeting((x + 1), y, obj_enemylimit) && image_xscale == 1)
        image_xscale = -1
    if (place_meeting((x - 1), y, obj_enemylimit) && image_xscale == -1)
        image_xscale = 1
}
if (roam == 0 && attack == 1 && attacked == 0)
{
    alarm[1] = 80
    attacked = 1
    hsp = 0
}
scr_collideandmoveonlywall()
