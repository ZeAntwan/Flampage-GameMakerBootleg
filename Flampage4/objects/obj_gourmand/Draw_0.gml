/// @description Insert description here
/*
draw_set_color(c_green);
draw_circle(x+sprite_width/2,y+sprite_width/2,100,false);
draw_set_halign(fa_center);
draw_text(x+sprite_width/2,y-110,"Gourmand")
draw_self();
draw_set_halign(fa_left);
*/

if(direction<45 or direction>315) {
	//Right Direction
		sprite_index = spr_gourmand_r;
	}
	else if (direction<315 and direction>225) {
	//Bottom Direction
		sprite_index = spr_gourmand_b;
	}
	else if (direction>45 and direction<225 and direction>135 and direction<315) {
	//Left Direction
		sprite_index = spr_gourmand_l;
	}
	else if (direction<135 and direction>45) {
	//Top Direction
		sprite_index = spr_gourmand_t;
	}
	
draw_self();