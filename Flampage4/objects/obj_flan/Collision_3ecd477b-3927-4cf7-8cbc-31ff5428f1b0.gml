/// @description Insert description here

global.rageLevel -= 10;
with(other) {
	instance_destroy();
}

if(global.rageLevel < 300) {
	isAttacked = false;
	isHealing = true;
}