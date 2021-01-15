/// @description Insert description here

// No Cursor
window_set_cursor(cr_none);
window_set_color(col2);

//Set the port bounds of view 0 to 640x480
view_set_wport(0, 1920);
view_set_hport(0, 1080);

window_set_size(1280,720);

//Resize and center
if (browser_not_a_browser) {
	window_set_rectangle((display_get_width() - view_wport[0]/2) * 0.5, (display_get_height() - view_hport[0]/2) * 0.5, view_wport[0]/2, view_hport[0]/2);
}
surface_resize(application_surface,view_wport[0],view_hport[0]);

global.Played = false;