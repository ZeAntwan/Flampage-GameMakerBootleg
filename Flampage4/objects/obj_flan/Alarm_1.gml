/// @description Shoot Phase 1 and 2
for(var i = 0; i <= 18 ; i++)
{
	var bul = instance_create_layer( x, y, "Bullets", obj_flan_bullet);
	bul.direction = i * 20;
}
audio_play_sound(snd_flan_bullet,1,false);
