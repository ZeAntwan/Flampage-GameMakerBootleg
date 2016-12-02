// Set game stage to Game
global.gameState = 1;

// Set camera on player
cam = instance_create_depth(x,y,"Tools",obj_camera)
with (cam) {
	objFollow = obj_player_1;
}