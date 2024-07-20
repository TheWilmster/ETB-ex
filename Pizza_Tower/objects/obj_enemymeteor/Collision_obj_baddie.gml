if (other.flying == 0 && other.sprite_index != other.stunfallspr)
{
    if (x != other.x)
        other.image_xscale = (-(sign((other.x - x))))
    other.hsp = (sign((other.x - x)) * 5)
    instance_create(x, y, obj_bangeffect)
    other.vsp = -10
    other.state = 81
    other.stunned = 200
}
