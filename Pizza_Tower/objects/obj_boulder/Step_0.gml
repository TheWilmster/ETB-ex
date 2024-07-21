if (place_meeting((x + 1), y, obj_solid) || place_meeting((x - 1), y, obj_solid))
    instance_destroy()
if (vsp < 12)
    vsp += grav
if (place_meeting((x - 5), y, obj_player) && obj_player.image_xscale == 1 && (obj_player.state == 47 || obj_player.state == 48 || obj_player.state == 68) && rolling == 0)
{
    rolling = 1
    hsp = 7
    obj_player.state = states.tackle
    obj_player.image_index = 0
    obj_player.mach2 = 0
    audio_sound_gain(sfx_bump, 0.7, 0)
    if (!audio_is_playing(sfx_bump))
        audio_play_sound(sfx_bump, 1, false)
}
if (place_meeting((x + 5), y, obj_player) && obj_player.image_xscale == -1 && (obj_player.state == 47 || obj_player.state == 48) && rolling == 0)
{
    rolling = 1
    hsp = -7
    obj_player.state = states.tackle
    obj_player.image_index = 0
    obj_player.mach2 = 0
    audio_sound_gain(sfx_bump, 0.7, 0)
    if (!audio_is_playing(sfx_bump))
        audio_play_sound(sfx_bump, 1, false)
}
scr_collideandmoveonlywall()
