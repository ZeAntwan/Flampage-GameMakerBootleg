/// @description Show Debug var

var xx = 32;
var yy = 32;

draw_set_halign(fa_left);
draw_set_valign(fa_left);
draw_set_color(c_black);

// FPS Debug
draw_text(xx,yy, "FPS - " + string(fps));
draw_text(xx,yy+20, "isMoving - " + string(obj_player_1.isMoving));
draw_text(xx,yy+40, "isAiming - " + string(obj_player_1.isAiming));
draw_text(xx,yy+60, "isShooting - " + string(obj_player_1.isShooting));
draw_text(xx,yy+80, "dirMoving - " + string(obj_player_1.dirMoving));
draw_text(xx,yy+100, "dirAiming - " + string(obj_player_1.dirAiming));
draw_text(xx,yy+120, "last_o - " + string(obj_player_1.last_o));
draw_text(xx,yy+140, "diraim_diff - " + string(obj_player_1.diraim_diff));
draw_text(xx,yy+160, "sprspeed - " + string(obj_player_1.sprspeed));

//Cam Debug
draw_text(xx,yy+200, "aimpoint - " + string(obj_player_1.aimpoint));
//draw_text(xx,yy+220, "nextcam_y - " + string(obj_camera.nextcam_y));
draw_text(xx,yy+240, "player x - " + string(obj_player_1.x));
draw_text(xx,yy+260, "player y - " + string(obj_player_1.y));

draw_text(xx,yy+320, "gameState - " + string(global.gameState));
draw_text(xx,yy+340, "rageLevel - " + string(global.rageLevel));