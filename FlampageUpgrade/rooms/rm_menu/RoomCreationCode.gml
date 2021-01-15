if (global.gameState != 0) {
	global.gameState = 0
	global.isCinematic = false;
	global.Played = false;
};

cam = instance_create_layer(x,y,"Tools",obj_camera)
with (cam) {
	objFollow = obj_player_1;
}