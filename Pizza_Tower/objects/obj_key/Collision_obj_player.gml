if (inv_frame == 0 && obj_player.state != 51)
{
    instance_destroy()
    global.key_inv = 1
    obj_player.key_particles = 1
    obj_player.alarm[7] = 30
}
if (global.keyget == 0)
{
    obj_player.state = 34
    image_index = 0
    global.keyget = 1
    audio_pause_all()
}
