/// @description Insert description here

Singleton();

// Game State
// 0 = Main Menu
// 1 = Game
// 2 = Pause
// 3 = Game Over
global.gameState = 0;

// Rage State
global.rageState = 0;

lastrage = 1;
showPhase = false;
lastWaveLevel = 0;
timer = 0;
vxPlayed = false;

// Player Movement is diabled when isCinematic
global.isCinematic = false;

// Font Color
col = make_colour_rgb(90, 50, 35);
col2 = make_colour_rgb(70, 30, 5);

window_set_color(col2);