if (!browser_not_a_browser) {
	instance_destroy()
}

if (loadup > 0) {
	loadup -= 1/(room_speed/2);
}

if (loadup >10) {
	game_end();
}