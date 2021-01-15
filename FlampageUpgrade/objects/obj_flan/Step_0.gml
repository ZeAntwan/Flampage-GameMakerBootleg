/// @description Insert description here

hpCheck = global.rageLevel;

// Avoid Global Rage to be over 300
global.rageLevel = clamp(global.rageLevel,0,300);

if (global.rageLevel <100) {
	if (lastState = 2) {
		sprite_index = spr_flan_1_dmg;
	} else if (lastState = 1) {
		sprite_index = spr_flan_1_heal;
	} else {
		sprite_index = spr_flan_1_idle;
	}
	global.rageState = 1;
}
else if (global.rageLevel >= 100 and global.rageLevel < 200) {
	if (lastState = 2) {
		sprite_index = spr_flan_2_dmg;
	} else if (lastState = 1) {
		sprite_index = spr_flan_2_heal;
	} else {
		sprite_index = spr_flan_2_idle;
	}
	global.rageState = 2;
}
else if (global.rageLevel >= 200 and global.rageLevel < 300) {
	if (lastState = 2) {
		sprite_index = spr_flan_3_dmg;
	} else if (lastState = 1) {
		sprite_index = spr_flan_3_heal;
	} else {
		sprite_index = spr_flan_3_idle;
	}
	global.rageState = 3;
}
else if (global.rageLevel >=300) {
	sprite_index = spr_flan_4_idle;
	global.rageState = 4;
	global.isCinematic = true;
	if(alarm[0] == -1) alarm[0] = 6*room_speed;
}

// Shooter Mechs

// Preparation for Phase 3 
if (global.rageState != 3) bul_angle = 0;

// Phase 1
if (global.rageState == 1 /* or keyboard_check(ord("Q"))*/) {
	alarm[1] = -1;
	alarm[2] = -1;
	// CàC

// Phase 2
} else if (global.rageState == 2 /* or keyboard_check(ord("S"))*/) {
	alarm[2] = -1;
	if (alarm[1] = -1) {
		alarm[1] = atk_speed*room_speed
	}
// Phase 3
} else if (global.rageState == 3 /* or keyboard_check(ord("D"))*/) {
	alarm[1] = -1;
	if (alarm[2] = -1) {
		alarm[2] = 1
		bul_angle += 360/20;
		if (bul_angle >= 360) {
			bul_angle = 0;
			audio_play_sound(snd_flan_bullet,1,false);
		}
	}
}



