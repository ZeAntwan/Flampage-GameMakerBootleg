/// @description Camera Update

//Var Updates
//Get target view position and size. size is halved so the view will focus around its center
var vpos_x = camera_get_view_x(view_camera[0]);
var vpos_y = camera_get_view_y(view_camera[0]);
vpos_w = camera_get_view_width(view_camera[0]) * 0.5;
vpos_h = camera_get_view_height(view_camera[0]) * 0.5;

//The interpolation rate
var rate = 0.19;
var moveCam = 10;
var aimCam = vpos_w;
var marginCam = vpos_w/3;

// Player Following
if (!global.isCinematic) {
	// Player following
	if (instance_exists(obj_player_1)) {
			if (obj_player_1.isMoving && !obj_player_1.isAiming) {
			// If player is Moving but NOT Aiming
				nextcam_x = (obj_player_1.x + (obj_player_1.hspd*moveCam));
				nextcam_y = (obj_player_1.y + (obj_player_1.vspd*moveCam));
			}
			else if ((obj_player_1.isMoving && obj_player_1.isAiming) || (!obj_player_1.isMoving && obj_player_1.isAiming)) {
			// If player is Moving and Aiming OR is Aiming Only
				nextcam_x = (obj_player_1.x + clamp(((obj_player_1.haim*aimCam)),-vpos_w+marginCam,vpos_w-marginCam));
				nextcam_y = (obj_player_1.y + clamp(((obj_player_1.vaim*aimCam)),-vpos_h+marginCam,vpos_h-marginCam));
			} 
			else if (!obj_player_1.isMoving && !obj_player_1.isAiming) {
			// If player is Idling
				nextcam_x = obj_player_1.x;
				nextcam_y = obj_player_1.y;
			}
	} else {
		nextcam_x = vpos_w;
		nextcam_y = vpos_h;
	}
} 
if (global.gameState == 0) {
	
}

// Update View

//Interpolate the view position to the new, relative position.
var new_x = clamp((lerp(vpos_x, nextcam_x - vpos_w, rate)),0,room_width-vpos_w*2);
var new_y = clamp((lerp(vpos_y, nextcam_y - vpos_h, rate)),0,room_height-vpos_h*2);

//Update the view position
camera_set_view_pos(view_camera[0], new_x, new_y);

// Camera Bobbing Test


//camera_set_view_size(view_camera[0])