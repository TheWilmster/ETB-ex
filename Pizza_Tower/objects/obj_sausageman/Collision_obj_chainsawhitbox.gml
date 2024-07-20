if (flying == 0)
{
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    if (x != other.x)
        image_xscale = sign((other.x - x))
    image_index = 0
    instance_create(x, y, obj_bangeffect)
    state = 77
    stunned = 200
}
