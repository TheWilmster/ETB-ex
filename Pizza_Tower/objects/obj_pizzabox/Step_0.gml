if (throwed == 1)
{
    if (vsp < 12)
        vsp += grav
}
if place_meeting((x + 64), (y - 130), obj_hungrypillar)
{
    obj_hungrypillar.framereset = 0
    obj_hungrypillar.image_speed = 0.35
    obj_hungrypillar.timeadded += inpizzabox
    instance_destroy()
    obj_hungrypillar.pillarhunger = 0
}
if place_meeting((x + floor(hsp)), y, obj_null)
{
    x = floor(x)
    while (!(place_meeting((x + sign(hsp)), y, obj_null)))
        x += sign(hsp)
    hsp = 0
}
x += hsp
if place_meeting(x, (y + floor(vsp)), obj_null)
{
    y = floor(y)
    while (!(place_meeting(x, (y + sign(vsp)), obj_null)))
        y += sign(vsp)
    vsp = 0
}
y += floor(vsp)
