var target;
var cam = view_camera[0];
var cx = camera_get_view_x(cam);
var cy = camera_get_view_y(cam);
var w = camera_get_view_width(cam);
var h = camera_get_view_height(cam);
if (global.panic == 1)
    timestop = 0
else
    timestop = 1

var background_width = [];
var background_height = [];
var bg_num = 5;
for (var i = 1; i < bg_num; i++) {
	var b = string_concat("Backgrounds_", i);
	if layer_exists(b) && (room == normalT_bonus1 || room == normalT_room1 || room == normalT_room2 || room == normalT_room3 || room == normalT_room4 || room == normalT_runbackpassage) {
		array_push(background_width, sprite_get_width(layer_background_get_sprite(layer_background_get_id(b))))
		array_push(background_height, sprite_get_height(layer_background_get_sprite(layer_background_get_id(b))))
	} else {
		array_push(background_width, 0);
		array_push(background_height, 0);
	}
}

if (room == normalT_room1 || room == normalT_room2 || room == normalT_room3 || room == normalT_room4 || room == normalT_runbackpassage)
{
	layer_x("Backgrounds_1", lerp(0, (room_width - background_width[0]), (cx/ (room_width - w))) / 6);
	layer_y("Backgrounds_1", lerp(0, (room_height - background_height[0]), (cy / (room_height - h))) / 6);
	layer_x("Backgrounds_2", lerp(0, (room_width - background_width[0]), (cx / (room_width - w))) / 8);
	layer_y("Backgrounds_2", lerp(0, (room_height - background_height[0]), (cy / (room_height - h))) / 8);
	layer_background_xscale(layer_background_get_id("Backgrounds_2"), 0.5);
	layer_background_yscale(layer_background_get_id("Backgrounds_2"), 0.5);
	layer_x("Backgrounds_3", lerp(0, (room_width - background_width[0]), (cx / (room_width - w))) / 10);
	layer_y("Backgrounds_3", lerp(0, (room_height - background_height[0]), (cy / (room_height - h))) / 10);
    layer_background_xscale(layer_background_get_id("Backgrounds_3"), 0.8);
	layer_background_yscale(layer_background_get_id("Backgrounds_3"), 0.8);
	layer_x("Backgrounds_5", lerp(0, (room_width - background_width[0]), (cx / (room_width - w))) / 16);
    layer_y("Backgrounds_5", lerp(0, (room_height - background_height[0]), (cy / (room_height - h))) / 16);
	layer_background_xscale(layer_background_get_id("Backgrounds_5"), 0.7);
	layer_background_yscale(layer_background_get_id("Backgrounds_5"), 0.7);
	layer_y("Backgrounds_5", 300);
}
if (room == normalT_bonus1)
{
    layer_x("Backgrounds_2", lerp(0, (room_width - background_width[0]), cx / (room_width - w)) / 6)
	layer_y("Backgrounds_2", lerp(0, (room_height - background_height[0]), cy / (room_height - h)) / 6)
}
if (room == timesuproom)
    timestop = 1
if (global.seconds == 0 && global.minutes == 0 && room != timesuproom)
{
    obj_player.state = 14
    room = timesuproom
    obj_player.image_index = 0
}
if (global.seconds < 0)
{
    global.seconds = 59
    global.minutes -= 1
}
if (global.seconds > 59)
{
    global.minutes += 1
    global.seconds -= 59
}
if (global.panic == 1 && global.minutes > 1)
{
    shake_mag = 3
    shake_mag_acc = (5 / room_speed)
}
else if (global.panic == 1 && global.minutes <= 1)
{
    shake_mag = 4
    shake_mag_acc = (6 / room_speed)
}
if (shake_mag > 0)
{
    shake_mag -= shake_mag_acc
    if (shake_mag < 0)
        shake_mag = 0
}
if (instance_exists(obj_player) && obj_player.state != 14 && obj_player.state != 33)
{
    target = obj_player
	var px = (target.x - (w / 2)) + irandom_range((-shake_mag), shake_mag);
	var py = (target.y - (h / 2)) + irandom_range((-shake_mag), shake_mag);
	camera_set_view_pos(cam, clamp(px, 0, (room_width - w)), clamp(py, 0, (room_height - h)));
}
