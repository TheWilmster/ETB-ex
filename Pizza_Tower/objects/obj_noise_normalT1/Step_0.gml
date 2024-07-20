if (sprite_index == spr_noise_button && floor(image_index) == (image_number - 1))
{
    hspeed = 3
    image_xscale = 1
    sprite_index = spr_noise_walk
}
if (floor(image_index) == 53)
{
    global.panic = 1
    obj_player.image_index = 0
    obj_player.sprite_index = spr_player_bossintro
}
if ((!instance_exists(obj_cloudeffect)) && hspeed != 0)
    instance_create(x, (y + 43), obj_cloudeffect)
