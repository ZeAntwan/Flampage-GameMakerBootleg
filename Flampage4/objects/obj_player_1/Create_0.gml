/// @description Var Setup

// SET GAMEPAD
for (i=0; i < gamepad_get_device_count(); i++) {
	if (gamepad_is_connected(i)) {
		gamepad_set_axis_deadzone(i,0.2)
	}
}

// SET MOVEMENT
spd = 30;
isMoving = false;
isAiming = false;
isShooting = false;
isDashing = false;

isAttacked = false;

// Dash Help
timeoutDash = 1.5*room_speed
timerDash = 0;

// SET LAST ORIETATION
// Var for last orientation
// 0 : right
// 1 : bottom
// 2 : left
// 3 : top
last_o = 1; 

//Set spr direction
dirMoving = 0;
dirAiming = 0;
shootanim = 0;

//Différenciel d'angle entre la visée et le déplacement
diraim_diff = 0;

// Walk Sound help
walk_help = true;

// SET SHOOT
//Tool variable
shootchk = 0;
// Shoot rate
shootrate = 5;
// Secondary Weapon
secondary_weapon = 0;

hp = 30;