function scr_player_pizzathrow()
{
	scr_getinput()
	movespeed = 0
	mach2 = 0
	hsp = 0
	xscale = -1
	jumpstop = 0
	if (global.pizza == 0 && (!instance_exists(obj_pizzabox)))
	{
	    state = states.smirk
	    landAnim = 0
	    movespeed = 4
	    mach2 = 0
	    image_index = 0
	    machslideAnim = 1
	}
	if (key_jump && place_meeting(x, (y + 1), obj_collisionparent) && (!key_down) && (!key_attack2) && (!instance_exists(obj_pizzabox)))
	{
	    vsp = -7
	    state = states.jump
	    image_index = 0
	    machslideAnim = 1
	    jumpAnim = 1
	    audio_sound_gain(sfx_jump, 0.7, 0)
	    if (!audio_is_playing(sfx_jump))
	        audio_play_sound(sfx_jump, 1, false)
	}
	if (global.pizza > 0 && (!instance_exists(obj_pizzabox)))
	{
	    instance_create(x, (y - 75), obj_pizzabox)
	    sprite_index = spr_player_pizzathrow
	}
	if instance_exists(obj_pizzabox)
	{
	    if (obj_pizzabox.throwed == 0 && key_attack2)
	    {
	        obj_pizzabox.inpizzabox = global.pizza
	        global.pizza = 0
	        obj_pizzabox.hsp = -4
	        obj_pizzabox.throwed = 1
	        obj_pizzabox.vsp = -10
	    }
	}
	if key_attack2
	    sprite_index = spr_player_pizzathrow2
	if (floor(image_index) == 3)
	    sprite_index = spr_player_pizzathrow3
	image_speed = 0.35
	scr_collideandmove()
}
