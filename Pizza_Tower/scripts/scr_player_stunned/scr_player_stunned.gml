function scr_player_stunned()
{
	scr_getinput()
	hsp = 0
	combo = 0
	mach2 = 0
	bounce = 0
	jumpAnim = 1
	dashAnim = 1
	if place_meeting(x, (y + 1), obj_collisionparent)
	    landAnim = 0
	else
	    landAnim = 1
	jumpstop = 0
	machslideAnim = 1
	moveAnim = 1
	stopAnim = 1
	crouchslideAnim = 1
	crouchAnim = 0
	machhitAnim = 0
	movespeed = 0
	hurted = 1
	turning = 0
	if instance_exists(obj_hook)
	    obj_hook.hooked = 0
	alarm[5] = 2
	sprite_index = spr_player_stunned
	image_speed = 0.35
	if (floor(image_index) == 53)
	{
	    mask_index = spr_player_mask
	    state = 0
	    sprite_index = spr_player_idle
	    image_index = 0
	}
	audio_sound_gain(sfx_hurt, 0.7, 0)
	if (!audio_is_playing(sfx_hurt))
	    audio_play_sound(sfx_hurt, 1, false)
	scr_collideandmove()
}
