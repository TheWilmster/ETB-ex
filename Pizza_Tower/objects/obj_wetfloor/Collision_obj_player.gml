with (obj_player)
{
    if (state == 47 || state == 48 || state == 49 || state == 38)
    {
        state = states.slipnslide
        if (movespeed < 8)
            movespeed = 8
    }
    if (state == 60 || state == 59)
    {
        image_index = 0
        state = states.barrelslipnslide
        if (movespeed < 8)
            movespeed = 8
    }
}
