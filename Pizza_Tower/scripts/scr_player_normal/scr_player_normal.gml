function scr_player_normal()
{
	scr_getinput()
	move = (key_left + key_right)
	hsp = (move * movespeed)
	if (key_attack && place_meeting(x, (y + 1), obj_collisionparent) && (!((place_meeting((x + 1), y, obj_collisionparent) && xscale == 1 && (!(place_meeting((x + xscale), y, obj_slope)))))) && (!((place_meeting((x - 1), y, obj_collisionparent) && xscale == -1 && (!(place_meeting((x + xscale), y, obj_slope)))))))
	{
	    jumpAnim = 1
	    state = states.mach1
	    movespeed = 0
	    image_index = 0
	}
	if (place_meeting((x + sign(hsp)), y, obj_collisionparent) && xscale == 1 && move == 1 && (!(place_meeting((x + 1), y, obj_slope))))
	    movespeed = 0
	if (place_meeting((x + sign(hsp)), y, obj_collisionparent) && xscale == -1 && move == -1 && (!(place_meeting((x - 1), y, obj_slope))))
	    movespeed = 0
	jumpstop = 0
	if (place_meeting(x, (y + 1), obj_collisionparent) && xscale == 1 && move == -1)
	{
	    machslideAnim = 1
	    landAnim = 0
	    image_index = 0
	    movespeed = 0
	}
	if (place_meeting(x, (y + 1), obj_collisionparent) && xscale == -1 && move == 1)
	{
	    machslideAnim = 1
	    landAnim = 0
	    image_index = 0
	    movespeed = 0
	}
	if ((!(place_meeting(x, (y + 1), obj_collisionparent))) && (!key_jump))
	{
	    jumpAnim = 0
	    state = states.jump
	    machslideAnim = 1
	    image_index = 0
	}
	if (key_jump && place_meeting(x, (y + 1), obj_collisionparent) && key_up && (!key_down) && (!key_attack) && move == 0)
	{
	    vsp = -12
	    state = states.highjump
	    image_index = 0
	    machslideAnim = 1
	    jumpAnim = 1
	    audio_play_sound(sfx_jump, 1, false)
	}
	if (key_jump && place_meeting(x, (y + 1), obj_collisionparent) && (!key_down) && sprite_index != spr_player_Sjumpprep && input_buffer_jump >= 8)
	{
	    vsp = -9
	    state = states.jump
	    image_index = 0
	    machslideAnim = 1
	    jumpAnim = 1
	    audio_play_sound(sfx_jump, 1, false)
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
	if ((key_down && place_meeting(x, (y + 1), obj_collisionparent)) || place_meeting(x, (y - 3), obj_collisionparent))
	{
	    state = states.crouch
	    machslideAnim = 1
	    landAnim = 0
	    crouchAnim = 1
	    image_index = 0
	    idle = 0
	}
	if (move != 0)
	{
	    if (movespeed < 6 && sprite_index != spr_player_running)
	        movespeed += 0.5
	    else if (floor(movespeed) == 5 && sprite_index != spr_player_running)
	        movespeed = 6
	    else if (movespeed < 8 && sprite_index == spr_player_running)
	        movespeed += 0.2
	    else if (floor(movespeed) == 8 && sprite_index == spr_player_running)
	        movespeed = 9
	}
	else
	    movespeed = 0
	if (movespeed > 6)
	    movespeed -= 0.1
	if (key_up && move == 0 && sprite_index != spr_player_Sjumpprep)
	    image_index = 0
	if (key_up && move == 0)
	{
	    landAnim = 0
	    sprite_index = spr_player_Sjumpprep
	    if (floor(image_index) == 5)
	        image_speed = 0
	}
	if (!((key_up && move == 0)))
	{
	    if (machslideAnim == 1 && landAnim == 0)
	    {
	        if (move == 0)
	        {
	            if (idle < 400)
	                idle++
	            if (idle >= 300 && floor(image_index) == (image_number - 1))
	            {
	                idle = 0
	                image_index = 0
	            }
	            if (idle >= 300 && sprite_index != spr_player_idlefrown && sprite_index != spr_player_idledance && sprite_index != spr_player_idlevomit && sprite_index != spr_player_idlevomitblood)
	            {
	                randomize()
	                idleanim = random_range(0, 100)
	                if (idleanim < 40)
	                    sprite_index = spr_player_idlefrown
	                if (idleanim < 80 && idleanim >= 40)
	                    sprite_index = spr_player_idledance
	                if (idleanim < 99 && idleanim >= 80)
	                    sprite_index = spr_player_idlevomit
	                if (idleanim < 100 && idleanim >= 99)
	                    sprite_index = spr_player_idlevomitblood
	                image_index = 0
	            }
	            if (idle < 300)
	            {
	                if (windingAnim < 50)
	                {
	                    start_running = 1
	                    movespeed = 0
	                    sprite_index = spr_player_idle
	                }
	                else
	                {
	                    idle = 0
	                    windingAnim--
	                    sprite_index = spr_player_winding
	                }
	            }
	        }
	        if (move != 0)
	        {
	            idle = 0
	            machslideAnim = 1
	            sprite_index = spr_player_move
	        }
	        if (move != 0)
	            xscale = move
	    }
	    if (landAnim == 1)
	    {
	        if (move == 0)
	        {
	            movespeed = 0
	            sprite_index = spr_player_land
	            if (floor(image_index) == 5)
	                landAnim = 0
	        }
	        if (move != 0)
	        {
	            sprite_index = spr_player_land2
	            if (floor(image_index) == 4)
	            {
	                landAnim = 0
	                sprite_index = spr_player_move
	                image_index = 0
	            }
	        }
	    }
	    if (machslideAnim == 0 && machhitAnim == 0)
	    {
	        sprite_index = spr_player_machslideend
	        if (floor(image_index) == 5)
	            machslideAnim = 1
	    }
	    if (machhitAnim == 1)
	    {
	        machhitAnim = 0
	        machslideAnim = 1
	    }
	    if (move != 0)
	    {
	        if (movespeed < 3 && move != 0)
	            image_speed = 0.35
	        else if (movespeed > 3 && movespeed < 6)
	            image_speed = 0.45
	        else
	            image_speed = 0.6
	    }
	    else
	        image_speed = 0.35
	}
	if (hsp != 0 && (!audio_is_playing(sfx_footsteps)))
	    scr_sound(sfx_footsteps)
	if ((!instance_exists(obj_cloudeffect)) && (!(place_meeting(x, y, obj_water2))) && place_meeting(x, (y + 1), obj_collisionparent) && move != 0 && (floor(image_index) == 4 || floor(image_index) == 10))
	    instance_create(x, (y + 43), obj_cloudeffect)
	if (movespeed == 9 && dashdust == 0)
	{
	    dashdust = 1
	    instance_create(x, y, obj_jumpdust)
	}
	scr_collideandmove()
}
