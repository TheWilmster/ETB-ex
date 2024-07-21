function scr_player_mach3()
{
	scr_getinput()
	if (windingAnim < 200)
	    windingAnim++
	hsp = (xscale * movespeed)
	mach2 = 100
	machslideAnim = 1
	move = (key_right + key_left)
	movespeed = 14
	crouchslideAnim = 1
	if (key_down && place_meeting(x, (y + 1), obj_collisionparent))
	{
	    machhitAnim = 0
	    state = states.crouchslide
	}
	if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	{
	    vsp /= 2
	    jumpstop = 1
	}
	if (place_meeting(x, (y + 1), obj_collisionparent) && vsp > 0)
	    jumpstop = 0
	if (input_buffer_jump < 8 && place_meeting(x, (y + 1), obj_collisionparent) && (!((move == 1 && xscale == -1))) && (!((move == -1 && xscale == 1))) && key_attack)
	    vsp = -9
	if key_jump
	    input_buffer_jump = 0
	if key_up
	{
	    audio_play_sound(sfx_supermove, 1, false)
	    vsp = -4
	    sprite_index = spr_player_superjumpprep
	    instance_create(x, y, obj_machsuperjump1)
	    instance_create(x, y, obj_machsuperjump2)
	    state = states.Sjumpprep
	    hsp = 0
	    image_index = 0
	    flash = 1
	}
	if ((!key_attack) && place_meeting(x, (y + 1), obj_collisionparent))
	{
	    flash = 0
	    state = states.machslide
	    image_index = 0
	    mach2 = 35
	}
	if (move == -1 && xscale == 1 && place_meeting(x, (y + 1), obj_collisionparent))
	{
	    scr_sound(sfx_slide)
	    flash = 0
	    state = states.machslide
	    image_index = 0
	    mach2 = 35
	}
	if (move == 1 && xscale == -1 && place_meeting(x, (y + 1), obj_collisionparent))
	{
	    scr_sound(sfx_slide)
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
	if (place_meeting((x + 1), y, obj_bumpable) && xscale == 1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
	{
	    state = states.bump
	    scr_sound(sfx_superimpact)
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
	            image_index = 0
	            state = 81
	            vsp = -7
	            hsp = 0
	            stunned = 200
	        }
	    }
	    flash = 0
	    combo = 0
	    hsp = -2.5
	    vsp = -3
	    mach2 = 0
	    image_index = 0
	    instance_create((x + 10), (y + 10), obj_bumpeffect)
	    audio_sound_gain(sfx_bump, 0.7, 0)
	    if (!audio_is_playing(sfx_bump))
	        audio_play_sound(sfx_bump, 1, false)
	}
	if (place_meeting((x - 1), y, obj_bumpable) && xscale == -1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
	{
	    state = states.bump
	    scr_sound(sfx_superimpact)
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
	    vsp = -3
	    mach2 = 0
	    image_index = 0
	    instance_create((x - 10), (y + 10), obj_bumpeffect)
	    audio_sound_gain(sfx_bump, 0.7, 0)
	    if (!audio_is_playing(sfx_bump))
	        audio_play_sound(sfx_bump, 1, false)
	}
	if place_meeting(x, (y + 1), obj_onewaywatersolid)
	{
	    instance_create((x - (xscale * 30)), (y + 40), obj_waterdrop)
	    instance_create((x - (xscale * 30)), (y + 40), obj_waterdrop)
	    instance_create((x - (xscale * 30)), (y + 40), obj_waterdrop)
	    instance_create((x - (xscale * 30)), (y + 40), obj_waterdrop)
	}
	audio_sound_gain(sfx_mach2, 0.7, 0)
	if (!audio_is_playing(sfx_mach2))
	    audio_play_sound(sfx_mach2, 2, false)
	if (!audio_is_playing(sfx_woop))
	    audio_play_sound(sfx_woop, 1, false)
	sprite_index = spr_player_mach4
	if (!instance_exists(obj_chargeeffect))
	    instance_create(x, y, obj_chargeeffect)
	if ((!instance_exists(obj_dashcloud)) && place_meeting(x, (y + 1), obj_collisionparent) && (!(place_meeting(x, (y + 1), obj_water))))
	    instance_create(x, y, obj_dashcloud)
	image_speed = 0.6
	scr_collideandmove()
}
