//scr_shoot(bullet,ammo,shootrate)
if (global.ammo > 0) {
	if (shootchk>argument[2]) {
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
			var bullet = instance_create_layer(bul_x,bul_y,"Bullets",argument[0]);
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
			var bullet = instance_create_layer(bul_x,bul_y,"Bullets",argument[0]);
			with (bullet) {
				direction = other.last_o*-90;	
			}
		}
		if (global.gameState == 1) {
			global.ammo -= argument[1];
		}
		shootchk = 0;
	} else {
		shootchk++;
	}
} else {
	if (shootchk>argument[2]) {
		// Play sound empty weapon
		shootchk = 0;
	} else {
		shootchk++;
	}
}