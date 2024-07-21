function scr_player_knightpep()
{
	scr_getinput()
	if (place_meeting(x, (y + 1), obj_collisionparent) && (sprite_index == spr_knightpep_walk || sprite_index == spr_knightpep_idle))
	{
	    move = (key_left + key_right)
	    hsp = (move * movespeed)
	}
	else if place_meeting(x, (y + 1), obj_collisionparent)
	{
	    hsp = 0
	    move = 0
	}
	if (place_meeting((x + sign(hsp)), y, obj_collisionparent) && xscale == 1 && move == 1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
	    movespeed = 0
	if (place_meeting((x + sign(hsp)), y, obj_collisionparent) && xscale == -1 && move == -1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
	    movespeed = 0
	if ((sprite_index == spr_knightpep_idle || sprite_index == spr_knightpep_walk) && key_attack)
	{
	    scr_sound(sfx_swordswing)
	    instance_create(x, y, obj_swordhitbox)
	    instance_create((x + ((-xscale) * 10)), y, obj_slidecloud)
	    sprite_index = spr_knightpep_attack
	    image_index = 0
	    state = states.knightpepattack
	}
	if (place_meeting(x, (y + 1), obj_collisionparent) && xscale == 1 && move == -1)
	    movespeed = 0
	if (place_meeting(x, (y + 1), obj_collisionparent) && xscale == -1 && move == 1)
	    movespeed = 0
	if (place_meeting(x, (y + 1), obj_collisionparent) && move != 0 && sprite_index == spr_knightpep_idle)
	    sprite_index = spr_knightpep_walk
	else if (place_meeting(x, (y + 1), obj_collisionparent) && move == 0 && sprite_index == spr_knightpep_walk)
	    sprite_index = spr_knightpep_idle
	if (key_jump && place_meeting(x, (y + 1), obj_collisionparent) && (sprite_index == spr_knightpep_idle || sprite_index == spr_knightpep_walk))
	{
	    image_index = 0
	    sprite_index = spr_knightpep_jumpstart
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_knightpep_jumpstart)
	{
	    scr_sound(sfx_jump)
	    vsp = -7
	    if key_right
	        hsp = 4
	    if (-key_left)
	        hsp = -4
	    sprite_index = spr_knightpep_jump
	}
	if ((floor(image_index) == (image_number - 1) && sprite_index == spr_knightpep_jump) || ((!(place_meeting(x, (y + 1), obj_collisionparent))) && sprite_index != spr_knightpep_jump))
	    sprite_index = spr_knightpep_fall
	if (sprite_index == spr_knightpep_fall && place_meeting(x, (y + 1), obj_collisionparent))
	{
	    scr_sound(sfx_landmetal)
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
	    combo = 0
	    bounce = 0
	    image_index = 0
	    with (instance_create(x, (y + 35), obj_bangeffect))
	        image_xscale = obj_player.xscale
	    if (!(place_meeting(x, y, obj_water2)))
	        instance_create(x, y, obj_landcloud)
	    freefallstart = 0
	    audio_sound_gain(sfx_land, 0.7, 0)
	    if (!audio_is_playing(sfx_land))
	        audio_play_sound(sfx_land, 1, false)
	    instance_create(x, y, obj_landcloud)
	    sprite_index = spr_knightpep_land
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_knightpep_land)
	    sprite_index = spr_knightpep_idle
	if (move != 0)
	    xscale = move
	image_speed = 0.35
	if (place_meeting(x, (y + 1), obj_collisionparent) && hsp != 0 && (!audio_is_playing(sfx_land)))
	    scr_sound(sfx_land)
	if (move != 0)
	{
	    if (movespeed < 4)
	        movespeed += 0.1
	    else if (movespeed == 4)
	        movespeed = 4
	}
	else
	    movespeed = 0
	if (move != 0)
	{
	    if (movespeed < 1)
	        image_speed = 0.15
	    else if (movespeed > 1 && movespeed < 3)
	        image_speed = 0.35
	    else
	        image_speed = 0.6
	}
	else
	    image_speed = 0.35
	if (floor(image_index) == 9 && sprite_index == spr_knightpep_start)
	    instance_create(x, (y - 600), obj_thunder)
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_knightpep_thunder)
	    sprite_index = spr_knightpep_idle
	if ((!instance_exists(obj_cloudeffect)) && (!(place_meeting(x, y, obj_water2))) && place_meeting(x, (y + 1), obj_collisionparent) && move != 0 && (floor(image_index) == 4 || floor(image_index) == 10))
	    instance_create(x, (y + 43), obj_cloudeffect)
	scr_collideandmove()
}
