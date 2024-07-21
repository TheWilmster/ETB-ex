if (vsp < 12)
    vsp += grav
image_speed = 0.35
if place_meeting(x, (y + 1), obj_solid)
{
    image_xscale = (-(sign((x - obj_player.x))))
    climbing = 0
}
if (climbing == 0)
{
    if (place_meeting((x + 1), y, obj_solid) && image_xscale == 1)
        vsp = -5
    if (place_meeting((x - 1), y, obj_solid) && image_xscale == -1)
        vsp = -5
    if place_meeting(x, (y - 1), obj_solid)
        climbing = 1
}
if (roam == 0 && attack == 0)
{
    if (!((place_meeting((x + 1), y, obj_player) || place_meeting((x - 1), y, obj_player))))
        hsp = (image_xscale * 10)
    else
        attack = 1
}
if (roam == 0 && attack == 1 && attacked == 0)
{
    alarm[1] = 80
    attacked = 1
    hsp = 0
}
if (place_meeting((x + 1), y, obj_player) || place_meeting((x - 1), y, obj_player) || place_meeting(x, (y + 1), obj_player) || place_meeting(x, (y - 1), obj_player))
{
    with (obj_player)
    {
        if (state != 51 && state != 56 && state != 53 && hurted == 0 && barrel == 0)
        {
            state = states.hurt
            obj_player.image_index = 0
            obj_player.flash = 1
            obj_player.hsp = (sign((x - other.x)) * 5)
            if (!(place_meeting(x, (y + 1), obj_solid)))
            {
                hurtbounce = 1
                vsp = -5
            }
        }
        else if (barrel == 1)
        {
            barrel = 0
            state = states.hurt
            obj_player.image_index = 0
            obj_player.flash = 1
            obj_player.hsp = (sign((x - other.x)) * 5)
            if (!(place_meeting(x, (y + 1), obj_solid)))
            {
                hurtbounce = 1
                vsp = -5
            }
            instance_create((x + random_range(15, -15)), (y + random_range(15, -15)), obj_wooddebris)
            instance_create((x + random_range(15, -15)), (y + random_range(15, -15)), obj_wooddebris)
            instance_create((x + random_range(15, -15)), (y + random_range(15, -15)), obj_wooddebris)
            instance_create((x + random_range(15, -15)), (y + random_range(15, -15)), obj_wooddebris)
            instance_create((x + random_range(15, -15)), (y + random_range(15, -15)), obj_wooddebris)
            instance_create((x + random_range(15, -15)), (y + random_range(15, -15)), obj_wooddebris)
            instance_create((x + random_range(15, -15)), (y + random_range(15, -15)), obj_wooddebris)
            instance_create((x + random_range(15, -15)), (y + random_range(15, -15)), obj_wooddebris)
            instance_create((x + random_range(15, -15)), (y + random_range(15, -15)), obj_wooddebris)
            instance_create((x + random_range(15, -15)), (y + random_range(15, -15)), obj_wooddebris)
        }
    }
}
scr_collideandmoveonlywall()
