function scr_player_superslam()
{
	scr_getinput()
	movespeed = 0
	mach2 = 0
	hsp = 0
	if (place_meeting(x, (y + 1), obj_bumpable) && (!(place_meeting(x, (y + 1), obj_destructibles))))
	{
	    scr_sound(sfx_superimpact)
	    state = states.freefallland
	    jumpAnim = 1
	    jumpstop = 0
	    image_index = 0
	    with (obj_camera)
	    {
	        shake_mag = 20
	        shake_mag_acc = (40 / room_speed)
	    }
	    hsp = 0
	    image_speed = 0.35
	    bounce = 0
	    with (instance_create(x, (y + 35), obj_bangeffect))
	        xscale = obj_player.xscale
	    instance_create(x, y, obj_landcloud)
	    freefallstart = 0
	    audio_sound_gain(sfx_land, 0.7, 0)
	    if (!audio_is_playing(sfx_land))
	        audio_play_sound(sfx_land, 1, false)
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
	}
	jumpAnim = 1
	dashAnim = 1
	landAnim = 0
	machslideAnim = 1
	moveAnim = 1
	stopAnim = 1
	crouchslideAnim = 1
	crouchAnim = 1
	if (!instance_exists(obj_superslameffect))
	    instance_create(x, y, obj_superslameffect)
	sprite_index = spr_player_freefall
	scr_collideandmove()
}
