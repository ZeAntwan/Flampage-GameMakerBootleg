/// @description Insert description here
if (other.hp < 30) {
	other.hp += 10;
	audio_play_sound(snd_ammo,2,false);
	instance_destroy();
} else {

}
