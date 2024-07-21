if (hurted == 0 && state != 5 && state != 2 && state != 3 && state != 19 && other.hsp != 0)
{
    hsp = 0
    movespeed = 0
    image_index = 0
    state = states.bombpep
    sprite_index = spr_bombpep_intro
    instance_create((x + (image_xscale * 40)), y, obj_punchdust)
    instance_destroy(other.id)
}
