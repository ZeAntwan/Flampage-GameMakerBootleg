/// @description Insert description here
move_towards_point( obj_flan.x, obj_flan.y, spd );

if (hp <= 0) {
	instance_destroy();
	audio_play_sound(snd_kill,1,false);
}