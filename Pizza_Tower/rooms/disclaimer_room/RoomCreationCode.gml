if (!shaders_are_supported())
{
    if (shader_is_compiled(shdr_wind) && shader_is_compiled(shd_hit))
    {
        show_message("ur graphic card is shit")
        game_end()
    }
}
