with (obj_player)
{
    if (state == 47 || state == 48 || state == 68 || state == 49 || state == 38)
    {
        other.drop = 1
        state = states.slipnslide
        if (movespeed < 8)
            movespeed = 8
    }
    if (state == 60 || state == 59)
    {
        image_index = 0
        other.drop = 1
        state = states.barrelslipnslide
        if (movespeed < 8)
            movespeed = 8
    }
    if (state == 15)
        other.drop = 1
}
