function scr_player_Sjump()
{
	scr_getinput()
	mach2 = 0
	jumpAnim = 1
	dashAnim = 1
	landAnim = 0
	machslideAnim = 1
	moveAnim = 1
	stopAnim = 1
	crouchslideAnim = 1
	crouchAnim = 0
	machhitAnim = 0
	movespeed = 0
	vsp--
	if key_attack2
	{
	    image_index = 0
	    sprite_index = spr_player_mach2jump
	    instance_create(x, y, obj_machsuperjump1)
	    instance_create(x, y, obj_machsuperjump2)
	    state = states.freefallprep
	    vsp = -4
	    mach2 = 35
	}
	if (place_meeting(x, (y - 1), obj_collisionparent) && (!(place_meeting(x, (y - 1), obj_destructibles))))
	{
	    with (obj_camera)
	    {
	        shake_mag = 10
	        shake_mag_acc = (30 / room_speed)
	    }
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
	    combo = 0
	    state = states.Sjumpland
	    image_index = 0
	    machhitAnim = 0
	    with (instance_create(x, y, obj_bangeffect))
	        xscale = obj_player.xscale
	    audio_sound_gain(sfx_freefallland, 0.7, 0)
	    if (!audio_is_playing(sfx_freefallland))
	        audio_play_sound(sfx_freefallland, 1, false)
	}
	sprite_index = spr_player_superjump
	image_speed = 0.5
	scr_collideandmoveonlywall()
}
