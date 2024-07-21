if (place_meeting(x, (y - 1), obj_player) && obj_player.x >= (x - 10) && obj_player.x <= (x + 10) && global.pizza > 0 && obj_hungrypillar.pillarhunger > 0)
    obj_player.state = states.pizzathrow
