function scr_player_boulder()
{
	scr_getinput()
	landAnim = 1
	movespeed = 4
	mach2 = 0
	sprite_index = spr_player_slipnslide
	image_speed = 0.35
	scr_collideandmoveonlywall()
}
