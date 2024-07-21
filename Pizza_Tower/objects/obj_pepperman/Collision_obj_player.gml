if (!(obj_player.y < y))
{
    with (obj_player)
    {
        if ((state != 51 && mach2 < 35 && state != 52 && state != 35 && state != 64 && state != 50 && hurted == 0 && barrel == 0) || (other.charging == 1 && hurted == 0))
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
        else if (barrel == 1 && state != 64)
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
if (obj_player.y < y && obj_player.state != 51 && obj_player.state != 64 && obj_player.barrel == 0 && obj_player.state != 50 && obj_player.mach2 < 35 && obj_player.state != 52)
{
    obj_player.vsp = -5.5
    audio_sound_gain(sfx_superjump, 0.7, 0)
    if (!audio_is_playing(sfx_superjump))
        audio_play_sound(sfx_superjump, 1, false)
}
if ((obj_player.mach2 >= 35 || obj_player.state == 52 || obj_player.state == 25 || obj_player.state == 64) && charging == 0)
{
    flash = 1
    stunned = 1
    obj_player.state = states.tackle
    obj_player.image_index = 0
    if (obj_player.x != x)
        image_xscale = sign((obj_player.x - x))
    hsp = (sign((x - obj_player.x)) * 4)
    vsp = -3
    alarm[0] = 100
    alarm[1] = 100
}
