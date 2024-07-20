function scr_pizzagoblin_throw()
{
	hsp = 0
	if (floor(image_index) == 2 && thrown == 0)
	{
	    thrown = 400
	    with (instance_create(x, y, obj_bomb))
	    {
	        hsp = (other.image_xscale * 5)
	        vsp = -5
	    }
	}
	if (floor(image_index) == (image_number - 1) && place_meeting(x, (y + 1), obj_enemiesbumpable))
	{
	    state = 72
	    image_index = 0
	}
	if ((!(place_meeting(x, (y + 1), obj_enemiesbumpable))) && hsp < 0)
	    hsp += 0.1
	else if ((!(place_meeting(x, (y + 1), obj_enemiesbumpable))) && hsp > 0)
	    hsp -= 0.1
	sprite_index = spr_pizzagoblin_throwbomb
	image_speed = 0.5
	scr_collideandmoveonlywall()
}
