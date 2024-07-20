with (obj_player)
{
    if (state != 56)
    {
        state = 66
        x = other.x
        y = (other.y - 32)
        image_xscale = other.image_xscale
    }
}
