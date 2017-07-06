/// @description Wame Behavior

timer++;

if (is_array(w) and timer > w[line,2]*room_speed) {
		text = "Wave Number " + string(w[line,1]);
		setspawn = w[line,3];
	if (w[line,0] != 0) {
		ammoSpawned = false;
		// Set the Enemy Spawn Point
		switch (setspawn) {
			case 1: 
				spawnpoint = obj_spawnpoint1;
				break;
			case 2: 
				spawnpoint = obj_spawnpoint2;
				break;
			case 3: 
				spawnpoint = obj_spawnpoint3;
				break;
			case 4: 
				spawnpoint = obj_spawnpoint4;
				break;
			case 5: 
				spawnpoint = obj_spawnpoint5;
				break;
			case 6: 
				spawnpoint = obj_spawnpoint6;
				break;
			case 7: 
				spawnpoint = obj_spawnpoint7;
				break;
			case 8: 
				spawnpoint = obj_spawnpoint8;
				break;
		}
		// Commis Spawn
			if (w[line,4] > 0) {
				for (var c = 0; c < w[line,4]; c++) {
					instance_create_layer(spawnpoint.x+c*200,spawnpoint.y,"Ennemies",obj_commis);
				}
			}
		// Plongeur Spawn
		
		// Gourmand Spawn
			if (w[line,6] > 0) {
				for (var c = 0; c < w[line,6]; c++) {
					instance_create_layer(spawnpoint.x+c*200,spawnpoint.y,"Ennemies",obj_gourmand);
				}
			}
		// Gordon Spawn
			if (w[line,7] > 0) {
				for (var c = 0; c < w[line,7]; c++) {
					instance_create_layer(spawnpoint.x+c*200,spawnpoint.y,"Ennemies",obj_gordon);
				}
			}
		global.waveLevel = w[line,0];
		line++
	} else {
		// Spawn Ammo
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
			instance_create_layer(ammopoint.x,ammopoint.y,"Ammo",obj_ammo);
			ammoSpawned = true;
		}
		line++
	}
}

clamp(line,0,array_height_2d(w)-1);