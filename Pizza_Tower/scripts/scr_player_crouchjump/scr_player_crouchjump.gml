function scr_player_crouchjump()
{
	scr_getinput()
	move = (key_left + key_right)
	mask_index = spr_crouchmask
	hsp = (move * movespeed)
	if (xscale == 1 && move == -1)
	    movespeed = 0
	if (xscale == -1 && move == 1)
	    movespeed = 0
	if (movespeed < 4)
	    movespeed += 0.5
	else if (movespeed >= 4)
	    movespeed = 4
	if ((!key_jump2) && jumpstop == 0 && jumpAnim == 1)
	{
	    vsp /= 2
	    jumpstop = 1
	}
	if (place_meeting(x, (y - 1), obj_collisionparent) && jumpstop == 0 && jumpAnim == 1)
	{
	    vsp = grav
	    jumpstop = 1
	}
	if (place_meeting(x, (y + 1), obj_collisionparent) && key_down)
	{
	    state = states.crouch
	    jumpAnim = 1
	    crouchAnim = 1
	    image_index = 0
	    jumpstop = 0
	    if (!(place_meeting(x, y, obj_water2)))
	        instance_create(x, y, obj_landcloud)
	    audio_sound_gain(sfx_land, 0.7, 0)
	    if (!audio_is_playing(sfx_land))
	        audio_play_sound(sfx_land, 1, false)
	}
	if (place_meeting(x, (y + 1), obj_collisionparent) && (!key_down) && (!(place_meeting(x, (y - 16), obj_collisionparent))))
	{
	    state = 0
	    jumpAnim = 1
	    landAnim = 1
	    crouchAnim = 1
	    image_index = 0
	    jumpstop = 0
	    if (!(place_meeting(x, y, obj_water2)))
	        instance_create(x, y, obj_landcloud)
	    mask_index = spr_player_mask
	}
	if place_meeting(x, (y + 1), obj_collisionparent)
	{
	    state = states.crouch
	    jumpAnim = 1
	    crouchAnim = 1
	    image_index = 0
	    jumpstop = 0
	    if (!(place_meeting(x, y, obj_water2)))
	        instance_create(x, y, obj_landcloud)
	    audio_sound_gain(sfx_land, 0.7, 0)
	    if (!audio_is_playing(sfx_land))
	        audio_play_sound(sfx_land, 1, false)
	}
	if (jumpAnim == 1)
	{
	    sprite_index = spr_player_crouchjump
	    if (floor(image_index) == 8)
	        jumpAnim = 0
	}
	if (jumpAnim == 0)
	    sprite_index = spr_player_crouchfall
	if (move != 0)
	    xscale = move
	image_speed = 0.35
	scr_collideandmove()
}
