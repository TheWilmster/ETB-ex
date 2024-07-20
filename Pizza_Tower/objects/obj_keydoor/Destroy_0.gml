with (instance_create(x, y, obj_door))
{
    sprite_index = spr_doorvisited
    visited = 1
    target_x = other.target_x
    target_y = other.target_y
    targetRoom = other.targetRoom
}
