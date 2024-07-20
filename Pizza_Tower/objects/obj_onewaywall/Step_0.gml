if (obj_player.bbox_bottom < y && created == 0)
{
    alarm[0] = 1
    created = 1
}
if instance_exists(obj_pizzakinshroom)
{
    if (obj_pizzakinshroom.bbox_bottom <= y && place_meeting(x, (y - 2), obj_pizzakinshroom))
        obj_pizzakinshroom.vsp = 0
}
if instance_exists(obj_pizzakincheese)
{
    if (obj_pizzakincheese.bbox_bottom <= y && place_meeting(x, (y - 2), obj_pizzakincheese))
        obj_pizzakincheese.vsp = 0
}
if instance_exists(obj_pizzakintomato)
{
    if (obj_pizzakintomato.bbox_bottom <= y && place_meeting(x, (y - 2), obj_pizzakintomato))
        obj_pizzakintomato.vsp = 0
}
if instance_exists(obj_pizzakinsausage)
{
    if (obj_pizzakinsausage.bbox_bottom <= y && place_meeting(x, (y - 2), obj_pizzakinsausage))
        obj_pizzakinsausage.vsp = 0
}
if instance_exists(obj_pizzakinpineapple)
{
    if (obj_pizzakinpineapple.bbox_bottom <= y && place_meeting(x, (y - 2), obj_pizzakinpineapple))
        obj_pizzakinpineapple.vsp = 0
}
