function scr_enemy_rolling()
{
	hsp = ((-image_xscale) * 10)
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
	sprite_index = rollingspr
	image_speed = 0.35
	if (((place_meeting((x + 1), y, obj_enemiesbumpable) && image_xscale == -1) || (place_meeting((x - 1), y, obj_enemiesbumpable) && image_xscale == 1)) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
	{
	    state = 76
	    sprite_index = hitwallspr
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
