right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);
jump_key_pressed = keyboard_check_pressed(vk_space);
dash_key_pressed = keyboard_check_pressed(vk_shift);

move_dir = (right_key - left_key);
move_x = move_dir * spd;

x += move_x;