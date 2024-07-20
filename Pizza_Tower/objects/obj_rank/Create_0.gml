image_speed = 0.5
if (global.collect >= 3000 && global.shroomfollow == 1 && global.cheesefollow == 1 && global.tomatofollow == 1 && global.sausagefollow == 1 && global.pineapplefollow == 1)
    sprite_index = spr_rankS
else if (global.collect > 2500)
    sprite_index = spr_rankA
else if (global.collect > 2000)
    sprite_index = spr_rankB
else if (global.collect > 1500)
    sprite_index = spr_rankC
else
    sprite_index = spr_rankD
