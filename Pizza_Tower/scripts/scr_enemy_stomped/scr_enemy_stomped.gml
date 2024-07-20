function scr_enemy_stomped()
{
	hsp = 0
	sprite_index = stompedspr
	image_speed = 0.35
	if (floor(image_index) == 3)
	{
	    sprite_index = stunlandspr
	    state = 82
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
