/// @description Wave Behavior

timer++;

if (is_array(w) and timer > w[line,2]*room_speed) {
		text = "Wave Number " + string(w[line,1]);
		setspawn = w[line,3];
		
	if (w[line,0] != 0) {
		ammoSpawned = false;
		objSpawned = false;
		// Set the Enemy Spawn Point
		switch (setspawn) {
			case 1: 
				spawnpoint = obj_spawnpoint1;
				offset_x = 250;
				offset_y = -1;
				break;
			case 2: 
				spawnpoint = obj_spawnpoint2;
				offset_x = 250;
				offset_y = -1;
				break;
			case 3: 
				spawnpoint = obj_spawnpoint3;
				offset_x = 1;
				offset_y = 200;
				break;
			case 4: 
				spawnpoint = obj_spawnpoint4;
				offset_x = 1;
				offset_y = 200;
				break;
			case 5: 
				spawnpoint = obj_spawnpoint5;
				offset_x = 200;
				offset_y = 1;
				break;
			case 6: 
				spawnpoint = obj_spawnpoint6;
				offset_x = 200;
				offset_y = 1;
				break;
			case 7: 
				spawnpoint = obj_spawnpoint7;
				offset_x = -1;
				offset_y = 200;
				break;
			case 8: 
				spawnpoint = obj_spawnpoint8;
				offset_x = -1;
				offset_y = 200;
				break;
		}
		// Commis Spawn
			if (w[line,4] > 0) {
				for (var c = 0; c < w[line,4]; c++) {
					instance_create_layer(spawnpoint.x+c*offset_x,spawnpoint.y+c*offset_y,"Ennemies",obj_commis);
				}
			}
		// Plongeur Spawn
			if (w[line,5] > 0) {
				for (var c = 0; c < w[line,5]; c++) {
					instance_create_layer(spawnpoint.x+c*offset_x,spawnpoint.y+c*offset_y,"Ennemies",obj_plongeur);
				}
			}
		// Gourmand Spawn
			if (w[line,6] > 0) {
			var s = sign(offset_y); 
			offset_x += 100;
			offset_y += 250;
				for (var c = 0; c < w[line,6]; c++) {
					instance_create_layer(spawnpoint.x+c*200,spawnpoint.y+c*(offset_y*s),"Ennemies",obj_gourmand);
				}
			}
		// Gordon Spawn
			if (w[line,7] > 0) {
				for (var c = 0; c < w[line,7]; c++) {
					instance_create_layer(spawnpoint.x+c*200,spawnpoint.y+c*200,"Ennemies",obj_gordon);
				}
			}
			with (spawnpoint) {
				image_index = 1;
				alarm_set(0,.5*room_speed)	
			}
		
			global.waveLevel = w[line,0];
			line++
	} else {
		// Spawn Ammo
		if (w[line,8] >= 1 and w[line,8] < 4) {
			// Ammo
			var _obj = obj_ammo;
			switch (setspawn) {
					case 1: 
						ammopoint = obj_ammoSpawn1;
						break;
					case 2: 
						ammopoint = obj_ammoSpawn2;
						break;
					case 3: 
						ammopoint = obj_ammoSpawn3;
						break;
					case 4: 
						ammopoint = obj_ammoSpawn4;
						break;
				}
			if (!ammoSpawned) {
				instance_create_layer(ammopoint.x,ammopoint.y,"Ammo",_obj);
				ammoSpawned = true;
			}		
		} 
		if (w[line,8] == 3) {
			// Chou 
			ammopoint = obj_itemSpawn1;
			var _obj = obj_recette_chou;
			
		} else if (w[line,8] == 2) {
			// Sniper
			ammopoint = obj_itemSpawn1;
			var _obj = obj_recette_sniper;
			
		} else if (w[line,8] == 4) {
			ammopoint = obj_itemSpawn2;
			var _obj = obj_life;
		}
		if (!objSpawned) {
				instance_create_layer(ammopoint.x,ammopoint.y,"Ammo",_obj);
				objSpawned = true;
			}
		line++
	}
}

clamp(line,0,array_height_2d(w)-1);