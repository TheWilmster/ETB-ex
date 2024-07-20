if (!surface_exists(surf))
    surf = surface_create(room_width, room_height)
else if (view_current == 0)
    draw_surface(surf, 0, 0)
