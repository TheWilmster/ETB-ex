function scr_player_hurt()
{
	scr_getinput()
	if (floor(image_index) == 0)
	    alarm[11] = 10
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
	if (place_meeting(x, (y + 1), obj_collisionparent) && hurtbounce == 2 && vsp > 0)
	{
	    start_running = 1
	    alarm[4] = 14
	    hsp = 0
	}
	if (place_meeting(x, (y + 1), obj_collisionparent) && hurtbounce == 1 && vsp > 0)
	{
	    hurtbounce = 2
	    vsp = -3
	}
	if (place_meeting(x, (y + 1), obj_collisionparent) && hurtbounce == 0 && vsp > 0)
	{
	    hurtbounce = 1
	    vsp = -5
	}
	if (floor(image_index) == 27)
	{
	    alarm[7] = 60
	    mask_index = spr_player_mask
	    state = 0
	    hurtbounce = 0
	}
	sprite_index = spr_player_hurt
	image_speed = 0.35
	scr_collideandmove()
}
