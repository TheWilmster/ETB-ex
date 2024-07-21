with (obj_player)
{
    if (key_up && ladderbuffer == 0 && (state == states.normal || state == 8 || state == 36 || state == 10) && state != 51 && state != 47 && state != 48 && state != 49 && state != 52 && state != 55)
    {
        state = states.ladder
        x = (other.x + 16)
        y = floor(y)
        if ((y % 2) == 1)
            y -= 1
    }
}
