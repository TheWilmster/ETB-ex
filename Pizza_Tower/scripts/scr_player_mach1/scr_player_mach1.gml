function scr_player_mach1()
{
	scr_getinput()
	move = (key_left + key_right)
	landAnim = 0
	if (place_meeting((x + 1), y, obj_collisionparent) && xscale == 1 && (!(place_meeting((x + 1), y, obj_slope))))
	{
	    mach2 = 0
	    state = 0
	    movespeed = 0
	}
	if (place_meeting((x - 1), y, obj_collisionparent) && xscale == -1 && (!(place_meeting((x - 1), y, obj_slope))))
	{
	    mach2 = 0
	    state = 0
	    movespeed = 0
	}
	if (movespeed <= 8)
	    movespeed += 0.2
	machhitAnim = 0
	crouchslideAnim = 1
	hsp = floor((xscale * movespeed))
	if (place_meeting(x, (y + 1), obj_collisionparent) && xscale == 1 && move == -1)
	{
	    momemtum = 0
	    mach2 = 0
	    movespeed = 0
	    image_index = 0
	    xscale = -1
	}
	if (place_meeting(x, (y + 1), obj_collisionparent) && xscale == -1 && move == 1)
	{
	    momemtum = 0
	    mach2 = 0
	    movespeed = 0
	    image_index = 0
	    xscale = 1
	}
	if (key_jump && place_meeting(x, (y + 1), obj_collisionparent) && key_attack)
	{
	    momemtum = 1
	    vsp = -9
	    state = states.jump
	    jumpAnim = 1
	    image_index = 0
	}
	if place_meeting(x, (y + 1), obj_collisionparent)
	{
	    if (mach2 < 35)
	        mach2++
	    if (mach2 >= 35)
	    {
	        state = states.mach2
	        instance_create(x, y, obj_jumpdust)
	    }
	}
	if (!(place_meeting(x, (y + 1), obj_collisionparent)))
	{
	    momemtum = 1
	    state = states.jump
	    jumpAnim = 0
	    image_index = 0
	}
	if ((!key_attack) && place_meeting(x, (y + 1), obj_collisionparent))
	{
	    state = 0
	    image_index = 0
	    mach2 = 0
	    machslideAnim = 1
	}
	if key_down
	{
	    scr_sound(sfx_slide)
	    state = states.crouchslide
	    mach2 = 0
	}
	audio_sound_gain(sfx_mach1, 0.7, 0)
	if (!audio_is_playing(sfx_mach1))
	    audio_play_sound(sfx_mach1, 1, false)
	if (momemtum == 0)
	    sprite_index = spr_player_mach1
	else
	    sprite_index = spr_player_running
	if (movespeed < 4)
	    image_speed = 0.35
	else if (movespeed > 4 && movespeed < 8)
	    image_speed = 0.45
	else
	    image_speed = 0.6
	if ((!instance_exists(obj_dashcloud)) && (!(place_meeting(x, y, obj_water2))) && place_meeting(x, (y + 1), obj_collisionparent))
	    instance_create(x, y, obj_dashcloud)
	scr_collideandmove()
}
