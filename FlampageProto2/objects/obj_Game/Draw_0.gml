/// @description Insert description here
if (global.gameState == 0) {
logo_anim += (pi/(room_speed/0.8));
var size = (sin(logo_anim))/10;
draw_set_color(c_black);
draw_text(20,20,size);
draw_sprite_ext(spr_flan_1_idle,0,room_width/2,900*.15,.5+size,.5+size,0,c_black,.5);
}