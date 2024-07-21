stunned = 200
if (place_meeting(x, y, obj_player) && state == 82 && obj_player.state == 0)
{
    instance_create((x + (obj_player.xscale * 40)), y, obj_punchdust)
    other.state = states.grabbing
    other.movespeed = 0
    state = 85
}
else
{
    with (obj_player)
    {
        if (y < other.y && attacking == 0 && (state == 36 || state == 10))
        {
            if (other.state != 84 && key_jump2 && vsp > 0)
            {
                audio_play_sound(sfx_boing, 1, false)
                sprite_index = spr_player_stompprep
                image_index = 0
                stompAnim = 1
                vsp = -14
                state = states.jump
                instance_create(x, y, obj_bangeffect)
                other.state = 84
                other.stunned = 200
                other.image_index = 0
            }
        }
        if (y < other.y && sprite_index == spr_player_facestomp)
        {
            if (other.state != 84 && vsp > 0)
            {
                image_index = 0
                facestompAnim = 1
                vsp = -7
                instance_create(x, y, obj_bangeffect)
                other.state = 84
                other.stunned = 200
                other.image_index = 0
            }
        }
        if (other.flying == 0)
        {
            if ((!(place_meeting(x, (y + 1), obj_collisionparent))) && (state == 48 || state == 68 || state == 15))
            {
                hsp = ((-xscale) * 4)
                vsp = -4
                if (x != other.x)
                    other.image_xscale = (-(sign((other.x - x))))
                other.state = 77
                instance_create(x, y, obj_bangeffect)
                image_index = 0
                state = states.tackle
                other.stunned = 200
            }
        }
        if ((state == 48 || state == 68 || state == 15 || state == 52 || state == 21) && place_meeting(x, (y + 1), obj_collisionparent) && other.flying == 0)
        {
            if (x != other.x)
                other.image_xscale = (-(sign((other.x - x))))
            other.hsp = (sign((other.x - x)) * 5)
            image_index = 0
            instance_create(x, y, obj_bangeffect)
            machpunchAnim = 1
            if (state != 68 && state != 15)
                other.vsp = -10
            if (state == 68 || state == 15)
                other.vsp = -18
            other.state = 81
            other.stunned = 200
        }
    }
}
