/// @description Create Camera / Manage Music / Reset Game

// Manage Music
if (global.gameState == 0) {
	//Music
	if (!audio_is_playing(snd_menu)) {
		audio_play_sound(snd_menu,1,true);
	}
} else if (global.gameState == 1) {
	// Music
	sg = audio_create_sync_group(true);
	//snd[0] = audio_play_in_sync_group(sg, snd_phase_1);
	//snd[1] = audio_play_in_sync_group(sg, snd_phase_2);
	//snd[2] = audio_play_in_sync_group(sg, snd_phase_3);
	//audio_sound_gain(snd[1], 0, 0);
	//audio_sound_gain(snd[2], 0, 0);
	if (!audio_sync_group_is_playing(sg)) {
		//audio_start_sync_group(sg);
	}
	audio_play_sound(snd_phase_1,1,true);
	p2 = audio_play_sound(snd_phase_2,1,true);
	audio_sound_gain(p2,0,0);
	p3 = audio_play_sound(snd_phase_3,1,true);
	audio_sound_gain(p3,0,0);
}

// Reset Game
global.ammo = 300;

// Flan Rage
global.rageState = 0;


// Set Camera

// Set Viewport
//Enable the use of views
view_enabled = true;

//Make view 0 visible
view_set_visible(0, true);

//Set the port bounds of view 0 to 640x480
view_set_wport(0, 1920);
view_set_hport(0, 1080);

//Resize and center
window_set_rectangle((display_get_width() - view_wport[0]/2) * 0.5, (display_get_height() - view_hport[0]/2) * 0.5, view_wport[0]/2, view_hport[0]/2);
surface_resize(application_surface,view_wport[0],view_hport[0]);