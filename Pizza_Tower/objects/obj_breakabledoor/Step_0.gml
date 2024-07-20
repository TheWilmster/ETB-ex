if ((place_meeting((x + 5), y, obj_player) || place_meeting((x - 5), y, obj_player)) && obj_player.mach2 >= 35 && obj_player.attacking == 1)
{
    if (obj_player.machpunchAnim == 0)
    {
        obj_player.machpunchAnim = 1
        obj_player.image_index = 0
    }
    instance_create((x + 16), (y + 50), obj_wooddebris)
    instance_create((x + 16), (y + 50), obj_wooddebris)
    instance_create((x + 16), (y + 50), obj_wooddebris)
    instance_create((x + 16), (y + 50), obj_wooddebris)
    instance_create((x + 16), (y + 50), obj_wooddebris)
    instance_create((x + 16), (y + 50), obj_wooddebris)
    instance_create((x + 16), (y + 50), obj_wooddebris)
    instance_create((x + 16), (y + 50), obj_wooddebris)
    instance_destroy()
    audio_sound_gain(sfx_break, 0.7, 0)
    if (!audio_is_playing(sfx_break))
        audio_play_sound(sfx_break, 1, false)
}
if place_meeting(x, y, obj_swordhitbox)
{
    instance_create((x + 16), (y + 50), obj_wooddebris)
    instance_create((x + 16), (y + 50), obj_wooddebris)
    instance_create((x + 16), (y + 50), obj_wooddebris)
    instance_create((x + 16), (y + 50), obj_wooddebris)
    instance_create((x + 16), (y + 50), obj_wooddebris)
    instance_create((x + 16), (y + 50), obj_wooddebris)
    instance_create((x + 16), (y + 50), obj_wooddebris)
    instance_create((x + 16), (y + 50), obj_wooddebris)
    instance_destroy()
}
if (place_meeting(x, (y - 15), obj_player) && obj_player.state == 52)
{
    instance_destroy()
    instance_create((x + 16), (y + 50), obj_wooddebris)
    instance_create((x + 16), (y + 50), obj_wooddebris)
    instance_create((x + 16), (y + 50), obj_wooddebris)
    instance_create((x + 16), (y + 50), obj_wooddebris)
    instance_create((x + 16), (y + 50), obj_wooddebris)
    instance_create((x + 16), (y + 50), obj_wooddebris)
    instance_create((x + 16), (y + 50), obj_wooddebris)
    instance_create((x + 16), (y + 50), obj_wooddebris)
    audio_sound_gain(sfx_break, 0.7, 0)
    if (!audio_is_playing(sfx_break))
        audio_play_sound(sfx_break, 1, false)
}
