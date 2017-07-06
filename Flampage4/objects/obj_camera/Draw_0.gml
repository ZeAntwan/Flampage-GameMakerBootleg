/// @description Draw Reticle
if (objFollow == obj_player_1) {
	if (obj_player_1.isMoving && !obj_player_1.isAiming) {
		ret_x = clamp(obj_player_1.x + ((obj_input.haxis*2) * obj_player_1.spd * moveCam),45,room_width-45);
		ret_y = clamp(obj_player_1.y + ((obj_input.vaxis*2) * obj_player_1.spd * moveCam),45,room_height-45);
		draw_sprite(spr_reticle,0,ret_x,ret_y);
	}
	else if ((obj_player_1.isMoving && obj_player_1.isAiming) || (!obj_player_1.isMoving && obj_player_1.isAiming)) {
		ret_x = clamp((obj_player_1.x + obj_input.haim*((cam_w/2)-marginCam*2))-obj_player_1.hspd,45,room_width-45);
		ret_y = clamp((obj_player_1.y + obj_input.vaim*((cam_h/2)-marginCam))-obj_player_1.vspd,45,room_height-45);
		draw_sprite(spr_reticle,0,ret_x,ret_y);
	} else {
	
	}
}