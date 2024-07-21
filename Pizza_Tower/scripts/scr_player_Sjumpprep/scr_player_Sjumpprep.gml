function scr_player_Sjumpprep()
{
	scr_getinput()
	combo = 0
	movespeed = 4
	mach2 = 0
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
	if (floor(image_index) == 6)
	{
	    audio_play_sound(sfx_plane, 1, false)
	    state = states.Sjump
	    vsp = -15
	}
	sprite_index = spr_player_superjumpprep
	image_speed = 0.35
	scr_collideandmove()
}
