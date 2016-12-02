/// @description Loop

/// PLAYER INPUT
//Left Stick
haxis = gamepad_axis_value(0, gp_axislh) + (keyboard_check(vk_right)-keyboard_check(vk_left));
vaxis = gamepad_axis_value(0, gp_axislv) + (keyboard_check(vk_down)-keyboard_check(vk_up));
//Right Stick
haim = gamepad_axis_value(0, gp_axisrh);
vaim = gamepad_axis_value(0, gp_axisrv);
//Buttons Setup
rtrigger = gamepad_button_check(0, gp_shoulderrb) + keyboard_check(vk_space);


////////////////////////////////////////////////// MOVEMENT
hspd = haxis*spd;
vspd = vaxis*spd;
//isMoving
if (hspd !=0 or vspd != 0) isMoving = true else isMoving = false;

//dirMoving
// 0 : RIGHT
// 1 : BOTTOM
// 2 : LEFT
// 3 : TOP
dirpoint = point_direction(x, y, x+haxis, y+vaxis); // Direction du mouvement en degré
if(dirpoint<45 or dirpoint>315) {
//Right Direction
	dirMoving = 0;
	sprite_index = spr_player_run_r;
}
else if (dirpoint<315 and dirpoint>225) {
//Bottom Direction
	dirMoving = 1;
	sprite_index = spr_player_run_b;
}
else if (dirpoint>45 and dirpoint<225 and dirpoint>135 and dirpoint<315) {
//Left Direction
	dirMoving = 2;
	sprite_index = spr_player_run_l;
}
else if (dirpoint<135 and dirpoint>45) {
//Top Direction
	dirMoving = 3;
	sprite_index = spr_player_run_t;
}

////////////////////////////////////////////////// AIMING
//isAiming
if (haim != 0 or vaim != 0) isAiming = true else isAiming = false;

//dirAiming
// 0 : RIGHT
// 1 : BOTTOM
// 2 : LEFT
// 3 : TOP

aimpoint = point_direction(x, y, x+haim, y+vaim); // Direction de la visée en degré
if(aimpoint<45 or aimpoint>315) {
//Right Direction
	dirAiming = 0;
}
else if (aimpoint<315 and aimpoint>225) {
//Bottom Direction
	dirAiming = 1;
}
else if (aimpoint>45 and aimpoint<225 and aimpoint>135 and aimpoint<315) {
//Left Direction
	dirAiming = 2;
}
else if (aimpoint<135 and aimpoint>45) {
//Top Direction
	dirAiming = 3;
}

// Sprite Direction
if (isAiming and isMoving) {
	if (dirAiming == 0) {
		sprite_index = spr_player_run_r;
	}
	else if (dirAiming == 1) {
		sprite_index = spr_player_run_b;
	}
	else if (dirAiming == 2) {
		sprite_index = spr_player_run_l;
	}
	else if (dirAiming == 3) {
		sprite_index = spr_player_run_t;
	}
	last_o = dirAiming;
} else if (isMoving) {
	if (dirMoving == 0) {
		sprite_index = spr_player_run_r;
	}
	else if (dirMoving == 1) {
		sprite_index = spr_player_run_b;
	}
	else if (dirMoving == 2) {
		sprite_index = spr_player_run_l;
	}
	else if (dirMoving == 3) {
		sprite_index = spr_player_run_t;
	}
	last_o = dirMoving;
} else if(!isMoving) {
	if (isAiming) last_o = dirAiming;
	image_index = last_o;
	sprite_index = spr_player_idle;
}

////////////////////////////////////////////////// COLLISIONS
// HORIZONTAL COLLISION
// Square
if (!place_free(x+hspd,y)) {
	while (place_free(x+sign(hspd),y)) {
		x += (sign(hspd));
	}
	hspd = 0;
	
}

x += hspd


/// VERTICAL COLLISION
// Square
if (!place_free(x,y+vspd)) {
	while (place_free(x,y+sign(vspd))) {
		y += (sign(vspd));
	}
	vspd = 0;
}

y += vspd




// SHOOTING
if (rtrigger) {
	isShooting = true;
	if (shootchk>shootrate) {
		if (isAiming) {
			var bullet = instance_create_layer(x,y,"Bullets",obj_bullet);
			with (bullet) {
				direction = other.aimpoint;	
			}
		} else if (isMoving or !isAiming) {
		var bullet = instance_create_layer(x,y,"Bullets",obj_bullet);
			with (bullet) {
				direction = other.last_o*-90;	
			}
		}
		shootchk = 0;
	} else {
		shootchk++;
	}
} 
else
{
	isShooting = false;
}