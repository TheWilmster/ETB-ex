if ((state == 36 || state == 41 || state == 48 || obj_player.state == 68) && y > other.y && other.drop == 0)
{
    state = 53
    image_xscale = 1
    other.hooked = 1
    if (mach2 >= 35)
        other.hspeed = 10
    if (other.hspeed == 10)
        sprite_index = spr_player_hangslide
    if (other.hspeed == 0)
        sprite_index = spr_player_hang
}
