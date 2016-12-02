global.gameState = 0;

cam = instance_create_depth(x,y,"Tools",obj_camera)
with (cam) {
	objFollow = obj_player_1;
}