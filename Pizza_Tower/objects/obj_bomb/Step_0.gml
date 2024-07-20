countdown--
if (countdown < 50)
    sprite_index = spr_bomblit
if (countdown == 0)
{
    instance_destroy()
    instance_create(x, y, obj_bombexplosion)
}
scr_collideandmove()
if place_meeting(x, (y + 1), obj_collisionparent)
    hsp = 0
