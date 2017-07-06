/// @description 

// Set Sprite Speed
if (!global.isCinematic) {
	sprspeed = clamp((abs(obj_input.haxis)+abs(obj_input.vaxis)),0,1)
	image_speed = sprspeed;
	if (isAiming) {
		diraim_diff = angle_difference(dirpoint,aimpoint);
		if (diraim_diff>90 or diraim_diff <-90) {
			image_speed = -sprspeed;
		}
	}
}

// Set Sprite

draw_self();

if(isAiming) {
	var rot = aimpoint
	//Draw Reticle
	
} else {
	var rot = 0;
}

if (isShooting) {
	if (shootanim>sprite_get_number(spr_player_aim_l)-1) shootanim = 0;
	shootanim++;
	if (last_o == 0)
	{
		draw_sprite_ext(spr_player_aim_r,shootanim,x,y-25,1,1,rot,c_white,1);
	}
	else if (last_o == 1)
	{
		//if (shootanim>sprite_get_number(spr_player_aim_l)-1) shootanim = 0;
		//shootanim++;
		draw_sprite_ext(spr_player_aim_b,shootanim,x,y,1,1,0,c_white,1);
	}
	else if (last_o == 2)
	{
		//if (shootanim>sprite_get_number(spr_player_aim_l)-1) shootanim = 0;
		//shootanim++;
		if (isAiming) rot -= 180
		draw_sprite_ext(spr_player_aim_l,shootanim,x,y-25,1,1,rot,c_white,1);
	}
} else {
	if (!isAiming) {
		if (last_o == 0)
			{
				draw_sprite_ext(spr_player_run_r_arm,image_index,x,y-25,1,1,0,c_white,1);
			}
			else if (last_o == 1)
			{
				draw_sprite_ext(spr_player_run_b_arm,image_index,x,y,1,1,0,c_white,1);
			}
			else if (last_o == 2)
			{
				draw_sprite_ext(spr_player_run_l_arm,image_index,x,y-25,1,1,0,c_white,1);
			}
		} else {
			shootanim = 0;	
			if (last_o == 0)
			{
				draw_sprite_ext(spr_player_aim_r,shootanim,x,y-25,1,1,rot,c_white,1);
			}
			else if (last_o == 1)
			{
				draw_sprite_ext(spr_player_aim_b,shootanim,x,y,1,1,0,c_white,1);
			}
			else if (last_o == 2)
			{
				if (isAiming) rot -= 180
				draw_sprite_ext(spr_player_aim_l,shootanim,x,y-25,1,1,rot,c_white,1);
			}
		}	
}