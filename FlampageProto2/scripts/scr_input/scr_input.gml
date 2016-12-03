/// PLAYER INPUT
// Keyboard and mouse
//Left Stick
haxis = (keyboard_check(vk_right)-keyboard_check(vk_left));
vaxis = (keyboard_check(vk_down)-keyboard_check(vk_up));
//Right Stick
haim = gamepad_axis_value(0, gp_axisrh);
vaim = gamepad_axis_value(0, gp_axisrv);
//Buttons Setup
kShoot = keyboard_check(vk_space);
kDash = keyboard_check(vk_shift);
//Options
kEsc = keyboard_check_pressed(vk_escape);
kFullscreen = keyboard_check(ord("F"));

// Controller
if (gamepad_is_connected(0)) {
	//Left Stick
	haxis = gamepad_axis_value(0, gp_axislh);
	vaxis = gamepad_axis_value(0, gp_axislv);
	//Right Stick
	haim = gamepad_axis_value(0, gp_axisrh);
	vaim = gamepad_axis_value(0, gp_axisrv);
	//Buttons Setup
	kShoot = gamepad_button_check(0, gp_shoulderrb);
	kDash = gamepad_button_check(0, gp_shoulderl);
	//Options
	kEsc = gamepad_button_check_pressed(0,gp_start)
	kFullscreen = gamepad_button_check_pressed(0,gp_select)
}
