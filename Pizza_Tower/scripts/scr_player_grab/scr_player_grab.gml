function scr_player_grab()
{
	scr_getinput()
	combo = 0
	movespeed = 0
	mach2 = 0
	hsp = 0
	move = (key_left + key_right)
	if (throwforce < 20)
	    throwforce++
	if (throwforce >= 20)
	    image_speed = 0.35
	else
	    image_speed = 0
	if (throwforce >= 20)
	{
	    if (!audio_is_playing(sfx_superdash))
	        scr_sound(sfx_superdash)
	}
	if ((!key_attack) && sprite_index == spr_player_grab)
	{
	    scr_sound(sfx_woosh)
	    state = states.player_throw
	    image_index = 1
	    image_speed = 0.35
	}
	if ((!key_attack) && sprite_index == spr_player_punchprep)
	{
	    state = states.punch
	    image_index = 1
	    image_speed = 0.35
	}
	if ((!key_attack) && sprite_index == spr_player_backkickprep)
	{
	    state = states.backkick
	    image_index = 1
	    image_speed = 0.35
	}
	if (key_jump && throwforce < 20)
	{
	    scr_sound(sfx_spin)
	    vsp = -9
	    state = states.slam
	    image_index = 0
	    image_speed = 0.35
	}
	if (key_jump && throwforce >= 20)
	{
	    scr_sound(sfx_spin)
	    vsp = -13
	    state = states.slam
	    image_index = 0
	    image_speed = 0.35
	}
	if ((!key_attack) && sprite_index == spr_player_uppunchprep)
	{
	    state = states.uppunch
	    image_index = 1
	    image_speed = 0.35
	}
	if ((!key_attack) && throwforce < 20 && sprite_index == spr_player_shoulderprep)
	{
	    state = states.shoulder
	    image_index = 1
	    image_speed = 0.35
	}
	if ((!key_attack) && throwforce >= 20 && sprite_index == spr_player_shoulderprep)
	{
	    state = states.shoulder
	    image_index = 1
	    image_speed = 0.35
	    with (obj_baddie)
	    {
	        if point_in_rectangle(x, y, view_xview[0], view_yview[0], (view_xview[0] + view_wview[0]), (view_yview[0] + view_hview[0]))
	        {
	            vsp = -7
	            hsp = 0
	        }
	    }
	    with (obj_camera)
	    {
	        shake_mag = 10
	        shake_mag_acc = (30 / room_speed)
	    }
	}
	jumpAnim = 1
	dashAnim = 1
	landAnim = 0
	machslideAnim = 1
	moveAnim = 1
	stopAnim = 1
	crouchslideAnim = 1
	crouchAnim = 1
	if ((xscale == 1 && move == 1) || (xscale == -1 && move == -1))
	    sprite_index = spr_player_punchprep
	else if ((xscale == 1 && move == -1) || (xscale == -1 && move == 1))
	    sprite_index = spr_player_backkickprep
	else if key_up
	    sprite_index = spr_player_uppunchprep
	else if key_down
	    sprite_index = spr_player_shoulderprep
	else
	    sprite_index = spr_player_grab
	scr_collideandmove()
}
