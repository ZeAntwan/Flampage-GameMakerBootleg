/// @description Insert description here

// Set Camera Zoom
cam_w = cam_w*zoom;
cam_h = cam_h*zoom;

// Set Camera at Following object
x = objFollow.x-cam_w/2;
y = objFollow.y-cam_h/2

camera_set_view_size(view_camera[0],cam_w,cam_h);
camera_set_view_pos(view_camera[0],x,y);