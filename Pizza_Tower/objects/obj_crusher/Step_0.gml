if (crushing == 1)
{
    alarm[0] = 15
    vspeed = 8
    if place_meeting(x, (y + 1), obj_solid)
    {
        vspeed = 0
        crushing = 0
    }
}
if (backup == 1)
{
    vspeed = -8
    if place_meeting(x, (y - 1), obj_solid)
    {
        vspeed = 0
        backup = 0
    }
}
if (place_meeting((x + 1), y, obj_player) || place_meeting((x - 1), y, obj_player) || place_meeting(x, (y + 1), obj_player) || place_meeting(x, (y - 1), obj_player))
{
    with (obj_player)
    {
        if (state != 51 && hurted == 0 && barrel == 0)
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
