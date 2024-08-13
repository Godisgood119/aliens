draw_self();

var mdist = point_distance(x, y, mouse_x, mouse_y);
var mdir = point_direction(x, y, mouse_x, mouse_y);
if(mdir <= 90 || mdir >= 270) 
{
	draw_sprite_ext(weapon_sprite, 0, x+(sprite_width/2), y-(sprite_height/2), 1, 1, mdir, c_white, 1);
} else if(mdir > 90 && mdir < 270) 
{
	draw_sprite_ext(weapon_sprite, 0, x-(sprite_width/2), y-(sprite_height/2), -1, 1, mdir-180, c_white, 1);
}