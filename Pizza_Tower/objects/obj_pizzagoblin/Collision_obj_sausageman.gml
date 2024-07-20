with (other.id)
{
    if (state != 81 && other.state == 77 && flying == 0)
    {
        if (other.x != x)
            image_xscale = (-(sign((x - other.x))))
        hsp = ((-(sign((other.x - x)))) * 5)
        image_index = 0
        instance_create(x, y, obj_bangeffect)
        vsp = -14
        state = 81
        stunned = 200
    }
    if (state != 84 && other.state == 81 && flying == 0 && other.vsp > 0 && y > other.y)
    {
        instance_create(x, y, obj_bangeffect)
        other.vsp = -14
        state = 84
        other.state = 72
        stunned = 200
        image_index = 0
        other.image_index = 0
    }
}
