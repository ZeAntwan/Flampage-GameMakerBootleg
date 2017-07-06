/// @description Insert description here
// Draw Menu

if (global.gameState == 0) {
	if (!logoanimDone) {
		if (image_index > image_number-1) {
			logoanimDone = !logoanimDone
		}
	} else {
		image_index = image_number -1
	}
	logo_anim += (pi/(room_speed/0.8));
	var size = (sin(logo_anim))/10;
	draw_sprite_ext(sprite_index,image_index,x,y,1+size,1+size,0,c_white,1)
		
}
