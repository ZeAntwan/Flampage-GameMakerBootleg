/// @description Movement and Behavior
event_inherited();

if (floor(image_index) == 0 or floor(image_index) == 10) {
	if (walk_help) {
		var rnd = floor(random_range(1,3))
		switch (rnd) {
			case 1 : var pas = audio_play_sound(snd_gordon_walk_1,1,false)
			case 2 : var pas = audio_play_sound(snd_gordon_walk_2,1,false)
		}				
			audio_sound_pitch(pas, random_range(.7,1.2));
			walk_help = false;
	}
	
} else {
	walk_help = true;
}
