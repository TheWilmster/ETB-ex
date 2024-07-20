x = (other.x + (128 * other.image_xscale))
y = other.y
image_xscale = other.image_xscale
if (place_meeting(x, y, obj_player) && obj_player.state != 57)
{
    other.roam = 0
    other.alarm[0] = 100
}
