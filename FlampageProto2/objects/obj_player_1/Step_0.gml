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
		// Walking Audio
		if (image_index == 0) {
			var pas = audio_play_sound(snd_walk,1,false)
			audio_sound_pitch(pas, random_range(.7,1.2));
		}
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
		// Walking Audio
		if (image_index == 0) {
			var pas = audio_play_sound(snd_walk,1,false)
			audio_sound_pitch(pas, random_range(.7,1.2));
		}
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
	if (obj_input.kShoot) {
			isShooting = true;
		if (global.ammo > 0) {
			if (shootchk>shootrate) {
				if (isAiming) {
					if (dirAiming == 0 or dirAiming == 2) {
						if (dirAiming == 0) {
							var bul_x = x + 40;
						} else if (dirAiming == 2) {
							var bul_x = x - 40;
						}
						var bul_y = y + 20 + lengthdir_y(30,other.aimpoint)
					} else {
						var bul_y = y + 15;
						var bul_x = x + 10;
					}
					var bullet = instance_create_layer(bul_x,bul_y,"Bullets",obj_bullet);
					with (bullet) {
						direction = other.aimpoint;	
					}
				} else if (isMoving or !isAiming) {
				if (dirMoving == 0 or dirMoving == 2) {
						if (dirMoving == 0) {
							var bul_x = x + 40;
						} else if (dirMoving == 2) {
							var bul_x = x - 40;
						}
						var bul_y = y + 20
					} else {
						var bul_y = y + 15;
						var bul_x = x + 0;
					}
					var bullet = instance_create_layer(bul_x,bul_y,"Bullets",obj_bullet);
					with (bullet) {
						direction = other.last_o*-90;	
					}
				}
				if (global.gameState == 1) {
					global.ammo--
				}
				shootchk = 0;
			} else {
				shootchk++;
			}
		}
	} 
	else
	{
		isShooting = false;
	}

} else {
	isMoving = false;
	isShooting = false;
	isAiming = false;
}