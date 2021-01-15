/// @description State Checkup and Hurt Sound

if (lastState != 0) {
	if (timeState > 0) {
		timeState--
	}
	else if (timeState <= 0) {
		lastState = 0;
		timeState = 1*room_speed;
	}
} else {
	if (isHealing) {lastState = 1};
	if (isAttacked) {lastState = 2};
	timeState = 1*room_speed;
}

if (isAttacked) {
	var rnd = floor(random_range(1,4))
	if (global.rageState == 1) {
		switch (rnd) {
			case 1 : audio_play_sound(snd_flan_hurt_p1_1,1,false);
			case 2 : audio_play_sound(snd_flan_hurt_p1_2,1,false);
			case 3 : audio_play_sound(snd_flan_hurt_p1_3,1,false);
		}
	}
	if (global.rageState == 2) {
		switch (rnd) {
			case 1 : audio_play_sound(snd_flan_hurt_p1_1,1,false);
			case 2 : audio_play_sound(snd_flan_hurt_p1_2,1,false);
			case 3 : audio_play_sound(snd_flan_hurt_p1_3,1,false);
		}
	}
	if (global.rageState == 3) {
		switch (rnd) {
			case 1 : audio_play_sound(snd_flan_hurt_p1_1,1,false);
			case 2 : audio_play_sound(snd_flan_hurt_p1_2,1,false);
			case 3 : audio_play_sound(snd_flan_hurt_p1_3,1,false);
		}
	}
	isAttacked = false;
}

if isHealing {
	isHealing = false;
}


