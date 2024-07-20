obj_player.alarm[9] = 100
instance_destroy()
obj_player.combo += 1
if (obj_player.combo == 1)
{
    instance_create(x, y, obj_10)
    global.pizzameter += 1
    global.collect += 10
}
if (obj_player.combo == 2)
{
    instance_create(x, y, obj_20)
    global.pizzameter += 2
    global.collect += 20
}
if (obj_player.combo == 3)
{
    instance_create(x, y, obj_40)
    global.pizzameter += 4
    global.collect += 40
}
if (obj_player.combo == 4 || obj_player.combo > 4)
{
    instance_create(x, y, obj_80)
    global.pizzameter += 8
    global.collect += 80
}
instance_create(x, y, obj_slimedead)
instance_create((x + 16), y, obj_slimedebris)
instance_create((x + 16), y, obj_slimedebris)
instance_create((x + 16), y, obj_slimedebris)
instance_create((x + 16), y, obj_slimedebris)
instance_create((x + 16), y, obj_slimedebris)
instance_create((x + 16), y, obj_slimedebris)
instance_create((x + 16), y, obj_slimedebris)
instance_create((x + 16), y, obj_slimedebris)
instance_create((x + 16), y, obj_slimedebris)
instance_create((x + 16), y, obj_slimedebris)
audio_sound_gain(sfx_enemyhit, 0.7, 0)
audio_play_sound(sfx_enemyhit, 1, false)
