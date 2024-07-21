if place_meeting(x, (y - 1), obj_player)
{
    with (obj_player)
    {
        if (place_meeting(x, (y + 1), obj_ladder) && key_down && state == 44 && place_meeting(x, (y + 1), obj_platform))
        {
            audio_sound_gain(sfx_climbdown, 0.7, 0)
            if (!audio_is_playing(sfx_climbdown))
                audio_play_sound(sfx_climbdown, 1, false)
            y += 5
            state = states.ladder
            x = (other.x + 16)
            y = floor(y)
            if ((y % 2) == 1)
                y -= 1
        }
    }
}
