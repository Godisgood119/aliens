draw_self();

if(move == 3) {
	shield_alpha += 1 / 100;
	draw_set_alpha(shield_alpha);
	draw_set_color(c_red);
	draw_circle(x, y - 83, 80, false);
	draw_set_alpha(1);
	draw_set_color(c_white);
}