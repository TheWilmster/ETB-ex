with (obj_player)
{
    if (place_meeting(x, (y + 1), obj_runonball) && x >= (obj_runonball.x - 8) && x <= (obj_runonball.x + 8) && (state == states.normal || state == 44 || state == 47 || state == 48))
        state = states.runonball
}
if (vsp < 12)
    vsp += grav
if (obj_player.state == 67)
    hsp = obj_player.hsp
else
    hsp = 0
scr_collideandmoveonlywall()
if place_meeting(x, (y + 1), obj_spike)
    vsp = 0
