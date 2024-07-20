if ((place_meeting((x + 1), y, obj_player) || place_meeting(x, (y + 1), obj_player)) && obj_player.xscale == -1 && obj_player.state == 48 && obj_player.attacking == 1)
{
    if (obj_player.machpunchAnim == 0)
    {
        with (obj_player)
        {
            if place_meeting(x, (y + 1), obj_collisionparent)
            {
                machpunchAnim = 1
                image_index = 0
            }
        }
    }
    instance_destroy()
}
if ((place_meeting((x - 1), y, obj_player) || place_meeting(x, (y + 1), obj_player)) && obj_player.xscale == 1 && obj_player.state == 48 && obj_player.attacking == 1)
{
    if (obj_player.machpunchAnim == 0)
    {
        with (obj_player)
        {
            if place_meeting(x, (y + 1), obj_collisionparent)
            {
                machpunchAnim = 1
                image_index = 0
            }
        }
    }
    instance_destroy()
}
if (place_meeting(x, (y - 1), obj_player) && obj_player.vsp > 0 && obj_player.state == 12)
{
    instance_destroy()
    obj_player.image_index = 0
    obj_player.vsp = -7
    obj_player.facestompAnim = 1
}
if ((place_meeting((x + 5), y, obj_player) || place_meeting((x - 5), y, obj_player)) && (obj_player.state == 68 || obj_player.state == 15))
    instance_destroy()
if (place_meeting(x, (y - 1), obj_player) && obj_player.vsp > 0 && (obj_player.state == 52 || obj_player.state == 21 || obj_player.state == 2))
    instance_destroy()
if (place_meeting(x, (y + 1), obj_player) && obj_player.state == 41)
    instance_destroy()
