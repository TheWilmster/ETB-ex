function scr_player_chainsaw()
{
	scr_getinput()
	landAnim = 0
	hsp = (xscale * movespeed)
	machslideAnim = 1
	move2 = (key_right2 + key_left2)
	move = (key_right + key_left)
	if (obj_chainsawhitbox.bumpeffect == 0)
	{
	    if (movespeed <= 13 && movespeed > 0 && (sprite_index == spr_player_chainsaw || sprite_index == spr_player_chainsawstart))
	        movespeed -= 0.2
	    else if (movespeed <= 13 && movespeed > 0)
	        movespeed -= 0.4
	}
	else if (obj_chainsawhitbox.bumpeffect == 1)
	{
	    hsp = (xscale * movespeed)
	    if (movespeed > 0)
	        movespeed -= 0.2
	}
	crouchslideAnim = 1
	if (movespeed < 4 && place_meeting(x, (y + 1), obj_collisionparent) && (!key_chainsaw))
	{
	    state = 0
	    image_index = 0
	}
	if (key_down && place_meeting(x, (y + 1), obj_collisionparent) && movespeed > 0)
	{
	    machhitAnim = 0
	    state = states.crouchslide
	}
	audio_sound_gain(sfx_mach2, 0.7, 0)
	if (!audio_is_playing(sfx_mach2))
	    audio_play_sound(sfx_mach2, 1, false)
	if (sprite_index == spr_player_chainsawstart && floor(image_index) == 1 && movespeed > 8)
	    sprite_index = spr_player_chainsaw
	else if (movespeed <= 8 || (!key_chainsaw))
	    sprite_index = spr_player_chainsawend
	if (sprite_index == spr_player_chainsaw)
	{
	    if ((!instance_exists(obj_dashcloud)) && place_meeting(x, (y + 1), obj_collisionparent))
	        instance_create(x, y, obj_dashcloud)
	}
	else if (sprite_index == spr_player_chainsawend)
	{
	    if ((!instance_exists(obj_slidecloud)) && place_meeting(x, (y + 1), obj_collisionparent) && movespeed > 5)
	        instance_create(x, y, obj_slidecloud)
	}
	image_speed = 0.6
	scr_collideandmove()
}
