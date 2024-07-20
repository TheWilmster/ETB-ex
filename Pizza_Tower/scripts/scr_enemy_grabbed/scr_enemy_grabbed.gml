function scr_enemy_grabbed()
{
	image_xscale = (-obj_player.xscale)
	stunned = 200
	if (obj_player.state == 6 || obj_player.state == 24 || obj_player.state == 19)
	{
	    depth = -1
	    x = (obj_player.x + (obj_player.xscale * 15))
	    y = obj_player.y
	    image_xscale = (-obj_player.xscale)
	}
	with (obj_player)
	{
	    if (!((state == 24 || state == 6 || state == 28 || state == 19 || state == 20 || state == 25 || state == 26 || state == 27 || state == 29)))
	    {
	        other.x = x
	        other.y = y
	        other.state = 82
	        other.image_index = 0
	    }
	}
	hsp = 0
	if place_meeting(x, y, obj_player)
	{
	    if (obj_player.state == 25 && floor(obj_player.image_index) == 2 && obj_player.throwforce < 20)
	    {
	        x = obj_player.x
	        y = obj_player.y
	        state = 81
	        hsp = ((-image_xscale) * 7)
	        vsp = -4
	        instance_create((x + (obj_player.xscale * 10)), y, obj_bangeffect)
	    }
	    if (obj_player.state == 25 && floor(obj_player.image_index) == 2 && obj_player.throwforce >= 20)
	    {
	        with (instance_create(x, y, obj_enemymeteor))
	        {
	            image_xscale = (-other.image_xscale)
	            ID = other.id
	        }
	        x = obj_player.x
	        y = obj_player.y
	        state = 81
	        hsp = ((-image_xscale) * 20)
	        straightthrow = 1
	        instance_create((x + (obj_player.xscale * 10)), y, obj_bangeffect)
	    }
	    if (obj_player.state == 26 && floor(obj_player.image_index) == 2 && obj_player.throwforce < 20)
	    {
	        x = obj_player.x
	        y = obj_player.y
	        state = 81
	        image_xscale *= -1
	        hsp = ((-image_xscale) * 5)
	        vsp = -4
	        instance_create((obj_player.x + ((-obj_player.xscale) * 40)), obj_player.y, obj_bangeffect)
	    }
	    if (obj_player.state == 26 && floor(obj_player.image_index) == 2 && obj_player.throwforce >= 20)
	    {
	        with (instance_create(x, y, obj_enemymeteor))
	        {
	            image_xscale = other.image_xscale
	            ID = other.id
	        }
	        x = obj_player.x
	        y = obj_player.y
	        state = 81
	        image_xscale *= -1
	        hsp = ((-image_xscale) * 20)
	        straightthrow = 1
	        instance_create((obj_player.x + ((-obj_player.xscale) * 40)), obj_player.y, obj_bangeffect)
	    }
	    if (obj_player.state == 19 && floor(obj_player.image_index) == 2 && obj_player.throwforce < 20)
	    {
	        x = obj_player.x
	        y = obj_player.y
	        state = 81
	        hsp = ((-image_xscale) * 7)
	        vsp = -8
	    }
	    if (obj_player.state == 19 && floor(obj_player.image_index) == 2 && obj_player.throwforce >= 20)
	    {
	        with (instance_create(x, y, obj_enemymeteor))
	        {
	            image_xscale = (-other.image_xscale)
	            ID = other.id
	        }
	        x = obj_player.x
	        y = obj_player.y
	        state = 81
	        hsp = ((-image_xscale) * 10)
	        vsp = -12
	    }
	    if (obj_player.state == 28 && floor(obj_player.image_index) == 2 && obj_player.throwforce < 20)
	    {
	        x = obj_player.x
	        y = obj_player.y
	        hsp = ((-image_xscale) * 5)
	        state = 81
	        vsp = -4
	        instance_create(obj_player.x, (obj_player.y + 46), obj_bangeffect)
	    }
	    if (obj_player.state == 28 && floor(obj_player.image_index) == 2 && obj_player.throwforce >= 20)
	    {
	        with (instance_create(x, y, obj_enemymeteor))
	        {
	            image_xscale = (-other.image_xscale)
	            ID = other.id
	        }
	        x = obj_player.x
	        y = obj_player.y
	        hsp = ((-image_xscale) * 5)
	        state = 81
	        vsp = -8
	        instance_create(obj_player.x, (obj_player.y + 46), obj_bangeffect)
	    }
	    if (obj_player.state == 27 && floor(obj_player.image_index) == 2 && obj_player.throwforce < 20)
	    {
	        x = obj_player.x
	        y = obj_player.y
	        hsp = ((-image_xscale) * 1)
	        state = 81
	        vsp = -10
	        instance_create(obj_player.x, (obj_player.y - 40), obj_bangeffect)
	    }
	    if (obj_player.state == 27 && floor(obj_player.image_index) == 2 && obj_player.throwforce >= 20)
	    {
	        with (instance_create(x, y, obj_enemymeteor))
	        {
	            image_angle = -270
	            ID = other.id
	        }
	        x = obj_player.x
	        y = obj_player.y
	        hsp = ((-image_xscale) * 1)
	        state = 81
	        vsp = -20
	        instance_create(obj_player.x, (obj_player.y - 40), obj_bangeffect)
	    }
	    if (obj_player.state == 20 && obj_player.slamming == 0)
	    {
	        depth = -7
	        x = obj_player.x
	        y = (obj_player.y + 20)
	    }
	    if (obj_player.state == 20 && obj_player.slamming == 1)
	    {
	        x = obj_player.x
	        y = obj_player.y
	        state = 81
	        hsp = ((-image_xscale) * 10)
	        vsp = -8
	        instance_create(x, y, obj_bangeffect)
	    }
	}
	sprite_index = grabbedspr
	image_speed = 0.35
}
