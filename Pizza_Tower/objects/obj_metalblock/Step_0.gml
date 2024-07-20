if ((place_meeting((x + 1), y, obj_player) || place_meeting((x - 1), y, obj_player)) && (obj_player.state == 68 || obj_player.state == 15))
{
    instance_destroy()
    audio_sound_gain(sfx_break, 0.7, 0)
    if (!audio_is_playing(sfx_break))
        audio_play_sound(sfx_break, 1, false)
}
if (place_meeting(x, (y - 15), obj_player) && (obj_player.state == 52 || obj_player.state == 21 || obj_player.state == 2))
{
    instance_destroy()
    tile_layer_delete_at(1, x, y)
    audio_sound_gain(sfx_break, 0.7, 0)
    if (!audio_is_playing(sfx_break))
        audio_play_sound(sfx_break, 1, false)
}
if (place_meeting(x, (y + 15), obj_player) && obj_player.state == 41)
{
    instance_destroy()
    tile_layer_delete_at(1, x, y)
    audio_sound_gain(sfx_break, 0.7, 0)
    if (!audio_is_playing(sfx_break))
        audio_play_sound(sfx_break, 1, false)
}
