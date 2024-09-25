function controls_setup() {
	buffer_time = 4;
	jump_buffered = false;
	jump_buffer_timer = 0;
}

function get_controls() {
	// basic movement inputs
	right_key = keyboard_check(ord("D")) || (gamepad_axis_value(0, gp_axislh) > 0 ? 1 : 0);
	left_key = keyboard_check(ord("A")) || (gamepad_axis_value(0, gp_axislh) > 0 ? 1 : 0); 
	sprint_key = keyboard_check(vk_shift);
	dash_key_pressed = keyboard_check_pressed(vk_shift);

	
	//Jump inputs
	jump_key_pressed = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1);
	jump_key = keyboard_check(vk_space) || gamepad_button_check(0, gp_face1);
	
	// Combat inputs
	attack_key_pressed = mouse_check_button_pressed(mb_left);
	attack_key = mouse_check_button(mb_left);

	
	// Jump buffering
	if jump_key_pressed {
		jump_buffer_timer = jump_buffer_time;
	}
	
	if jump_buffer_timer > 0 {
		jump_buffered = true;	
		jump_buffer_timer--;
	} else {
		jump_buffered = false;	
	}
}