function scr_player_mach4()
{
	scr_getinput()
	if (windingAnim < 200)
	    windingAnim += 5
	hsp = (image_xscale * movespeed)
	machslideAnim = 1
	move = (key_right + key_left)
	movespeed = 20
	crouchslideAnim = 1
	if (input_buffer_jump < 5 && place_meeting(x, (y + 1), obj_collisionparent) && (!((move == 1 && image_xscale == -1))) && (!((move == -1 && image_xscale == 1))))
	    vsp = -6
	if key_jump
	    input_buffer_jump = 0
	if ((!key_attack) && place_meeting(x, (y + 1), obj_collisionparent))
	{
	    flash = 0
	    state = states.machslide
	    image_index = 0
	    mach2 = 35
	}
	if (move == -1 && image_xscale == 1 && place_meeting(x, (y + 1), obj_collisionparent))
	{
	    flash = 0
	    state = states.machslide
	    image_index = 0
	    mach2 = 35
	}
	if (move == 1 && image_xscale == -1 && place_meeting(x, (y + 1), obj_collisionparent))
	{
	    flash = 0
	    state = states.machslide
	    image_index = 0
	    mach2 = 35
	}
	if (key_down && place_meeting(x, (y + 1), obj_collisionparent))
	{
	    instance_create(x, y, obj_jumpdust)
	    flash = 0
	    state = states.machroll
	}
	if key_up
	{
	    vsp = -4
	    instance_create(x, y, obj_machsuperjump1)
	    instance_create(x, y, obj_machsuperjump2)
	    state = states.Sjumpprep
	    hsp = 0
	    image_index = 0
	    flash = 1
	}
	if (place_meeting((x + 1), y, obj_bumpable) && image_xscale == 1)
	{
	    with (obj_camera)
	    {
	        shake_mag = 20
	        shake_mag_acc = (40 / room_speed)
	    }
	    hsp = 0
	    image_speed = 0.35
	    with (obj_baddie)
	    {
	        if point_in_rectangle(x, y, view_xview[0], view_yview[0], (view_xview[0] + view_wview[0]), (view_yview[0] + view_hview[0]))
	        {
	            stun = 1
	            alarm[0] = 200
	            ministun = 0
	            vsp = -5
	            hsp = 0
	            image_xscale *= -1
	        }
	    }
	    flash = 0
	    combo = 0
	    state = states.bump
	    hsp = -2.5
	    vsp = -2.5
	    mach2 = 0
	    image_index = 0
	    instance_create((x + 10), (y + 10), obj_bumpeffect)
	    audio_sound_gain(sfx_bump, 0.7, 0)
	    if (!audio_is_playing(sfx_bump))
	        audio_play_sound(sfx_bump, 1, false)
	}
	if (place_meeting((x - 1), y, obj_bumpable) && image_xscale == -1)
	{
	    with (obj_camera)
	    {
	        shake_mag = 20
	        shake_mag_acc = (40 / room_speed)
	    }
	    hsp = 0
	    image_speed = 0.35
	    flash = 0
	    combo = 0
	    state = states.bump
	    hsp = 2.5
	    vsp = -2.5
	    mach2 = 0
	    image_index = 0
	    instance_create((x - 10), (y + 10), obj_bumpeffect)
	    audio_sound_gain(sfx_bump, 0.7, 0)
	    if (!audio_is_playing(sfx_bump))
	        audio_play_sound(sfx_bump, 1, false)
	}
	if (key_down2 && (!(place_meeting(x, (y + 1), obj_collisionparent))))
	{
	    vsp = -4
	    state = states.freefallprep
	    hsp = 0
	    image_index = 0
	}
	if place_meeting(x, (y + 1), obj_onewaywatersolid)
	{
	    instance_create((x - (image_xscale * 30)), (y + 40), obj_waterdrop)
	    instance_create((x - (image_xscale * 30)), (y + 40), obj_waterdrop)
	    instance_create((x - (image_xscale * 30)), (y + 40), obj_waterdrop)
	    instance_create((x - (image_xscale * 30)), (y + 40), obj_waterdrop)
	}
	audio_sound_gain(sfx_mach2, 0.7, 0)
	if (!audio_is_playing(sfx_mach2))
	    audio_play_sound(sfx_mach2, 1, false)
	sprite_index = spr_player_mach4
	if (floor(image_index) == 0)
	    flash = 1
	else
	    flash = 0
	if (floor(image_index) == 0)
	    instance_create(x, y, obj_mach3effect)
	if ((!instance_exists(obj_dashcloud)) && place_meeting(x, (y + 1), obj_collisionparent) && (!(place_meeting(x, (y + 1), obj_water))))
	    instance_create(x, y, obj_dashcloud)
	image_speed = 0.35
	scr_collideandmove()
}
