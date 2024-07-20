switch state
{
    case 72:
        scr_enemy_idle()
        break
    case 74:
        scr_enemy_turn()
        break
    case 75:
        scr_enemy_hitceilling()
        break
    case 76:
        scr_enemy_hitwall()
        break
    case 77:
        scr_enemy_rolling()
        break
    case 78:
        scr_enemy_walk()
        break
    case 80:
        scr_enemy_land()
        break
    case 81:
        scr_enemy_hit()
        break
    case 82:
        scr_enemy_stun()
        break
    case 83:
        scr_enemy_recovery()
        break
    case 84:
        scr_enemy_stomped()
        break
    case 85:
        scr_enemy_grabbed()
        break
}

if (state != 81 && state != 76 && state != 85 && state != 75 && state != 77)
    flying = 0
else
    flying = 1
if (cigar == 1 && cigarcreate == 0 && (state == 72 || state == 78 || state == 74 || state == 80))
{
    cigarcreate = 1
    with (instance_create(x, y, obj_sausagemancigar))
        ID = other.id
}
if (state != 81)
    straightthrow = 0
if (state != 85)
    depth = 0
