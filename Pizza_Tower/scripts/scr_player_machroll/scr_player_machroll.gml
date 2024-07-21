function scr_player_machroll()
{
	scr_getinput()
	hsp = (xscale * movespeed)
	mach2 = 100
	machslideAnim = 1
	move = (key_right + key_left)
	movespeed = 12
	if (((!key_down) && (!(place_meeting((x + 27), (y - 32), obj_collisionparent))) && (!(place_meeting((x - 27), (y - 32), obj_collisionparent))) && (!(place_meeting(x, (y - 32), obj_collisionparent))) && (!(place_meeting(x, (y - 16), obj_collisionparent))) && key_attack) || (!(place_meeting(x, (y + 1), obj_collisionparent))))
	{
	    machhitAnim = 1
	    state = states.mach2
	}
	if (place_meeting((x + 1), y, obj_bumpable) && xscale == 1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
	{
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
	if place_meeting(x, (y + 1), obj_collisionparent)
	    sprite_index = spr_player_machroll
	if (floor(image_index) == 0)
	    flash = 1
	else
	    flash = 0
	if (!audio_is_playing(sfx_roll))
	    audio_play_sound(sfx_roll, 1, false)
	if ((!instance_exists(obj_cloudeffect)) && place_meeting(x, (y + 1), obj_collisionparent) && (!(place_meeting(x, (y + 1), obj_water))))
	    instance_create(x, (y + 43), obj_cloudeffect)
	image_speed = 0.6
	scr_collideandmove()
}
