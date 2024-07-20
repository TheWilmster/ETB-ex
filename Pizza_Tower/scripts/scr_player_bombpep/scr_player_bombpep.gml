function scr_player_bombpep()
{
	if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	{
	    vsp /= 2
	    jumpstop = 1
	}
	if (place_meeting(x, (y + 1), obj_collisionparent) && vsp > 0)
	    jumpstop = 0
	mach2 = 0
	landAnim = 0
	scr_getinput()
	alarm[5] = 2
	if (sprite_index == spr_bombpep_intro && floor(image_index) == (image_number - 1))
	    sprite_index = spr_bombpep_run
	if (sprite_index == spr_bombpep_run || sprite_index == spr_bombpep_runabouttoexplode)
	{
	    if (movespeed <= 8)
	        movespeed += 0.2
	    hsp = floor((xscale * movespeed))
	}
	else
	{
	    hsp = 0
	    movespeed = 0
	}
	if (bombpephitwall == 2)
	    sprite_index = spr_bombpep_runabouttoexplode
	if (sprite_index == spr_bombpep_end && floor(image_index) == (image_number - 1))
	{
	    alarm[7] = 60
	    hurted = 1
	    state = 0
	    sprite_index = spr_player_idle
	    image_index = 0
	}
	if (bombpephitwall == 3)
	{
	    hurted = 1
	    bombpephitwall = 0
	    instance_create(x, y, obj_bombexplosion)
	    sprite_index = spr_bombpep_end
	}
	if (place_meeting((x + 1), y, obj_collisionparent) && xscale == 1 && hsp != 0 && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
	{
	    scr_sound(sfx_bump)
	    instance_create((x + 10), (y + 10), obj_bumpeffect)
	    vsp = -3
	    bombpephitwall += 1
	    xscale *= -1
	}
	if (place_meeting((x - 1), y, obj_collisionparent) && xscale == -1 && hsp != 0 && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
	{
	    scr_sound(sfx_bump)
	    instance_create((x - 10), (y + 10), obj_bumpeffect)
	    vsp = -3
	    bombpephitwall += 1
	    xscale *= -1
	}
	if (key_jump && place_meeting(x, (y + 1), obj_collisionparent) && hsp != 0)
	    vsp = -9
	if (movespeed < 4)
	    image_speed = 0.35
	else if (movespeed > 4 && movespeed < 8)
	    image_speed = 0.45
	else
	    image_speed = 0.6
	if (hsp != 0 && place_meeting(x, (y + 1), obj_collisionparent))
	{
	    audio_sound_gain(sfx_mach1, 0.7, 0)
	    if (!audio_is_playing(sfx_mach1))
	        audio_play_sound(sfx_mach1, 1, false)
	}
	if ((!instance_exists(obj_dashcloud)) && place_meeting(x, (y + 1), obj_collisionparent) && hsp != 0)
	    instance_create(x, y, obj_dashcloud)
	scr_collideandmove()
}
