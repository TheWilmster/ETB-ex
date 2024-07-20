if (flying == 0)
{
    if (x != other.x)
        image_xscale = (-(sign((x - other.x))))
    hsp = (sign((x - other.x)) * 5)
    image_index = 0
    instance_create(x, y, obj_bangeffect)
    vsp = -10
    state = 81
    stunned = 200
}
