function scr_player_grabbing()
{
	scr_getinput()
	if (!(place_meeting(x, y, obj_baddie)))
	    state = 0
	move = (key_left + key_right)
	hsp = (move * movespeed)
	if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	{
	    vsp /= 2
	    jumpstop = 1
	}
	if (place_meeting(x, (y + 1), obj_collisionparent) && vsp > 0)
	    jumpstop = 0
	if (((place_meeting((x + 1), y, obj_collisionparent) && xscale == 1) || (place_meeting((x - 1), y, obj_collisionparent) && xscale == -1)) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
	    movespeed = 0
	if (xscale == 1 && move == -1)
	    movespeed = 0
	if (xscale == -1 && move == 1)
	    movespeed = 0
	if (key_attack && place_meeting(x, (y + 1), obj_collisionparent))
	{
	    image_index = 0
	    state = states.grab
	}
	if (key_attack && (!(place_meeting(x, (y + 1), obj_collisionparent))))
	{
	    scr_sound(sfx_woosh)
	    image_index = 0
	    state = states.player_throw
	}
	if (key_jump && (!(place_meeting(x, (y + 1), obj_collisionparent))))
	{
	    scr_sound(sfx_spin)
	    vsp = -11
	    state = states.slam
	    image_index = 0
	    image_speed = 0.35
	}
	if (move == 0 && place_meeting(x, (y + 1), obj_collisionparent))
	{
	    movespeed = 0
	    sprite_index = spr_player_grabbing
	}
	if (move != 0)
	{
	    if place_meeting(x, (y + 1), obj_collisionparent)
	        sprite_index = spr_player_grabbingmove
	    xscale = move
	}
	if (key_jump && place_meeting(x, (y + 1), obj_collisionparent) && (!key_down) && (!key_attack))
	{
	    scr_sound(sfx_jump)
	    vsp = -9
	    image_index = 0
	    sprite_index = spr_player_grabbingjump
	    audio_sound_gain(sfx_jump, 0.7, 0)
	    if (!audio_is_playing(sfx_jump))
	        audio_play_sound(sfx_jump, 1, false)
	}
	if (sprite_index == spr_player_grabbingjump && floor(image_index) == 2)
	    sprite_index = spr_player_grabbingfall
	if ((!(place_meeting(x, (y + 1), obj_collisionparent))) && vsp > 0)
	    sprite_index = spr_player_grabbingfall
	if (hsp != 0 && (!audio_is_playing(sfx_footsteps)) && place_meeting(x, (y + 1), obj_collisionparent))
	    scr_sound(sfx_footsteps)
	if (move != 0)
	{
	    if (movespeed < 6)
	        movespeed += 0.5
	    else if (movespeed == 6)
	        movespeed = 6
	}
	else
	    movespeed = 0
	if (move != 0 && place_meeting(x, (y + 1), obj_collisionparent))
	{
	    if (movespeed < 3 && move != 0)
	        image_speed = 0.35
	    else if (movespeed > 3 && movespeed < 6)
	        image_speed = 0.45
	    else
	        image_speed = 0.6
	}
	else
	    image_speed = 0.35
	if ((!instance_exists(obj_cloudeffect)) && (!(place_meeting(x, y, obj_water2))) && place_meeting(x, (y + 1), obj_collisionparent) && move != 0 && (floor(image_index) == 4 || floor(image_index) == 10))
	    instance_create(x, (y + 43), obj_cloudeffect)
	if (place_meeting(x, (y + 1), obj_collisionparent) && vsp > 1)
	    instance_create(x, y, obj_landcloud)
	scr_collideandmove()
}
