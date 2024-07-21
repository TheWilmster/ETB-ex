function scr_player_freefallprep()
{
	scr_getinput()
	start_running = 1
	alarm[4] = 14
	jumpAnim = 1
	dashAnim = 1
	landAnim = 0
	machslideAnim = 1
	moveAnim = 1
	stopAnim = 1
	crouchslideAnim = 1
	crouchAnim = 1
	if (floor(image_index) == 5)
	    state = states.mach2
	sprite_index = spr_player_mach2jump
	image_speed = 0.35
	instance_create(x, y, obj_mach3effect)
	scr_collideandmove()
}
