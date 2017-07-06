/// @description

Singleton();

/// DEBUG
rm_next = keyboard_check_pressed(ord("Y"));
rm_prev = keyboard_check_pressed(ord("T"));
cinematic = keyboard_check_pressed(ord("C"));
played = keyboard_check_pressed(ord("P"));

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

if(played) {
	global.Played = !global.Played;
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

} else if (global.gameState == 2) {

} else if (global.gameState == 3) {
	
} else if (global.gameState == 4) {
	room_goto(rm_credits);
} else if (global.gameState == 5) {
	if (audio_is_playing(snd_cred1) == false && audio_is_playing(snd_cred2) == false) {
		pc2 = audio_play_sound(snd_cred2,1,true)
	}
}
// Rage State Music Handle
if (global.rageState == 1) {
	audio_sound_gain(p2,0,250);
	// SFX Flan Rage Phase Up and Down
	if (lastrage > global.rageState) {
		audio_play_sound(snd_flan_down,1,0);
	} else if (lastrage < global.rageState){
		audio_play_sound(snd_flan_up,1,0);
	}
	lastrage = global.rageState;
}
else if (global.rageState == 2) {
	audio_sound_gain(p2,1,250);
	audio_sound_gain(p3,0,250);
	// SFX Flan Rage Phase Up and Down
	if (lastrage > global.rageState) {
		audio_play_sound(snd_flan_down,1,0);
	} else if (lastrage < global.rageState){
		audio_play_sound(snd_flan_up,1,0);
	}
	lastrage = global.rageState;
	

} else if (global.rageState == 3) {
	audio_sound_gain(p3,1,250);
	// SFX Flan Rage Phase Up and Down
	if (lastrage > global.rageState) {
		audio_play_sound(snd_flan_down,1,0);
	} else if (lastrage < global.rageState){
		audio_play_sound(snd_flan_up,1,0);
	}
	lastrage = global.rageState;
}
// Game Over Music Handle
else if (global.rageState == 4) {
	global.gameState = 3;
	if (!audio_is_playing(snd_gameover)) {
//		audio_play_sound(snd_gameover,1,true);
	}
	audio_sound_gain(p1,0,250);
}

// Ammo Limit
global.ammo = clamp(global.ammo,0,100);
global.chargeurs = clamp(global.chargeurs,0,3);

if (global.ammo = 0 and global.chargeurs > 0) {
	global.ammo = 100;
	global.chargeurs--
}