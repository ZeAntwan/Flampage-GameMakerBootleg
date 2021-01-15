// Set game stage to Game
global.gameState = 1;
global.Played = true;

// Set camera on player
cam = instance_create_layer(x,y,"Tools",obj_camera)
with (cam) {
	objFollow = obj_player_1;
	zoom = 1.5;
}