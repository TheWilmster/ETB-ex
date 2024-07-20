audio_sound_gain(zone1_theme, 50, 0)
if (!audio_is_playing(zone1_theme))
    audio_play_sound(zone1_theme, 2, true)
audio_stop_sound(Intro)
