if (global.tomatofollow == 0)
    audio_play_sound(sfx_bigcollect, 1, false)
if (obj_player.state != 51)
{
    global.tomatofollow = 1
    panic = 0
}
