function scr_enemy_walk()
{
	if place_meeting(x, (y + 1), obj_enemiesbumpable)
	    hsp = (image_xscale * movespeed)
	else
	    hsp = 0
	if (roaming == 0 && place_meeting(x, (y + 1), obj_enemiesbumpable))
	{
	    hsp = 0
	    state = 72
	    image_index = 0
	}
	if (sprite_index == fallspr && place_meeting(x, (y + 1), obj_enemiesbumpable))
	{
	    scr_sound(sfx_land)
	    instance_create(x, y, obj_landcloud)
	    state = 80
	    sprite_index = landspr
	    image_index = 0
	}
	if place_meeting(x, (y + 1), obj_enemiesbumpable)
	    sprite_index = walkspr
	else
	    sprite_index = fallspr
	image_speed = 0.35
	if (((place_meeting((x + 1), y, obj_enemiesbumpable) && image_xscale == 1) || (place_meeting((x - 1), y, obj_enemiesbumpable) && image_xscale == -1)) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
	{
	    state = 74
	    sprite_index = turnspr
	    image_index = 0
	}
	if ((!(place_meeting((x + 15), (y + 3), obj_enemiesbumpable))) && image_xscale == 1)
	{
	    hsp = 0
	    state = 74
	    sprite_index = turnspr
	    image_index = 0
	}
	if ((!(place_meeting((x - 15), (y + 3), obj_enemiesbumpable))) && image_xscale == -1)
	{
	    hsp = 0
	    state = 74
	    sprite_index = turnspr
	    image_index = 0
	}
	if ((!(place_meeting(x, (y + 1), obj_enemiesbumpable))) && hsp < 0)
	    hsp += 0.1
	else if ((!(place_meeting(x, (y + 1), obj_enemiesbumpable))) && hsp > 0)
	    hsp -= 0.1
	scr_collideandmoveonlywall()
}
