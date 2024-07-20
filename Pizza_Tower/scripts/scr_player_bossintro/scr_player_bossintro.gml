function scr_player_bossintro()
{
	scr_getinput()
	landAnim = 0
	if (sprite_index == spr_player_idle)
	    image_index = 0
	if (image_index == 0 && sprite_index == spr_player_bossintro && (!audio_is_playing(va_hurt3)))
	    scr_sound(va_hurt3)
	xscale = 1
	if (sprite_index == spr_player_bossintro && floor(image_index) == (image_number - 1))
	{
	    state = 0
	    image_index = 0
	}
	image_speed = 0.35
	scr_collideandmove()
}
