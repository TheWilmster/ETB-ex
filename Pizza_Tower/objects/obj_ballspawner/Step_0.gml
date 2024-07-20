if ((!(place_meeting(x, y, obj_ball))) && (!instance_exists(obj_ball)) && (!(point_in_rectangle(x, y, (view_xview[0] - 50), view_yview[0], ((view_xview[0] + view_wview[0]) + 50), (view_yview[0] + view_hview[0])))))
    instance_create(x, y, obj_ball)
