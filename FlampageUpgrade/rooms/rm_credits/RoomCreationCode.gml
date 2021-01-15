if (global.Played) {
	instance_create_layer(256,928,"Menu",obj_replay);
}

global.isCinematic = false;
// global.Played = false;
global.gameState = 5;
	
cam = instance_create_layer(x,y,"Tools",obj_camera)
with (cam) {
	objFollow = obj_player_1;
}