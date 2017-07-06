/// @description Insert description here

if (loadup > 0) {
	loadup -= 1/(room_speed/2);
}

if (loadup >10) {
	room_goto(room_target);
}