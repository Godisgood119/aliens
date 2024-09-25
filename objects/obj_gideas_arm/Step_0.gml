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