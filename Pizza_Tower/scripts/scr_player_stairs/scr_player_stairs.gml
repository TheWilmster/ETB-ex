function scr_player_stairs()
{
	scr_getinput()
	move = (key_right + key_left)
	jumpAnim = 1
	dashAnim = 1
	landAnim = 0
	machslideAnim = 1
	moveAnim = 1
	stopAnim = 1
	crouchslideAnim = 1
	crouchAnim = 0
	machhitAnim = 0
	turning = 0
	jumpstop = 0
	if (move == 1)
	{
	    vsp = -4
	    hsp = 4
	    image_speed = 0.6
	}
	else if (move == -1)
	{
	    vsp = 4
	    hsp = -4
	    image_speed = 0.6
	}
	else
	{
	    vsp = 0
	    hsp = 0
	}
	mach2 = 0
	jumpAnim = 1
	dashAnim = 1
	landAnim = 0
	machslideAnim = 1
	moveAnim = 1
	stopAnim = 1
	crouchslideAnim = 1
	crouchAnim = 1
	machhitAnim = 0
	if place_meeting(x, (y + 1), obj_stairsend)
	{
	    vsp = 10
	    jumpAnim = 0
	    landAnim = 0
	    state = 0
	    machslideAnim = 1
	    image_index = 0
	}
	start_running = 1
	alarm[4] = 14
	if (move == 0)
	    sprite_index = spr_player_stairs
	else if (move == 1)
	{
	    sprite_index = spr_player_climbstairs
	    audio_sound_gain(sfx_climbdown, 0.7, 0)
	    if (!audio_is_playing(sfx_climbdown))
	        audio_play_sound(sfx_climbdown, 1, false)
	}
	else if (move == -1)
	{
	    sprite_index = spr_player_climbstairs
	    audio_sound_gain(sfx_climb, 0.7, 0)
	    if (!audio_is_playing(sfx_climb))
	        audio_play_sound(sfx_climb, 1, false)
	}
	if (move != 0)
	    image_xscale = move
	scr_collideandmove()
}
