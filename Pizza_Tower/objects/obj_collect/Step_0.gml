if (drop == 1)
    scr_collideandmove()
if place_meeting(x, (y + 1), obj_collisionparent)
    hsp = 0
if (cantcollect == 1)
{
    if (flicker == 0)
    {
        alarm[1] = 3
        flicker = 1
    }
}
else if (cantcollect == 0)
    image_alpha = 1
