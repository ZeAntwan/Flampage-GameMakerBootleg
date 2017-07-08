/// @description Insert description here
/*
draw_set_color(c_green);
draw_circle(x+sprite_width/2,y+sprite_width/2,100,false);
draw_set_halign(fa_center);
draw_text(x+sprite_width/2,y-110,"plongeur")
draw_self();
draw_set_halign(fa_left);
*/
// Set Sprite

if (!attackMode) {
	if(direction<45 or direction>315) {
		//Right Direction
			sprite_index = spr_plongeur_r;
		}
		else if (direction<315 and direction>225) {
		//Bottom Direction
			sprite_index = spr_plongeur_b;
		}
		else if (direction>45 and direction<225 and direction>135 and direction<315) {
		//Left Direction
			sprite_index = spr_plongeur_l;
		}
		else if (direction<135 and direction>45) {
		//Top Direction
			sprite_index = spr_plongeur_t;
		}
} else {
		if(direction<45 or direction>315) {
		//Right Direction
			sprite_index = spr_plongeur_atk_r;
		}
		else if (direction<315 and direction>225) {
		//Bottom Direction
			sprite_index = spr_plongeur_atk_b;
		}
		else if (direction>45 and direction<225 and direction>135 and direction<315) {
		//Left Direction
			sprite_index = spr_plongeur_atk_l;
		}
		else if (direction<135 and direction>45) {
		//Top Direction
			sprite_index = spr_plongeur_atk_t;
		}
}
draw_self();