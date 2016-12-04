/// @description Gui Elements
var gborder = 20;
var gw = display_get_gui_width() - gborder;
var gh = display_get_gui_height() - gborder;

if (global.gameState != 0) { 
// Ammo bar
	// BG
	draw_set_color(c_yellow);
	draw_rectangle(gw-50,gh-100,gw,gh,false);
	// Ammo bar
	draw_set_color(c_orange);
	draw_rectangle(gw-50,gh-(global.ammo),gw,gh,false)
	// Outline
	draw_set_color(c_yellow);
	draw_rectangle(gw-50,gh-100,gw,gh,true);
	// Text
	draw_set_color(c_black);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom)
	draw_text(gw-25,gh-25,string(global.ammo));
	
} else {
	
}