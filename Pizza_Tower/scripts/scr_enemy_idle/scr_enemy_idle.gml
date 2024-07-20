function scr_enemy_idle()
{
	if (sprite_index == fallspr && place_meeting(x, (y + 1), obj_enemiesbumpable))
	{
	    scr_sound(sfx_land)
	    instance_create(x, y, obj_landcloud)
	    state = 80
	    sprite_index = landspr
	    image_index = 0
	}
	if (floor(image_index) == (image_number - 1) && roaming == 1 && place_meeting(x, (y + 1), obj_enemiesbumpable))
	{
	    state = 78
	    image_index = 0
	}
	if ((!(place_meeting(x, (y + 1), obj_enemiesbumpable))) && hsp < 0)
	    hsp += 0.1
	else if ((!(place_meeting(x, (y + 1), obj_enemiesbumpable))) && hsp > 0)
	    hsp -= 0.1
	if place_meeting(x, (y + 1), obj_enemiesbumpable)
	    sprite_index = idlespr
	else
	    sprite_index = fallspr
	image_speed = 0.35
	scr_collideandmoveonlywall()
}
