if (global.gameState != -1) {
	global.gameState = -1
	global.isCinematic = false;
	global.Played = false;
};

cam = instance_create_layer(x,y,"Tools",obj_camera)
with (cam) {
	objFollow = obj_Game;
}

