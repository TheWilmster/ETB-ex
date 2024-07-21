if (obj_player.y < y && enterbarrel == 1 && place_meeting(x, y, obj_player) && obj_player.barrel == 0)
{
    if (obj_player.state != 51)
    {
        obj_player.state = states.barrelnormal
        obj_player.vsp = 10
        obj_player.image_index = 0
        obj_player.barrel = 1
        obj_player.x = x
        obj_player.image_xscale = image_xscale
        instance_destroy()
    }
}
if place_meeting(x, y, obj_water2)
    vsp -= 1
else
    vsp = 0
scr_collideandmoveonlywall()
