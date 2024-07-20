if (global.panic == 1)
{
    instance_destroy()
    with (instance_create(x, y, obj_enemyblockdead))
    {
        if (x != other.x)
            hsp = (sign((other.x - x)) * 15)
        vsp = -10
    }
}
