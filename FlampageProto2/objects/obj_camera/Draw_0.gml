/// @description Draw Reticle
if (objFollow == obj_player_1) {
	if (obj_player_1.isMoving && !obj_player_1.isAiming) {
		ret_x = clamp(obj_player_1.x + obj_input.haxis * moveCam,0,room_width);
		ret_y = clamp(obj_player_1.y + obj_player_1.spd * moveCam,0,room_height);
		draw_sprite(spr_reticle,0,ret_x,ret_y);
	}
	else if ((obj_player_1.isMoving && obj_player_1.isAiming) || (!obj_player_1.isMoving && obj_player_1.isAiming)) {
		ret_x = clamp((obj_player_1.x + obj_input.haim*((cam_w)-marginCam*2)),0,room_width);
		ret_y = clamp((obj_player_1.y + obj_input.vaim*((cam_h)-marginCam)),0,room_height);
		draw_sprite(spr_reticle,0,ret_x,ret_y);
	} else {
	
	}
}