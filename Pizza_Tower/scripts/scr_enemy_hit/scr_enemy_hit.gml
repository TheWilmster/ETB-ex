function scr_enemy_hit()
{
	if (place_meeting(x, (y - 1), obj_enemiesbumpable) && (sprite_index == flyingspr || sprite_index == hitspr))
	{
	    image_index = 0
	    state = 75
	    scr_sound(sfx_facestomp)
	}
	if (straightthrow == 1)
	    vsp = 0
	if (vsp < 0 && floor(image_index) != 2 && sprite_index != flyingspr)
	    sprite_index = hitspr
	else if (vsp < 0)
	    sprite_index = flyingspr
	else if (sprite_index == flyingspr)
	    sprite_index = stunfalltransspr
	else if (floor(image_index) == 4 && sprite_index == stunfalltransspr)
	    sprite_index = stunfallspr
	if (place_meeting(x, (y + 1), obj_enemiesbumpable) && floor(vsp) > 0)
	{
	    instance_create(x, y, obj_landcloud)
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
	image_speed = 0.35
	scr_collideandmoveonlywall()
	if (((place_meeting((x + 1), y, obj_enemiesbumpable) && image_xscale == -1) || (place_meeting((x - 1), y, obj_enemiesbumpable) && image_xscale == 1)) && floor(vsp) <= 0 && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
	{
	    scr_sound(sfx_facestomp)
	    image_index = 0
	    sprite_index = hitwallspr
	    state = 76
	}
}
