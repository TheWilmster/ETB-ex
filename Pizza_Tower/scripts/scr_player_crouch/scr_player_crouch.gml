function scr_player_crouch()
{
	scr_getinput()
	move = (key_left + key_right)
	hsp = (move * movespeed)
	mask_index = spr_crouchmask
	turning = 0
	if ((place_meeting((x + 1), y, obj_bumpable) && xscale == 1) || (place_meeting((x - 1), y, obj_bumpable) && xscale == -1))
	    movespeed = 0
	if (xscale == 1 && move == -1)
	    movespeed = 0
	if (xscale == -1 && move == 1)
	    movespeed = 0
	if ((!(place_meeting(x, (y + 1), obj_collisionparent))) && (!key_jump))
	{
	    jumpAnim = 0
	    state = states.crouchjump
	    movespeed = 4
	    crouchAnim = 1
	    image_index = 0
	}
	if (key_jump && place_meeting(x, (y + 1), obj_collisionparent) && (!(place_meeting(x, (y - 16), obj_collisionparent))) && (!(place_meeting(x, (y - 32), obj_collisionparent))))
	{
	    vsp = -9.2
	    state = states.crouchjump
	    movespeed = 4
	    image_index = 0
	    crouchAnim = 1
	    jumpAnim = 1
	    audio_sound_gain(sfx_jump, 0.7, 0)
	    if (!audio_is_playing(sfx_jump))
	        audio_play_sound(sfx_jump, 1, false)
	}
	if (place_meeting(x, (y + 1), obj_collisionparent) && (!key_down) && (!(place_meeting(x, (y - 16), obj_collisionparent))) && (!(place_meeting(x, (y - 32), obj_collisionparent))) && (!key_jump))
	{
	    state = 0
	    movespeed = 0
	    crouchAnim = 1
	    jumpAnim = 1
	    image_index = 0
	    mask_index = spr_player_mask
	}
	if (movespeed < 4)
	    movespeed += 0.5
	else if (movespeed >= 4)
	    movespeed = 4
	if (crouchAnim == 0)
	{
	    if (move == 0)
	        sprite_index = spr_player_crouch
	    if (move != 0)
	        sprite_index = spr_player_crawl
	}
	if (crouchAnim == 1)
	{
	    sprite_index = spr_player_couchstart
	    if (floor(image_index) == 2)
	        crouchAnim = 0
	}
	if (move != 0)
	{
	    xscale = move
	    crouchAnim = 0
	}
	image_speed = 0.6
	scr_collideandmove()
}
