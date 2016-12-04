/// @description Insert description here
draw_set_color(c_red);
draw_roundrect_ext(x,y,x+400,y+200,50,50,0);
draw_set_color(c_orange);
draw_roundrect_ext(x,y,x+clamp((400/10)*loadup,0,400),y+200,50,50,0);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_txt)
draw_text(x+200,y+100,"Shoot to play");
// Back to debug
draw_set_font(fnt_debug);
draw_set_valign(fa_top);
draw_set_halign(fa_left);


