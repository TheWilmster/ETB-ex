function scr_enemy_stun()
{
	if ((!(sprite_index == stunspr)) && floor(image_index) != (image_number - 1))
	    sprite_index = stunlandspr
	else
	    sprite_index = stunspr
	image_speed = 0.35
	if (place_meeting(x, (y + 1), obj_enemiesbumpable) && vsp > 0)
	    hsp = 0
	stunned--
	if (stunned == 0)
	{
	    state = 83
	    image_index = 0
	}
	if (collectdrop != 0)
	{
	    collectdrop--
	    with (instance_create(x, y, obj_collect))
	    {
	        alarm[0] = 20
	        cantcollect = 1
	        hsp = ((-other.image_xscale) * random_range(3, 5))
	        vsp = random_range(-3, -10)
	        drop = 1
	    }
	}
	scr_collideandmoveonlywall()
}
