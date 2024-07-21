with (obj_player)
{
    if (state != 56)
    {
        state = states.boulder
        x = other.x
        y = (other.y - 32)
        image_xscale = other.image_xscale
    }
}
