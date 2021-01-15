/// @description Explode
for(var i = 1; i < 8 ; i++)
{
	var bul = instance_create_layer( x, y, "Bullets", obj_chou_minibullet);
	bul.direction = i * 360/8;
}
audio_play_sound(snd_chou_explode,1,false);
instance_destroy();