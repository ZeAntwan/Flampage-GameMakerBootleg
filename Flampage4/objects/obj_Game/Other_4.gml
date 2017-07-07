/// @description Create Camera / Manage Music / Reset Game

// Phase reset
showPhase = false;
lastWaveLevel = 0;
vxPlayed = false;

// Manage Music
if (global.gameState == 0) {
	// Menu Music
	pm = audio_play_sound(snd_menu,1,true);
} else if (global.gameState == 1) {
	// Main Music
	p1 = audio_play_sound(snd_phase_1,1,true);
	p2 = audio_play_sound(snd_phase_2,1,true);
	audio_sound_gain(p2,0,0);
	p3 = audio_play_sound(snd_phase_3,1,true);
	audio_sound_gain(p3,0,0);

	// Credits Music
} else if (global.gameState == 5) {
	pc1 = audio_play_sound(snd_cred1,1,false)
	if (audio_is_playing(snd_cred1) == false) {
		pc2 = audio_play_sound(snd_cred2,1,true)
	}
}

// Reset Game
global.ammo = 100;
global.chargeurs = 1;

// Flan Rage
global.rageState = 0;

// Timer Reset
global.seconds = 0;
global.minutes = 0;

// Set Camera

// Set Viewport
//Enable the use of views
view_enabled = true;

//Make view 0 visible
view_set_visible(0, true);

