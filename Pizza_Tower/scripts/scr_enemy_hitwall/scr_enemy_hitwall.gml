function scr_enemy_hitwall()
{
	vsp = 0
	hsp = 0
	sprite_index = hitwallspr
	image_speed = 0.35
	if (floor(image_index) == 2)
	{
	    hsp = (image_xscale * random_range(1, 4))
	    sprite_index = stunfallspr
	    image_index = 0
	    state = 81
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
