move_x = 0;
move_y = 0;

if(move == 0) {
	hover = hovers.x_only;
	right_arm.hover = hovers.x_only;
	left_arm.hover = hovers.x_only;
	set_left_arm(x-36, y);
	set_right_arm(x+36, y);
	
	// yy is the only variable for y to modify
	yy += (target_y - yy) * 0.05;
	
	if(yy >= target_y - 4) {
		yy = target_y;
		// move_y = 0;
		// switch to move 1
		if(alarm[1] == -1) {
			alarm[1] = 60;	
		}
	}
} else if (move == 1) {
	// tilt to left or right and move in that direction
}

xx += move_x;
yy += move_y;

if(hover == hovers.x_and_y) {
	x = xx + dsin(hvar) * hsize;
	y = yy + dsin(hvar) * hsize;
	hvar += 2;
} else if (hover == hovers.x_only) {
	x = xx + dsin(hvar) * hsize;
	y = yy;
	hvar += 2;
} else if (hover == hovers.none) {
	x = xx;
	y = yy;
}
