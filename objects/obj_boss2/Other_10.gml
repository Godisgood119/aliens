x += 1.2;
y = by + (15 * dsin(angy));
angy += 5;

track_arms();

if(x >= room_width/2) {
	x = room_width/2;
	state = bm.idle;
}