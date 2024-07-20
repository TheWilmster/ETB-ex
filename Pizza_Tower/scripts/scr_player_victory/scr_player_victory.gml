function scr_player_victory()
{
	scr_getinput()
	hsp = 0
	if ((!audio_is_playing(va_happy1)) && (!audio_is_playing(va_happy2)) && (!audio_is_playing(va_happy3)) && floor(image_index) == 17)
	    scr_sound(va_happy1, va_happy2, va_happy3)
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
	sprite_index = spr_player_victory
	if (floor(image_index) == 37)
	    image_speed = 0
	else
	    image_speed = 0.35
	scr_collideandmove()
}
