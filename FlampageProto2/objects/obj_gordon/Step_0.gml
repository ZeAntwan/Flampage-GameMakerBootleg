/// @description Insert description here
move_towards_point( obj_player_1.x, obj_player_1.y, spd );

if (hp <= 0) {
	instance_destroy();
	audio_play_sound(snd_kill,1,false);
}