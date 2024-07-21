function scr_player_runonball()
{
	scr_getinput()
	move = (key_left + key_right)
	if (!key_attack)
	    hsp = (move * movespeed)
	else
	    hsp = (image_xscale * movespeed)
	jumpstop = 0
	vsp = obj_player.vsp
	if (!(place_meeting(x, (y + 1), obj_runonball)))
	{
	    mach2 = 0
	    state = 0
	    jumpAnim = 1
	    jumpstop = 0
	}
	if (key_jump && place_meeting(x, (y + 1), obj_collisionparent) && (!key_down) && (!key_attack))
	{
	    vsp = -7
	    state = states.jump
	    image_index = 0
	    machslideAnim = 1
	    jumpAnim = 1
	    audio_sound_gain(sfx_jump, 0.7, 0)
	    if (!audio_is_playing(sfx_jump))
	        audio_play_sound(sfx_jump, 1, false)
	}
	movespeed = 2.5
	sprite_index = spr_player_slipnslide
	if (key_attack && place_meeting(x, (y + 1), obj_collisionparent))
	{
	    if (mach2 < 35)
	    {
	        mach2++
	        movespeed = 4
	    }
	    if (mach2 >= 35)
	        movespeed = 6
	}
	if (!key_attack)
	    mach2 = 0
	image_speed = 0.35
	scr_collideandmove()
}
