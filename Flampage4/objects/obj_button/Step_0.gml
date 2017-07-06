/// @description Insert description here

if (loadup > 0) {
	loadup -= 1/(room_speed/2);
}

if (loadup >10) {
	audio_play_sound(snd_validate,1,false);
	room_goto(room_target);
}