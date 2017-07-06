/// @description Gui Elements
var gborder = 20;
//var gw = display_get_gui_width() - gborder;
//var gh = display_get_gui_height() - gborder;
var gw = window_get_width() - gborder;
var gh = window_get_height() - gborder;

if (global.gameState > 0 && global.gameState < 3) { 
	// Player HUD
	
	// Flan bar
	var _ragelvl = clamp(ceil((global.rageLevel/300)*50),0,49) 
	draw_sprite_ext(spr_levelcolere,_ragelvl,gborder + 100, gborder+75,.5,.5,0,c_white,1);
	
	// Flan Head
	var _ragestate = (global.rageState-1)*3+2*obj_flan.isHealing+obj_flan.isAttacked
	draw_sprite_ext(spr_flanhead,_ragestate,gborder + 100, gborder+75,.5,.5,0,c_white,1);
	
	// Health Bar
	var _hp = clamp(ceil(obj_player_1.hp/5),0,6) 
	draw_sprite_ext(spr_lifebar,_hp,gborder + 100, gborder+160,.6,.6,0,c_white,1);
	
	// Ammo Pak
	draw_sprite_ext(spr_ammopak,global.chargeurs,gw-(205),gh-(70),.7,.7,0,c_white,1);
	
	// Ammobar
	var ammoleft = clamp((((100-global.ammo)/100)*50),0,49);
	draw_sprite_ext(spr_ammobar,ammoleft,gw-(90),gh-(100),.7,.7,0,c_white,1);
	
	// Text
	draw_set_font(fnt_txt);
	draw_set_color(col);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle)
	draw_text(gw-90,gh-80,string(global.ammo));
	
	// Timer
	if (global.minutes < 10) {
		if (global.seconds < 10) {
			draw_text(gw-90, gborder+40,"0" + string(floor(global.minutes)) + ":0" + string(floor(global.seconds)))
		} else {
			draw_text(gw-90, gborder+40,"0" + string(floor(global.minutes)) + ":" + string(floor(global.seconds)))
		}
	//
	} else {
		draw_text(gw-90, gborder+40,string(floor(global.minutes)) + ":" + string(floor(global.seconds)))
	}
	

} else {
	
}

if (global.rageState == 4) {
	draw_sprite_ext(spr_gameover,0,gw/2,gh/2,.5,.5,0,c_white,1)
}