/// @description Insert description here
draw_set_color(c_red);
draw_rectangle(x,y,x+400,y+200,0);
draw_set_color(c_orange);
draw_rectangle(x,y,x+clamp((400/10)*loadup,0,400),y+200,0);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(x+200,y+100,"Shoot to play");
draw_set_halign(fa_left);