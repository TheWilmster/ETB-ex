if (vsp < 12)
    vsp += grav
image_speed = 0.35
if (charging == 0 && stunned == 0)
{
    if (obj_player.x != x)
        image_xscale = sign((obj_player.x - x))
    hsp = 0
    sprite_index = spr_pepperman
}
if (stunned == 1)
{
    if (hsp < 0)
        hsp += 0.1
    else if (hsp > 0)
        hsp -= 0.1
    sprite_index = spr_pepperman_hurt
}
if (charging == 1)
{
    hsp = (image_xscale * movespeed)
    if (!(place_meeting((x + 50), (y + 3), obj_solid)))
        image_xscale = -1
    if (!(place_meeting((x - 50), (y + 3), obj_solid)))
        image_xscale = 1
    if (chargingdown == 0)
    {
        if (movespeed < 12)
            movespeed += 0.1
        if (movespeed >= 12)
            chargingdown = 1
    }
    if (chargingdown == 1)
    {
        movespeed -= 0.1
        if (movespeed <= 0)
        {
            chargingdown = 0
            charging = 0
            alarm[1] = 50
        }
    }
    sprite_index = spr_pepperman_charge
}
if (charging == 1 && movespeed > 6)
    image_speed = 0.6
else
    image_speed = 0.35
if (floor(image_index) == 0 && charging == 1)
    instance_create(x, (y + 90), obj_cloudeffect)
if (flash == 1 && alarm[3] <= 0)
    alarm[3] = (0.01 * room_speed)
scr_collideandmoveonlywall()
