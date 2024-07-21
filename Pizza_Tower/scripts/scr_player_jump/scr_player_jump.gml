function scr_player_jump()
{
	scr_getinput()
	move = (key_left + key_right)
	if (momemtum == 0)
	    hsp = (move * movespeed)
	else
	    hsp = (xscale * movespeed)
	if (move == 0 && momemtum == 0)
	    movespeed = 0
	if (move != 0 && movespeed < 6)
	    movespeed += 0.5
	if ((place_meeting((x + 1), y, obj_collisionparent) && move == 1) || (place_meeting((x - 1), y, obj_collisionparent) && move == -1 && (!(place_meeting((x + sign(hsp)), y, obj_slope)))))
	    movespeed = 0
	if (xscale == 1 && move == -1)
	{
	    mach2 = 0
	    movespeed = 0
	    momemtum = 0
	}
	if (xscale == -1 && move == 1)
	{
	    mach2 = 0
	    momemtum = 0
	    movespeed = 0
	}
	if key_down2
	{
	    if (vsp < 0.5)
	        vsp /= 2
	    state = states.facestomp
	}
	landAnim = 1
	if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	{
	    vsp /= 2
	    jumpstop = 1
	}
	if (ladderbuffer > 0)
	    ladderbuffer--
	if (place_meeting(x, (y - 1), obj_collisionparent) && jumpstop == 0 && jumpAnim == 1)
	{
	    vsp = grav
	    jumpstop = 1
	}
	if (place_meeting(x, (y + 1), obj_collisionparent) && vsp > 0 && key_attack && momemtum == 1)
	{
	    landAnim = 0
	    state = states.mach1
	    jumpAnim = 1
	    jumpstop = 0
	    image_index = 0
	    if (!(place_meeting(x, y, obj_water2)))
	        instance_create(x, y, obj_landcloud)
	    freefallstart = 0
	    audio_sound_gain(sfx_land, 0.7, 0)
	    if (!audio_is_playing(sfx_land))
	        audio_play_sound(sfx_land, 1, false)
	}
	if (place_meeting(x, (y + 1), obj_collisionparent) && vsp > 0 && ((!key_attack) || momemtum == 0))
	{
	    if key_attack
	        landAnim = 0
	    state = 0
	    jumpAnim = 1
	    jumpstop = 0
	    image_index = 0
	    if (!(place_meeting(x, y, obj_water2)))
	        instance_create(x, y, obj_landcloud)
	    freefallstart = 0
	    audio_sound_gain(sfx_land, 0.7, 0)
	    if (!audio_is_playing(sfx_land))
	        audio_play_sound(sfx_land, 1, false)
	}
	if (place_meeting(x, (y + 1), obj_collisionparent) && input_buffer_jump < 8 && (!key_down) && vsp > 0)
	{
	    stompAnim = 0
	    vsp = -9
	    state = states.jump
	    jumpAnim = 1
	    jumpstop = 0
	    image_index = 0
	    if (!(place_meeting(x, y, obj_water2)))
	        instance_create(x, y, obj_landcloud)
	    freefallstart = 0
	    audio_play_sound(sfx_jump, 1, false)
	}
	if key_jump
	    input_buffer_jump = 0
	if (stompAnim == 0)
	{
	    if (jumpAnim == 1)
	    {
	        if (momemtum == 1)
	            sprite_index = spr_player_jump2
	        else
	            sprite_index = spr_player_jump
	        if (floor(image_index) == 8)
	            jumpAnim = 0
	    }
	    if (jumpAnim == 0)
	    {
	        if (momemtum == 1)
	            sprite_index = spr_player_fall2
	        else
	            sprite_index = spr_player_fall
	    }
	}
	if (stompAnim == 1)
	{
	    if (sprite_index == spr_player_stompprep && floor(image_index) == 4)
	        sprite_index = spr_player_stomp
	}
	if (move != 0)
	    xscale = move
	image_speed = 0.35
	scr_collideandmove()
}
