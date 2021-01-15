/// PLAYER INPUT
function scr_input() {


	// Controller
	if (gamepad_is_connected(0)) {
		gamepad_set_axis_deadzone(0,.05)
		isGamepad = true;
		//Left Stick
		haxis = gamepad_axis_value(0, gp_axislh);
		vaxis = gamepad_axis_value(0, gp_axislv);
		//Right Stick
		haim = gamepad_axis_value(0, gp_axisrh);
		vaim = gamepad_axis_value(0, gp_axisrv);
		//Buttons Setup
		kShoot = gamepad_button_check(0, gp_shoulderrb);
		kSecondaryShoot = gamepad_button_check(0, gp_shoulderlb);
		kDash = gamepad_button_check(0, gp_shoulderl);
		//Options
		kEsc = gamepad_button_check_pressed(0,gp_start)
		kFullscreen = gamepad_button_check_pressed(0,gp_select)
	} else {
		isGamepad = false;
		// Keyboard and mouse
		//Left Stick (Movement)
		keyboard_set_map(ord("L"), vk_right);
		keyboard_set_map( ord("J"), vk_left);
		keyboard_set_map(ord("I"), vk_up);
		keyboard_set_map(ord("K"), vk_down);

		haxis = (keyboard_check(vk_right)-keyboard_check(vk_left));
		vaxis = (keyboard_check(vk_down)-keyboard_check(vk_up));
		//Right Stick
		haim = mouse_x;
		vaim = mouse_y;
		//Buttons Setup
		kShoot = mouse_check_button(mb_left);
		kSecondaryShoot = mouse_check_button(mb_right);
		kDash = keyboard_check(vk_shift);
		//Options
		kEsc = keyboard_check_pressed(vk_escape);
		kFullscreen = keyboard_check_pressed(ord("F"));
	}



}
