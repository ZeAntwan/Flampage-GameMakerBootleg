/// @description Camera Setup

Singleton();

// Set initial position to player pos
//if (instance_exists(obj_player_1)) {
//	x = obj_player_1.x;
//	y = obj_player_1.y;
//}

//Enable the use of views
view_enabled = true;

//Set the port bounds of view 0 to 1280*720
camera_ratio = 16/9;

camera_width = 1280;
camera_height = camera_width/camera_ratio;

view_set_wport(0, display_get_width()/2);
view_set_hport(0, display_get_height()/2);

//Resize and center
window_set_rectangle((display_get_width()/4), (display_get_height()/4), (display_get_width()/2), (display_get_height()/2));
surface_resize(application_surface,view_wport[0],view_hport[0]);

///Camera creation

var vpos_w = camera_get_view_width(view_camera[0]) * 0.5;
var vpos_h = camera_get_view_height(view_camera[0]) * 0.5;

//Build a camera with camera object at center, with size 640x480, 0 degrees of angle, no target instance, instant-jupming hspeed and vspeed, with a 32 pixel border
camera = camera_create_view(x-vpos_w, y-vpos_h, camera_width, camera_height, 0, -1, -1, -1, 32, 32);
view_set_camera(0,camera)
