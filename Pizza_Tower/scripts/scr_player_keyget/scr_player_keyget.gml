function scr_player_keyget()
{
	scr_getinput()
	hsp = 0
	if (image_index == 0)
	    audio_pause_all()
	image_speed = 0.35
	if ((!audio_is_playing(va_happy1)) && (!audio_is_playing(va_happy2)) && (!audio_is_playing(va_happy3)) && floor(image_index) == 17)
	    scr_sound(va_happy1, va_happy2, va_happy3)
	movespeed = 0
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
	if (!audio_is_playing(key_obtained))
	    audio_play_sound(key_obtained, 1, false)
	sprite_index = spr_player_keyget
	if (floor(image_index) == 47)
	{
	    audio_resume_all()
	    state = 0
	    image_index = 0
	}
	scr_collideandmove()
}
