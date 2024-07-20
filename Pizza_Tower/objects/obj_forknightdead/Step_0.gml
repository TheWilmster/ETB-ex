if (vsp < 30)
    vsp += grav
if ((!((obj_player.state == 24 || obj_player.state == 19 || obj_player.state == 21 || obj_player.state == 20 || obj_player.state == 25 || obj_player.state == 26 || obj_player.state == 27 || obj_player.state == 28 || obj_player.state == 29))) && grabbed == 1)
{
    instance_destroy()
    instance_create(x, y, obj_explosioneffect)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
}
if (grabbed == 1)
{
    sprite_index = spr_forknightstun
    if (obj_player.state == 24)
    {
        x = (obj_player.x + (obj_player.image_xscale * 20))
        y = obj_player.y
        if (x != obj_player.x)
            image_xscale = sign((obj_player.x - x))
    }
    if (obj_player.state == 25)
    {
        x = (obj_player.x + (obj_player.image_xscale * 20))
        y = obj_player.y
        if (floor(obj_player.image_index) == 3)
        {
            with (obj_camera)
            {
                shake_mag = 10
                shake_mag_acc = (30 / room_speed)
            }
            y = obj_player.y
            hsp = (obj_player.image_xscale * 20)
            vsp = -5
            instance_create(x, y, obj_bangeffect)
            grabbed = 0
        }
    }
    if (obj_player.state == 27)
    {
        x = obj_player.x
        y = (obj_player.y - 40)
        if (floor(obj_player.image_index) == 3)
        {
            with (obj_camera)
            {
                shake_mag = 10
                shake_mag_acc = (30 / room_speed)
            }
            instance_create(x, y, obj_bangeffect)
            grabbed = 0
            vsp = -20
        }
    }
    if (obj_player.state == 26)
    {
        x = (obj_player.x - (obj_player.image_xscale * 20))
        y = obj_player.y
        if (floor(obj_player.image_index) == 3)
        {
            with (obj_camera)
            {
                shake_mag = 10
                shake_mag_acc = (30 / room_speed)
            }
            obj_player.vsp = -5
            hsp = (-((obj_player.image_xscale * 20)))
            vsp = -5
            instance_create(x, y, obj_bangeffect)
            grabbed = 0
        }
    }
    if (obj_player.state == 28)
    {
        x = obj_player.x
        y = (obj_player.y + 30)
        if (floor(obj_player.image_index) == 3)
        {
            with (obj_camera)
            {
                shake_mag = 10
                shake_mag_acc = (30 / room_speed)
            }
            obj_player.vsp = -5
            instance_create(x, y, obj_bangeffect)
            grabbed = 0
            vsp = -4
            hsp = (obj_player.image_xscale * 4)
        }
    }
    if (obj_player.state == 29)
    {
        x = obj_player.x
        y = (obj_player.y - 40)
        if (floor(obj_player.image_index) == 1)
        {
            with (obj_camera)
            {
                shake_mag = 10
                shake_mag_acc = (30 / room_speed)
            }
            instance_create(x, y, obj_bangeffect)
            grabbed = 0
            vsp = -4
            hsp = (obj_player.image_xscale * 4)
        }
    }
    if (obj_player.state == 20)
    {
        x = obj_player.x
        y = (obj_player.y + 30)
        if (floor(obj_player.image_index) == 4)
        {
            with (obj_camera)
            {
                shake_mag = 10
                shake_mag_acc = (30 / room_speed)
            }
            instance_create(x, y, obj_bangeffect)
            grabbed = 0
            vsp = -4
            hsp = (obj_player.image_xscale * 4)
        }
    }
    if (obj_player.state == 21)
    {
        x = obj_player.x
        y = (obj_player.y + 30)
        if (floor(obj_player.image_index) == 4)
        {
            with (obj_camera)
            {
                shake_mag = 10
                shake_mag_acc = (30 / room_speed)
            }
            instance_create(x, y, obj_bangeffect)
            grabbed = 0
            vsp = -4
            hsp = (obj_player.image_xscale * 4)
        }
    }
    if (obj_player.state == 19)
    {
        x = obj_player.x
        y = (obj_player.y - 40)
        if (floor(obj_player.image_index) == 3)
        {
            with (obj_camera)
            {
                shake_mag = 10
                shake_mag_acc = (30 / room_speed)
            }
            y = obj_player.y
            hsp = (obj_player.image_xscale * 10)
            vsp = -5
            instance_create(x, y, obj_bangeffect)
            grabbed = 0
        }
    }
}
if (grabbed == 0)
{
    sprite_index = spr_forknight_dead
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
}
