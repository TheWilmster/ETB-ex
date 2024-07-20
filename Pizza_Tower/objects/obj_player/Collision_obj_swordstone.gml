if (other.image_index == 0 && state == 0)
{
    scr_sound(sfx_swordswing)
    other.image_index = 1
    image_index = 0
    sprite_index = spr_knightpep_start
    state = 2
    hsp = 0
}
