function scr_player_bossdefeat()
{
	scr_getinput()
	if (a != 255)
	    a += 1
	image_blend = make_color_rgb(a, a, a)
	obj_camera.visible = false
	sprite_index = spr_player_bossdefeat
	scr_collideandmove()
}
