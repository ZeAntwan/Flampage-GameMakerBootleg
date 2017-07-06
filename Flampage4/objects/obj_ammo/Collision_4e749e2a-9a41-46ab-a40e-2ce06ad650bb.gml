/// @description Insert description here
if (global.chargeurs < 3) {
	global.chargeurs += 1;
	audio_play_sound(snd_ammo,2,false);
	instance_destroy();
}