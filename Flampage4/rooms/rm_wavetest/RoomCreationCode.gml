global.gameState = 6;

cam = instance_create_layer(x,y,"Tools",obj_camera)
with (cam) {
	objFollow = obj_player_1;
}