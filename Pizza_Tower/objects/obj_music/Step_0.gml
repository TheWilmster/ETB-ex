audio_master_gain(0.5)
if (global.panic == 1 && (!audio_is_playing(music_escapetheme)))
{
    audio_play_sound(music_escapetheme, 1, false)
    audio_stop_sound(music_onepizzaatatime)
}
else if (global.panic == 0)
{
    audio_stop_sound(music_escapetheme)
    if (room == timesuproom && (!audio_is_playing(music_timesup)))
        audio_play_sound(music_timesup, 1, false)
    if (room == rank_room && (!audio_is_playing(music_victory)) && played == 0)
    {
        played = 1
        audio_play_sound(music_victory, 1, false)
    }
    if ((obj_player.state == 2 || obj_player.state == 3) && (!audio_is_playing(music_knight)))
    {
        audio_play_sound(music_knight, 1, false)
        audio_pause_sound(music_onepizzaatatime)
    }
    else if (obj_player.state != 2 && obj_player.state != 3 && audio_is_paused(music_onepizzaatatime) && audio_is_playing(music_knight))
    {
        audio_resume_sound(music_onepizzaatatime)
        audio_stop_sound(music_knight)
    }
    if (obj_player.state == 5 && obj_player.sprite_index != spr_bombpep_end && (!audio_is_playing(music_bomb)))
    {
        audio_play_sound(music_bomb, 1, false)
        audio_pause_sound(music_onepizzaatatime)
    }
    else if ((obj_player.state != 5 || obj_player.sprite_index == spr_bombpep_end) && audio_is_paused(music_onepizzaatatime) && audio_is_playing(music_bomb))
    {
        audio_resume_sound(music_onepizzaatatime)
        audio_stop_sound(music_bomb)
    }
    if (room == tutorial_room1 && (!audio_is_playing(music_tutorial)))
        audio_play_sound(music_tutorial, 1, true)
    else if (room == normalT_room1 || global.panic == 1)
        audio_stop_sound(music_tutorial)
    if (room == normalT_room1 && (!audio_is_playing(music_onepizzaatatime)) && (!audio_is_paused(music_onepizzaatatime)))
        audio_play_sound(music_onepizzaatatime, 1, true)
    else if (room == tutorial_room1 || global.panic == 1)
        audio_stop_sound(music_onepizzaatatime)
    if ((room == normalT_bonus1 || room == normalT_bonus2) && (!audio_is_playing(music_scary)))
    {
        audio_pause_sound(music_onepizzaatatime)
        audio_play_sound(music_scary, 1, true)
    }
    else if (room != normalT_bonus1 && room != normalT_bonus2 && audio_is_playing(music_scary))
    {
        audio_resume_sound(music_onepizzaatatime)
        audio_stop_sound(music_scary)
    }
    if (room == normalT_treasure)
        audio_pause_sound(music_onepizzaatatime)
    else if (audio_is_paused(music_onepizzaatatime) && obj_player.state != 34 && (!audio_is_playing(music_knight)) && (!audio_is_playing(music_bomb)) && (!audio_is_playing(music_scary)) && (!audio_is_playing(music_victory)) && (!audio_is_playing(music_timesup)))
        audio_resume_sound(music_onepizzaatatime)
}
