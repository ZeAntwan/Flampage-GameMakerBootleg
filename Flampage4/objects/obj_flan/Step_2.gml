/// @description State Checkup
if (isAttacked or isHealing) {
	if (timeState > 0) {
		timeState--
	}
} else {
	timeState = 5*room_speed;
}

if (global.rageLevel > hpCheck) {
	isHealing = true;
	isAttacked = false;
} else if (global.rageLevel < hpCheck) {
	isHealing = false;
	isAttacked = true;
} else if (global.rageLevel == hpCheck and timeState <= 0) {
	isHealing = false;
	isAttacked = false;
}
