/// @description Create Camera / Kill Music / Reset Game

// Kill Menu Music
audio_stop_all();

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
view_set_wport(0, 1280);
view_set_hport(0, 720);

//Resize and center
window_set_rectangle((display_get_width() - view_wport[0]) * 0.5, (display_get_height() - view_hport[0]) * 0.5, view_wport[0], view_hport[0]);
surface_resize(application_surface,view_wport[0],view_hport[0]);