if (global.cheesefollow == 0)
    audio_play_sound(sfx_bigcollect, 1, false)
if (obj_player.state != 51)
{
    global.cheesefollow = 1
    panic = 0
}
