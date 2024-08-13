// stats
max_hp = 150;
hp = max_hp;

// basic movement
move_dir = 0;
move_spd = 2.5;
xspd = 0;
yspd = 0;
sprint_spd = 1;
dashing = false;
dash_direction = 1;
dash_distance = 20;
dash_duration = 5;
dash_counter = 0;

// Jumps
grav = 0.275;
//term_vel = 5;
jspd = -4;
jump_buffered = false;
jump_buffer_time = 5;
jump_buffer_timer = 0;
on_ground = false;

// Items
inventory = [];

// Temporary combat variables
weapon_sprite = spr_player_gun;
weapon_dmg = 6;
