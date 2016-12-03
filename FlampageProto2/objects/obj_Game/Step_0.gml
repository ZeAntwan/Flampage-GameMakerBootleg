/// @description

Singleton();

/// DEBUG
rm_next = keyboard_check_pressed(ord("Y"));
rm_prev = keyboard_check_pressed(ord("T"));
cinematic = keyboard_check_pressed(ord("C"));

// Debug Behavior
if(rm_next) {
	if (room != room_last) {
		room_goto_next();
	} else {
		room_goto(room_first)
	}
}
if(rm_prev) {
	if (room != room_first) {
		room_goto_previous();
	} else {
		room_goto(room_last)
	}	
}

if(cinematic) {
	global.isCinematic = !global.isCinematic;
}


// Quit the game
if (obj_input.kEsc) {
	game_end();
}

if (obj_input.kFullscreen) {
	if (!window_get_fullscreen()) {
		window_set_fullscreen(true);
	}
	else
	{
		window_set_fullscreen(false);
	}
}

// Game State
// 0 = Main Menu
// 1 = Game
// 2 = Pause
// 3 = Game Over
if (global.gameState == 0) {

	global.isCinematic = false;
} else if (global.gameState == 1) {

}

// Rage State Music Handle
if (global.rageState == 2) {
//	audio_sound_gain(snd[1], 1, 0);
} else if (global.rageState == 3) {
//	audio_sound_gain(snd[2], 1, 0);
}
// Game Over Music Handle
else if (global.rageState == 4) {
	//audio_destroy_sync_group(sg);
	if (!audio_is_playing(snd_gameover)) {
//		audio_play_sound(snd_gameover,1,true);
	}
}
	