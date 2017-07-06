/// @description Insert description here

zoom = 1

cam_w = 1920*zoom;
cam_h = 1080*zoom;

camera = camera_create_view(x,y,cam_w,cam_h,0,-1,-1,-1,0,0);
view_set_camera(0,camera);

// Shaky Prepare
shake_x = 0;
shake_y = 0;