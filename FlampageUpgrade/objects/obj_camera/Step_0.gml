/// @description Insert description here

//The interpolation rate
var rate = 0.19;
//The view ahead of movement
moveCam = 10;
//The Border Margin when aiming
marginCam = 300;

// If in Game state
if (global.gameState != 0 && global.gameState != 5) {
// If Camera is Following Player
	if (objFollow == obj_player_1) {
				if (obj_player_1.isMoving && !obj_player_1.isAiming) {
				// If player is Moving but NOT Aiming
					nextcam_x = (obj_player_1.x + (obj_player_1.hspd*moveCam));
					nextcam_y = (obj_player_1.y + (obj_player_1.vspd*moveCam));
				}
				else if ((obj_player_1.isMoving && obj_player_1.isAiming) || (!obj_player_1.isMoving && obj_player_1.isAiming)) {
				// If player is Moving and Aiming OR is Aiming Only
					if (obj_input.isGamepad) {
						nextcam_x = (obj_player_1.x + obj_input.haim*((cam_w/4)-marginCam));
						nextcam_y = (obj_player_1.y + obj_input.vaim*((cam_h/4)-marginCam/2));
					} else {
						var dist_aim_x = lengthdir_x((distance_to_point(obj_player_1.x,obj_input.haim)),direction);
						var dist_aim_y = lengthdir_x((distance_to_point(obj_player_1.x,obj_input.vaim)),direction);
						//if (obj_input.haim < obj_player_1.x) {dist_aim_x = -dist_aim_x};
						//if (obj_input.vaim<obj_player_1.y) {dist_aim_y = -dist_aim_y};
						//nextcam_x = (obj_player_1.x + dist_aim_x/2);
						//nextcam_y = (obj_player_1.y + dist_aim_y/2);
						nextcam_x = (mean(obj_player_1.x,obj_input.haim));
						nextcam_y = (mean(obj_player_1.y,obj_input.vaim));
					}
				} 
				else if (!obj_player_1.isMoving && !obj_player_1.isAiming) {
				// If player is Idling
					nextcam_x = obj_player_1.x;
					nextcam_y = obj_player_1.y;
				}
	} else {
	// Camera is Following anything else
		nextcam_x = objFollow.x;
		nextcam_y = objFollow.y;	
	}
}

if (global.isCinematic) {
	// Camera is Following anything else
	nextcam_x = objFollow.x;
	nextcam_y = objFollow.y;
}

if (global.rageState != 4 && global.gameState == 3) {
	objFollow = obj_player_1;
	// Zooming in
	var view_w = camera_get_view_width(view_camera[0]);
	var view_h = camera_get_view_height(view_camera[0]);
	newcam_w = lerp(view_w,cam_w*.5,0.01);
	newcam_h = lerp(view_h,cam_h*.5,0.01);
	camera_set_view_size(view_camera[0],newcam_w,newcam_h);
	shake_x = random_range(5,10);
	shake_y = random_range(5,10);
	nextcam_x -= (newcam_w - cam_w)/2;
	nextcam_y -= (newcam_h - cam_h)/2; 
}

if (global.rageState == 4) {

	objFollow = obj_flan;
	// Zooming in
	var view_w = camera_get_view_width(view_camera[0]);
	var view_h = camera_get_view_height(view_camera[0]);
	newcam_w = lerp(view_w,cam_w*.5,0.01);
	newcam_h = lerp(view_h,cam_h*.5,0.01);
	camera_set_view_size(view_camera[0],newcam_w,newcam_h);
	shake_x = random_range(5,10);
	shake_y = random_range(5,10);
	nextcam_x -= (newcam_w - cam_w)/2;
	nextcam_y -= (newcam_h - cam_h)/2; 
}

// Camera Lerp
if (global.gameState != 0 && global.gameState != 5) {
	// Clamping Next Camera Position to Room
	nextcam_x = clamp(nextcam_x-cam_w/2,0,room_width-cam_w);
	nextcam_y = clamp(nextcam_y-cam_h/2,0,room_height-cam_h);
	x = lerp(x,nextcam_x,rate);
	y = lerp(y,nextcam_y,rate);
} else {
	x = 0;
	y = 0;
}

camera_set_view_pos(view_camera[0],x+shake_x,y+shake_y)