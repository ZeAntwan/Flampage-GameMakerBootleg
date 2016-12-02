/// @description Insert description here

cam_w = 1920;
cam_h = 1080;

camera = camera_create_view(x,y,cam_w,cam_h,0,-1,-1,-1,0,0);
view_set_camera(0,camera);