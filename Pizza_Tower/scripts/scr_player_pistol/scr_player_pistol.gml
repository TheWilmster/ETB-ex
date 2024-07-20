function scr_player_pistol()
{
	var box, ID;
	scr_getinput()
	mach2 = 0
	hsp = (image_xscale * movespeed)
	if (place_meeting(x, (y + 1), obj_collisionparent) && movespeed >= 0)
	    movespeed -= 0.4
	jumpAnim = 1
	dashAnim = 1
	landAnim = 0
	machslideAnim = 1
	moveAnim = 1
	stopAnim = 1
	crouchslideAnim = 1
	crouchAnim = 1
	if (floor(image_index) == 8)
	    state = 0
	if (shoot == 1 && floor(image_index) == 0)
	{
	    with (obj_camera)
	    {
	        shake_mag = 8
	        shake_mag_acc = (30 / room_speed)
	    }
	    with (instance_create(x, y, obj_pistoleffect))
	        image_xscale = other.image_xscale
	    if (image_xscale == 1)
	        box = bbox_right
	    else
	        box = bbox_left
	    ID = instance_create((box + (image_xscale * 10)), y, obj_pistolbullet)
	    ID.hspeed = (image_xscale * 20)
	    shoot = 0
	}
	if ((!instance_exists(obj_slidecloud)) && place_meeting(x, (y + 1), obj_collisionparent) && movespeed > 5)
	    instance_create(x, y, obj_slidecloud)
	if place_meeting(x, (y + 1), obj_collisionparent)
	    sprite_index = spr_player_pistol
	else
	    sprite_index = spr_player_pistolair
	image_speed = 0.35
	scr_collideandmove()
}
