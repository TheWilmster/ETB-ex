if (flying == 0)
{
    repeat (5)
	{
	    with (instance_create(x, y, obj_baddiegibs))
	    {
	        hsp = ((-image_xscale) * random_range(0, 15))
	        vsp = random_range(-5, -10)
	    }
	}
    if (x != other.x)
        image_xscale = (-(sign((x - other.x))))
    hsp = (sign((x - other.x)) * 9)
    image_index = 0
    instance_create(x, y, obj_bangeffect)
    vsp = -5
    state = 81
    stunned = 100
}
