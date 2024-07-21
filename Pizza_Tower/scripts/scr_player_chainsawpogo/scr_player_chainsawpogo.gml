function scr_player_chainsawpogo()
{
	scr_getinput()
	hsp = (xscale * movespeed)
	if ((place_meeting((x + 1), y, obj_bumpable) && xscale == 1) || (place_meeting((x - 1), y, obj_bumpable) && xscale == -1))
	    movespeed = 0
	if (move == 0)
	    movespeed = 0
	if (move != 0 && movespeed < 6)
	    movespeed += 0.5
	if (xscale == 1 && move == -1)
	    movespeed = 0
	if (xscale == -1 && move == 1)
	    movespeed = 0
	landAnim = 1
	if (ladderbuffer > 0)
	    ladderbuffer--
	if (place_meeting(x, (y - 1), obj_collisionparent) && jumpstop == 0 && jumpAnim == 1)
	{
	    vsp = grav
	    jumpstop = 1
	}
	if ((place_meeting(x, (y + 1), obj_collisionparent) && vsp > 0) || (!key_chainsaw))
	{
	    state = states.jump
	    jumpAnim = 0
	    jumpstop = 0
	}
	if (sprite_index != spr_player_chainsawpogobounce)
	{
	    if (sprite_index == spr_player_chainsawpogo1 && floor(image_index) == 3)
	        sprite_index = spr_player_chainsawpogo2
	}
	else if (floor(image_index) == 4)
	    sprite_index = spr_player_chainsawpogo2
	image_speed = 0.35
	if (move != 0)
	    xscale = move
	image_speed = 0.35
	scr_collideandmove()
}
