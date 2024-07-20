function scr_collideandmoveonlywall()
{
	var _temp_local_var_2;
	_temp_local_var_2 = abs(vsp)
	if (abs(vsp) <= 0)
	{
	}
	else
	{
	    repeat (_temp_local_var_2)
	    {
	        if (!(place_meeting(x, (y + sign(vsp)), obj_enemiesbumpable)))
	        {
	            y += sign(vsp)
	            _temp_local_var_2 = (abs(vsp) - 1)
	            if (abs(vsp) - 1)
	                continue
	            break
	        }
	        else
	            vsp = 0
	    }
	}
	_temp_local_var_2 = abs(hsp)
	if (abs(hsp) <= 0)
	{
	}
	else
	{
	    repeat (_temp_local_var_2)
	    {
	        if (place_meeting((x + sign(hsp)), y, obj_enemiesbumpable) && place_meeting((x + sign(hsp)), (y - 1), obj_enemiesbumpable) && (!(place_meeting((x + sign(hsp)), (y - 2), obj_enemiesbumpable))))
	            y -= 2
	        else if (place_meeting((x + sign(hsp)), y, obj_enemiesbumpable) && (!(place_meeting((x + sign(hsp)), (y - 1), obj_enemiesbumpable))))
	            y--
	        if ((!(place_meeting((x + sign(hsp)), y, obj_enemiesbumpable))) && (!(place_meeting((x + sign(hsp)), (y + 1), obj_enemiesbumpable))) && (!(place_meeting((x + sign(hsp)), (y + 2), obj_enemiesbumpable))) && place_meeting((x + sign(hsp)), (y + 3), obj_enemiesbumpable))
	            y += 2
	        else if ((!(place_meeting((x + sign(hsp)), y, obj_enemiesbumpable))) && (!(place_meeting((x + sign(hsp)), (y + 1), obj_enemiesbumpable))) && place_meeting((x + sign(hsp)), (y + 2), obj_enemiesbumpable))
	            y++
	        if (!(place_meeting((x + sign(hsp)), y, obj_enemiesbumpable)))
	        {
	            x += sign(hsp)
	            _temp_local_var_2 = (abs(hsp) - 1)
	            if (abs(hsp) - 1)
	                continue
	            break
	        }
	        else
	            hsp = 0
	    }
	}
	if (vsp < 20)
	    vsp += grav
}
