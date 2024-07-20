function scr_player_skateboard()
{
	scr_getinput()
	machhitAnim = 0
	crouchslideAnim = 1
	hsp = floor((xscale * movespeed))
	if key_jump
	{
	    state = 48
	    vsp = -6
	    with (instance_create((x + (xscale * movespeed)), y, obj_skateboard))
	    {
	        xscale = other.xscale
	        hsp = other.hsp
	        vsp = -5
	    }
	}
	if (place_meeting((x + 1), y, obj_bumpable) && xscale == 1)
	{
	    machhitAnim = 0
	    state = 50
	    hsp = -2.5
	    vsp = -3
	    mach2 = 0
	    image_index = 0
	    instance_create((x + 10), (y + 10), obj_bumpeffect)
	    audio_sound_gain(sfx_bump, 0.7, 0)
	    if (!audio_is_playing(sfx_bump))
	        audio_play_sound(sfx_bump, 1, false)
	    instance_create(x, (y + 10), obj_skateboarddebris1)
	    instance_create(x, (y + 10), obj_skateboarddebris2)
	}
	else if (place_meeting((x - 1), y, obj_bumpable) && xscale == -1)
	{
	    machhitAnim = 0
	    state = 50
	    hsp = 2.5
	    vsp = -3
	    mach2 = 0
	    image_index = 0
	    instance_create((x - 10), (y + 10), obj_bumpeffect)
	    audio_sound_gain(sfx_bump, 0.7, 0)
	    if (!audio_is_playing(sfx_bump))
	        audio_play_sound(sfx_bump, 1, false)
	    instance_create(x, (y + 10), obj_skateboarddebris1)
	    instance_create(x, (y + 10), obj_skateboarddebris2)
	}
	sprite_index = spr_player_skateboard
	image_speed = 0.35
	if ((!instance_exists(obj_slidecloud)) && place_meeting(x, (y + 1), obj_collisionparent) && movespeed > 5)
	    instance_create(x, y, obj_slidecloud)
	scr_collideandmove()
}
