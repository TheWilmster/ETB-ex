draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha)
if flash
{
    shader_set(shd_hit)
    draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha)
    shader_reset()
}
