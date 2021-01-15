/// @description Gui Elements
var gborder = 20;
//gw = display_get_gui_width() - gborder;
//gh = display_get_gui_height() - gborder;
 var gw = window_get_width() - gborder;
 var gh = window_get_height() - gborder;

//display_set_gui_size(window_get_width(),window_get_height());
display_set_gui_maximise();

if ((global.gameState > 0 && global.gameState < 3) or global.gameState == 6) { 
	// Player HUD
	
	// Flan bar
	var _ragelvl = clamp(ceil((global.rageLevel/300)*50),0,49) 
	draw_sprite_ext(spr_levelcolere,_ragelvl,gborder + 100, gborder+75,.5,.5,0,c_white,1);
	
	// Flan Head
	var _ragestate = (global.rageState-1)*3+obj_flan.lastState
	draw_sprite_ext(spr_flanhead,_ragestate,gborder + 100, gborder+75,.5,.5,0,c_white,1);
	
	// Health Bar
	var _hp = clamp(ceil(obj_player_1.hp/5),0,6) 
	draw_sprite_ext(spr_lifebar,_hp,gborder + 100, gborder+170,.6,.6,0,c_white,1);
	
	// Ammo Pak
	draw_sprite_ext(spr_ammopak,global.chargeurs,gw-(205),gh-(70),.7,.7,0,c_white,1);
	
	// Secondary Weapon
	draw_sprite_ext(spr_secondary,obj_player_1.secondary_weapon,gw-(195),gh-(120),.7,.7,0,c_white,1);
	
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
	draw_sprite_ext(spr_horloge,0,gw-110, gborder+80,1,1,0,c_white,1);
	
	if (global.minutes < 10) {
		if (global.seconds < 10) {
			draw_text(gw-110, gborder+80,"0" + string(floor(global.minutes)) + ":0" + string(floor(global.seconds)))
		} else {
			draw_text(gw-110, gborder+80,"0" + string(floor(global.minutes)) + ":" + string(floor(global.seconds)))
		}
	//
	} else {
		draw_text(gw-90, gborder+40,string(floor(global.minutes)) + ":" + string(floor(global.seconds)))
	}
	
	// Phase Showup

	if (showPhase and timer>=5*room_speed) {
		showPhase = false;
		timer = 0;
		vxPlayed = false;
	} else if (showPhase) {
		timer++;
	}
	if (instance_exists(obj_WaveManager)) {
		if (global.waveLevel != lastWaveLevel or showPhase) {
			draw_sprite_ext(spr_phase,global.waveLevel-1,gw/2,gh/4,1,1,0,c_white,1)
			showPhase = true;
		}

		lastWaveLevel = global.waveLevel
	}
} else {
	show_phase = false;
}

// Game Over
if (global.gameState == 3) {
	draw_sprite_ext(spr_gameover,0,gw/2,(gh/4)*3,.5,.5,0,c_white,1)
}

