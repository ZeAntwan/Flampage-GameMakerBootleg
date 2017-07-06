/// @description Movement and Behavior

// MOVEMENT

if (distance_to_object(target) <= 20) {
	attackMode = true;
	if (attack_timer <= firerate*room_speed) {
		attack_timer++
	} else {
		if (target = obj_flan) {
			global.rageLevel += attack;
		} else {
			var _atk = attack
			with(target) {
				hp -= _atk;
			}
		}
		attack_timer = 0;
	}
} else {
	attackMode = false;
	
	direction = point_direction(x,y,target.x,target.y)

	hspd = (lengthdir_x(distance_to_object(target),direction)/distance_to_object(target))*spd;
	vspd = (lengthdir_y(distance_to_object(target),direction)/distance_to_object(target))*spd;
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

}

if (hp <= 0) {
	instance_destroy();
	audio_play_sound(snd_kill,1,false);
}