/// @description Loop

////////////////////////////////////////////////// MOVEMENT
//If Player is Allowed to move
if (!global.isCinematic) {

	hspd = obj_input.haxis*spd;
	vspd = obj_input.vaxis*spd;
	//isMoving
	if (hspd !=0 or vspd != 0) isMoving = true else isMoving = false;

	//dirMoving
	// 0 : RIGHT
	// 1 : BOTTOM
	// 2 : LEFT
	// 3 : TOP
	dirpoint = point_direction(x, y, x+obj_input.haxis, y+obj_input.vaxis); // Direction du mouvement en degré
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
	if (obj_input.haim != 0 or obj_input.vaim != 0) isAiming = true else isAiming = false;

	//dirAiming
	// 0 : RIGHT
	// 1 : BOTTOM
	// 2 : LEFT
	// 3 : TOP

	aimpoint = point_direction(x, y, x+obj_input.haim, y+obj_input.vaim); // Direction de la visée en degré
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
	} else if (!isMoving) {
		if (isAiming) last_o = dirAiming;
		image_index = last_o;
		sprite_index = spr_player_idle;
	}
	if (isDashing) {
		if (last_o == 0) {
			sprite_index = spr_player_dash_r;
		}
		else if (last_o == 1) {
			sprite_index = spr_player_dash_b;
		}
		else if (last_o == 2) {
			sprite_index = spr_player_dash_l;
		}
		else if (last_o == 3) {
			sprite_index = spr_player_dash_t;
		}	
	}
	// Dash
	if (obj_input.kDash and timerDash == 0) {
		if (isMoving) {
			hspd = hspd*2;
			vspd = vspd*2;
		}
		isDashing = true;
		if (!audio_is_playing(snd_dash)) {
			audio_play_sound(snd_dash,1,false);
		}
		alarm[1] = .15*room_speed;
	}
	if (timerDash > 0) timerDash--;
	
	if (isMoving and !isDashing) {
		
	
	// Walking Audio
		if (floor(image_index) == 4 or floor(image_index) == 13) {
			if (walk_help) {
			var rnd = floor(random_range(1,3))
			switch (rnd) {
				case 1 : var pas = audio_play_sound(snd_walk_1,1,false)
				case 2 : var pas = audio_play_sound(snd_walk_2,1,false)
			}				
				audio_sound_pitch(pas, random_range(.7,1.2));
				walk_help = false;
			}
			
		} else {
			walk_help = true;
		}
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
	if (obj_input.kShoot) {
		isShooting = true;
		scr_shoot(obj_bullet,1,shootrate);
	} else if (obj_input.kSecondaryShoot) {
		if (secondary_weapon == 1) {
			scr_shoot(obj_chou_bullet,8,6*shootrate);
		} else if (secondary_weapon == 2) {
			scr_shoot(obj_sniper_bullet,6,8*shootrate);
		} else {
			isShooting = false;
			shootchk = 0;
		}
	} else {
		isShooting = false;
		shootchk = 0;
	}
	//if (obj_input.kDash) {
	//	scr_shoot(obj_bullet_heal,1,shootrate);
	//}

} else {
	isMoving = false;
	isShooting = false;
	isAiming = false;
}

// Hurt Sound
if(isAttacked and hp > 0 and !global.isCinematic) {
	var rnd = floor(random_range(1,4))
	switch (rnd) {
		case 1 : audio_play_sound(snd_player_hurt_1,1,false);
		case 2 : audio_play_sound(snd_player_hurt_2,1,false);
		case 3 : audio_play_sound(snd_player_hurt_3,1,false);
	}
	isAttacked = false;
}



// Game Over

if (hp <= 0) {
	global.isCinematic = true;
	sprite_index = spr_player_death;
	global.gameState = 3;
	if(alarm[0] == -1) alarm[0] = 6*room_speed;
}