if (vsp < 12)
    vsp += grav
if (place_meeting(x, (y - 1), obj_player) && obj_player.x >= (x - 8) && obj_player.x <= (x + 8) && (obj_player.state == states.normal || obj_player.state == 44 || obj_player.state == 47))
{
    obj_player.state = states.barrelcrouch
    obj_player.image_index = 0
    obj_player.barrel = 1
    obj_player.vsp = 10
    instance_destroy()
}
if place_meeting(x, (y + 1), obj_solid)
{
    hsp = 0
    bounce = 0
}
if (place_meeting((x - 5), y, obj_player) && obj_player.image_xscale == 1 && (obj_player.state == 47 || obj_player.state == 48 || obj_player.state == 68) && bounce == 0)
{
    vsp = -3
    hsp = 3
    bounce = 1
    obj_player.state = states.tackle
    obj_player.image_index = 0
    obj_player.mach2 = 0
    audio_sound_gain(sfx_bump, 0.7, 0)
    if (!audio_is_playing(sfx_bump))
        audio_play_sound(sfx_bump, 1, false)
}
if (place_meeting((x + 5), y, obj_player) && obj_player.image_xscale == -1 && (obj_player.state == 47 || obj_player.state == 48) && bounce == 0)
{
    vsp = -3
    hsp = -3
    bounce = 1
    obj_player.state = states.tackle
    obj_player.image_index = 0
    audio_sound_gain(sfx_bump, 0.7, 0)
    if (!audio_is_playing(sfx_bump))
        audio_play_sound(sfx_bump, 1, false)
}
scr_collideandmoveonlywall()
