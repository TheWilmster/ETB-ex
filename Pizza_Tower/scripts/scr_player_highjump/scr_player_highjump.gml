function scr_player_highjump()
{
	scr_getinput()
	move = (key_left + key_right)
	hsp = (move * movespeed)
	if ((place_meeting((x + 1), y, obj_bumpable) && xscale == 1) || (place_meeting((x - 1), y, obj_bumpable) && xscale == -1))
	    movespeed = 0
	if (move == 0)
	    movespeed = 0
	if (move != 0 && movespeed < 5)
	    movespeed += 0.5
	if (xscale == 1 && move == -1)
	    movespeed = 0
	if (xscale == -1 && move == 1)
	    movespeed = 0
	if key_down2
	{
	    if (vsp < 0.5)
	        vsp /= 2
	    state = 12
	}
	landAnim = 1
	if ((!key_jump2) && jumpstop == 0 && vsp < 0)
	{
	    vsp /= 2
	    jumpstop = 1
	}
	if (ladderbuffer > 0)
	    ladderbuffer--
	if (place_meeting(x, (y - 1), obj_collisionparent) && jumpstop == 0 && jumpAnim == 1)
	{
	    vsp = grav
	    jumpstop = 1
	}
	if (place_meeting(x, (y + 1), obj_collisionparent) && vsp > 0)
	{
	    if key_attack
	        landAnim = 0
	    state = 0
	    jumpAnim = 1
	    jumpstop = 0
	    image_index = 0
	    if (!(place_meeting(x, y, obj_water2)))
	        instance_create(x, y, obj_landcloud)
	    freefallstart = 0
	    audio_sound_gain(sfx_land, 0.7, 0)
	    if (!audio_is_playing(sfx_land))
	        audio_play_sound(sfx_land, 1, false)
	}
	if (place_meeting(x, (y + 1), obj_collisionparent) && input_buffer_jump < 8 && (!key_down) && vsp > 0)
	{
	    vsp = -9
	    state = 36
	    jumpAnim = 1
	    jumpstop = 0
	    image_index = 0
	    if (!(place_meeting(x, y, obj_water2)))
	        instance_create(x, y, obj_landcloud)
	    freefallstart = 0
	    audio_sound_gain(sfx_jump, 0.7, 0)
	    if (!audio_is_playing(sfx_jump))
	        audio_play_sound(sfx_jump, 1, false)
	}
	if key_jump
	    input_buffer_jump = 0
	if (jumpAnim == 1)
	{
	    sprite_index = spr_player_Sjumpstart
	    if (floor(image_index) == 3)
	        jumpAnim = 0
	}
	if (jumpAnim == 0)
	    sprite_index = spr_player_Sjump
	if (move != 0)
	    xscale = move
	image_speed = 0.35
	scr_collideandmove()
}
