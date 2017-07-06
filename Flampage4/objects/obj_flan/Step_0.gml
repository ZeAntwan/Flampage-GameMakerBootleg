/// @description Insert description here

hpCheck = global.rageLevel;

// Avoid Global Rage to be over 300
global.rageLevel = clamp(global.rageLevel,0,300);

if (global.rageLevel <100) {
	sprite_index = spr_flan_1_idle;
	global.rageState = 1;
}
else if (global.rageLevel >= 100 and global.rageLevel < 200) {
	sprite_index = spr_flan_2_idle;
	global.rageState = 2;
}
else if (global.rageLevel >= 200 and global.rageLevel < 300) {
	sprite_index = spr_flan_3_idle;
	global.rageState = 3;
}
else if (global.rageLevel >=300) {
	sprite_index = spr_flan_4_idle;
	global.rageState = 4;
	global.isCinematic = true;
	if(alarm[0] == -1) alarm[0] = 6*room_speed;
}