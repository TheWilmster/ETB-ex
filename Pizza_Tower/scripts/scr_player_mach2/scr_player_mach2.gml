function scr_player_mach2()
{
	scr_getinput()
	if (windingAnim < 200)
	    windingAnim++
	hsp = (xscale * movespeed)
	machslideAnim = 1
	move2 = (key_right2 + key_left2)
	move = (key_right + key_left)
	movespeed = 10
	crouchslideAnim = 1
	if ((!(place_meeting(x, (y + 1), obj_collisionparent))) && vsp > 0)
	{
	    machfreefall++
	    if (machfreefall > 30)
	        state = states.machfreefall
	}
	else
	    machfreefall = 0
	if (!(place_meeting(x, (y + 1), obj_collisionparent)))
	{
	    if (move == -1 && xscale == 1)
	        movespeed = 8
	    if (move == 1 && xscale == -1)
	        movespeed = 8
	}
	if place_meeting(x, (y + 1), obj_collisionparent)
	{
	    if (mach2 < 100)
	        mach2++
	    if (mach2 >= 100)
	    {
	        machhitAnim = 0
	        state = states.mach3
	        flash = 1
	        sprite_index = spr_player_mach4
	        instance_create(x, y, obj_jumpdust)
	        instance_create(x, y, obj_mach3effect1)
	        instance_create(x, y, obj_mach3effect2)
	        movespeed = 8
	    }
	}
	if key_jump
	    input_buffer_jump = 0
	if ((!key_attack) && place_meeting(x, (y + 1), obj_collisionparent))
	{
	    scr_sound(sfx_slide)
	    state = states.machslide
	    image_index = 0
	    mach2 = 35
	}
	if (move == -1 && xscale == 1 && place_meeting(x, (y + 1), obj_collisionparent))
	{
	    scr_sound(sfx_slide)
	    state = states.machslide
	    image_index = 0
	    mach2 = 35
	}
	if (move == 1 && xscale == -1 && place_meeting(x, (y + 1), obj_collisionparent))
	{
	    scr_sound(sfx_slide)
	    state = states.machslide
	    image_index = 0
	    mach2 = 35
	}
	if (key_down && place_meeting(x, (y + 1), obj_collisionparent))
	{
	    scr_sound(sfx_slide)
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
	if (place_meeting((x + 1), y, obj_bumpable) && xscale == 1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
	{
	    machhitAnim = 0
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
	else if (place_meeting((x - 1), y, obj_bumpable) && xscale == -1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
	{
	    machhitAnim = 0
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
	if place_meeting(x, (y + 1), obj_collisionparent)
	{
	    audio_sound_gain(sfx_mach2, 0.7, 0)
	    if (!audio_is_playing(sfx_mach2))
	        audio_play_sound(sfx_mach2, 1, false)
	}
	else if (!audio_is_playing(sfx_spin))
	    audio_play_sound(sfx_spin, 1, false)
	if place_meeting(x, (y + 1), obj_collisionparent)
	{
	    if (machpunchAnim == 0)
	    {
	        if (machhitAnim == 0)
	            sprite_index = spr_player_mach
	        if (machhitAnim == 1)
	            sprite_index = spr_player_machhit
	    }
	    if (machpunchAnim == 1)
	    {
	        if (punch == 0)
	            sprite_index = spr_player_machpunch1
	        if (punch == 1)
	            sprite_index = spr_player_machpunch2
	        if (floor(image_index) == 4 && sprite_index == spr_player_machpunch1)
	        {
	            punch = 1
	            machpunchAnim = 0
	        }
	        if (floor(image_index) == 4 && sprite_index == spr_player_machpunch2)
	        {
	            punch = 0
	            machpunchAnim = 0
	        }
	    }
	}
	else
	    sprite_index = spr_player_mach2jump
	if (!(place_meeting(x, (y + 1), obj_collisionparent)))
	    machpunchAnim = 0
	if ((!instance_exists(obj_dashcloud)) && place_meeting(x, (y + 1), obj_collisionparent) && (!(place_meeting(x, (y + 1), obj_water))))
	    instance_create(x, y, obj_dashcloud)
	image_speed = 0.6
	scr_collideandmove()
}
