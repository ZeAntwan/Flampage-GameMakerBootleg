/// @description

Singleton();

//Debug Keys

rm_next = keyboard_check_pressed(ord("Y"));
rm_prev = keyboard_check_pressed(ord("T"));
cinematic = keyboard_check_pressed(ord("C"));

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
if (keyboard_check(vk_escape)) {
	game_end();
}

if (keyboard_check_pressed(ord("F"))) {
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
	//Music
	if (!audio_is_playing(snd_menu)) {
		audio_play_sound(snd_menu,1,true);
	}
	global.isCinematic = false;
} else if (global.gameState == 1) {
	// Music
	if (!audio_is_playing(snd_phase_1)) {
		audio_play_sound(snd_phase_1,1,true);
	}
}


// Game Over Music Handle
if (global.rageState == 4) {
	if (audio_is_playing(snd_phase_1)) {
		audio_stop_sound(snd_phase_1)
	}
	if (!audio_is_playing(snd_gameover)) {
		audio_play_sound(snd_gameover,1,true);
	}
	global.isCinematic = true;
}
	