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

// Player Movement is diabled when isCinematic
global.isCinematic = false;